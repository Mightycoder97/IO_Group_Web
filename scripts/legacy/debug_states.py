
import openpyxl

wb = openpyxl.load_workbook('DATA 2026.xlsx', read_only=True)
ws = wb['Servicio']
rows = list(ws.iter_rows(min_row=2, values_only=True))

states = set()
for r in rows:
    val = r[8] # Column I (index 8) is 'estado'
    if val:
        states.add(str(val).strip().upper())
    else:
        states.add('NONE')

with open('unique_states.txt', 'w') as f:
    f.write('\n'.join(sorted(states)))

print(f"Found {len(states)} unique states. Written to unique_states.txt")
