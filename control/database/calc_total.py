import re

# Leer el archivo
with open(r'c:\Users\sebas\Documents\IOGROUPWEB\control\database\pagos_lima_insert.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Buscar todas las líneas de factura y extraer el monto
# Formato: INSERT INTO Factura (..., monto_total, ...) VALUES (..., MONTO, ...);
pattern = r"INSERT INTO Factura.*?VALUES.*?'[^']*',\s*'[^']*',\s*(\d+\.?\d*)"

matches = re.findall(pattern, content)

print(f"Total facturas encontradas: {len(matches)}")

# Convertir a números y sumar
montos = [float(m) for m in matches]
total = sum(montos)

print(f"Suma total de montos: S/ {total:,.2f}")
print(f"\nEstadísticas:")
print(f"  Monto mínimo: S/ {min(montos):,.2f}")
print(f"  Monto máximo: S/ {max(montos):,.2f}")
print(f"  Monto promedio: S/ {total/len(montos):,.2f}")

# Contar montos mayores a ciertos valores
print(f"\nDistribución:")
print(f"  Montos > 1000: {len([m for m in montos if m > 1000])}")
print(f"  Montos > 500: {len([m for m in montos if m > 500])}")
print(f"  Montos entre 50-100: {len([m for m in montos if 50 <= m <= 100])}")
