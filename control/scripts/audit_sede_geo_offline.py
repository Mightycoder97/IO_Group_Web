#!/usr/bin/env python3
"""Offline Sede geo-region audit using SQL import data and geo_location catalog.

Reads Sede rows from the SQL import migration and validates distrito/provincia/
departamento/region against the geo catalog defined in geo_location.php.

Usage:
  python scripts/audit_sede_geo_offline.py
"""
from __future__ import annotations
import json, re, unicodedata, csv
from datetime import datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

# --- Geo catalog (mirrored from geo_location.php) ---
CATALOG_ROWS = [
    "LIMA|LIMA|LIMA|ANCON","LIMA|LIMA|LIMA|ATE","LIMA|LIMA|LIMA|BARRANCO",
    "LIMA|LIMA|LIMA|BRENA","LIMA|LIMA|LIMA|CARABAYLLO","LIMA|LIMA|LIMA|CHACLACAYO",
    "LIMA|LIMA|LIMA|CHORRILLOS","LIMA|LIMA|LIMA|CIENEGUILLA","LIMA|LIMA|LIMA|COMAS",
    "LIMA|LIMA|LIMA|EL AGUSTINO","LIMA|LIMA|LIMA|INDEPENDENCIA",
    "LIMA|LIMA|LIMA|JESUS MARIA","LIMA|LIMA|LIMA|LA MOLINA","LIMA|LIMA|LIMA|LA VICTORIA",
    "LIMA|LIMA|LIMA|LINCE","LIMA|LIMA|LIMA|LOS OLIVOS",
    "LIMA|LIMA|LIMA|LURIGANCHO CHOSICA","LIMA|LIMA|LIMA|LURIN",
    "LIMA|LIMA|LIMA|MAGDALENA DEL MAR","LIMA|LIMA|LIMA|MIRAFLORES",
    "LIMA|LIMA|LIMA|PACHACAMAC","LIMA|LIMA|LIMA|PUCUSANA","LIMA|LIMA|LIMA|PUEBLO LIBRE",
    "LIMA|LIMA|LIMA|PUENTE PIEDRA","LIMA|LIMA|LIMA|PUNTA HERMOSA",
    "LIMA|LIMA|LIMA|PUNTA NEGRA","LIMA|LIMA|LIMA|RIMAC","LIMA|LIMA|LIMA|SAN BARTOLO",
    "LIMA|LIMA|LIMA|SAN BORJA","LIMA|LIMA|LIMA|SAN ISIDRO",
    "LIMA|LIMA|LIMA|SAN JUAN DE LURIGANCHO","LIMA|LIMA|LIMA|SAN JUAN DE MIRAFLORES",
    "LIMA|LIMA|LIMA|SAN LUIS","LIMA|LIMA|LIMA|SAN MARTIN DE PORRES",
    "LIMA|LIMA|LIMA|SAN MIGUEL","LIMA|LIMA|LIMA|SANTA ANITA",
    "LIMA|LIMA|LIMA|SANTA MARIA DEL MAR","LIMA|LIMA|LIMA|SANTA ROSA",
    "LIMA|LIMA|LIMA|SANTIAGO DE SURCO","LIMA|LIMA|LIMA|SURQUILLO",
    "LIMA|LIMA|LIMA|VILLA EL SALVADOR","LIMA|LIMA|LIMA|VILLA MARIA DEL TRIUNFO",
    "LIMA|LIMA|LIMA|CERCADO DE LIMA",
    "LIMA|LIMA|BARRANCA|BARRANCA","LIMA|LIMA|BARRANCA|PARAMONGA",
    "LIMA|LIMA|CANETE|SAN VICENTE DE CANETE","LIMA|LIMA|CANETE|ASIA",
    "LIMA|LIMA|CANETE|CHILCA","LIMA|LIMA|CANETE|IMPERIAL","LIMA|LIMA|CANETE|MALA",
    "LIMA|LIMA|CANETE|NUEVO IMPERIAL","LIMA|LIMA|CANETE|QUILMANA",
    "LIMA|LIMA|CANETE|SAN ANTONIO","LIMA|LIMA|CANETE|SAN LUIS",
    "LIMA|LIMA|HUARAL|HUARAL","LIMA|LIMA|HUARAL|AUCALLAMA","LIMA|LIMA|HUARAL|CHANCAY",
    "LIMA|LIMA|HUAROCHIRI|MATUCANA","LIMA|LIMA|HUAROCHIRI|RICARDO PALMA",
    "LIMA|LIMA|HUAROCHIRI|SANTA EULALIA",
    "LIMA|LIMA|HUAURA|HUACHO","LIMA|LIMA|HUAURA|HUALMAY","LIMA|LIMA|HUAURA|HUAURA",
    "ICA|ICA|ICA|ICA","ICA|ICA|ICA|LA TINGUINA","ICA|ICA|ICA|LOS AQUIJES",
    "ICA|ICA|ICA|PARCONA","ICA|ICA|ICA|PUEBLO NUEVO","ICA|ICA|ICA|SUBTANJALLA",
    "ICA|ICA|ICA|SAN JUAN BAUTISTA","ICA|ICA|ICA|SANTIAGO",
    "ICA|ICA|CHINCHA|CHINCHA ALTA","ICA|ICA|CHINCHA|ALTO LARAN",
    "ICA|ICA|CHINCHA|CHINCHA BAJA","ICA|ICA|CHINCHA|EL CARMEN",
    "ICA|ICA|CHINCHA|GROCIO PRADO","ICA|ICA|CHINCHA|PUEBLO NUEVO",
    "ICA|ICA|CHINCHA|SUNAMPE","ICA|ICA|CHINCHA|TAMBO DE MORA",
    "ICA|ICA|NAZCA|NAZCA","ICA|ICA|NAZCA|MARCONA","ICA|ICA|NAZCA|VISTA ALEGRE",
    "ICA|ICA|PALPA|PALPA","ICA|ICA|PISCO|PISCO","ICA|ICA|PISCO|PARACAS",
    "ICA|ICA|PISCO|SAN ANDRES","ICA|ICA|PISCO|SAN CLEMENTE",
    "LIMA|CALLAO|CALLAO|CALLAO","LIMA|CALLAO|CALLAO|BELLAVISTA",
    "LIMA|CALLAO|CALLAO|CARMEN DE LA LEGUA REYNOSO","LIMA|CALLAO|CALLAO|LA PERLA",
    "LIMA|CALLAO|CALLAO|LA PUNTA","LIMA|CALLAO|CALLAO|MI PERU",
    "LIMA|CALLAO|CALLAO|VENTANILLA",
]

