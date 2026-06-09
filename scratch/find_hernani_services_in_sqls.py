import os

search_dir = "/Users/mightycoder/Documents/GitHub/IO_Group_Web/control/database/migrations"
target = "HERNANI"

sql_files = [os.path.join(search_dir, f) for f in os.listdir(search_dir) if f.endswith('.sql')]

print(f"Searching for '{target}' in {len(sql_files)} SQL files...")
for fpath in sql_files:
    fname = os.path.basename(fpath)
    with open(fpath, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
    
    if target in content.upper():
        print(f"\nMatches in {fname}:")
        lines = content.split('\n')
        matched = 0
        for idx, line in enumerate(lines):
            if target in line.upper():
                print(f"  Line {idx+1}: {line[:200]}")
                matched += 1
                if matched >= 10:
                    print("  ... truncated ...")
                    break
