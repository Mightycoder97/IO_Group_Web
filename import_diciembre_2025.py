"""
Importador de Servicios Diciembre 2025 - CORREGIDO V2
Schema exacto según reset_database.sql
"""
import openpyxl
from datetime import datetime
from collections import defaultdict

print("Cargando Excel...")
wb = openpyxl.load_workbook('COBRANZAS 2025.xlsx', data_only=True)
ws = wb['DIC']

# Empresas faltantes
MISSING_COMPANIES = {
    '20601483701': ('DERMATOLÓGICA PERÚ', 'JESUS MARIA', '934209124', 'Av. Cuba 863 - Jesús María'),
    '20610727507': ('CLINICA OQUENDO SAC', 'CALLAO', '999304721', 'MZ L LT 29 LOS SAIRES DE OQUENDO'),
    '20000000001': ('CONSULTORIOS ESPECIALIZADOS SERFLO E.I.R.L.', 'VILLA EL SALVADOR', '922732502', 'SECTOR 1 GRUPO 21 MZ F LOT 13'),
    '20613838385': ('Consultorio Odontológico Dentios E.I.R.L', 'PUEBLO LIBRE', '930267023', 'Jr. Marcos Palomino 139')
}

# RUCs con problemas que hay que corregir
RUC_FIXES = {
    'CLINICA DENTAL LUREN': '20000000001',
    'CLINICADENTALLUREN': '20000000001'
}

servicios = []
for row in ws.iter_rows(min_row=2, values_only=True):
    if row[0] is None:
        continue
    
    fecha = str(row[0])[:10] if row[0] else None
    ruc_raw = str(row[1]).strip().replace(' ', '') if row[1] else None
    ruc = RUC_FIXES.get(ruc_raw, ruc_raw)
    
    razon = str(row[2]).strip().replace("'", "\\'") if row[2] else None
    placa = str(row[7]).strip() if row[7] else None
    estado_pago_raw = str(row[9]).strip().upper() if row[9] else None
    tipo_pago_raw = str(row[10]).strip().upper() if row[10] else None
    factura = str(row[12]).strip() if row[12] and str(row[12]).strip() not in ('None', 'PENDIENTE', '') else None
    
    # estado_pago: solo 'pendiente' o 'pagado' (según ENUM de BD)
    if estado_pago_raw in ('PAGADO', 'CANCELADO', 'CANCELADO ', 'YAPE'):
        estado_pago = 'pagado'
    else:
        estado_pago = 'pendiente'  # REPROGRAMADO y otros van como pendiente
    
    # forma_pago
    if tipo_pago_raw == 'EFECTIVO':
        forma_pago = 'efectivo'
    elif tipo_pago_raw == 'TRANSFERENCIA':
        forma_pago = 'transferencia'
    elif tipo_pago_raw in ('YAPE', 'OK') or estado_pago_raw == 'YAPE':
        forma_pago = 'yape'
    elif tipo_pago_raw == 'CON ANTICIPACION':
        forma_pago = 'anticipado'
    else:
        forma_pago = 'no_especificado'
    
    if fecha and ruc:
        try:
            dt = datetime.strptime(fecha, '%Y-%m-%d')
            meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
            mes_servicio = f"{meses[dt.month-1]} {dt.year}"
        except:
            mes_servicio = 'Diciembre 2025'
            
        servicios.append({
            'fecha': fecha,
            'mes_servicio': mes_servicio,
            'ruc': ruc,
            'vehiculo': placa,
            'estado_pago': estado_pago,
            'forma_pago': forma_pago,
            'factura': factura
        })

print(f"Procesados {len(servicios)} servicios")

# Rutas únicas
rutas = defaultdict(list)
for s in servicios:
    key = (s['fecha'], s['vehiculo'])
    rutas[key].append(s)

# === GENERAR SQL ===
sql = []
sql.append("-- Importación Diciembre 2025 (V2 - Schema Corregido)")
sql.append(f"-- Generado: {datetime.now()}")
sql.append("SET FOREIGN_KEY_CHECKS = 0;")
sql.append("")

