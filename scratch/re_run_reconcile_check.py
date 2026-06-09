import openpyxl
import re
import os

excel_path = "/Users/mightycoder/Documents/GitHub/IO_Group_Web/excel_data/PAGOS CLIENTES LIMA.xlsx"

def clean_text(val):
    if val is None: return ""
    return str(val).strip()

def parse_monto(val):
    if val is None:
        return None
    if isinstance(val, (int, float)):
        return float(val)
    val_str = str(val).strip().replace(',', '')
    match = re.search(r'\d+(\.\d+)?', val_str)
    if match:
        try:
            return float(match.group(0))
        except ValueError:
            pass
    return None

if os.path.exists(excel_path):
    wb = openpyxl.load_workbook(excel_path, data_only=True)
    sheet = wb['PETMAX - JORGE CHAVEZ']
    rows = list(sheet.iter_rows(values_only=True))
    
    # Let's find header row
    header_idx = -1
    for idx, r in enumerate(rows[:20]):
        row_str = " ".join([str(c) for c in r if c]).upper()
        if 'FECHA' in row_str and ('SERVICIO' in row_str or 'PAGO' in row_str):
            header_idx = idx
            break
            
    print(f"Header row index: {header_idx}")
    if header_idx != -1:
        headers = [str(c).strip().upper() if c else "" for c in rows[header_idx]]
        print("Headers:", headers)
        
        # Parse data rows
        for idx, r in enumerate(rows[header_idx+1:]):
            row_num = header_idx + idx + 2
            # Check if row has date 2026-02-27
            row_str = str(r)
            if '2026-02-27' in row_str or '27/02/26' in row_str or '27-02-26' in row_str or (r[3] and '2026-02-27' in str(r[3])):
                print(f"\nRow {row_num}: {r}")
                # Print how each column is parsed
                for col_idx, val in enumerate(r):
                    header = headers[col_idx] if col_idx < len(headers) else f"COL_{col_idx}"
                    print(f"  {header}: Raw: {val} | Parsed Monto: {parse_monto(val)}")
    wb.close()
else:
    print("Excel not found!")
