import pandas as pd
import warnings
warnings.filterwarnings('ignore')

xls = pd.ExcelFile('PAGOS CLIENTES LIMA.xlsx')

lines = []
lines.append("=" * 80)
lines.append("ANALISIS PROFUNDO DEL EXCEL - MAPEO A ENTIDADES")
lines.append("=" * 80)

# Analizar 5 hojas con diferentes estructuras para entender patrones
sheets_to_analyze = [0, 1, 2, 10, 50]

for sheet_idx in sheets_to_analyze:
    if sheet_idx >= len(xls.sheet_names):
        continue
    
    sheet_name = xls.sheet_names[sheet_idx]
    lines.append(f"\n{'='*80}")
    lines.append(f"HOJA {sheet_idx}: {sheet_name}")
    lines.append("="*80)
    
    df = pd.read_excel(xls, sheet_name=sheet_idx, header=None)
    
    # Mostrar cabecera (primeras 6 filas)
    lines.append("\n--- CABECERA (Datos de la empresa/sede) ---")
    for i in range(min(6, len(df))):
        row = df.iloc[i]
        non_null = [(j, str(v)[:80]) for j, v in enumerate(row) if pd.notna(v)]
        if non_null:
            lines.append(f"Fila {i}: {non_null}")
    
    # Mostrar los primeros 5 registros de datos (desde fila 6)
    lines.append("\n--- REGISTROS DE DATOS (Fila 6 en adelante) ---")
    for i in range(6, min(11, len(df))):
        row = df.iloc[i]
        non_null = [(j, str(v)[:60]) for j, v in enumerate(row) if pd.notna(v)]
        if non_null:
            lines.append(f"Fila {i}: {non_null}")
    
    # Contar total de registros
    data_rows = len(df) - 6 if len(df) > 6 else 0
    lines.append(f"\nTotal registros de datos en esta hoja: {data_rows}")

# Ahora analizar columnas en detalle
lines.append("\n" + "="*80)
lines.append("ANALISIS DE COLUMNAS (basado en encabezados fila 5)")
lines.append("="*80)

df_sample = pd.read_excel(xls, sheet_name=0, header=None)
if len(df_sample) > 5:
    headers = df_sample.iloc[5]
    lines.append("\nEncabezados encontrados:")
    for j, h in enumerate(headers):
        if pd.notna(h):
            lines.append(f"  Col{j}: {h}")

# Verificar variaciones en otras hojas
lines.append("\n--- Verificando consistencia de encabezados en otras hojas ---")
for idx in [1, 10, 50, 100]:
    if idx < len(xls.sheet_names):
        df_check = pd.read_excel(xls, sheet_name=idx, header=None)
        if len(df_check) > 5:
            headers_check = df_check.iloc[5]
            headers_str = [str(h)[:30] for h in headers_check if pd.notna(h)]
            lines.append(f"Hoja {idx} ({xls.sheet_names[idx][:30]}): {len(headers_str)} columnas")

# Analizar valores unicos de algunas columnas importantes
lines.append("\n" + "="*80)
lines.append("ANALISIS DE VALORES - FORMAS DE PAGO (Col5)")
lines.append("="*80)

formas_pago = set()
descripciones = set()
for idx in range(min(100, len(xls.sheet_names))):
    df = pd.read_excel(xls, sheet_name=idx, header=None)
    for i in range(6, len(df)):
        if len(df.columns) > 5 and pd.notna(df.iloc[i, 5]):
            formas_pago.add(str(df.iloc[i, 5]).strip().upper())
        if len(df.columns) > 4 and pd.notna(df.iloc[i, 4]):
            descripciones.add(str(df.iloc[i, 4]).strip().upper())

lines.append(f"Formas de pago encontradas: {formas_pago}")
lines.append(f"\nDescripciones de servicio encontradas: {descripciones}")

# Guardar
with open('deep_analysis_output.txt', 'w', encoding='utf-8') as f:
    f.write('\n'.join(lines))

print("Analisis completado. Ver deep_analysis_output.txt")
