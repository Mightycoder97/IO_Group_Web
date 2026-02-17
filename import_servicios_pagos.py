
import openpyxl
import re
from datetime import datetime
import unidecode

# --- Configuración ---
INPUT_FILE = 'PAGOS CLIENTES LIMA.xlsx'
OUTPUT_SQL = 'control/database/migrations/import_servicios_2026.sql'
LOG_FILE = 'manual_review_needed.txt'

# --- Listas de ayuda ---
DISTRITOS = [
    'ANCON', 'ATE', 'BARRANCO', 'BREÑA', 'CARABAYLLO', 'CHACLACAYO', 'CHORRILLOS', 'CIENEGUILLA',
    'COMAS', 'EL AGUSTINO', 'INDEPENDENCIA', 'JESUS MARIA', 'LA MOLINA', 'LA VICTORIA', 'LIMA',
    'LINCE', 'LOS OLIVOS', 'LURIGANCHO', 'LURIN', 'MAGDALENA', 'MIRAFLORES', 'PACHACAMAC',
    'PUCUSANA', 'PUEBLO LIBRE', 'PUENTE PIEDRA', 'PUNTA HERMOSA', 'PUNTA NEGRA', 'RIMAC',
    'SAN BARTOLO', 'SAN BORJA', 'SAN ISIDRO', 'SAN JUAN DE LURIGANCHO', 'SAN JUAN DE MIRAFLORES',
    'SAN LUIS', 'SAN MARTIN DE PORRES', 'SAN MIGUEL', 'SANTA ANITA', 'SANTA MARIA DEL MAR',
    'SANTA ROSA', 'SANTIAGO DE SURCO', 'SURQUILLO', 'VILLA EL SALVADOR', 'VILLA MARIA DEL TRIUNFO'
]

def normalize_text(text):
    if not text: return ""
    return unidecode.unidecode(str(text)).upper().strip()

def clean_sql_val(val):
    if val is None: return 'NULL'
    val_str = str(val).replace("'", "\\'")
    return f"'{val_str}'"

def parse_date_excel(cell_val):
    if isinstance(cell_val, datetime):
        return cell_val.strftime('%Y-%m-%d')
    if not cell_val:
        return None
    
    val_str = str(cell_val).strip()
    # Intentar formatos texto
    for fmt in ('%Y-%m-%d', '%d/%m/%Y', '%d-%m-%Y'):
        try:
            dt = datetime.strptime(val_str.split(' ')[0], fmt)
            if 2000 < dt.year < 2100:
                return dt.strftime('%Y-%m-%d')
        except:
            pass
    return None

def normalize_residuo(desc):
    desc = normalize_text(desc)
    if 'BIO' in desc: return 'Biocontaminado'
    if 'ESPECIAL' in desc: return 'Especial'
    if 'CADAVER' in desc or 'ANIMAL' in desc: return 'Cadaver Animal'
    if 'MEDICAMENTO' in desc or 'VENCIDO' in desc: return 'Medicamento Vencido'
    return 'Otros'

print(f"Cargando archivo '{INPUT_FILE}' (esto puede tardar)...")
wb = openpyxl.load_workbook(INPUT_FILE, data_only=True, read_only=True)

sql_statements = []
sql_statements.append("-- Importación de Servicios Históricos (PAGOS CLIENTES LIMA)")
sql_statements.append(f"-- Generado: {datetime.now()}")
sql_statements.append("SET FOREIGN_KEY_CHECKS = 0;")
sql_statements.append("-- Asegurar existencia de Planta Principal (Requerido por FK)")
sql_statements.append("INSERT IGNORE INTO Planta (id_planta, razon_social, ruc, direccion, activo) VALUES (1, 'PLANTA PRINCIPAL', '20000000000', 'LIMA', 1);")

log_lines = []

count_sheets_processed = 0
count_services_generated = 0

