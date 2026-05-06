#!/usr/bin/env python3
"""
Build a MySQL import from BASE DE DATOS 2026.xlsx / DATA IOGROUP.

The script intentionally uses only the Python standard library. The local
environment does not provide openpyxl, and this importer should stay portable.
"""

from __future__ import annotations

import argparse
import datetime as dt
import json
import posixpath
import re
import sys
import unicodedata
import zipfile
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from decimal import Decimal, InvalidOperation, ROUND_HALF_UP
from pathlib import Path
from typing import Any
from xml.etree import ElementTree as ET


ROOT_DIR = Path(__file__).resolve().parents[1]
DEFAULT_EXCEL_PATH = ROOT_DIR / "BASE DE DATOS 2026.xlsx"
DEFAULT_SQL_PATH = ROOT_DIR / "database" / "migrations" / "import_base_datos_2026.sql"
DEFAULT_FORCE_SQL_PATH = ROOT_DIR / "database" / "migrations" / "import_base_datos_2026_force_clean.sql"
DEFAULT_AUDIT_PATH = ROOT_DIR / "database" / "migrations" / "import_base_datos_2026_audit.json"
DEFAULT_FORCE_AUDIT_PATH = ROOT_DIR / "database" / "migrations" / "import_base_datos_2026_force_clean_audit.json"
SHEET_NAME = "DATA IOGROUP"
DEFAULT_FECHA_INICIO = "2020-01-01"

MAIN_NS = "http://schemas.openxmlformats.org/spreadsheetml/2006/main"
REL_NS = "http://schemas.openxmlformats.org/package/2006/relationships"
OFFICE_REL_NS = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"
NS = {"a": MAIN_NS, "rel": REL_NS}

EXPECTED_HEADERS = {
    "CLIENTE",
    "RUC",
    "FECHA INICIO CONTRATO",
    "LIMITE DE PESO",
    "RAZON SOCIAL",
    "RUBRO",
    "DIRECCION",
    "DISTRITO",
    "NOMBRE COMERCIAL",
    "HORARIO",
    "CONTACTO",
    "OBSERVACION",
    "RENOVACION DE CONTRATO",
    "VIGENCIA",
    "CONTACTO HOJA DE RUTA",
    "METODO PAGO",
    "DEBEN",
    "INICIO DE SERVICIO CLIENTES NUEVOS",
    "PROGRAMACIONES NUMERO",
    "FECHA DE SERVICIO",
    "PROVINCIA",
    "DEPARTAMENTO",
    "REPRESENTANTE",
    "DNI",
    "FRECUENCIA",
    "TELEFONO PARA PROGRAMAR",
    "TELEFONO PARA COBRAR",
    "STATUS",
    "TARIFA",
    "UBICACION",
}

CORE_ROW_FIELDS = {
    "RUC",
    "RAZON SOCIAL",
    "DIRECCION",
    "DISTRITO",
    "NOMBRE COMERCIAL",
    "REPRESENTANTE",
    "DNI",
    "STATUS",
    "TARIFA",
    "FECHA INICIO CONTRATO",
    "LIMITE DE PESO",
    "FRECUENCIA",
}

DEPENDENT_TABLES = [
    "Servicio",
    "ServicioEmpleado",
    "Factura",
    "Guia",
    "Manifiesto",
    "IngresoNuevoCliente",
    "GestionCobranza",
]

MONTHS = {
    "ENE": 1,
    "ENERO": 1,
    "FEB": 2,
    "FEBRERO": 2,
    "MAR": 3,
    "MARZO": 3,
    "ABR": 4,
    "ABRIL": 4,
    "MAY": 5,
    "MAYO": 5,
    "JUN": 6,
    "JUNIO": 6,
    "JUL": 7,
    "JULIO": 7,
    "AGO": 8,
    "AGOSTO": 8,
    "SET": 9,
    "SEP": 9,
    "SEPT": 9,
    "SETIEMBRE": 9,
    "SEPTIEMBRE": 9,
    "OCT": 10,
    "OCTUBRE": 10,
    "NOV": 11,
    "NOVIEMBRE": 11,
    "DIC": 12,
    "DICIEMBRE": 12,
}


def strip_accents(value: str) -> str:
    normalized = unicodedata.normalize("NFD", value)
    return "".join(ch for ch in normalized if unicodedata.category(ch) != "Mn")


def clean_text(value: Any) -> str:
    if value is None:
        return ""
    text = str(value).replace("\t", " ").replace("\xa0", " ").replace("\x00", "")
    return re.sub(r"\s+", " ", text).strip()


def header_key(value: Any) -> str:
    text = strip_accents(clean_text(value)).upper()
    text = text.replace("NRO.", "NRO")
    return re.sub(r"\s+", " ", text).strip()


def canonical(value: Any) -> str:
    return header_key(value)


def only_digits(value: Any) -> str:
    return re.sub(r"\D", "", clean_text(value))


def decimal_or_none(value: Any) -> Decimal | None:
    if value is None:
        return None
    try:
        return Decimal(str(value)).quantize(Decimal("0.01"), rounding=ROUND_HALF_UP)
    except (InvalidOperation, ValueError):
        return None


def decimal_sql(value: Decimal | None) -> str:
    if value is None:
        return "NULL"
    return f"{value:.2f}"


def cell_ref_to_col(ref: str) -> int | None:
    match = re.match(r"([A-Z]+)", ref or "")
    if not match:
        return None
    number = 0
    for char in match.group(1):
        number = number * 26 + ord(char) - 64
    return number


def shared_string_text(element: ET.Element | None) -> str:
    if element is None:
        return ""
    return "".join(node.text or "" for node in element.findall(".//a:t", NS))


