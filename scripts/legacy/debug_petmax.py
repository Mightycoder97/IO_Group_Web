
import openpyxl

INPUT_FILE = 'DATA 2026.xlsx'
SHEET_NAME = 'Data Completa'
TARGET_RUC = '20610289321'

print(f"Buscando RUC {TARGET_RUC} en {INPUT_FILE}...")
wb = openpyxl.load_workbook(INPUT_FILE, data_only=True, read_only=True)
ws = wb[SHEET_NAME]
rows = list(ws.iter_rows(values_only=True))
headers = [str(h).strip().upper() if h else '' for h in rows[0]]

# Encontrar indices
try:
    idx_ruc = headers.index('RUC')
    idx_nombre = headers.index('NOMBRE COMERCIAL')
    idx_direccion = headers.index('DIRECCION')
    idx_distrito = headers.index('DISTRITO')
except ValueError as e:
    print(f"Error columnas: {e}")
    # Fallback search
    for i, h in enumerate(headers):
        print(f"{i}: {h}")
    exit()

count = 0
print(f"{'INDEX':<5} | {'NOMBRE COMERCIAL':<30} | {'DIRECCION':<40} | {'DISTRITO'}")
print("-" * 100)

for i, row in enumerate(rows[1:], start=2):
    ruc_val = str(row[idx_ruc]).strip().replace(' ', '')
    if ruc_val == TARGET_RUC:
        count += 1
        nombre = str(row[idx_nombre])
        direcc = str(row[idx_direccion])
        dist = str(row[idx_distrito])
        print(f"{i:<5} | {nombre[:30]:<30} | {direcc[:40]:<40} | {dist}")

print(f"\nTotal filas encontradas: {count}")
