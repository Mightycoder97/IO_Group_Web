"""
Importador de Servicios Diciembre 2025 desde COBRANZAS 2025.xlsx
Genera SQL para:
- Crear vehículos
- Crear/actualizar servicios
- Crear rutas
- Crear facturas
"""
import openpyxl
from datetime import datetime
from collections import defaultdict

print("Cargando Excel...")
wb = openpyxl.load_workbook('COBRANZAS 2025.xlsx', data_only=True)
ws = wb['DIC']

# Extraer todos los datos
servicios = []
for row_idx, row in enumerate(ws.iter_rows(min_row=2, values_only=True), 2):
    if row[0] is None:
        continue
    
    fecha = str(row[0])[:10] if row[0] else None
    ruc = str(row[1]).strip().replace(' ', '') if row[1] else None
    razon = str(row[2]).strip().replace("'", "\\'") if row[2] else None
    distrito = str(row[5]).strip() if row[5] else None
    transporte = str(row[6]).strip() if row[6] else None
    placa = str(row[7]).strip() if row[7] else None
    tarifa_raw = row[8]
    estado_pago_raw = str(row[9]).strip().upper() if row[9] else None
    tipo_pago_raw = str(row[10]).strip().upper() if row[10] else None
    factura = str(row[12]).strip() if row[12] and str(row[12]).strip() not in ('None', 'PENDIENTE', '') else None
    
    # Limpiar tarifa
    tarifa = None
    if tarifa_raw:
        try:
            tarifa = float(tarifa_raw)
        except:
            pass  # Algunos tienen texto como "PAGA FIN DE MES"
    
    # Mapear estado de pago
    if estado_pago_raw in ('PAGADO', 'CANCELADO', 'CANCELADO '):
        estado_pago = 'pagado'
    elif estado_pago_raw in ('YAPE',):
        estado_pago = 'pagado'
    elif estado_pago_raw in ('REPROGRAMADO',):
        estado_pago = 'reprogramado'
    else:
        estado_pago = 'pendiente'
    
    # Mapear forma de pago
    if tipo_pago_raw in ('EFECTIVO',):
        forma_pago = 'efectivo'
    elif tipo_pago_raw in ('TRANSFERENCIA',):
        forma_pago = 'transferencia'
    elif tipo_pago_raw in ('YAPE', 'OK') or estado_pago_raw == 'YAPE':
        forma_pago = 'yape'
    elif tipo_pago_raw in ('CON ANTICIPACION',):
        forma_pago = 'anticipado'
    else:
        forma_pago = 'no_especificado'
    
    if fecha and ruc:
        servicios.append({
            'fecha': fecha,
            'ruc': ruc,
            'razon': razon,
            'distrito': distrito,
            'transporte': transporte,
            'vehiculo_modelo': placa,  # Es el modelo, no la placa
            'tarifa': tarifa,
            'estado_pago': estado_pago,
            'forma_pago': forma_pago,
            'factura': factura
        })

print(f"Total servicios extraídos: {len(servicios)}")

# Estadísticas
vehiculos = defaultdict(int)
for s in servicios:
    vehiculos[s['vehiculo_modelo']] += 1

print("\nVehículos encontrados:")
for v, c in sorted(vehiculos.items(), key=lambda x: -x[1]):
    print(f"  {v}: {c} servicios")

# Agrupar por vehículo y fecha para crear rutas
rutas = defaultdict(list)
for s in servicios:
    key = (s['fecha'], s['vehiculo_modelo'])
    rutas[key].append(s)

print(f"\nTotal rutas únicas (fecha + vehículo): {len(rutas)}")

# Generar SQL
sql_lines = [
    "-- ========================================",
    "-- Importación Diciembre 2025 - COBRANZAS",
    f"-- Generado: {datetime.now().strftime('%Y-%m-%d %H:%M')}",
    f"-- Total servicios: {len(servicios)}",
    f"-- Total rutas: {len(rutas)}",
    "-- ========================================",
    "",
    "SET FOREIGN_KEY_CHECKS = 0;",
    "",
    "-- ========================================",
    "-- 1. CREAR VEHÍCULOS",
    "-- ========================================",
]

# Vehículos únicos
vehiculos_unicos = set(s['vehiculo_modelo'] for s in servicios if s['vehiculo_modelo'])
for idx, v in enumerate(sorted(vehiculos_unicos), 1):
    # Usar el nombre como placa temporal y modelo
    placa_temp = v.replace(' ', '-')
    sql_lines.append(f"""
INSERT INTO Vehiculo (placa, marca, modelo, tipo, activo)
SELECT '{placa_temp}', 'PENDIENTE', '{v}', 'camion', 1
WHERE NOT EXISTS (SELECT 1 FROM Vehiculo WHERE modelo = '{v}' OR placa = '{placa_temp}');
""")

sql_lines.extend([
    "",
    "-- ========================================",
    "-- 2. CREAR RUTAS (por fecha y vehículo)",
    "-- ========================================",
])