def read_xlsx_sheet(path: Path, sheet_name: str) -> tuple[list[tuple[int, dict[str, str]]], list[str]]:
    with zipfile.ZipFile(path) as archive:
        shared_strings: list[str] = []
        if "xl/sharedStrings.xml" in archive.namelist():
            root = ET.fromstring(archive.read("xl/sharedStrings.xml"))
            shared_strings = [shared_string_text(si) for si in root.findall("a:si", NS)]

        workbook = ET.fromstring(archive.read("xl/workbook.xml"))
        rels = ET.fromstring(archive.read("xl/_rels/workbook.xml.rels"))
        rel_targets = {
            rel.attrib["Id"]: rel.attrib["Target"]
            for rel in rels.findall("rel:Relationship", NS)
        }

        sheet_part = None
        available_sheets = []
        for sheet in workbook.findall("a:sheets/a:sheet", NS):
            name = sheet.attrib.get("name", "")
            available_sheets.append(name)
            if name.strip().lower() != sheet_name.strip().lower():
                continue
            rel_id = sheet.attrib.get(f"{{{OFFICE_REL_NS}}}id")
            target = rel_targets[rel_id]
            sheet_part = posixpath.normpath(posixpath.join("xl", target.lstrip("/")))

        if sheet_part is None:
            raise RuntimeError(
                f"Sheet {sheet_name!r} not found. Available sheets: {', '.join(available_sheets)}"
            )

        sheet_root = ET.fromstring(archive.read(sheet_part))

        def cell_value(cell: ET.Element) -> str:
            cell_type = cell.attrib.get("t")
            if cell_type == "s":
                value_node = cell.find("a:v", NS)
                if value_node is None or value_node.text is None:
                    return ""
                return shared_strings[int(value_node.text)]
            if cell_type == "inlineStr":
                return shared_string_text(cell.find("a:is", NS))
            value_node = cell.find("a:v", NS)
            return value_node.text if value_node is not None and value_node.text is not None else ""

        raw_rows: list[tuple[int, dict[int, str]]] = []
        max_col = 0
        for row in sheet_root.findall(".//a:sheetData/a:row", NS):
            row_number = int(row.attrib.get("r", "0"))
            values: dict[int, str] = {}
            for cell in row.findall("a:c", NS):
                col_number = cell_ref_to_col(cell.attrib.get("r", ""))
                if not col_number:
                    continue
                values[col_number] = clean_text(cell_value(cell))
                max_col = max(max_col, col_number)
            if any(value for value in values.values()):
                raw_rows.append((row_number, values))

        if not raw_rows:
            raise RuntimeError(f"Sheet {sheet_name!r} has no readable rows")

        header_row_number, header_cells = raw_rows[0]
        headers = {col: header_key(header_cells.get(col, "")) for col in range(1, max_col + 1)}
        ordered_headers = [headers[col] for col in range(1, max_col + 1) if headers[col]]
        rows: list[tuple[int, dict[str, str]]] = []

        for row_number, raw_values in raw_rows[1:]:
            values = {
                headers[col]: clean_text(raw_values.get(col, ""))
                for col in range(1, max_col + 1)
                if headers[col]
            }
            if any(values.values()):
                rows.append((row_number, values))

        if header_row_number != 1:
            raise RuntimeError(f"Expected headers in row 1, found first non-empty row {header_row_number}")

        return rows, ordered_headers


class Audit:
    def __init__(self) -> None:
        self.issue_counts: Counter[str] = Counter()
        self.issues: dict[str, list[dict[str, Any]]] = defaultdict(list)
        self.samples_only = {
            "field_truncations",
            "defaulted_fecha_inicio",
            "defaulted_fecha_fin",
            "frequency_defaults",
            "weight_warnings",
            "unknown_status",
            "entity_conflicts",
        }
        self.sample_limit = 80

    def add(self, category: str, row: int | None, reason: str, **details: Any) -> None:
        self.issue_counts[category] += 1
        keep_all = category not in self.samples_only
        if keep_all or len(self.issues[category]) < self.sample_limit:
            payload = {"reason": reason}
            if row is not None:
                payload["row"] = row
            payload.update(details)
            self.issues[category].append(payload)

    def as_dict(self) -> dict[str, Any]:
        return {
            "issue_counts": dict(sorted(self.issue_counts.items())),
            "issues": {key: value for key, value in sorted(self.issues.items())},
        }


@dataclass
class PreparedRow:
    rownum: int
    raw: dict[str, str]
    ruc: str
    active: int
    client_key: tuple[str, str]
    client_name: str
    client_doc_type: str
    client_doc: str
    razon_social: str
    rubro: str | None
    direccion: str
    distrito: str
    provincia: str
    departamento: str
    nombre_comercial: str
    contacto_nombre: str | None
    contacto_telefono: str | None
    contacto_telefono_2: str | None
    coordenadas_gps: str | None
    referencia: str | None
    fecha_inicio: str
    fecha_fin: str | None
    frecuencia: str
    peso_limite_kg: Decimal | None
    tarifa: Decimal | None
    tipo_tarifa: str
    contrato_observaciones: str
    service_class: str
    contract_valid: bool
    score: int

    @property
    def base_sede_key(self) -> tuple[str, str, str]:
        return (self.ruc, canonical(self.distrito), canonical(self.direccion))

    @property
    def service_signature(self) -> tuple[Any, ...]:
        if not self.contract_valid:
            return (*self.base_sede_key, "SIN_CONTRATO")
        return (
            *self.base_sede_key,
            self.service_class,
            self.fecha_inicio,
            self.frecuencia,
            decimal_sql(self.tarifa),
            decimal_sql(self.peso_limite_kg),
        )


@dataclass
class ClienteRecord:
    key: tuple[str, str]
    id_cliente: int = 0
    nombre: str = ""
    tipo_documento: str = "DNI"
    dni: str = ""
    activo: int = 1
    first_row: int = 0
    score: int = 0


@dataclass
class EmpresaRecord:
    ruc: str
    id_empresa: int = 0
    cliente_key: tuple[str, str] = ("RUC", "")
    razon_social: str = ""
    rubro: str | None = None
    direccion_fiscal: str | None = None
    distrito: str | None = None
    provincia: str | None = None
    departamento: str | None = None
    activo: int = 1
    first_row: int = 0
    score: int = 0


@dataclass
class SedeRecord:
    signature: tuple[Any, ...]
    id_sede: int = 0
    ruc: str = ""
    nombre_comercial: str = ""
    direccion: str = ""
    distrito: str = ""
    provincia: str = ""
    departamento: str = ""
    referencia: str | None = None
    coordenadas_gps: str | None = None
    contacto_nombre: str | None = None
    contacto_telefono: str | None = None
    contacto_telefono_2: str | None = None
    activo: int = 1
    service_class: str = "GENERAL"
    first_row: int = 0
    score: int = 0
    source_rows: list[int] = field(default_factory=list)


@dataclass
class ContratoRecord:
    id_contrato: int = 0
    sede_signature: tuple[Any, ...] = field(default_factory=tuple)
    fecha_inicio: str = ""
    fecha_fin: str | None = None
    frecuencia: str = "mensual"
    peso_limite_kg: Decimal | None = None
    tarifa: Decimal = Decimal("0.00")
    tipo_tarifa: str = "por_servicio"
    observaciones: str | None = None
    activo: int = 1
    first_row: int = 0


def fit_varchar(
    value: str | None,
    limit: int,
    audit: Audit,
    rownum: int,
    field_name: str,
) -> str | None:
    if value is None:
        return None
    text = clean_text(value)
    if not text:
        return None
    if len(text) <= limit:
        return text
    audit.add(
        "field_truncations",
        rownum,
        f"{field_name} exceeds varchar({limit})",
        field=field_name,
        original_length=len(text),
        kept=text[:limit],
        original=text,
    )
    return text[:limit]


