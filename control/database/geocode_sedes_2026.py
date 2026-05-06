#!/usr/bin/env python3
"""
Geocode all Sede rows produced by extract_base_datos_2026.py.

Outputs:
- database/migrations/update_sedes_gps_2026.sql
- database/migrations/update_sedes_gps_2026_audit.json
- database/migrations/update_sedes_gps_2026_google_cache.json

The script uses Google Geocoding API when a key is available. It never prints
the key. Results include confidence metadata so low-quality coordinates can be
reviewed before/after applying the SQL.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import os
import re
import sys
import time
import unicodedata
import urllib.parse
import urllib.request
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any


ROOT_DIR = Path(__file__).resolve().parents[1]
EXTRACTOR_PATH = ROOT_DIR / "database" / "extract_base_datos_2026.py"
DEFAULT_EXCEL_PATH = ROOT_DIR / "BASE DE DATOS 2026.xlsx"
DEFAULT_SQL_PATH = ROOT_DIR / "database" / "migrations" / "update_sedes_gps_2026.sql"
DEFAULT_AUDIT_PATH = ROOT_DIR / "database" / "migrations" / "update_sedes_gps_2026_audit.json"
DEFAULT_CACHE_PATH = ROOT_DIR / "database" / "migrations" / "update_sedes_gps_2026_google_cache.json"
LEGACY_CACHE_PATH = ROOT_DIR / "database" / "geocode_cache.json"


def strip_accents(value: str) -> str:
    normalized = unicodedata.normalize("NFD", value)
    return "".join(ch for ch in normalized if unicodedata.category(ch) != "Mn")


def clean_text(value: Any) -> str:
    if value is None:
        return ""
    return re.sub(r"\s+", " ", str(value).replace("\t", " ").replace("\xa0", " ")).strip()


def canonical(value: Any) -> str:
    return strip_accents(clean_text(value)).upper()


def load_extractor():
    spec = importlib.util.spec_from_file_location("extract_base_datos_2026", EXTRACTOR_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"Cannot load extractor from {EXTRACTOR_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def load_api_key() -> str:
    env_key = os.environ.get("GOOGLE_MAPS_API_KEY", "").strip()
    if env_key:
        return env_key

    candidates = [
        ROOT_DIR / "api" / "geocode_sedes_now.php",
        ROOT_DIR / "public" / "js" / "config.js",
    ]
    patterns = [
        re.compile(r"GOOGLE_API_KEY\s*=\s*'([^']+)'"),
        re.compile(r"GOOGLE_MAPS_API_KEY:\s*'([^']+)'"),
    ]
    for path in candidates:
        if not path.exists():
            continue
        content = path.read_text(encoding="utf-8", errors="ignore")
        for pattern in patterns:
            match = pattern.search(content)
            if match and match.group(1) and "YOUR_" not in match.group(1):
                return match.group(1).strip()

    raise RuntimeError(
        "No Google Maps API key found. Set GOOGLE_MAPS_API_KEY or configure the existing maps scripts."
    )


def load_entities(excel_path: Path) -> tuple[list[Any], dict[str, Any]]:
    extractor = load_extractor()
    raw_rows, _headers = extractor.read_xlsx_sheet(excel_path, extractor.SHEET_NAME)
    audit = extractor.Audit()
    prepared_rows = extractor.prepare_rows(raw_rows, audit)
    _clientes, empresas, sedes, _contratos = extractor.build_entities(prepared_rows, audit)
    empresa_by_ruc = {empresa.ruc: empresa for empresa in empresas}
    return sedes, empresa_by_ruc


def load_json(path: Path, default: Any) -> Any:
    if not path.exists():
        return default
    return json.loads(path.read_text(encoding="utf-8"))


def save_json(path: Path, payload: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def locality_parts(sede: Any) -> list[str]:
    parts: list[str] = []
    for value in [sede.distrito, sede.provincia, sede.departamento]:
        text = clean_text(value)
        if not text:
            continue
        if canonical(text) in {canonical(part) for part in parts}:
            continue
        if canonical(text) == "LIMA" and any(canonical(part) not in {"LIMA"} for part in parts):
            # Many rows have provincia/distrito outside Lima but departamento accidentally set to LIMA.
            continue
        parts.append(text)
    return parts


def build_query(base: str, sede: Any) -> str:
    chunks = [clean_text(base)]
    for part in locality_parts(sede):
        if canonical(part) not in canonical(base):
            chunks.append(part)
    chunks.append("Perú")
    return ", ".join(chunk for chunk in chunks if chunk)


def build_candidates(sede: Any, razon_social: str) -> list[dict[str, str]]:
    direccion_query = build_query(sede.direccion, sede)
    name_address = build_query(f"{sede.nombre_comercial}, {sede.direccion}", sede)
    company_address = build_query(f"{razon_social}, {sede.direccion}", sede)
    name_locality = build_query(sede.nombre_comercial, sede)
    address_peru = f"{sede.direccion}, Perú"

    candidates = [
        {"kind": "address", "query": direccion_query},
        {"kind": "name_address", "query": name_address},
        {"kind": "company_address", "query": company_address},
        {"kind": "address_peru", "query": address_peru},
        {"kind": "name_locality", "query": name_locality},
    ]

    unique = []
    seen = set()
    for candidate in candidates:
        key = canonical(candidate["query"])
        if key in seen:
            continue
        seen.add(key)
        unique.append(candidate)
    return unique


def google_geocode(query: str, api_key: str, cache: dict[str, Any], timeout: int = 30) -> dict[str, Any]:
    cache_key = canonical(query)
    if cache_key in cache:
        return cache[cache_key]

    params = urllib.parse.urlencode(
        {
            "address": query,
            "key": api_key,
            "region": "pe",
            "language": "es",
        }
    )
    url = f"https://maps.googleapis.com/maps/api/geocode/json?{params}"

    last_error = None
    for attempt in range(3):
        try:
            with urllib.request.urlopen(url, timeout=timeout) as response:
                payload = json.loads(response.read().decode("utf-8"))
            cache[cache_key] = payload
            return payload
        except Exception as exc:  # pragma: no cover - network boundary
            last_error = str(exc)
            time.sleep(1 + attempt)

    payload = {"status": "LOCAL_ERROR", "error_message": last_error or "unknown error", "results": []}
    cache[cache_key] = payload
    return payload


def legacy_cache_lookup(sede: Any, legacy_cache: dict[str, str]) -> dict[str, Any] | None:
    if not legacy_cache:
        return None
    wanted = canonical(f"{sede.direccion}|{sede.distrito}|{sede.departamento}")
    for raw_key, coords in legacy_cache.items():
        if canonical(raw_key) == wanted and re.match(r"^-?\d+(\.\d+)?\s*,\s*-?\d+(\.\d+)?$", coords):
            lat_text, lng_text = [part.strip() for part in coords.split(",", 1)]
            return {
                "lat": float(lat_text),
                "lng": float(lng_text),
                "formatted_address": raw_key,
                "location_type": "LEGACY_CACHE",
                "types": ["legacy_cache"],
                "partial_match": False,
                "source": "legacy_cache",
                "query_kind": "legacy_cache",
                "query": raw_key,
                "score": 50,
                "confidence": "medium",
            }
    return None


def component_names(result: dict[str, Any]) -> set[str]:
    names = set()
    for component in result.get("address_components", []):
        for key in ["long_name", "short_name"]:
            value = component.get(key)
            if value:
                names.add(canonical(value))
    return names


def result_country_is_peru(result: dict[str, Any]) -> bool:
    for component in result.get("address_components", []):
        if "country" in component.get("types", []):
            return component.get("short_name") == "PE"
    return "PERU" in canonical(result.get("formatted_address", ""))


def score_result(result: dict[str, Any], sede: Any, query_kind: str) -> tuple[int, str, list[str]]:
    geometry = result.get("geometry", {})
    location_type = geometry.get("location_type", "")
    result_types = set(result.get("types", []))
    formatted = canonical(result.get("formatted_address", ""))
    names = component_names(result)
    reasons: list[str] = []
    score = 0

    location_scores = {
        "ROOFTOP": 55,
        "RANGE_INTERPOLATED": 42,
        "GEOMETRIC_CENTER": 26,
        "APPROXIMATE": 8,
    }
    score += location_scores.get(location_type, 0)
    reasons.append(f"location_type={location_type or 'unknown'}")

    if result_types & {"street_address", "subpremise", "premise"}:
        score += 22
        reasons.append("street/premise result")
    elif result_types & {"establishment", "point_of_interest"}:
        score += 16
        reasons.append("establishment result")
    elif "route" in result_types:
        score += 8
        reasons.append("route result")
    elif result_types <= {"political", "locality"} or "locality" in result_types:
        score -= 25
        reasons.append("locality-only result")

    if result.get("partial_match"):
        score -= 18
        reasons.append("partial_match")

    if not result_country_is_peru(result):
        score -= 100
        reasons.append("outside Peru")

    district = canonical(sede.distrito)
    province = canonical(sede.provincia)
    if district and (district in formatted or district in names):
        score += 16
        reasons.append("district match")
    elif province and (province in formatted or province in names):
        score += 8
        reasons.append("province match")
    else:
        score -= 12
        reasons.append("locality mismatch")

    street_tokens = [
        token
        for token in re.findall(r"[A-Z0-9]{3,}", canonical(sede.direccion))
        if token not in {"AV", "JR", "CALLE", "MZ", "LT", "NRO", "URB", "PISO", "PERU"}
    ]
    if street_tokens:
        token_hits = sum(1 for token in street_tokens[:8] if token in formatted)
        if token_hits >= 2:
            score += 10
            reasons.append("address token match")
        elif token_hits == 0 and query_kind in {"address", "address_peru"}:
            score -= 10
            reasons.append("address tokens absent")

    if query_kind in {"name_address", "company_address"} and result_types & {"establishment", "point_of_interest"}:
        score += 7
        reasons.append("business-name candidate")

    if score >= 75:
        confidence = "high"
    elif score >= 50:
        confidence = "medium"
    else:
        confidence = "low"

    return score, confidence, reasons


def best_google_result(
    sede: Any,
    razon_social: str,
    api_key: str,
    google_cache: dict[str, Any],
    legacy_cache: dict[str, str],
    delay_seconds: float,
) -> dict[str, Any]:
    best: dict[str, Any] | None = None
    attempts = []

    for candidate in build_candidates(sede, razon_social):
        payload = google_geocode(candidate["query"], api_key, google_cache)
        status = payload.get("status")
        if status in {"REQUEST_DENIED", "OVER_QUERY_LIMIT"}:
            raise RuntimeError(f"Google Geocoding API stopped with status {status}: {payload.get('error_message', '')}")

        result_count = len(payload.get("results", []))
        attempts.append({"kind": candidate["kind"], "query": candidate["query"], "status": status, "results": result_count})

        if status == "OK" and result_count:
            result = payload["results"][0]
            score, confidence, reasons = score_result(result, sede, candidate["kind"])
            location = result.get("geometry", {}).get("location", {})
            option = {
                "lat": float(location.get("lat")),
                "lng": float(location.get("lng")),
                "formatted_address": result.get("formatted_address", ""),
                "location_type": result.get("geometry", {}).get("location_type", ""),
                "types": result.get("types", []),
                "partial_match": bool(result.get("partial_match")),
                "source": "google",
                "query_kind": candidate["kind"],
                "query": candidate["query"],
                "score": score,
                "confidence": confidence,
                "reasons": reasons,
                "attempts": attempts,
            }
            if best is None or option["score"] > best["score"]:
                best = option
            if option["confidence"] == "high":
                break

        time.sleep(delay_seconds)

    if best is not None:
        best["attempts"] = attempts
        return best

    fallback = legacy_cache_lookup(sede, legacy_cache)
    if fallback is not None:
        fallback["attempts"] = attempts
        return fallback

    return {
        "lat": None,
        "lng": None,
        "formatted_address": None,
        "location_type": None,
        "types": [],
        "partial_match": False,
        "source": "not_found",
        "query_kind": None,
        "query": None,
        "score": 0,
        "confidence": "missing",
        "reasons": ["no usable Google or legacy result"],
        "attempts": attempts,
    }


def sql_string(value: str) -> str:
    return "'" + value.replace("\\", "\\\\").replace("'", "''") + "'"


@dataclass
class GeocodeRow:
    id_sede: int
    ruc: str
    razon_social: str
    nombre_comercial: str
    direccion: str
    distrito: str
    provincia: str
    departamento: str
    lat: float | None
    lng: float | None
    coordenadas_gps: str | None
    confidence: str
    score: int
    source: str
    query_kind: str | None
    query: str | None
    formatted_address: str | None
    location_type: str | None
    partial_match: bool
    reasons: list[str]
    attempts: list[dict[str, Any]]


def generate_sql(results: list[GeocodeRow], sql_path: Path) -> None:
    updates = []
    for row in results:
        if not row.coordenadas_gps:
            continue
        updates.append(
            f"UPDATE `Sede` SET `coordenadas_gps` = {sql_string(row.coordenadas_gps)}, "
            f"`fecha_modificacion` = NOW() WHERE `id_sede` = {row.id_sede};"
        )

    content = [
        "-- Actualizacion GPS de Sedes - BASE DE DATOS 2026",
        "-- Generado por database/geocode_sedes_2026.py",
        f"-- Total sedes con coordenadas: {len(updates)}",
        "",
        "START TRANSACTION;",
        "",
        *updates,
        "",
        "COMMIT;",
        "",
    ]
    sql_path.parent.mkdir(parents=True, exist_ok=True)
    sql_path.write_text("\n".join(content), encoding="utf-8")


def summarize(results: list[GeocodeRow]) -> dict[str, Any]:
    by_confidence: dict[str, int] = {}
    by_source: dict[str, int] = {}
    for row in results:
        by_confidence[row.confidence] = by_confidence.get(row.confidence, 0) + 1
        by_source[row.source] = by_source.get(row.source, 0) + 1
    return {
        "total_sedes": len(results),
        "with_coordinates": sum(1 for row in results if row.coordenadas_gps),
        "missing_coordinates": sum(1 for row in results if not row.coordenadas_gps),
        "by_confidence": dict(sorted(by_confidence.items())),
        "by_source": dict(sorted(by_source.items())),
        "low_confidence_ids": [row.id_sede for row in results if row.confidence in {"low", "missing"}],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Geocode Sede rows from BASE DE DATOS 2026.")
    parser.add_argument("--excel", type=Path, default=DEFAULT_EXCEL_PATH)
    parser.add_argument("--sql", type=Path, default=DEFAULT_SQL_PATH)
    parser.add_argument("--audit", type=Path, default=DEFAULT_AUDIT_PATH)
    parser.add_argument("--cache", type=Path, default=DEFAULT_CACHE_PATH)
    parser.add_argument("--limit", type=int, default=0, help="Limit rows for testing")
    parser.add_argument("--delay", type=float, default=0.05, help="Delay between Google requests")
    parser.add_argument("--flush-every", type=int, default=25)
    parser.add_argument("--quiet", action="store_true", help="Print periodic progress only")
    args = parser.parse_args()

    api_key = load_api_key()
    sedes, empresa_by_ruc = load_entities(args.excel.resolve())
    if args.limit:
        sedes = sedes[: args.limit]

    google_cache = load_json(args.cache, {})
    legacy_cache = load_json(LEGACY_CACHE_PATH, {})
    results: list[GeocodeRow] = []

    total = len(sedes)
    for index, sede in enumerate(sedes, start=1):
        empresa = empresa_by_ruc.get(sede.ruc)
        razon_social = clean_text(getattr(empresa, "razon_social", "")) if empresa else ""
        result = best_google_result(sede, razon_social, api_key, google_cache, legacy_cache, args.delay)

        coords = None
        if result["lat"] is not None and result["lng"] is not None:
            coords = f"{result['lat']:.6f},{result['lng']:.6f}"

        row = GeocodeRow(
            id_sede=sede.id_sede,
            ruc=sede.ruc,
            razon_social=razon_social,
            nombre_comercial=sede.nombre_comercial,
            direccion=sede.direccion,
            distrito=sede.distrito,
            provincia=sede.provincia,
            departamento=sede.departamento,
            lat=result["lat"],
            lng=result["lng"],
            coordenadas_gps=coords,
            confidence=result["confidence"],
            score=result["score"],
            source=result["source"],
            query_kind=result["query_kind"],
            query=result["query"],
            formatted_address=result["formatted_address"],
            location_type=result["location_type"],
            partial_match=result["partial_match"],
            reasons=result.get("reasons", []),
            attempts=result.get("attempts", []),
        )
        results.append(row)

        if args.quiet:
            if index == 1 or index == total or index % args.flush_every == 0:
                summary = summarize(results)
                print(
                    f"[{index:04d}/{total}] coords={summary['with_coordinates']} "
                    f"missing={summary['missing_coordinates']} confidence={summary['by_confidence']}"
                )
        else:
            print(
                f"[{index:04d}/{total}] {sede.id_sede:04d} "
                f"{sede.nombre_comercial[:38]:38} {row.confidence:7} {row.coordenadas_gps or 'SIN_COORDS'}"
            )

        if index % args.flush_every == 0:
            save_json(args.cache, google_cache)
            generate_sql(results, args.sql)
            save_json(
                args.audit,
                {
                    "summary": summarize(results),
                    "partial": index < total,
                    "results": [asdict(item) for item in results],
                },
            )

    save_json(args.cache, google_cache)
    generate_sql(results, args.sql)
    audit_payload = {
        "summary": summarize(results),
        "partial": False,
        "sql_output": str(args.sql.resolve()),
        "cache_output": str(args.cache.resolve()),
        "results": [asdict(item) for item in results],
    }
    save_json(args.audit, audit_payload)
    print(json.dumps(audit_payload["summary"], ensure_ascii=False, indent=2))
    print(f"SQL: {args.sql.resolve()}")
    print(f"Audit: {args.audit.resolve()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
