
import openpyxl

INPUT_FILE = 'control/data/PAGOS CLIENTES LIMA.xlsx'

try:
    wb = openpyxl.load_workbook(INPUT_FILE, read_only=True)
    print(f"Sheets: {wb.sheetnames[:5]}...")
    
    for sheet_name in wb.sheetnames[:3]:
        print(f"\n--- Sheet: {sheet_name} ---")
        ws = wb[sheet_name]
        
        # Method 1: Iterating rows
        rows = list(ws.iter_rows(min_row=1, max_row=2, values_only=True))
        
        if len(rows) > 0:
            print("Row 1:", rows[0])
        if len(rows) > 1:
            print("Row 2:", rows[1])
            
except Exception as e:
    print(f"Error: {e}")