# Crear rutas
for (fecha, vehiculo), srvs in sorted(rutas.items()):
    placa_temp = vehiculo.replace(' ', '-') if vehiculo else 'SIN-VEHICULO'
    fecha_code = fecha.replace('-', '')
    codigo_ruta = f"R-{fecha_code}-{placa_temp}"
    
    sql_lines.append(f"""
-- Ruta: {fecha} - {vehiculo} ({len(srvs)} servicios)
INSERT INTO Ruta (id_vehiculo, codigo_ruta, fecha, estado)
SELECT v.id_vehiculo, '{codigo_ruta}', '{fecha}', 'completada'
FROM Vehiculo v WHERE v.modelo = '{vehiculo}'
ON DUPLICATE KEY UPDATE estado = 'completada';
""")

sql_lines.extend([
    "",
    "-- ========================================",
    "-- 3. INSERTAR/ACTUALIZAR SERVICIOS",
    "-- ========================================",
    "-- Lógica: Si existe un servicio para esa sede y fecha, actualizar.",
    "-- Si no existe, insertar nuevo.",
    "",
])

# Crear/actualizar servicios
for idx, s in enumerate(servicios, 1):
    ruc = s['ruc']
    fecha = s['fecha']
    estado_pago = s['estado_pago']
    forma_pago = s['forma_pago']
    vehiculo = s['vehiculo_modelo']
    tarifa = s['tarifa']
    factura = s['factura']
    placa_temp = vehiculo.replace(' ', '-') if vehiculo else 'SIN-VEHICULO'
    fecha_code = fecha.replace('-', '')
    codigo_ruta = f"R-{fecha_code}-{placa_temp}"
    
    # Actualizar servicios existentes o insertar nuevos
    sql_lines.append(f"-- Servicio #{idx}: {s['razon'][:40] if s['razon'] else 'N/A'} ({ruc}) - {fecha}")
    
    sql_lines.append(f"""
INSERT INTO Servicio (id_sede, id_ruta, id_planta, fecha_programada, fecha_ejecucion, estado, estado_pago, forma_pago)
SELECT 
    se.id_sede,
    (SELECT r.id_ruta FROM Ruta r 
     INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo 
     WHERE r.fecha = '{fecha}' AND v.modelo = '{vehiculo}' LIMIT 1),
    1, -- id_planta por defecto
    '{fecha}',
    '{fecha}',
    CASE WHEN '{estado_pago}' = 'reprogramado' THEN 'cancelado' ELSE 'completado' END,
    '{estado_pago}',
    '{forma_pago}'
FROM Sede se
INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
WHERE e.ruc = '{ruc}'
AND NOT EXISTS (
    SELECT 1 FROM Servicio s2 
    INNER JOIN Sede se2 ON s2.id_sede = se2.id_sede
    INNER JOIN Empresa e2 ON se2.id_empresa = e2.id_empresa
    WHERE e2.ruc = '{ruc}' AND s2.fecha_ejecucion = '{fecha}'
)
LIMIT 1;
""")

    # Actualizar si ya existe
    sql_lines.append(f"""
UPDATE Servicio s
INNER JOIN Sede se ON s.id_sede = se.id_sede
INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
SET s.estado_pago = '{estado_pago}',
    s.forma_pago = '{forma_pago}',
    s.estado = CASE WHEN '{estado_pago}' = 'reprogramado' THEN 'cancelado' ELSE 'completado' END,
    s.id_ruta = (SELECT r.id_ruta FROM Ruta r 
                 INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo 
                 WHERE r.fecha = '{fecha}' AND v.modelo = '{vehiculo}' LIMIT 1)
WHERE e.ruc = '{ruc}' AND s.fecha_ejecucion = '{fecha}';
""")

sql_lines.extend([
    "",
    "-- ========================================",
    "-- 4. CREAR FACTURAS",
    "-- ========================================",
])

# Facturas
facturas_creadas = set()
for s in servicios:
    if s['factura'] and s['factura'] not in facturas_creadas:
        factura_num = s['factura'].replace("'", "\\'")
        ruc = s['ruc']
        fecha = s['fecha']
        
        sql_lines.append(f"""
-- Factura: {factura_num}
INSERT INTO Factura (id_servicio, numero_factura, fecha_emision, monto_total, estado)
SELECT s.id_servicio, '{factura_num}', '{fecha}', COALESCE(se.tarifa_servicio, 0), 
       CASE WHEN s.estado_pago = 'pagado' THEN 'pagada' ELSE 'emitida' END
FROM Servicio s
INNER JOIN Sede se ON s.id_sede = se.id_sede
INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
WHERE e.ruc = '{ruc}' AND s.fecha_ejecucion = '{fecha}'
AND NOT EXISTS (SELECT 1 FROM Factura f WHERE f.numero_factura = '{factura_num}')
LIMIT 1;
""")
        facturas_creadas.add(s['factura'])

sql_lines.extend([
    "",
    "SET FOREIGN_KEY_CHECKS = 1;",
    "",
    f"-- Total: {len(servicios)} servicios, {len(rutas)} rutas, {len(facturas_creadas)} facturas",
    "-- ========================================",
])

# Guardar SQL
output_file = 'control/database/migrations/import_diciembre_2025.sql'
with open(output_file, 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql_lines))

print(f"\n✅ SQL guardado en: {output_file}")
print(f"   - {len(vehiculos_unicos)} vehículos")
print(f"   - {len(rutas)} rutas")
print(f"   - {len(servicios)} servicios")
print(f"   - {len(facturas_creadas)} facturas")
print("\n⚠️ Revisa el archivo antes de ejecutarlo en phpMyAdmin")