ALIASES = {
    "SURCO": {"distrito": "SANTIAGO DE SURCO", "provincia": "LIMA", "departamento": "LIMA"},
    "LURIGANCHO": {"distrito": "LURIGANCHO CHOSICA", "provincia": "LIMA", "departamento": "LIMA"},
    "MAGDALENA": {"distrito": "MAGDALENA DEL MAR", "provincia": "LIMA", "departamento": "LIMA"},
    "CERCADO": {"distrito": "CERCADO DE LIMA", "provincia": "LIMA", "departamento": "LIMA"},
    "LIMA CERCADO": {"distrito": "CERCADO DE LIMA", "provincia": "LIMA", "departamento": "LIMA"},
    "ATE VITARTE": {"distrito": "ATE", "provincia": "LIMA", "departamento": "LIMA"},
    "SJL": {"distrito": "SAN JUAN DE LURIGANCHO", "provincia": "LIMA", "departamento": "LIMA"},
    "SAN JUAN DE LURIGANCHO 1": {"distrito": "SAN JUAN DE LURIGANCHO", "provincia": "LIMA", "departamento": "LIMA"},
    "SJM": {"distrito": "SAN JUAN DE MIRAFLORES", "provincia": "LIMA", "departamento": "LIMA"},
    "VES": {"distrito": "VILLA EL SALVADOR", "provincia": "LIMA", "departamento": "LIMA"},
    "VMT": {"distrito": "VILLA MARIA DEL TRIUNFO", "provincia": "LIMA", "departamento": "LIMA"},
    "SMP": {"distrito": "SAN MARTIN DE PORRES", "provincia": "LIMA", "departamento": "LIMA"},
    "CANETE": {"distrito": "SAN VICENTE DE CANETE", "provincia": "CANETE", "departamento": "LIMA"},
    "SAN VICENTE": {"distrito": "SAN VICENTE DE CANETE", "provincia": "CANETE", "departamento": "LIMA"},
    "CHINCHA": {"distrito": "CHINCHA ALTA", "provincia": "CHINCHA", "departamento": "ICA"},
    "PISCO ICA": {"distrito": "PISCO", "provincia": "PISCO", "departamento": "ICA"},
    "ICA PISCO": {"distrito": "PISCO", "provincia": "PISCO", "departamento": "ICA"},
    "CALLAO BELLAVISTA": {"distrito": "BELLAVISTA", "provincia": "CALLAO", "departamento": "CALLAO"},
    "CALLAO VENTANILLA": {"distrito": "VENTANILLA", "provincia": "CALLAO", "departamento": "CALLAO"},
}


