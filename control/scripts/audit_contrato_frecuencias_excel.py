#!/usr/bin/env python3
"""Compare ContratoServicio.frecuencia with DATA IOGROUP column AG.

This script uses only Python standard libraries. It reads the XLSX as a zip,
parses the SQL import migration, and writes SQL/JSON/CSV audit outputs.

Usage:
  python scripts/audit_contrato_frecuencias_excel.py
  python scripts/audit_contrato_frecuencias_excel.py --sql database/migrations/import_base_datos_2026.sql
"""

from __future__ import annotations

import argparse
import csv
import json
import re
import unicodedata
import zipfile
from datetime import datetime
from pathlib import Path
from xml.etree import ElementTree as ET


ROOT = Path(__file__).resolve().parents[1]
NS_MAIN = "{http://schemas.openxmlformats.org/spreadsheetml/2006/main}"
NS_REL = "{http://schemas.openxmlformats.org/officeDocument/2006/relationships}"
NS_PKG_REL = "{http://schemas.openxmlformats.org/package/2006/relationships}"


def norm(value: str | None) -> str:
    value = value or ""
    value = unicodedata.normalize("NFD", value)
    value = "".join(ch for ch in value if unicodedata.category(ch) != "Mn")
    value = re.sub(r"[^A-Z0-9]+", " ", value.upper())
    return re.sub(r"\s+", " ", value).strip()


def normalize_frequency(value: str | None) -> tuple[str | None, str | None]:
    raw = (value or "").strip()
    key = norm(raw)
    if not key:
        return None, "sin frecuencia"
    if any(token in key for token in ("INTERDIARIO", "CADA 72", "3 VECES", "03 VECES", "2 VECES POR SEMANA")):
        return "interdiario", None
    if "QUINCENAL" in key or "15CENAL" in key:
        return "quincenal", None
    if "BIMENSUAL" in key or "BIMESTRAL" in key:
        return "bimestral", None
    if "SEMANAL" in key:
        return "semanal", None
    if "MENSUAL" in key and "ORDEN" not in key:
        return "mensual", None
    if key == "DIARIO":
        return "diario", None
    if key == "TRIMESTRAL":
        return "trimestral", None
    if key == "EVENTUAL":
        return "eventual", None
    return None, f"frecuencia requiere revision: {raw}"


def read_text_from_xlsx(zip_file: zipfile.ZipFile, name: str) -> str:
    with zip_file.open(name) as fh:
        return fh.read().decode("utf-8")


def read_shared_strings(zip_file: zipfile.ZipFile) -> list[str]:
    try:
        root = ET.fromstring(read_text_from_xlsx(zip_file, "xl/sharedStrings.xml"))
    except KeyError:
        return []
    values: list[str] = []
    for item in root.findall(f"{NS_MAIN}si"):
        texts = [node.text or "" for node in item.iter(f"{NS_MAIN}t")]
        values.append("".join(texts).strip())
    return values


def read_cell_value(cell: ET.Element, shared: list[str]) -> str | None:
    cell_type = cell.attrib.get("t")
    value = cell.find(f"{NS_MAIN}v")
    if cell_type == "s" and value is not None:
        idx = int(value.text or "0")
        return shared[idx] if idx < len(shared) else None
    if cell_type == "inlineStr":
        texts = [node.text or "" for node in cell.iter(f"{NS_MAIN}t")]
        return "".join(texts).strip()
    return (value.text or "").strip() if value is not None else None


def read_excel_ag_frequencies(path: Path) -> dict[int, str]:
    with zipfile.ZipFile(path) as zip_file:
        workbook = ET.fromstring(read_text_from_xlsx(zip_file, "xl/workbook.xml"))
        sheet_rid = None
        for sheet in workbook.findall(f"{NS_MAIN}sheets/{NS_MAIN}sheet"):
            if sheet.attrib.get("name") == "DATA IOGROUP":
                sheet_rid = sheet.attrib.get(f"{NS_REL}id")
                break
        if not sheet_rid:
            raise RuntimeError("No se encontro hoja DATA IOGROUP")

        rels = ET.fromstring(read_text_from_xlsx(zip_file, "xl/_rels/workbook.xml.rels"))
        target = None
        for rel in rels.findall(f"{NS_PKG_REL}Relationship"):
            if rel.attrib.get("Id") == sheet_rid:
                target = rel.attrib.get("Target")
                break
        if not target:
            raise RuntimeError("No se encontro relacion de DATA IOGROUP")

        sheet_path = target.lstrip("/") if target.startswith("/") else "xl/" + target
        shared = read_shared_strings(zip_file)
        sheet_xml = ET.fromstring(read_text_from_xlsx(zip_file, sheet_path))

        result: dict[int, str] = {}
        for row in sheet_xml.findall(f"{NS_MAIN}sheetData/{NS_MAIN}row"):
            row_num = int(row.attrib.get("r", "0"))
            if row_num <= 1:
                continue
            for cell in row.findall(f"{NS_MAIN}c"):
                if cell.attrib.get("r") == f"AG{row_num}":
                    value = read_cell_value(cell, shared)
                    if value:
                        result[row_num] = value
                    break
        return result