def parse_status(raw_status: str, audit: Audit, rownum: int) -> int:
    status = canonical(raw_status)
    if "INACTIVO" in status:
        return 0
    if "ACTIVO" in status:
        return 1
    if status:
        audit.add("unknown_status", rownum, "Unknown STATUS, defaulted to active", status=raw_status)
    return 1


def parse_document(raw_dni: str, ruc: str, audit: Audit, rownum: int) -> tuple[tuple[str, str], str, str]:
    raw = clean_text(raw_dni)
    raw_upper = canonical(raw)
    digits = only_digits(raw)
    if "CE" in raw_upper or "CARNET" in raw_upper:
        document = digits or raw[:15]
        if not document:
            document = ruc
            return ("RUC", ruc), "RUC", document
        return ("Carnet de Extranjeria", document), "Carnet de Extranjeria", document[:15]
    if digits:
        if not (6 <= len(digits) <= 9):
            audit.add("document_warnings", rownum, "DNI has unusual length", raw_dni=raw_dni, parsed=digits)
        return ("DNI", digits), "DNI", digits[:15]
    return ("RUC", ruc), "RUC", ruc


def parse_excel_date(raw: str) -> tuple[str | None, str]:
    text = clean_text(raw)
    if not text:
        return None, "blank"

    try:
        serial = Decimal(text)
    except InvalidOperation:
        serial = None
    if serial is not None and serial == serial.to_integral_value():
        day_number = int(serial)
        if 1 <= day_number <= 60000:
            parsed = (dt.datetime(1899, 12, 30) + dt.timedelta(days=day_number)).date()
            if 2000 <= parsed.year <= 2035:
                return parsed.isoformat(), "excel_serial"
            return None, "excel_serial_suspect"

    upper = canonical(text).replace(".", "")
    match = re.match(r"^(\d{1,2})[-\s/]([A-Z]{3,12})[-\s/](\d{2,4})$", upper)
    if match:
        day = int(match.group(1))
        month = MONTHS.get(match.group(2))
        year = int(match.group(3))
        year = 2000 + year if year < 100 else year
        if month:
            try:
                return dt.date(year, month, day).isoformat(), "spanish_text"
            except ValueError:
                return None, "invalid_text_date"

    match = re.match(r"^(\d{1,2})[/-](\d{1,2})[/-](\d{2,4})$", text)
    if match:
        day = int(match.group(1))
        month = int(match.group(2))
        year = int(match.group(3))
        year = 2000 + year if year < 100 else year
        try:
            return dt.date(year, month, day).isoformat(), "numeric_text"
        except ValueError:
            return None, "invalid_numeric_date"

    return None, "unparsed"


def parse_fecha_inicio(raw: str, audit: Audit, rownum: int) -> str:
    parsed, kind = parse_excel_date(raw)
    if parsed:
        return parsed
    audit.add(
        "defaulted_fecha_inicio",
        rownum,
        f"FECHA INICIO CONTRATO could not be parsed; defaulted to {DEFAULT_FECHA_INICIO}",
        raw_value=raw,
        parse_kind=kind,
        default=DEFAULT_FECHA_INICIO,
    )
    return DEFAULT_FECHA_INICIO


def parse_fecha_fin(raw: str, audit: Audit, rownum: int) -> str | None:
    parsed, kind = parse_excel_date(raw)
    if parsed:
        return parsed
    if clean_text(raw):
        audit.add(
            "defaulted_fecha_fin",
            rownum,
            "VIGENCIA is not a usable date; fecha_fin left NULL",
            raw_value=raw,
            parse_kind=kind,
        )
    return None


def parse_frequency(raw: str, audit: Audit, rownum: int) -> str:
    text = canonical(raw)
    if not text:
        audit.add("frequency_defaults", rownum, "Blank FRECUENCIA defaulted to mensual", raw_value=raw)
        return "mensual"
    if "ORDEN" in text or "EVENTUAL" in text:
        return "eventual"
    if "INTERDIARIO" in text or "DIARIO" in text or "CADA 72" in text:
        return "diario"
    if "SEMANAL" in text or "VECES POR SEMANA" in text or "SEMAN" in text:
        return "semanal"
    if "QUINCENAL" in text or "15CENAL" in text:
        return "quincenal"
    if "BIMENSUAL" in text or "BIMESTRAL" in text:
        return "bimestral"
    if "TRIMEST" in text:
        return "trimestral"
    if "VECES AL ANO" in text:
        audit.add("frequency_defaults", rownum, "Annual frequency has no enum equivalent; mapped to eventual", raw_value=raw)
        return "eventual"
    if "MENSUAL" in text or "VECES AL MES" in text:
        return "mensual"
    audit.add("frequency_defaults", rownum, "Unknown FRECUENCIA defaulted to mensual", raw_value=raw)
    return "mensual"


def parse_weight(raw: str, audit: Audit, rownum: int) -> Decimal | None:
    text = canonical(raw)
    if not text or text in {"-", "0"}:
        return None
    if "SIN" in text and "LIM" in text:
        return None
    match = re.search(r"\d+(?:[\.,]\d+)?", text)
    if not match:
        audit.add("weight_warnings", rownum, "LIMITE DE PESO is not numeric; left NULL", raw_value=raw)
        return None
    return decimal_or_none(match.group(0).replace(",", "."))


def parse_tariff(raw: str) -> Decimal | None:
    text = clean_text(raw).upper()
    if not text:
        return None
    payment_only_markers = [
        "PAGA A",
        "PAGA FIN",
        "PAGA FIN DE MES",
        "FIN DE MES",
        "ADM SE ENCARGA",
        "CANCELADO",
        "INACTIVO",
        "ORDEN DE SERVICIO",
    ]
    if any(marker in text for marker in payment_only_markers):
        return None
    match = re.search(r"\d+(?:[\.,]\d+)?", text.replace("S/", "").replace("S.", ""))
    if not match:
        return None
    return decimal_or_none(match.group(0).replace(",", "."))


def parse_tipo_tarifa(raw_tarifa: str, raw_observacion: str) -> str:
    text = canonical(f"{raw_tarifa} {raw_observacion}")
    if "POR KG" in text or "/KG" in text:
        return "por_kg"
    if "FIJO" in text or "MENSUAL FIJO" in text:
        return "mensual_fijo"
    return "por_servicio"