def norm(value: str | None) -> str:
    value = value or ""
    value = unicodedata.normalize("NFD", value)
    value = "".join(ch for ch in value if unicodedata.category(ch) != "Mn")
    value = re.sub(r"[^A-Z0-9]+", " ", value.upper())
    return re.sub(r"\s+", " ", value).strip()


def build_catalog():
    by_district: dict[str, list[dict]] = {}
    for row in CATALOG_ROWS:
        region, dept, prov, dist = row.split("|")
        entry = {"region": region, "departamento": dept, "provincia": prov, "distrito": dist}
        by_district.setdefault(norm(dist), []).append(entry)
    norm_aliases = {norm(k): v for k, v in ALIASES.items()}
    return by_district, norm_aliases


def resolve_location(district, province=None, department=None):
    by_district, aliases = build_catalog()
    dk = norm(district)
    pk = norm(province)
    depk = norm(department)
    if not dk:
        return None
    if dk in aliases:
        alias = aliases[dk]
        dk = norm(alias["distrito"])
        pk = pk or norm(alias["provincia"])
        depk = depk or norm(alias["departamento"])
    candidates = by_district.get(dk, [])
    if not candidates:
        return None
    best, best_score = None, -1
    for c in candidates:
        score = 0
        if pk and norm(c["provincia"]) == pk: score += 4
        if depk and norm(c["departamento"]) == depk: score += 3
        if depk == "CALLAO" and c["departamento"] == "CALLAO": score += 6
        if depk == "ICA" and c["region"] == "ICA": score += 2
        if depk == "LIMA" and c["region"] == "LIMA": score += 1
        if score > best_score:
            best_score = score
            best = c
    if best:
        best = dict(best)
        best["ambiguous"] = len(candidates) > 1 and best_score <= 0
    return best


def region_from_dept(dept):
    d = norm(dept)
    if d == "ICA": return "ICA"
    if d in ("LIMA", "CALLAO"): return "LIMA"
    return None


def split_sql_tuple(line: str) -> list[str | None]:
    text = line.strip()
    if text.endswith(","): text = text[:-1]
    if text.endswith(";"): text = text[:-1]
    if text.startswith("(") and text.endswith(")"): text = text[1:-1]
    values, current, in_quote, i = [], [], False, 0
    while i < len(text):
        ch = text[i]
        if ch == "'":
            if in_quote and i + 1 < len(text) and text[i + 1] == "'":
                current.append("'"); i += 2; continue
            in_quote = not in_quote; i += 1; continue
        if ch == "," and not in_quote:
            val = "".join(current).strip()
            values.append(None if val.upper() == "NULL" else val)
            current = []; i += 1; continue
        current.append(ch); i += 1
    val = "".join(current).strip()
    values.append(None if val.upper() == "NULL" else val)
    return values


def read_sedes(sql_path: Path) -> list[dict]:
    """Read Sede rows from the full-schema INSERT."""
    sedes = []
    in_sede_insert = False
    col_count = 0
    for line in sql_path.read_text(encoding="utf-8", errors="replace").splitlines():
        if line.startswith("INSERT INTO `Sede`"):
            in_sede_insert = True
            # Detect column order from header
            m = re.search(r"\(([^)]+)\)\s+VALUES", line)
            if m:
                cols = [c.strip().strip("`") for c in m.group(1).split(",")]
                col_count = len(cols)
            continue
        if not in_sede_insert:
            continue
        stripped = line.strip()
        if not stripped or stripped == ";":
            in_sede_insert = False; continue
        if not stripped.startswith("("):
            continue
        values = split_sql_tuple(stripped)
        if len(values) < 7:
            continue
        # Map by column names from the INSERT header
        # Full schema: id_sede, id_empresa, nombre_comercial, direccion, distrito,
        #              provincia, departamento, referencia, coordenadas_gps,
        #              contacto_nombre, contacto_telefono, contacto_telefono_2,
        #              contacto_email, activo
        # Or legacy: id_sede, id_empresa, nombre_comercial, tipo, ruc, direccion,
        #            distrito, provincia, departamento, activo
        sede = {}
        if col_count >= 14:
            sede = {
                "id_sede": int(values[0] or 0),
                "nombre_comercial": values[2],
                "direccion": values[3],
                "distrito": values[4],
                "provincia": values[5],
                "departamento": values[6],
                "coordenadas_gps": values[8] if len(values) > 8 else None,
                "activo": int(values[-1] or 0),
            }
        elif col_count >= 9:
            sede = {
                "id_sede": int(values[0] or 0),
                "nombre_comercial": values[2],
                "direccion": values[5] if len(values) > 5 else None,
                "distrito": values[6],
                "provincia": values[7],
                "departamento": values[8],
                "coordenadas_gps": None,
                "activo": int(values[-1] or 0),
            }
        else:
            continue
        sedes.append(sede)
        if stripped.endswith(";"):
            in_sede_insert = False
    return sedes


