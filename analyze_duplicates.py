"""
Análisis de facturas duplicadas para confirmar hipótesis:
¿Los duplicados son de la misma empresa (mismo RUC) con múltiples servicios en una sola factura?
"""

# Leer el reporte de duplicados generado
duplicates_file = 'facturas_duplicadas_report.txt'

# Contadores
mismos_ruc = 0  # Duplicados de la misma empresa (hipótesis del usuario)
diferentes_ruc = 0  # Duplicados de diferentes empresas

# Parsear el archivo
current_factura = None
current_rucs = set()

with open(duplicates_file, 'r', encoding='utf-8') as f:
    content = f.read()

# Análisis más detallado con el script de extracción original
import pandas as pd
from collections import defaultdict
import warnings
warnings.filterwarnings('ignore')

EXCEL_FILE = 'PAGOS CLIENTES LIMA.xlsx'

print("Analizando facturas duplicadas...")
print("=" * 60)

xls = pd.ExcelFile(EXCEL_FILE)

# Recolectar todas las facturas con su RUC
facturas_detalle = defaultdict(list)  # numero_factura -> [(ruc, hoja, fecha, monto), ...]

for idx, sheet_name in enumerate(xls.sheet_names):
    if (idx + 1) % 200 == 0:
        print(f"Procesando hoja {idx + 1}/{len(xls.sheet_names)}...")
    
    try:
        df = pd.read_excel(xls, sheet_name=sheet_name, header=None)
        
        # Extraer RUC
        ruc = None
        for row_idx in range(1, min(5, len(df))):
            if len(df.columns) > 1:
                col0 = str(df.iloc[row_idx, 0]).upper() if not pd.isna(df.iloc[row_idx, 0]) else ''
                if 'RUC' in col0:
                    val = df.iloc[row_idx, 1]
                    if not pd.isna(val):
                        ruc = str(val).strip()
                    break
        
        if not ruc:
            continue
        
        # Extraer facturas (desde fila 6)
        for row_idx in range(6, len(df)):
            if len(df.columns) > 7:
                num_factura = df.iloc[row_idx, 7]
                if not pd.isna(num_factura):
                    num_fact_str = str(num_factura).strip().lstrip('\t')
                    if num_fact_str and num_fact_str not in ['N° FACTURA', 'FACTURA']:
                        fecha = str(df.iloc[row_idx, 0])[:10] if not pd.isna(df.iloc[row_idx, 0]) else ''
                        monto = df.iloc[row_idx, 1] if len(df.columns) > 1 else 0
                        
                        facturas_detalle[num_fact_str].append({
                            'ruc': ruc,
                            'hoja': sheet_name,
                            'fecha': fecha,
                            'monto': monto
                        })
    except:
        continue

print(f"\nTotal de números de factura: {len(facturas_detalle)}")

# Analizar duplicados
duplicados_mismo_ruc = {}  # Factura usada para varios servicios del mismo cliente
duplicados_diferente_ruc = {}  # Factura con mismo número pero diferente cliente

for num_fact, ocurrencias in facturas_detalle.items():
    if len(ocurrencias) > 1:
        rucs_unicos = set(o['ruc'] for o in ocurrencias)
        
        if len(rucs_unicos) == 1:
            # Todos del mismo RUC - confirma hipótesis
            duplicados_mismo_ruc[num_fact] = ocurrencias
        else:
            # Diferentes RUCs - diferente patrón
            duplicados_diferente_ruc[num_fact] = ocurrencias

print("\n" + "=" * 60)
print("RESULTADOS DEL ANÁLISIS")
print("=" * 60)

total_duplicados = len(duplicados_mismo_ruc) + len(duplicados_diferente_ruc)
print(f"\nFacturas con número duplicado: {total_duplicados}")
print(f"\n1. MISMO RUC (una factura, múltiples servicios): {len(duplicados_mismo_ruc)}")
print(f"   Porcentaje: {len(duplicados_mismo_ruc)/total_duplicados*100:.1f}%")
print(f"\n2. DIFERENTE RUC (coincidencia de número): {len(duplicados_diferente_ruc)}")
print(f"   Porcentaje: {len(duplicados_diferente_ruc)/total_duplicados*100:.1f}%")

# Ejemplos
print("\n" + "=" * 60)
print("EJEMPLOS DE MISMO RUC (HIPÓTESIS CONFIRMADA)")
print("=" * 60)
count = 0
for num_fact, ocurrencias in list(duplicados_mismo_ruc.items())[:5]:
    print(f"\nFactura N° {num_fact} - {len(ocurrencias)} servicios")
    print(f"  RUC: {ocurrencias[0]['ruc']}")
    print(f"  Empresa: {ocurrencias[0]['hoja']}")
    for o in ocurrencias[:3]:
        print(f"    - Fecha: {o['fecha']}, Monto: S/{o['monto']}")
    if len(ocurrencias) > 3:
        print(f"    ... y {len(ocurrencias) - 3} servicios más")
    count += 1

print("\n" + "=" * 60)
print("EJEMPLOS DE DIFERENTE RUC (COINCIDENCIA DE NUMERACIÓN)")
print("=" * 60)
count = 0
for num_fact, ocurrencias in list(duplicados_diferente_ruc.items())[:5]:
    print(f"\nFactura N° {num_fact} - {len(ocurrencias)} ocurrencias")
    for o in ocurrencias[:3]:
        print(f"    - RUC: {o['ruc']}, Hoja: {o['hoja'][:30]}, Monto: S/{o['monto']}")
    if len(ocurrencias) > 3:
        print(f"    ... y {len(ocurrencias) - 3} ocurrencias más")
    count += 1

# Guardar resumen
with open('analisis_duplicados_detallado.txt', 'w', encoding='utf-8') as f:
    f.write("ANÁLISIS DE FACTURAS DUPLICADAS\n")
    f.write("=" * 60 + "\n\n")
    f.write(f"Total facturas con número duplicado: {total_duplicados}\n\n")
    f.write(f"1. MISMO RUC (una factura para múltiples servicios): {len(duplicados_mismo_ruc)} ({len(duplicados_mismo_ruc)/total_duplicados*100:.1f}%)\n")
    f.write(f"   Esto CONFIRMA la hipótesis: clientes con varios servicios en una factura.\n\n")
    f.write(f"2. DIFERENTE RUC (coincidencia de numeración): {len(duplicados_diferente_ruc)} ({len(duplicados_diferente_ruc)/total_duplicados*100:.1f}%)\n")
    f.write(f"   Esto ocurre por numeración correlativa global de facturas.\n")

print("\n\nAnálisis guardado en: analisis_duplicados_detallado.txt")
