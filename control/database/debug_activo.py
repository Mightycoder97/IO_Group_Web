import openpyxl
from extract_data_2026 import *

wb = openpyxl.load_workbook('/Users/sebastianretamozo/Documents/IO_Group_Web-main/DATA 2026.xlsx', data_only=True)
clientes, _ = extract_clientes(wb)
empresas, _, empresa_map = extract_empresas(wb)
status_map = parse_status_from_data_completa(wb)
sedes, _, sede_activo_map, sede_lookup, max_id_sede = extract_sedes(wb, empresa_map, status_map)
n_sedes, n_contratos, added = discover_missing_sedes(wb, empresa_map, sede_lookup, max_id_sede, 0, status_map)

print(f"Sedes from SEDE sheet active: {sum(1 for s in sedes if ', 1)' in s)} inactive: {sum(1 for s in sedes if ', 0)' in s)}")
print(f"Auto-discovered sedes active: {sum(1 for s in n_sedes if ', 1)' in s)} inactive: {sum(1 for s in n_sedes if ', 0)' in s)}")