def classify_service(row: dict[str, str]) -> str:
    text = canonical(
        " ".join(
            row.get(field, "")
            for field in [
                "NOMBRE COMERCIAL",
                "OBSERVACION",
                "RENOVACION DE CONTRATO",
                "TARIFA",
                "FRECUENCIA",
                "LIMITE DE PESO",
            ]
        )
    )
    if "ESPECIAL" in text:
        return "ESPECIALES"
    if "ANIMAL" in text:
        return "ANIMAL CONTAMINADO"
    if "BIOCONTAMIN" in text:
        return "BIOCONTAMINADOS"
    return "GENERAL"


def extract_coordinates(raw_ubicacion: str) -> str | None:
    text = clean_text(raw_ubicacion)
    match = re.search(r"(-?\d{1,2}\.\d+)\s*,\s*(-?\d{1,3}\.\d+)", text)
    if not match:
        return None
    coords = f"{match.group(1)},{match.group(2)}"
    return coords if len(coords) <= 50 else None


def build_reference(row: dict[str, str], rownum: int) -> str | None:
    parts = [f"Fila Excel: {rownum}"]
    labels = [
        ("HORARIO", "Horario"),
        ("CONTACTO HOJA DE RUTA", "Contacto hoja de ruta"),
        ("PROGRAMACIONES NUMERO", "Programacion"),
        ("TELEFONO PARA PROGRAMAR", "Telefono programar raw"),
        ("TELEFONO PARA COBRAR", "Telefono cobrar raw"),
        ("UBICACION", "Ubicacion"),
        ("FECHA DE SERVICIO", "Fecha de servicio"),
        ("INICIO DE SERVICIO CLIENTES NUEVOS", "Inicio servicio clientes nuevos"),
    ]
    for field, label in labels:
        value = clean_text(row.get(field, ""))
        if value:
            parts.append(f"{label}: {value}")
    return "; ".join(parts) if parts else None


def build_contract_observations(row: dict[str, str], rownum: int, source_rows: list[int] | None = None) -> str:
    rows_text = ", ".join(str(row) for row in (source_rows or [rownum]))
    parts = [f"Filas Excel: {rows_text}"]
    labels = [
        ("OBSERVACION", "Observacion"),
        ("RENOVACION DE CONTRATO", "Renovacion"),
        ("METODO PAGO", "Metodo pago"),
        ("DEBEN", "Deben"),
        ("FECHA INICIO CONTRATO", "Fecha inicio raw"),
        ("VIGENCIA", "Vigencia raw"),
        ("FRECUENCIA", "Frecuencia raw"),
        ("TARIFA", "Tarifa raw"),
        ("LIMITE DE PESO", "Peso raw"),
        ("STATUS", "Status raw"),
    ]
    for field, label in labels:
        value = clean_text(row.get(field, ""))
        if value:
            parts.append(f"{label}: {value}")
    return "; ".join(parts)


def row_score(row: dict[str, str], active: int) -> int:
    non_empty = sum(1 for value in row.values() if clean_text(value))
    return active * 10000 + non_empty


def meaningful_row(row: dict[str, str]) -> bool:
    return any(clean_text(row.get(field, "")) for field in CORE_ROW_FIELDS)


def choose_better(existing_score: int, new_score: int, existing_row: int, new_row: int) -> bool:
    if new_score != existing_score:
        return new_score > existing_score
    return new_row < existing_row


def prepare_rows(rows: list[tuple[int, dict[str, str]]], audit: Audit) -> list[PreparedRow]:
    prepared: list[PreparedRow] = []
    for rownum, row in rows:
        if not meaningful_row(row):
            audit.add("ignored_format_rows", rownum, "Ignored formatting/residual row")
            continue

        ruc = only_digits(row.get("RUC", ""))
        if len(ruc) != 11:
            audit.add(
                "blocked_rows",
                rownum,
                "Invalid or missing RUC; row skipped",
                raw_ruc=row.get("RUC", ""),
                razon_social=row.get("RAZON SOCIAL", ""),
                direccion=row.get("DIRECCION", ""),
            )
            continue

        direccion = clean_text(row.get("DIRECCION", ""))
        distrito = clean_text(row.get("DISTRITO", ""))
        if not direccion or not distrito:
            audit.add(
                "blocked_rows",
                rownum,
                "Missing DIRECCION or DISTRITO; row skipped",
                ruc=ruc,
                razon_social=row.get("RAZON SOCIAL", ""),
                direccion=direccion,
                distrito=distrito,
            )
            continue

        active = parse_status(row.get("STATUS", ""), audit, rownum)
        client_key, client_doc_type, client_doc = parse_document(row.get("DNI", ""), ruc, audit, rownum)
        razon_social = clean_text(row.get("RAZON SOCIAL", "")) or clean_text(row.get("NOMBRE COMERCIAL", "")) or ruc
        client_name = clean_text(row.get("REPRESENTANTE", "")) or clean_text(row.get("CONTACTO", "")) or razon_social
        nombre_comercial = clean_text(row.get("NOMBRE COMERCIAL", "")) or razon_social
        rubro = clean_text(row.get("RUBRO", "")) or None
        provincia = clean_text(row.get("PROVINCIA", "")) or "LIMA"
        departamento = clean_text(row.get("DEPARTAMENTO", "")) or "LIMA"

        tarifa = parse_tariff(row.get("TARIFA", ""))
        contract_valid = tarifa is not None
        if not contract_valid:
            audit.add(
                "skipped_contracts",
                rownum,
                "TARIFA is blank or non-numeric; Sede is kept but ContratoServicio is not generated",
                ruc=ruc,
                razon_social=razon_social,
                nombre_comercial=nombre_comercial,
                raw_tarifa=row.get("TARIFA", ""),
            )

        referencia = build_reference(row, rownum)
        fecha_inicio = parse_fecha_inicio(row.get("FECHA INICIO CONTRATO", ""), audit, rownum)
        fecha_fin = parse_fecha_fin(row.get("VIGENCIA", ""), audit, rownum)
        frecuencia = parse_frequency(row.get("FRECUENCIA", ""), audit, rownum)
        peso = parse_weight(row.get("LIMITE DE PESO", ""), audit, rownum)
        tipo_tarifa = parse_tipo_tarifa(row.get("TARIFA", ""), row.get("OBSERVACION", ""))
        score = row_score(row, active)

        prepared.append(
            PreparedRow(
                rownum=rownum,
                raw=row,
                ruc=ruc,
                active=active,
                client_key=client_key,
                client_name=fit_varchar(client_name, 100, audit, rownum, "Cliente.nombre") or ruc,
                client_doc_type=client_doc_type,
                client_doc=fit_varchar(client_doc, 15, audit, rownum, "Cliente.dni") or ruc,
                razon_social=fit_varchar(razon_social, 200, audit, rownum, "Empresa.razon_social") or ruc,
                rubro=fit_varchar(rubro, 100, audit, rownum, "Empresa.rubro"),
                direccion=fit_varchar(direccion, 255, audit, rownum, "Sede.direccion") or direccion[:255],
                distrito=fit_varchar(distrito.upper(), 100, audit, rownum, "Sede.distrito") or distrito.upper(),
                provincia=fit_varchar(provincia.upper(), 100, audit, rownum, "Sede.provincia") or provincia.upper(),
                departamento=fit_varchar(departamento.upper(), 100, audit, rownum, "Sede.departamento") or departamento.upper(),
                nombre_comercial=fit_varchar(nombre_comercial, 200, audit, rownum, "Sede.nombre_comercial") or ruc,
                contacto_nombre=fit_varchar(clean_text(row.get("CONTACTO", "")) or None, 100, audit, rownum, "Sede.contacto_nombre"),
                contacto_telefono=fit_varchar(clean_text(row.get("TELEFONO PARA PROGRAMAR", "")) or None, 20, audit, rownum, "Sede.contacto_telefono"),
                contacto_telefono_2=fit_varchar(clean_text(row.get("TELEFONO PARA COBRAR", "")) or None, 20, audit, rownum, "Sede.contacto_telefono_2"),
                coordenadas_gps=extract_coordinates(row.get("UBICACION", "")),
                referencia=referencia,
                fecha_inicio=fecha_inicio,
                fecha_fin=fecha_fin,
                frecuencia=frecuencia,
                peso_limite_kg=peso,
                tarifa=tarifa,
                tipo_tarifa=tipo_tarifa,
                contrato_observaciones=build_contract_observations(row, rownum),
                service_class=classify_service(row),
                contract_valid=contract_valid,
                score=score,
            )
        )
    return prepared


