import pandas as pd
import warnings
warnings.filterwarnings('ignore')

# Leer solo los nombres de las hojas primero
xls = pd.ExcelFile('PAGOS CLIENTES LIMA.xlsx')

lines = []

lines.append('===== PRIMERAS 15 HOJAS =====')
for i, name in enumerate(xls.sheet_names[:15]):
    lines.append(f'{i+1}. {name}')

lines.append(f'\nTotal de hojas: {len(xls.sheet_names)}')

# Leer la primera hoja
lines.append('\n\n===== PRIMERA HOJA: ' + xls.sheet_names[0] + ' =====')
df1 = pd.read_excel(xls, sheet_name=0, header=None)
lines.append(f'Dimensiones: {len(df1)} filas x {len(df1.columns)} columnas')

# Imprimir cada fila individualmente
for i in range(min(30, len(df1))):
    row = df1.iloc[i]
    non_null = [(f'Col{j}', str(v)[:60]) for j, v in enumerate(row) if pd.notna(v)]
    if non_null:
        lines.append(f'Fila {i}: {non_null}')

lines.append('\n\n===== SEGUNDA HOJA: ' + xls.sheet_names[1] + ' =====')
df2 = pd.read_excel(xls, sheet_name=1, header=None)
lines.append(f'Dimensiones: {len(df2)} filas x {len(df2.columns)} columnas')

for i in range(min(30, len(df2))):
    row = df2.iloc[i]
    non_null = [(f'Col{j}', str(v)[:60]) for j, v in enumerate(row) if pd.notna(v)]
    if non_null:
        lines.append(f'Fila {i}: {non_null}')

lines.append('\n\n===== TERCERA HOJA: ' + xls.sheet_names[2] + ' =====')
df3 = pd.read_excel(xls, sheet_name=2, header=None)
lines.append(f'Dimensiones: {len(df3)} filas x {len(df3.columns)} columnas')

for i in range(min(30, len(df3))):
    row = df3.iloc[i]
    non_null = [(f'Col{j}', str(v)[:60]) for j, v in enumerate(row) if pd.notna(v)]
    if non_null:
        lines.append(f'Fila {i}: {non_null}')

# Guardar en archivo
with open('excel_analysis_output.txt', 'w', encoding='utf-8') as f:
    f.write('\n'.join(lines))

print('Analisis completado. Ver excel_analysis_output.txt')
