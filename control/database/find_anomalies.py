import re

# Leer el archivo
with open(r'c:\Users\sebas\Documents\IOGROUPWEB\control\database\pagos_lima_insert.sql', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Buscar facturas con montos anómalos
print("FACTURAS CON MONTOS MAYORES A 10,000:")
print("=" * 80)

count = 0
for i, line in enumerate(lines):
    if 'INSERT INTO Factura' in line:
        # Extraer monto
        match = re.search(r"VALUES.*?'[^']*',\s*'[^']*',\s*(\d+\.?\d*)", line)
        if match:
            monto = float(match.group(1))
            if monto > 10000:
                count += 1
                print(f"\nLinea {i+1}: Monto = {monto:,.2f}")
                print(f"  {line[:200]}...")
                if count >= 10:
                    print("\n... (mostrando solo 10 primeros)")
                    break

print(f"\n\nTotal facturas con monto > 10,000: {count}")