# 1. Empresas faltantes
sql.append("-- 1. EMPRESAS FALTANTES")
for ruc, (razon, distrito, tel, dir) in MISSING_COMPANIES.items():
    sql.append(f"""
INSERT INTO Cliente (nombre, telefono, direccion, tipo_documento, dni)
SELECT '{razon}', '{tel}', '{dir}', 'RUC', '{ruc}'
WHERE NOT EXISTS (SELECT 1 FROM Empresa WHERE ruc = '{ruc}');

INSERT INTO Empresa (id_cliente, razon_social, ruc, direccion_fiscal, distrito, telefono)
SELECT LAST_INSERT_ID(), '{razon}', '{ruc}', '{dir}', '{distrito}', '{tel}'
WHERE NOT EXISTS (SELECT 1 FROM Empresa WHERE ruc = '{ruc}');

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, contacto_telefono)
SELECT id_empresa, razon_social, direccion_fiscal, distrito, telefono
FROM Empresa WHERE ruc = '{ruc}'
AND NOT EXISTS (SELECT 1 FROM Sede s JOIN Empresa e ON s.id_empresa=e.id_empresa WHERE e.ruc = '{ruc}');
""")

# 2. Vehículos
sql.append("-- 2. VEHÍCULOS")
for v in sorted(set(s['vehiculo'] for s in servicios if s['vehiculo'])):
    p = v.replace(' ', '-')
    sql.append(f"INSERT INTO Vehiculo (placa, marca, modelo, tipo, activo) SELECT '{p}', 'PENDIENTE', '{v}', 'camion', 1 WHERE NOT EXISTS (SELECT 1 FROM Vehiculo WHERE placa = '{p}');")

# 3. Rutas
sql.append("\n-- 3. RUTAS")
for (fecha, vehiculo), _ in sorted(rutas.items()):
    if not vehiculo:
        continue
    p = vehiculo.replace(' ', '-')
    code = f"R-{fecha.replace('-','')}-{p}"
    sql.append(f"INSERT INTO Ruta (id_vehiculo, codigo_ruta, fecha, estado) SELECT v.id_vehiculo, '{code}', '{fecha}', 'completada' FROM Vehiculo v WHERE v.placa = '{p}' ON DUPLICATE KEY UPDATE estado = 'completada';")

# 4. Servicios
sql.append("\n-- 4. SERVICIOS")
for s in servicios:
    p = s['vehiculo'].replace(' ', '-') if s['vehiculo'] else ''
    code = f"R-{s['fecha'].replace('-','')}-{p}"
    
    sql.append(f"""
INSERT INTO Servicio (id_sede, id_ruta, id_planta, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago)
SELECT se.id_sede,
       (SELECT id_ruta FROM Ruta WHERE codigo_ruta = '{code}' LIMIT 1),
       1, '{s['mes_servicio']}', '{s['fecha']}', 'completado', '{s['estado_pago']}', '{s['forma_pago']}'
FROM Sede se JOIN Empresa e ON se.id_empresa = e.id_empresa
WHERE e.ruc = '{s['ruc']}'
AND NOT EXISTS (SELECT 1 FROM Servicio s2 JOIN Sede se2 ON s2.id_sede=se2.id_sede JOIN Empresa e2 ON se2.id_empresa=e2.id_empresa WHERE e2.ruc = '{s['ruc']}' AND s2.fecha_ejecucion = '{s['fecha']}')
LIMIT 1;

UPDATE Servicio s JOIN Sede se ON s.id_sede=se.id_sede JOIN Empresa e ON se.id_empresa=e.id_empresa
SET s.estado_pago = '{s['estado_pago']}', s.forma_pago = '{s['forma_pago']}',
    s.id_ruta = (SELECT id_ruta FROM Ruta WHERE codigo_ruta = '{code}' LIMIT 1),
    s.mes_servicio = '{s['mes_servicio']}'
WHERE e.ruc = '{s['ruc']}' AND s.fecha_ejecucion = '{s['fecha']}';
""")

# 5. Facturas (schema simple: solo id_servicio, numero_factura)
sql.append("-- 5. FACTURAS")
facturas_vistas = set()
for s in servicios:
    if s['factura'] and s['factura'] not in facturas_vistas:
        f = s['factura'].replace("'", "\\'")
        sql.append(f"""
INSERT INTO Factura (id_servicio, numero_factura)
SELECT s.id_servicio, '{f}'
FROM Servicio s JOIN Sede se ON s.id_sede=se.id_sede JOIN Empresa e ON se.id_empresa=e.id_empresa
WHERE e.ruc = '{s['ruc']}' AND s.fecha_ejecucion = '{s['fecha']}'
AND NOT EXISTS (SELECT 1 FROM Factura WHERE numero_factura = '{f}')
LIMIT 1;
""")
        facturas_vistas.add(s['factura'])

sql.append("SET FOREIGN_KEY_CHECKS = 1;")
sql.append(f"-- Total: {len(servicios)} servicios, {len(facturas_vistas)} facturas")

with open('control/database/migrations/import_diciembre_2025.sql', 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql))

print("✅ SQL generado correctamente")