def merge_text_values(values: list[str | None]) -> str | None:
    unique = []
    seen = set()
    for value in values:
        text = clean_text(value)
        if not text:
            continue
        if text in seen:
            continue
        seen.add(text)
        unique.append(text)
    return "; ".join(unique) if unique else None


def disambiguate_sede_names(sedes: dict[tuple[Any, ...], SedeRecord], audit: Audit) -> None:
    by_base: dict[tuple[str, str, str], list[SedeRecord]] = defaultdict(list)
    for sede in sedes.values():
        by_base[(sede.ruc, canonical(sede.distrito), canonical(sede.direccion))].append(sede)

    for base_key, group in sorted(by_base.items(), key=lambda item: min(s.first_row for s in item[1])):
        if len(group) <= 1:
            continue
        group.sort(key=lambda item: (item.first_row, item.service_class, item.nombre_comercial))
        has_special = any(sede.service_class == "ESPECIALES" for sede in group)
        used_names: set[str] = set()
        audit.add(
            "parallel_service_groups",
            None,
            "Multiple operational services detected for the same RUC/address/district",
            ruc=base_key[0],
            distrito=base_key[1],
            direccion=base_key[2],
            rows=[row for sede in group for row in sede.source_rows],
            service_count=len(group),
        )

        for index, sede in enumerate(group, start=1):
            suffix = sede.service_class
            if suffix == "GENERAL" and has_special:
                suffix = "BIOCONTAMINADOS"
            elif suffix == "GENERAL":
                suffix = f"SERVICIO {index}"

            base_name = sede.nombre_comercial
            if suffix not in canonical(base_name):
                candidate = f"{base_name} - {suffix}"
            else:
                candidate = base_name

            candidate = candidate[:200]
            while canonical(candidate) in used_names:
                tail = f" {index}"
                candidate = f"{candidate[:200 - len(tail)]}{tail}"
            used_names.add(canonical(candidate))
            sede.nombre_comercial = candidate


