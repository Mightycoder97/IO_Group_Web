"""
Script para actualizar el sidebar en todas las páginas HTML
Reemplaza el ícono de Bootstrap con el logo SVG
"""

import os
import re

pages_dir = r'c:\Users\sebas\Documents\IOGROUPWEB\control\public\pages'

# Patron a reemplazar (sidebar-header con icono recycle)
old_pattern = r'<div class="sidebar-header">\s*<i class="bi bi-recycle"[^>]*></i>\s*<h2>IO Group</h2>\s*</div>'

count = 0
for root, dirs, files in os.walk(pages_dir):
    for file in files:
        if not file.endswith('.html'):
            continue
            
        filepath = os.path.join(root, file)
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Determinar path relativo al img folder
        rel_path = os.path.relpath(root, pages_dir)
        if rel_path == '.':
            img_path = '../img/logo-control-small.svg'
        else:
            img_path = '../../img/logo-control-small.svg'
        
        new_content = f'''<div class="sidebar-header">
                <img src="{img_path}" alt="IO Control" style="height: 36px; width: auto;">
            </div>'''
        
        new_text = re.sub(old_pattern, new_content, content, flags=re.DOTALL)
        
        if new_text != content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_text)
            count += 1
            print(f'Actualizado: {os.path.relpath(filepath, pages_dir)}')

print(f'\nTotal archivos actualizados: {count}')
