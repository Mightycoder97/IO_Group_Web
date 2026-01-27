"""
Script para actualizar teléfonos de contacto desde Datos.xlsx
Extrae números limpios de formatos complejos y genera SQL de actualización
"""
import openpyxl
import re
from datetime import datetime

def extract_phone(text):
    """
    Extrae el primer número de teléfono válido del texto.
    Maneja formatos como:
    - 937144263
    - 945 902 609 - Monica recp
    - 940709263/983726186
    - +51 998 170 294
    - 01 2635746
    - NUEVO NUMERO 902631960. 955 196 765
    """
    if not text or str(text).strip() == '':
        return None
    
    text = str(text)
    
    # Remover prefijos de país
    text = text.replace('+51', '').replace('+', '')
    
    # Buscar secuencias de dígitos (6-12 dígitos, pueden tener espacios entre ellos)
    # Patrón: busca grupos de dígitos con posibles espacios
    numbers = re.findall(r'(\d[\d\s]{4,11}\d)', text)
    
    if numbers:
        # Limpiar espacios y tomar el primero
        clean = re.sub(r'\D', '', numbers[0])
        # Validar longitud (teléfonos peruanos: 6-9 dígitos, con prefijo 01: hasta 11)
        if 6 <= len(clean) <= 12:
            return clean
    
    # Si no encontró con el patrón anterior, buscar cualquier secuencia de 6+ dígitos
    simple_match = re.search(r'\d{6,12}', re.sub(r'\s', '', text))
    if simple_match:
        return simple_match.group()
    
    return None


def main(test_mode=False):
    print("=" * 50)
    print("Actualizador de Teléfonos de Contacto")
    print("=" * 50)
    print()
    
    print("Cargando Datos.xlsx...")
    wb = openpyxl.load_workbook('Datos.xlsx', data_only=True)
    ws = wb['Sedes']
    
    updates = []
    
    for row in range(2, ws.max_row + 1):
        ruc = ws.cell(row=row, column=5).value  # Columna RUC
        sede = ws.cell(row=row, column=6).value  # Columna SEDE
        tel1_raw = ws.cell(row=row, column=11).value  # Columna Telefono
        tel2_raw = ws.cell(row=row, column=12).value  # Columna Telefono 2
        
        if not ruc:
            continue
        
        ruc = str(ruc).strip()
        if len(ruc) != 11:
            continue
        
        tel1 = extract_phone(tel1_raw)
        tel2 = extract_phone(tel2_raw)
        
        if tel1 or tel2:
            updates.append({
                'ruc': ruc,
                'sede': sede,
                'tel1_raw': tel1_raw,
                'tel1': tel1,
                'tel2_raw': tel2_raw,
                'tel2': tel2
            })
    
    print(f"Total registros con teléfonos: {len(updates)}")
    print()
    
    if test_mode:
        print("=== MODO TEST: Primeros 20 registros ===")
        for i, u in enumerate(updates[:20]):
            print(f"\n[{i+1}] RUC: {u['ruc']} | Sede: {str(u['sede'])[:30]}")
            print(f"    Tel1 Original: {u['tel1_raw']}")
            print(f"    Tel1 Limpio:   {u['tel1']}")
            if u['tel2_raw']:
                print(f"    Tel2 Original: {u['tel2_raw']}")
                print(f"    Tel2 Limpio:   {u['tel2']}")
        return
    
    # Generar SQL
    print("Generando SQL de actualización...")
    
    sql_lines = [
        "-- ============================================",
        "-- Actualización de Teléfonos de Contacto",
        f"-- Generado: {datetime.now().strftime('%Y-%m-%d %H:%M')}",
        f"-- Total registros: {len(updates)}",
        "-- ============================================",
        "",
        "-- NOTA: Ejecutar DESPUÉS de la migración add_contacto_telefono_2.sql",
        "",
    ]
    
    for u in updates:
        # Construir SET clause
        set_parts = []
        if u['tel1']:
            set_parts.append(f"contacto_telefono = '{u['tel1']}'")
        if u['tel2']:
            set_parts.append(f"contacto_telefono_2 = '{u['tel2']}'")
        
        if set_parts:
            set_clause = ", ".join(set_parts)
            sede_condition = ""
            if u['sede']:
                sede_name = str(u['sede']).replace("'", "\\'")[:100]
                sede_condition = f" AND s.nombre_comercial LIKE '%{sede_name}%'"
            
            sql = f"""UPDATE Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
SET {set_clause}
WHERE e.ruc = '{u['ruc']}'{sede_condition};"""
            sql_lines.append(sql)
            sql_lines.append("")
    
    # Guardar SQL
    output_file = 'control/database/migrations/update_telefonos.sql'
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f"SQL guardado en: {output_file}")
    print()
    print("Próximos pasos:")
    print("1. Ejecutar add_contacto_telefono_2.sql en phpMyAdmin")
    print("2. Ejecutar update_telefonos.sql en phpMyAdmin")
    print("3. Verificar en la cartilla de un cliente")


if __name__ == '__main__':
    import sys
    test_mode = '--test' in sys.argv
    main(test_mode)