def build_entities(prepared_rows: list[PreparedRow], audit: Audit) -> tuple[
    list[ClienteRecord],
    list[EmpresaRecord],
    list[SedeRecord],
    list[ContratoRecord],
]:
    clientes: dict[tuple[str, str], ClienteRecord] = {}
    empresas: dict[str, EmpresaRecord] = {}
    sedes: dict[tuple[Any, ...], SedeRecord] = {}
    contratos: dict[tuple[Any, ...], ContratoRecord] = {}

    company_client_keys: dict[str, set[tuple[str, str]]] = defaultdict(set)
    company_names: dict[str, set[str]] = defaultdict(set)

    for row in prepared_rows:
        company_client_keys[row.ruc].add(row.client_key)
        company_names[row.ruc].add(canonical(row.razon_social))

        existing_client = clientes.get(row.client_key)
        if existing_client is None:
            clientes[row.client_key] = ClienteRecord(
                key=row.client_key,
                nombre=row.client_name,
                tipo_documento=row.client_doc_type,
                dni=row.client_doc,
                activo=row.active,
                first_row=row.rownum,
                score=row.score,
            )
        elif choose_better(existing_client.score, row.score, existing_client.first_row, row.rownum):
            clientes[row.client_key] = ClienteRecord(
                key=row.client_key,
                nombre=row.client_name,
                tipo_documento=row.client_doc_type,
                dni=row.client_doc,
                activo=row.active,
                first_row=min(existing_client.first_row, row.rownum),
                score=row.score,
            )

        existing_empresa = empresas.get(row.ruc)
        if existing_empresa is None:
            empresas[row.ruc] = EmpresaRecord(
                ruc=row.ruc,
                cliente_key=row.client_key,
                razon_social=row.razon_social,
                rubro=row.rubro,
                direccion_fiscal=row.direccion,
                distrito=row.distrito,
                provincia=row.provincia,
                departamento=row.departamento,
                activo=row.active,
                first_row=row.rownum,
                score=row.score,
            )
        elif choose_better(existing_empresa.score, row.score, existing_empresa.first_row, row.rownum):
            empresas[row.ruc] = EmpresaRecord(
                ruc=row.ruc,
                cliente_key=row.client_key,
                razon_social=row.razon_social,
                rubro=row.rubro or existing_empresa.rubro,
                direccion_fiscal=row.direccion or existing_empresa.direccion_fiscal,
                distrito=row.distrito or existing_empresa.distrito,
                provincia=row.provincia or existing_empresa.provincia,
                departamento=row.departamento or existing_empresa.departamento,
                activo=row.active,
                first_row=min(existing_empresa.first_row, row.rownum),
                score=row.score,
            )

        existing_sede = sedes.get(row.service_signature)
        if existing_sede is None:
            sedes[row.service_signature] = SedeRecord(
                signature=row.service_signature,
                ruc=row.ruc,
                nombre_comercial=row.nombre_comercial,
                direccion=row.direccion,
                distrito=row.distrito,
                provincia=row.provincia,
                departamento=row.departamento,
                referencia=row.referencia,
                coordenadas_gps=row.coordenadas_gps,
                contacto_nombre=row.contacto_nombre,
                contacto_telefono=row.contacto_telefono,
                contacto_telefono_2=row.contacto_telefono_2,
                activo=row.active,
                service_class=row.service_class,
                first_row=row.rownum,
                score=row.score,
                source_rows=[row.rownum],
            )
        else:
            existing_sede.source_rows.append(row.rownum)
            existing_sede.activo = 1 if existing_sede.activo or row.active else 0
            existing_sede.referencia = merge_text_values([existing_sede.referencia, row.referencia])
            if choose_better(existing_sede.score, row.score, existing_sede.first_row, row.rownum):
                existing_sede.nombre_comercial = row.nombre_comercial
                existing_sede.contacto_nombre = row.contacto_nombre or existing_sede.contacto_nombre
                existing_sede.contacto_telefono = row.contacto_telefono or existing_sede.contacto_telefono
                existing_sede.contacto_telefono_2 = row.contacto_telefono_2 or existing_sede.contacto_telefono_2
                existing_sede.coordenadas_gps = row.coordenadas_gps or existing_sede.coordenadas_gps
                existing_sede.service_class = row.service_class
                existing_sede.score = row.score

        if row.contract_valid and row.tarifa is not None:
            existing_contract = contratos.get(row.service_signature)
            if existing_contract is None or choose_better(
                sedes[row.service_signature].score,
                row.score,
                sedes[row.service_signature].first_row,
                row.rownum,
            ):
                contratos[row.service_signature] = ContratoRecord(
                    sede_signature=row.service_signature,
                    fecha_inicio=row.fecha_inicio,
                    fecha_fin=row.fecha_fin,
                    frecuencia=row.frecuencia,
                    peso_limite_kg=row.peso_limite_kg,
                    tarifa=row.tarifa,
                    tipo_tarifa=row.tipo_tarifa,
                    observaciones=row.contrato_observaciones,
                    activo=row.active,
                    first_row=row.rownum,
                )

    for ruc, names in sorted(company_names.items()):
        if len(names) > 1:
            audit.add(
                "entity_conflicts",
                None,
                "Same RUC appears with multiple RAZON SOCIAL values; selected the best active/complete row",
                ruc=ruc,
                normalized_names=sorted(names),
            )
    for ruc, keys in sorted(company_client_keys.items()):
        if len(keys) > 1:
            audit.add(
                "entity_conflicts",
                None,
                "Same RUC appears with multiple Cliente document keys; selected the best active/complete row",
                ruc=ruc,
                client_keys=[list(key) for key in sorted(keys)],
            )

    disambiguate_sede_names(sedes, audit)

    sorted_clientes = sorted(clientes.values(), key=lambda record: (record.first_row, record.dni, record.nombre))
    sorted_empresas = sorted(empresas.values(), key=lambda record: (record.first_row, record.ruc))
    sorted_sedes = sorted(sedes.values(), key=lambda record: (record.first_row, record.ruc, record.nombre_comercial))
    sorted_contratos = sorted(contratos.values(), key=lambda record: (record.first_row, record.sede_signature))

    for idx, cliente in enumerate(sorted_clientes, start=1):
        cliente.id_cliente = idx
    cliente_ids = {cliente.key: cliente.id_cliente for cliente in sorted_clientes}

    for idx, empresa in enumerate(sorted_empresas, start=1):
        empresa.id_empresa = idx
        if empresa.cliente_key not in cliente_ids:
            raise RuntimeError(f"Empresa {empresa.ruc} references missing Cliente key {empresa.cliente_key}")
    empresa_ids = {empresa.ruc: empresa.id_empresa for empresa in sorted_empresas}

    for idx, sede in enumerate(sorted_sedes, start=1):
        sede.id_sede = idx
        if sede.ruc not in empresa_ids:
            raise RuntimeError(f"Sede {sede.nombre_comercial} references missing Empresa RUC {sede.ruc}")
    sede_ids = {sede.signature: sede.id_sede for sede in sorted_sedes}

    for idx, contrato in enumerate(sorted_contratos, start=1):
        contrato.id_contrato = idx
        if contrato.sede_signature not in sede_ids:
            raise RuntimeError(f"Contrato row {contrato.first_row} references missing Sede")

    return sorted_clientes, sorted_empresas, sorted_sedes, sorted_contratos


def sql_string(value: str | None) -> str:
    if value is None:
        return "NULL"
    text = clean_text(value)
    if not text:
        return "NULL"
    escaped = text.replace("\\", "\\\\").replace("'", "''")
    return f"'{escaped}'"


def bool_sql(value: int) -> str:
    return "1" if value else "0"


def batch_insert(table: str, columns: list[str], rows: list[list[str]], batch_size: int = 100) -> list[str]:
    lines: list[str] = [f"-- {table} ({len(rows)})"]
    if not rows:
        lines.append(f"-- No rows for {table}")
        return lines
    column_sql = ", ".join(f"`{column}`" for column in columns)
    for start in range(0, len(rows), batch_size):
        values = rows[start : start + batch_size]
        joined_values = ",\n".join("(" + ", ".join(row) + ")" for row in values)
        lines.append(f"INSERT INTO `{table}` ({column_sql}) VALUES\n{joined_values};")
    lines.append("")
    return lines


