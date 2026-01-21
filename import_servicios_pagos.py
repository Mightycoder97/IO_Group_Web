"""
Importador de Servicios desde PAGOS CLIENTES LIMA.xlsx
Genera SQL para insertar servicios consolidados de todas las hojas
"""
import pandas as pd
from datetime import datetime
import re

print("Cargando Excel...")
xl = pd.ExcelFile('PAGOS CLIENTES LIMA.xlsx')
print(f"Total hojas: {len(xl.sheet_names)}")

all_services = []
errors = []
processed = 0

for sheet_name in xl.sheet_names:
    try:
        df = pd.read_excel(xl, sheet_name=sheet_name, header=None)
        
        # Buscar RUC (generalmente en fila 2)
        ruc = None
        for i in range(min(10, len(df))):
            row = df.iloc[i].tolist()
            for j, cell in enumerate(row):
                if str(cell).upper() == 'RUC' and j+1 < len(row):
                    ruc_val = row[j+1]
                    if pd.notna(ruc_val):
                        ruc = str(int(ruc_val)) if isinstance(ruc_val, float) else str(ruc_val)
                        ruc = ruc.strip().replace('.0', '')
                        break
            if ruc:
                break
        
        if not ruc or len(ruc) != 11:
            errors.append(f"{sheet_name}: RUC no válido ({ruc})")
            continue
        
        # Buscar fila de encabezados (contiene "FECHA PAGO" o "MES DEL SERVICIO")
        header_row = None
        for i in range(min(15, len(df))):
            row_str = ' '.join([str(c).upper() for c in df.iloc[i].tolist() if pd.notna(c)])
            if 'FECHA PAGO' in row_str or 'MES DEL SERVICIO' in row_str:
                header_row = i
                break
        
        if header_row is None:
            errors.append(f"{sheet_name}: No se encontró encabezado")
            continue
        
        # Leer datos a partir de la fila después del encabezado
        for i in range(header_row + 1, len(df)):
            row = df.iloc[i].tolist()
            
            # Saltar filas vacías o con solo texto
            if pd.isna(row[0]) and pd.isna(row[1]) and pd.isna(row[2]) and pd.isna(row[3]):
                continue
            
            # Extraer datos
            fecha_pago = row[0] if pd.notna(row[0]) else None
            monto = row[1] if pd.notna(row[1]) else None
            mes_servicio = row[2] if pd.notna(row[2]) else None
            fecha_servicio = row[3] if pd.notna(row[3]) else None
            descripcion = row[4] if len(row) > 4 and pd.notna(row[4]) else None
            forma_pago = row[5] if len(row) > 5 and pd.notna(row[5]) else None
            # num_servicio = row[6] (ignorar)
            num_factura = row[7] if len(row) > 7 and pd.notna(row[7]) else None
            num_contrato = row[8] if len(row) > 8 and pd.notna(row[8]) else None
            num_manifiesto = row[9] if len(row) > 9 and pd.notna(row[9]) else None
            observacion = row[11] if len(row) > 11 and pd.notna(row[11]) else None
            
            # Validar que tengamos al menos fecha o mes
            if not fecha_servicio and not mes_servicio:
                continue
            
            # Determinar estado de pago
            estado_pago = 'pagado' if fecha_pago else 'pendiente'
            
            # Limpiar valores
            def clean_date(d):
                if pd.isna(d):
                    return None
                if isinstance(d, datetime):
                    return d.strftime('%Y-%m-%d')
                return None
            
            def clean_str(s):
                if pd.isna(s):
                    return None
                return str(s).strip()[:255].replace("'", "\\'")
            
            service = {
                'ruc': ruc,
                'fecha_pago': clean_date(fecha_pago),
                'mes_servicio': clean_str(mes_servicio),
                'fecha_servicio': clean_date(fecha_servicio),
                'descripcion_residuo': clean_str(descripcion),
                'forma_pago': clean_str(forma_pago),
                'num_factura': clean_str(num_factura),
                'num_contrato': clean_str(num_contrato),
                'num_manifiesto': clean_str(num_manifiesto),
                'observaciones': clean_str(observacion),
                'estado_pago': estado_pago,
                'tarifa': monto
            }
            
            all_services.append(service)
        
        processed += 1
        if processed % 100 == 0:
            print(f"Procesadas {processed} hojas...")
            
    except Exception as e:
        errors.append(f"{sheet_name}: Error - {str(e)}")

print(f"\nHojas procesadas: {processed}")
print(f"Total servicios extraídos: {len(all_services)}")
print(f"Errores: {len(errors)}")

# Mostrar algunos errores
if errors:
    print("\nPrimeros 10 errores:")
    for e in errors[:10]:
        print(f"  - {e}")

# Generar SQL
print("\nGenerando SQL...")

sql_lines = [
    "-- ========================================",
    "-- Importación de Servicios desde Excel",
    f"-- Generado: {datetime.now().strftime('%Y-%m-%d %H:%M')}",
    f"-- Total registros: {len(all_services)}",
    "-- ========================================",
    "",
    "-- NOTA: Este script requiere que las Sedes ya existan con su RUC",
    "-- Se vincula el servicio a la Sede mediante el RUC de la Empresa",
    "",
]

for svc in all_services:
    # Construir INSERT que busca la sede por RUC
    fecha_pago = f"'{svc['fecha_pago']}'" if svc['fecha_pago'] else 'NULL'
    mes = f"'{svc['mes_servicio']}'" if svc['mes_servicio'] else 'NULL'
    fecha = f"'{svc['fecha_servicio']}'" if svc['fecha_servicio'] else 'NULL'
    desc = f"'{svc['descripcion_residuo']}'" if svc['descripcion_residuo'] else 'NULL'
    forma = f"'{svc['forma_pago']}'" if svc['forma_pago'] else 'NULL'
    obs = f"'{svc['observaciones']}'" if svc['observaciones'] else 'NULL'
    estado = svc['estado_pago']
    
    sql = f"""INSERT INTO Servicio (id_sede, mes_servicio, fecha_ejecucion, descripcion_residuo, forma_pago, observaciones, estado_pago, fecha_pago, estado)
SELECT se.id_sede, {mes}, {fecha}, {desc}, {forma}, {obs}, '{estado}', {fecha_pago}, 'completado'
FROM Sede se
INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
WHERE e.ruc = '{svc['ruc']}'
LIMIT 1;"""
    
    sql_lines.append(sql)
    sql_lines.append("")

# Guardar SQL
with open('control/database/import_servicios_pagos.sql', 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql_lines))

print(f"\nSQL guardado en: control/database/import_servicios_pagos.sql")
print("Revisa el archivo antes de ejecutarlo en phpMyAdmin")
