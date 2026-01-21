"""
Análisis completo de estructura de servicios
"""
import pandas as pd

xl = pd.ExcelFile('PAGOS CLIENTES LIMA.xlsx')

# Ver una hoja completa para entender estructura
sheet_name = xl.sheet_names[1]  # verse bien
df = pd.read_excel(xl, sheet_name=sheet_name, header=None)

print(f"HOJA: {sheet_name}")
print(f"Total filas: {len(df)}")
print()
print("Primeras 20 filas:")
for i in range(min(20, len(df))):
    row = df.iloc[i].dropna().tolist()
    if row:
        print(f"Fila {i}: {row}")