def split_sql_tuple(line: str) -> list[str | None]:
    text = line.strip()
    if text.endswith(","):
        text = text[:-1]
    if text.endswith(";"):
        text = text[:-1]
    if text.startswith("(") and text.endswith(")"):
        text = text[1:-1]

    values: list[str | None] = []
    current: list[str] = []
    in_quote = False
    i = 0
    while i < len(text):
        ch = text[i]
        if ch == "'":
            if in_quote and i + 1 < len(text) and text[i + 1] == "'":
                current.append("'")
                i += 2
                continue
            in_quote = not in_quote
            i += 1
            continue
        if ch == "," and not in_quote:
            values.append(clean_sql_value("".join(current)))
            current = []
            i += 1
            continue
        current.append(ch)
        i += 1
    values.append(clean_sql_value("".join(current)))
    return values


def clean_sql_value(value: str) -> str | None:
    value = value.strip()
    return None if value.upper() == "NULL" else value


def read_contracts(sql_path: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    in_contract_insert = False
    for line in sql_path.read_text(encoding="utf-8", errors="replace").splitlines():
        if line.startswith("INSERT INTO `ContratoServicio`"):
            in_contract_insert = True
            continue
        if not in_contract_insert:
            continue
        stripped = line.strip()
        if not stripped:
            continue
        if stripped == ";":
            in_contract_insert = False
            continue
        if not stripped.startswith("("):
            continue
        values = split_sql_tuple(stripped)
        if len(values) < 13:
            continue
        rows.append(
            {
                "id_contrato": int(values[0] or 0),
                "id_sede": int(values[1] or 0),
                "frecuencia": values[4],
                "observaciones": values[11] or "",
                "activo": int(values[12] or 0),
            }
        )
        if stripped.endswith(";"):
            in_contract_insert = False
    return rows


def excel_row_ref(observaciones: str) -> int | None:
    match = re.search(r"Filas Excel:\s*(\d+)", observaciones, flags=re.I)
    return int(match.group(1)) if match else None


def sql_escape(value: str) -> str:
    return value.replace("'", "''")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--xlsx", default=str(ROOT / "BASE DE DATOS 2026.xlsx"))
    parser.add_argument("--sql", default=str(ROOT / "database/migrations/import_base_datos_2026.sql"))
    parser.add_argument("--output-dir", default=str(ROOT / "database/migrations"))
    args = parser.parse_args()

    xlsx_path = Path(args.xlsx)
    sql_path = Path(args.sql)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    excel = read_excel_ag_frequencies(xlsx_path)
    contracts = read_contracts(sql_path)
    updates: list[dict[str, object]] = []
    reviews: list[dict[str, object]] = []
    audit: list[dict[str, object]] = []

    for contract in contracts:
        row = excel_row_ref(str(contract["observaciones"]))
        raw = excel.get(row or -1)
        normalized, reason = normalize_frequency(raw)
        status = "ok"
        if row is None or raw is None:
            status = "review"
            reason = "sin frecuencia AG para fila Excel"
        elif normalized is None:
            status = "review"
        elif normalized != contract["frecuencia"]:
            status = "update"
            updates.append(
                {
                    "id_contrato": contract["id_contrato"],
                    "id_sede": contract["id_sede"],
                    "from": contract["frecuencia"],
                    "to": normalized,
                    "excel_row": row,
                    "raw": raw,
                }
            )
        if status == "review":
            reviews.append(
                {
                    "id_contrato": contract["id_contrato"],
                    "id_sede": contract["id_sede"],
                    "excel_row": row,
                    "raw": raw,
                    "frecuencia_actual": contract["frecuencia"],
                    "reason": reason,
                }
            )
        audit.append(
            {
                "id_contrato": contract["id_contrato"],
                "id_sede": contract["id_sede"],
                "excel_row": row,
                "raw": raw,
                "actual": contract["frecuencia"],
                "normalizada": normalized,
                "status": status,
                "reason": reason,
            }
        )

    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    sql_out = output_dir / f"fix_contrato_frecuencias_{stamp}.sql"
    audit_out = output_dir / f"fix_contrato_frecuencias_{stamp}_audit.json"
    review_out = output_dir / f"fix_contrato_frecuencias_{stamp}_review.csv"

    sql_lines = [
        "-- ContratoServicio frecuencia corrections generated from DATA IOGROUP AG",
        "START TRANSACTION;",
        "",
    ]
    for update in updates:
        sql_lines.append(
            "UPDATE `ContratoServicio` "
            f"SET `frecuencia` = '{sql_escape(str(update['to']))}', `fecha_modificacion` = NOW() "
            f"WHERE `id_contrato` = {update['id_contrato']};"
        )
    sql_lines.extend(["", "COMMIT;", ""])
    sql_out.write_text("\n".join(sql_lines), encoding="utf-8")

    audit_out.write_text(
        json.dumps(
            {
                "generated_at": datetime.now().isoformat(),
                "summary": {"total": len(audit), "updates": len(updates), "review": len(reviews)},
                "rows": audit,
            },
            ensure_ascii=False,
            indent=2,
        ),
        encoding="utf-8",
    )

    with review_out.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(
            fh,
            fieldnames=["id_contrato", "id_sede", "excel_row", "raw", "frecuencia_actual", "reason"],
        )
        writer.writeheader()
        writer.writerows(reviews)

    print(f"Contratos comparados: {len(audit)}")
    print(f"Updates: {len(updates)}")
    print(f"Review: {len(reviews)}")
    print(f"SQL: {sql_out}")
    print(f"Audit: {audit_out}")
    print(f"Review CSV: {review_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