def main() -> int:
    sql_path = ROOT / "database" / "migrations" / "import_base_datos_2026.sql"
    output_dir = ROOT / "database" / "migrations"
    output_dir.mkdir(parents=True, exist_ok=True)

    sedes = read_sedes(sql_path)
    print(f"Sedes leidas del SQL: {len(sedes)}")

    updates, reviews, audit_rows = [], [], []
    ok_count = 0

    for i, sede in enumerate(sedes):
        distrito = sede["distrito"]
        provincia = sede["provincia"]
        departamento = sede["departamento"]
        status = "review"
        reason = ""

        location = resolve_location(distrito, provincia, departamento)

        if location and not location.get("ambiguous"):
            changed = False
            for field in ("distrito", "provincia", "departamento", "region"):
                old = norm(sede.get(field, ""))
                new = norm(location.get(field, ""))
                if old != new:
                    changed = True
                    break
            if changed:
                status = "update"
                updates.append({
                    "id_sede": sede["id_sede"],
                    "before": {
                        "distrito": distrito, "provincia": provincia,
                        "departamento": departamento,
                        "region": region_from_dept(departamento),
                    },
                    "after": location,
                    "source": "catalog_alias",
                })
            else:
                status = "ok"
                ok_count += 1
        elif location and location.get("ambiguous"):
            status = "review"
            reason = "distrito ambiguo en catalogo"
            reviews.append({
                "id_sede": sede["id_sede"],
                "nombre_comercial": sede["nombre_comercial"],
                "distrito": distrito, "provincia": provincia,
                "departamento": departamento, "reason": reason,
            })
        else:
            reason = "distrito no encontrado en catalogo"
            # Try to assign region from department
            r = region_from_dept(departamento)
            if r:
                current_region = region_from_dept(departamento)
                status = "ok_region_only"
                ok_count += 1
            else:
                reviews.append({
                    "id_sede": sede["id_sede"],
                    "nombre_comercial": sede["nombre_comercial"],
                    "distrito": distrito, "provincia": provincia,
                    "departamento": departamento, "reason": reason,
                })

        audit_rows.append({
            "id_sede": sede["id_sede"],
            "nombre_comercial": sede["nombre_comercial"],
            "distrito": distrito, "provincia": provincia,
            "departamento": departamento,
            "status": status, "reason": reason,
        })

    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    sql_out = output_dir / f"fix_sedes_region_distrito_offline_{stamp}.sql"
    audit_out = output_dir / f"fix_sedes_region_distrito_offline_{stamp}_audit.json"
    review_out = output_dir / f"fix_sedes_region_distrito_offline_{stamp}_review.csv"

    # Write SQL
    sql_lines = [
        "-- Sede district/province/department/region corrections (offline catalog audit)",
        "START TRANSACTION;", "",
    ]
    for u in updates:
        a = u["after"]
        d = a["distrito"].replace("'", "''")
        p = a["provincia"].replace("'", "''")
        dep = a["departamento"].replace("'", "''")
        r = a["region"].replace("'", "''")
        sql_lines.append(
            f"UPDATE `Sede` SET `distrito` = '{d}', `provincia` = '{p}', "
            f"`departamento` = '{dep}', `region` = '{r}', `fecha_modificacion` = NOW() "
            f"WHERE `id_sede` = {u['id_sede']};"
        )
    sql_lines.extend(["", "COMMIT;", ""])
    sql_out.write_text("\n".join(sql_lines), encoding="utf-8")

    # Write audit JSON
    audit_out.write_text(json.dumps({
        "generated_at": datetime.now().isoformat(),
        "summary": {"total": len(audit_rows), "ok": ok_count, "updates": len(updates), "review": len(reviews)},
        "rows": audit_rows,
    }, ensure_ascii=False, indent=2), encoding="utf-8")

    # Write review CSV
    with review_out.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=["id_sede", "nombre_comercial", "distrito", "provincia", "departamento", "reason"])
        writer.writeheader()
        writer.writerows(reviews)

    print(f"\nSummary")
    print(f"OK: {ok_count}")
    print(f"Updates: {len(updates)}")
    print(f"Review: {len(reviews)}")
    print(f"SQL: {sql_out}")
    print(f"Audit: {audit_out}")
    print(f"Review CSV: {review_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