def generate_sql(
    clientes: list[ClienteRecord],
    empresas: list[EmpresaRecord],
    sedes: list[SedeRecord],
    contratos: list[ContratoRecord],
    clean_dependencies: bool = False,
) -> str:
    cliente_ids = {cliente.key: cliente.id_cliente for cliente in clientes}
    empresa_ids = {empresa.ruc: empresa.id_empresa for empresa in empresas}
    sede_ids = {sede.signature: sede.id_sede for sede in sedes}

    dependency_sum = " +\n  ".join(f"(SELECT COUNT(*) FROM `{table}`)" for table in DEPENDENT_TABLES)
    lines = [
        "-- Importacion quirurgica desde BASE DE DATOS 2026.xlsx / DATA IOGROUP",
        "-- Generado por database/extract_base_datos_2026.py",
        "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;",
        "",
    ]

    if clean_dependencies:
        lines.extend(
            [
                "-- MODO FORCE CLEAN:",
                "-- Este archivo borra tablas operativas dependientes antes de recrear Cliente/Empresa/Sede/ContratoServicio.",
                "-- Uselo solo cuando quiera reemplazar la base operativa actual por la informacion del Excel.",
                "START TRANSACTION;",
                "",
                "SET FOREIGN_KEY_CHECKS = 0;",
                "",
                "DELETE FROM `Factura`;",
                "DELETE FROM `Guia`;",
                "DELETE FROM `Manifiesto`;",
                "DELETE FROM `GestionCobranza`;",
                "DELETE FROM `ServicioEmpleado`;",
                "DELETE FROM `IngresoNuevoCliente`;",
                "DELETE FROM `Servicio`;",
                "DELETE FROM `ContratoServicio`;",
                "DELETE FROM `Sede`;",
                "DELETE FROM `Empresa`;",
                "DELETE FROM `Cliente`;",
                "",
                "ALTER TABLE `Factura` AUTO_INCREMENT = 1;",
                "ALTER TABLE `Guia` AUTO_INCREMENT = 1;",
                "ALTER TABLE `Manifiesto` AUTO_INCREMENT = 1;",
                "ALTER TABLE `GestionCobranza` AUTO_INCREMENT = 1;",
                "ALTER TABLE `ServicioEmpleado` AUTO_INCREMENT = 1;",
                "ALTER TABLE `IngresoNuevoCliente` AUTO_INCREMENT = 1;",
                "ALTER TABLE `Servicio` AUTO_INCREMENT = 1;",
                "ALTER TABLE `Cliente` AUTO_INCREMENT = 1;",
                "ALTER TABLE `Empresa` AUTO_INCREMENT = 1;",
                "ALTER TABLE `Sede` AUTO_INCREMENT = 1;",
                "ALTER TABLE `ContratoServicio` AUTO_INCREMENT = 1;",
                "",
                "SET FOREIGN_KEY_CHECKS = 1;",
                "",
            ]
        )
    else:
        lines.extend(
            [
                "-- Guardia: si esta comprobacion falla con 'Duplicate entry',",
                "-- existen filas dependientes y el import se aborta antes de borrar datos base.",
                f"SET @io_import_dependency_count := (\n  {dependency_sum}\n);",
                "SELECT CONCAT('IO import dependency rows: ', @io_import_dependency_count) AS import_guard;",
                "SELECT CASE",
                "  WHEN @io_import_dependency_count > 0 THEN 'ABORTADO: existen filas dependientes; no se limpiaron Cliente/Empresa/Sede/ContratoServicio.'",
                "  ELSE 'OK: no hay filas dependientes; continua el import.'",
                "END AS import_guard_status;",
                "CREATE TEMPORARY TABLE `_io_import_guard` (`id` TINYINT NOT NULL PRIMARY KEY) ENGINE=Memory;",
                "INSERT INTO `_io_import_guard` (`id`) VALUES (1);",
                "INSERT INTO `_io_import_guard` (`id`)",
                "SELECT 1 WHERE @io_import_dependency_count > 0;",
                "DROP TEMPORARY TABLE `_io_import_guard`;",
                "",
                "START TRANSACTION;",
                "",
                "DELETE FROM `ContratoServicio`;",
                "DELETE FROM `Sede`;",
                "DELETE FROM `Empresa`;",
                "DELETE FROM `Cliente`;",
                "ALTER TABLE `Cliente` AUTO_INCREMENT = 1;",
                "ALTER TABLE `Empresa` AUTO_INCREMENT = 1;",
                "ALTER TABLE `Sede` AUTO_INCREMENT = 1;",
                "ALTER TABLE `ContratoServicio` AUTO_INCREMENT = 1;",
                "",
            ]
        )

    cliente_rows = [
        [
            str(cliente.id_cliente),
            sql_string(cliente.nombre),
            sql_string(cliente.tipo_documento),
            sql_string(cliente.dni),
            bool_sql(cliente.activo),
        ]
        for cliente in clientes
    ]
    empresa_rows = [
        [
            str(empresa.id_empresa),
            str(cliente_ids[empresa.cliente_key]),
            sql_string(empresa.razon_social),
            sql_string(empresa.rubro),
            sql_string(empresa.ruc),
            sql_string(empresa.direccion_fiscal),
            sql_string(empresa.distrito),
            sql_string(empresa.provincia),
            sql_string(empresa.departamento),
            bool_sql(empresa.activo),
        ]
        for empresa in empresas
    ]
    sede_rows = [
        [
            str(sede.id_sede),
            str(empresa_ids[sede.ruc]),
            sql_string(sede.nombre_comercial),
            sql_string(sede.direccion),
            sql_string(sede.distrito),
            sql_string(sede.provincia),
            sql_string(sede.departamento),
            sql_string(sede.referencia),
            sql_string(sede.coordenadas_gps),
            sql_string(sede.contacto_nombre),
            sql_string(sede.contacto_telefono),
            sql_string(sede.contacto_telefono_2),
            "NULL",
            bool_sql(sede.activo),
        ]
        for sede in sedes
    ]
    contrato_rows = [
        [
            str(contrato.id_contrato),
            str(sede_ids[contrato.sede_signature]),
            sql_string(contrato.fecha_inicio),
            sql_string(contrato.fecha_fin),
            sql_string(contrato.frecuencia),
            decimal_sql(contrato.peso_limite_kg),
            "NULL",
            decimal_sql(contrato.tarifa),
            sql_string(contrato.tipo_tarifa),
            "NULL",
            "NULL",
            sql_string(contrato.observaciones),
            bool_sql(contrato.activo),
        ]
        for contrato in contratos
    ]

    lines.extend(batch_insert("Cliente", ["id_cliente", "nombre", "tipo_documento", "dni", "activo"], cliente_rows))
    lines.extend(
        batch_insert(
            "Empresa",
            [
                "id_empresa",
                "id_cliente",
                "razon_social",
                "rubro",
                "ruc",
                "direccion_fiscal",
                "distrito",
                "provincia",
                "departamento",
                "activo",
            ],
            empresa_rows,
        )
    )
    lines.extend(
        batch_insert(
            "Sede",
            [
                "id_sede",
                "id_empresa",
                "nombre_comercial",
                "direccion",
                "distrito",
                "provincia",
                "departamento",
                "referencia",
                "coordenadas_gps",
                "contacto_nombre",
                "contacto_telefono",
                "contacto_telefono_2",
                "contacto_email",
                "activo",
            ],
            sede_rows,
        )
    )
    lines.extend(
        batch_insert(
            "ContratoServicio",
            [
                "id_contrato",
                "id_sede",
                "fecha_inicio",
                "fecha_fin",
                "frecuencia",
                "peso_limite_kg",
                "tarifa_adicional_kg",
                "tarifa",
                "tipo_tarifa",
                "doc_escaneado",
                "comprobante_pago",
                "observaciones",
                "activo",
            ],
            contrato_rows,
        )
    )

    lines.extend(["COMMIT;", ""])
    return "\n".join(lines)