for sheet_name in wb.sheetnames:
    ws = wb[sheet_name]
    rows = list(ws.iter_rows(values_only=True, max_row=100)) # Leer primeras 100 filas es suficiente
    
    if not rows: continue

    # 1. Identificar RUC y Posible Dirección en Encabezado (filas 0-9)
    ruc_found = None
    distrito_found = None
    direccion_snippet = None
    
    header_row_idx = -1
    col_map = {} # 'FECHA_SERVICIO': idx, 'FECHA_PAGO': idx, ...

    # Analizar primeras 15 filas para metadata y header
    for i, row in enumerate(rows[:15]):
        row_str = " ".join([str(c) for c in row if c]).upper()
        
        # Buscar RUC
        if not ruc_found:
            match = re.search(r'\b(10|20)\d{9}\b', row_str)
            if match:
                ruc_found = match.group(0)
            else:
                 # Check cells individually just in case
                 for cell in row:
                     if isinstance(cell, (int, str)) and re.match(r'^(10|20)\d{9}$', str(cell).strip()):
                         ruc_found = str(cell).strip()
                         break

        # Buscar Distrito
        if not distrito_found:
            row_norm = normalize_text(row_str)
            for dist in DISTRITOS:
                if dist in row_norm:
                    distrito_found = dist
                    break
        
        # Buscar Header
        if header_row_idx == -1:
            # Check for keywords
            norm_row = [normalize_text(c) for c in row]
            if 'FECHA' in row_str and ('SERVICIO' in row_str or 'PAGO' in row_str):
                # Validar que tenga sentido
                try:
                    # Mapear columnas
                    for idx, val in enumerate(norm_row):
                        if 'FECHA' in val and 'SERVICIO' in val: col_map['FECHA_SERVICIO'] = idx
                        elif 'FECHA' in val and 'PAGO' in val: col_map['FECHA_PAGO'] = idx
                        elif 'MES' in val: col_map['MES'] = idx
                        elif 'FORMA' in val and 'PAGO' in val: col_map['FORMA_PAGO'] = idx
                        elif 'DESC' in val or 'RESIDU' in val: col_map['DESCRIPCION'] = idx
                    
                    if 'FECHA_SERVICIO' in col_map:
                        header_row_idx = i
                except:
                    pass

    # 2. Generar lógica de selección de ID Sede
    sql_statements.append(f"\n-- Hoja: {sheet_name}")
    
    target_sede_var = f"@id_sede_{count_sheets_processed}" # Unique var per sheet block logic
    
    valid_sede_logic = False
    
    if ruc_found:
        # Estrategia RUC
        if distrito_found:
             sql_statements.append(f"""
SET {target_sede_var} = (
    SELECT s.id_sede FROM Sede s 
    JOIN Empresa e ON s.id_empresa = e.id_empresa 
    WHERE e.ruc = '{ruc_found}' 
    AND (s.distrito LIKE '%{distrito_found}%' OR s.direccion LIKE '%{distrito_found}%')
    LIMIT 1
);""")
             # Fallback si no encuentra por distrito, intentar solo RUC (Sede principal)
             sql_statements.append(f"""
SET {target_sede_var} = COALESCE({target_sede_var}, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '{ruc_found}' LIMIT 1));""")
        else:
             sql_statements.append(f"SET {target_sede_var} = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '{ruc_found}' LIMIT 1);")
        
        valid_sede_logic = True
    else:
        # Estrategia Nombre Hoja (Fuzzy Match básico en SQL es difícil, usaré Nombre Comercial exacto o LIKE)
        # Nota: Esto es arriesgado. Lo logueamos mejor.
        clean_name = sheet_name.replace("'", "").strip()
        sql_statements.append(f"SET {target_sede_var} = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%{clean_name}%' LIMIT 1);")
        if not ruc_found:
             log_lines.append(f"REVISION REQUERIDA: Hoja '{sheet_name}' sin RUC. Se intentó match por nombre.")
        valid_sede_logic = True # Allow SQL gen, but flagged

    # 3. Procesar Servicios
    if header_row_idx != -1:
        start_row = header_row_idx + 1
        curr_services = 0
        for r_idx, row in enumerate(rows[start_row:], start=start_row+1):
            if not row: continue
            
            # Obtener Fecha Servicio
            idx_fs = col_map.get('FECHA_SERVICIO')
            if idx_fs is None or idx_fs >= len(row): continue
            
            fecha_ejecucion = parse_date_excel(row[idx_fs])
            if not fecha_ejecucion: continue # Skip filas sin fecha
            
            # Otros campos
            mes = clean_sql_val(row[col_map['MES']]) if 'MES' in col_map and col_map['MES'] < len(row) else 'NULL'
            
            fecha_pago = 'NULL'
            estado_pago = 'pendiente'
            if 'FECHA_PAGO' in col_map and col_map['FECHA_PAGO'] < len(row):
                fp = parse_date_excel(row[col_map['FECHA_PAGO']])
                if fp:
                    fecha_pago = f"'{fp}'"
                    estado_pago = 'pagado'
            
            forma_pago = clean_sql_val(row[col_map['FORMA_PAGO']]) if 'FORMA_PAGO' in col_map and col_map['FORMA_PAGO'] < len(row) else 'NULL'
            
            desc_raw = row[col_map['DESCRIPCION']] if 'DESCRIPCION' in col_map and col_map['DESCRIPCION'] < len(row) else ''
            descripcion = normalize_residuo(desc_raw)
            
            # Generar INSERT dinámico
            sql_statements.append(f"""
INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT {target_sede_var}, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = {target_sede_var} LIMIT 1), '{fecha_ejecucion}', {mes}, {fecha_pago}, '{estado_pago}', {forma_pago}, '{descripcion}', 'completado'
WHERE {target_sede_var} IS NOT NULL;""")
            curr_services += 1
        
        count_services_generated += curr_services
        if curr_services == 0:
             log_lines.append(f"INFO: Hoja '{sheet_name}' tiene encabezados pero no se extrajeron servicios.")
    else:
        log_lines.append(f"ERROR: Hoja '{sheet_name}' no se detectó encabezado de servicios.")

    count_sheets_processed += 1
    if count_sheets_processed % 50 == 0:
        print(f"Procesadas {count_sheets_processed} hojas...")

sql_statements.append("SET FOREIGN_KEY_CHECKS = 1;")

# Escribir Outputs
with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql_statements))

with open(LOG_FILE, 'w', encoding='utf-8') as f:
    f.write('\n'.join(log_lines))

print(f"✅ SQL generado en: {OUTPUT_SQL}")
print(f"📄 Log de revisión: {LOG_FILE}")
print(f"Total Servicios Generados: {count_services_generated}")
