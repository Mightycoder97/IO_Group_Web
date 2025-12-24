"""
Mostrar resultados del análisis de duplicados
"""
from collections import defaultdict
import pandas as pd
import warnings
warnings.filterwarnings('ignore')

EXCEL_FILE = 'PAGOS CLIENTES LIMA.xlsx'

xls = pd.ExcelFile(EXCEL_FILE)

facturas_detalle = defaultdict(list)

for idx, sheet_name in enumerate(xls.sheet_names):
    try:
        df = pd.read_excel(xls, sheet_name=sheet_name, header=None)
        
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
        
        for row_idx in range(6, len(df)):
            if len(df.columns) > 7:
                num_factura = df.iloc[row_idx, 7]
                if not pd.isna(num_factura):
                    num_fact_str = str(num_factura).strip().lstrip('\t')
                    if num_fact_str and num_fact_str not in ['N° FACTURA', 'FACTURA']:
                        fecha = str(df.iloc[row_idx, 0])[:10] if not pd.isna(df.iloc[row_idx, 0]) else ''
                        monto = df.iloc[row_idx, 1] if len(df.columns) > 1 else 0
                        facturas_detalle[num_fact_str].append({'ruc': ruc, 'hoja': sheet_name, 'fecha': fecha, 'monto': monto})
    except:
        continue

duplicados_mismo_ruc = {}
duplicados_diferente_ruc = {}

for num_fact, ocurrencias in facturas_detalle.items():
    if len(ocurrencias) > 1:
        rucs_unicos = set(o['ruc'] for o in ocurrencias)
        if len(rucs_unicos) == 1:
            duplicados_mismo_ruc[num_fact] = ocurrencias
        else:
            duplicados_diferente_ruc[num_fact] = ocurrencias

total_dup = len(duplicados_mismo_ruc) + len(duplicados_diferente_ruc)

print("=" * 60)
print("RESULTADO DEL ANALISIS")
print("=" * 60)
print()
print(f"MISMO RUC (1 factura = varios servicios): {len(duplicados_mismo_ruc)}")
print(f"Porcentaje: {len(duplicados_mismo_ruc)/total_dup*100:.1f}%")
print()
print(f"DIFERENTE RUC (coincidencia numeracion): {len(duplicados_diferente_ruc)}")
print(f"Porcentaje: {len(duplicados_diferente_ruc)/total_dup*100:.1f}%")