def validate_entities(
    clientes: list[ClienteRecord],
    empresas: list[EmpresaRecord],
    sedes: list[SedeRecord],
    contratos: list[ContratoRecord],
) -> None:
    rucs = [empresa.ruc for empresa in empresas]
    if len(rucs) != len(set(rucs)):
        raise RuntimeError("Empresa.ruc is not unique after extraction")

    cliente_keys = {cliente.key for cliente in clientes}
    for empresa in empresas:
        if empresa.cliente_key not in cliente_keys:
            raise RuntimeError(f"Empresa {empresa.ruc} has no Cliente")

    empresa_rucs = {empresa.ruc for empresa in empresas}
    for sede in sedes:
        if sede.ruc not in empresa_rucs:
            raise RuntimeError(f"Sede {sede.id_sede} has no Empresa")

    sede_signatures = {sede.signature for sede in sedes}
    valid_freqs = {"diario", "semanal", "quincenal", "mensual", "bimestral", "trimestral", "eventual"}
    valid_tipo_tarifas = {"por_servicio", "por_kg", "mensual_fijo"}
    for contrato in contratos:
        if contrato.sede_signature not in sede_signatures:
            raise RuntimeError(f"Contrato {contrato.id_contrato} has no Sede")
        if contrato.frecuencia not in valid_freqs:
            raise RuntimeError(f"Contrato {contrato.id_contrato} has invalid frecuencia {contrato.frecuencia}")
        if contrato.tipo_tarifa not in valid_tipo_tarifas:
            raise RuntimeError(f"Contrato {contrato.id_contrato} has invalid tipo_tarifa {contrato.tipo_tarifa}")


def build_case_checks(sedes: list[SedeRecord], contratos: list[ContratoRecord]) -> dict[str, Any]:
    contratos_by_sede = {contrato.sede_signature: contrato for contrato in contratos}

    def rows_for_ruc(ruc: str) -> list[dict[str, Any]]:
        result = []
        for sede in sedes:
            if sede.ruc != ruc:
                continue
            contrato = contratos_by_sede.get(sede.signature)
            result.append(
                {
                    "id_sede": sede.id_sede,
                    "nombre_comercial": sede.nombre_comercial,
                    "direccion": sede.direccion,
                    "activo": sede.activo,
                    "source_rows": sede.source_rows,
                    "id_contrato": contrato.id_contrato if contrato else None,
                    "frecuencia": contrato.frecuencia if contrato else None,
                    "tarifa": f"{contrato.tarifa:.2f}" if contrato else None,
                }
            )
        return sorted(result, key=lambda item: item["id_sede"])

    return {
        "CERTUS_20603817185": rows_for_ruc("20603817185"),
        "UCIVET_20601498902": rows_for_ruc("20601498902"),
    }


def write_audit(
    audit_path: Path,
    excel_path: Path,
    sql_path: Path,
    headers: list[str],
    raw_rows: list[tuple[int, dict[str, str]]],
    prepared_rows: list[PreparedRow],
    clientes: list[ClienteRecord],
    empresas: list[EmpresaRecord],
    sedes: list[SedeRecord],
    contratos: list[ContratoRecord],
    audit: Audit,
) -> None:
    active_status = Counter(row.active for row in prepared_rows)
    payload = {
        "source": {
            "excel_path": str(excel_path),
            "sheet": SHEET_NAME,
            "sql_output": str(sql_path),
        },
        "summary": {
            "raw_nonempty_data_rows": len(raw_rows),
            "prepared_rows": len(prepared_rows),
            "clientes": len(clientes),
            "empresas": len(empresas),
            "sedes": len(sedes),
            "contratos": len(contratos),
            "prepared_active_rows": active_status.get(1, 0),
            "prepared_inactive_rows": active_status.get(0, 0),
            "headers_detected": len(headers),
        },
        "headers": headers,
        "case_checks": build_case_checks(sedes, contratos),
    }
    payload.update(audit.as_dict())
    audit_path.parent.mkdir(parents=True, exist_ok=True)
    audit_path.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def run(excel_path: Path, sql_path: Path, audit_path: Path, clean_dependencies: bool = False) -> dict[str, Any]:
    if not excel_path.exists():
        raise FileNotFoundError(f"Excel file not found: {excel_path}")

    raw_rows, headers = read_xlsx_sheet(excel_path, SHEET_NAME)
    missing_headers = sorted(EXPECTED_HEADERS - set(headers))
    if missing_headers:
        raise RuntimeError(f"Missing expected headers in {SHEET_NAME}: {', '.join(missing_headers)}")

    audit = Audit()
    prepared_rows = prepare_rows(raw_rows, audit)
    clientes, empresas, sedes, contratos = build_entities(prepared_rows, audit)
    validate_entities(clientes, empresas, sedes, contratos)

    sql = generate_sql(clientes, empresas, sedes, contratos, clean_dependencies=clean_dependencies)
    sql_path.parent.mkdir(parents=True, exist_ok=True)
    sql_path.write_text(sql, encoding="utf-8")
    write_audit(
        audit_path,
        excel_path,
        sql_path,
        headers,
        raw_rows,
        prepared_rows,
        clientes,
        empresas,
        sedes,
        contratos,
        audit,
    )

    return {
        "raw_rows": len(raw_rows),
        "prepared_rows": len(prepared_rows),
        "clientes": len(clientes),
        "empresas": len(empresas),
        "sedes": len(sedes),
        "contratos": len(contratos),
        "sql_path": str(sql_path),
        "audit_path": str(audit_path),
        "clean_dependencies": clean_dependencies,
        "issue_counts": dict(sorted(audit.issue_counts.items())),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Extract DATA IOGROUP to a MySQL import SQL file.")
    parser.add_argument("--excel", type=Path, default=DEFAULT_EXCEL_PATH, help="Path to BASE DE DATOS 2026.xlsx")
    parser.add_argument("--sql", type=Path, default=None, help="Output SQL path")
    parser.add_argument("--audit", type=Path, default=None, help="Output audit JSON path")
    parser.add_argument(
        "--clean-dependencies",
        action="store_true",
        help="Generate a destructive import that deletes dependent operational tables before loading base data",
    )
    args = parser.parse_args()
    sql_path = args.sql or (DEFAULT_FORCE_SQL_PATH if args.clean_dependencies else DEFAULT_SQL_PATH)
    audit_path = args.audit or (DEFAULT_FORCE_AUDIT_PATH if args.clean_dependencies else DEFAULT_AUDIT_PATH)

    try:
        result = run(
            args.excel.resolve(),
            sql_path.resolve(),
            audit_path.resolve(),
            clean_dependencies=args.clean_dependencies,
        )
    except Exception as exc:  # pragma: no cover - CLI boundary
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1

    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
