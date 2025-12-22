#!/usr/bin/env python3
"""
IO Group - CSV to SQL Export (Con columna rubro en Empresa)
"""

import csv
import re
from datetime import datetime
import os

CSV_FILE = r'c:\Users\sebas\Documents\IOGROUPWEB\BASE DE DATOS 2025(DATA IOGROUP).csv'
OUTPUT_FILE = r'c:\Users\sebas\Documents\IOGROUPWEB\control\database\import_data.sql'


def escape_sql(value, allow_null=True):
    if value is None:
        return 'NULL' if allow_null else "''"
    value = str(value).replace("'", "''").replace("\\", "\\\\").strip()
    if not value:
        return 'NULL' if allow_null else "''"
    return f"'{value}'"


def parse_date(date_str):
    if not date_str or date_str.strip() in ['', '#¡VALOR!', 'N/A']:
        return 'NULL'
    date_str = date_str.strip().replace('\t', '')
    for fmt in ['%d/%m/%Y', '%d-%m-%Y', '%Y-%m-%d', '%d-%b-%y', '%d/%m/%y']:
        try:
            return f"'{datetime.strptime(date_str, fmt).date().isoformat()}'"
        except ValueError:
            continue
    return 'NULL'


def parse_weight(weight_str):
    if not weight_str or 'SIN LIMITE' in weight_str.upper():
        return 'NULL'
    match = re.search(r'(\d+(?:\.\d+)?)', weight_str)
    return match.group(1) if match else 'NULL'


def parse_tarifa(tarifa_str):
    if not tarifa_str:
        return '0'
    tarifa_str = tarifa_str.replace(',', '.')
    match = re.search(r'(\d+(?:\.\d+)?)', tarifa_str)
    return match.group(1) if match else '0'


def normalize_frecuencia(frecuencia_str):
    if not frecuencia_str:
        return 'mensual'
    f = frecuencia_str.upper().strip()
    if 'QUINCENAL' in f: return 'quincenal'
    if 'BIMENSUAL' in f: return 'bimestral'
    if 'SEMANAL' in f or 'INTERDIARIO' in f or '72HRS' in f: return 'semanal'
    if 'DIARIO' in f: return 'diario'
    if 'TRIMESTRAL' in f: return 'trimestral'
    return 'mensual'


def normalize_rubro(rubro_str):
    """Normaliza el rubro a valores válidos"""
    if not rubro_str:
        return 'NO ESPECIFICA'
    rubro = rubro_str.upper().strip()
    # Limpiar valores inválidos (textos largos que no son rubros)
    if len(rubro) > 50 or any(x in rubro for x in ['AMABLEMENTE', 'RECORDAMOS', 'ATENCIÓN']):
        return 'NO ESPECIFICA'
    # Normalizar variantes
    if 'VETERINARI' in rubro: return 'VETERINARIA'
    if 'DENTAL' in rubro or 'ODONTO' in rubro: return 'DENTAL'
    if 'POLICLINIC' in rubro: return 'POLICLINICO'
    if 'CENTRO MEDICO' in rubro: return 'CENTRO MEDICO'
    if 'CONSULTORIO' in rubro: return 'CONSULTORIO MEDICO'
    if 'LABORATORIO' in rubro: return 'LABORATORIO'
    if 'CLINICA' in rubro: return 'CLINICA'
    if 'ESTETICA' in rubro or 'ESTETITA' in rubro: return 'ESTETICA'
    if 'PODOLOGIA' in rubro: return 'PODOLOGIA'
    if 'DIALISIS' in rubro: return 'DIALISIS'
    if 'GRANJA' in rubro: return 'GRANJA'
    if 'TERAPIA' in rubro: return 'TERAPIA'
    if 'TOPICO' in rubro: return 'TOPICO'
    if 'OFTALMOLOG' in rubro: return 'OFTALMOLOGIA'
    if 'OBSTETRICIA' in rubro: return 'OBSTETRICIA'
    if 'ORTOPEDIA' in rubro: return 'ORTOPEDIA'
    return rubro[:50] if len(rubro) <= 50 else 'NO ESPECIFICA'


def is_active(status_str):
    if not status_str:
        return 1
    return 0 if 'INACTIVO' in status_str.upper() else 1


def main():
    print("=" * 60)
    print("IO Group - CSV to SQL Export (Con Rubro)")
    print("=" * 60)
    
    with open(CSV_FILE, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f, delimiter=';')
        rows = list(reader)
    
    print(f"   {len(rows)} filas encontradas\n")
    
    clientes = {}
    empresas = {}
    sedes = []
    
    for row in rows:
        ruc = row.get('RUC', '').strip()
        if not ruc or len(ruc) < 8:
            continue
        ruc = re.sub(r'\D', '', ruc)[:11]
        
        # Cliente
        representante = row.get('REPRESENTANTE', '').strip()[:100]
        dni = row.get('DNI', '').strip()
        dni = re.sub(r'\D', '', dni)[:8] if dni else ''
        
        if not representante:
            representante = row.get('RAZON SOCIAL', 'Cliente')[:100]
        
        cliente_key = dni if dni else f"N_{representante[:20]}"
        if cliente_key not in clientes:
            clientes[cliente_key] = {
                'nombre': representante,
                'dni': dni if dni else None,
                'telefono': row.get('TELEFONO PARA COBRAR', '')[:20]
            }
        
        # Empresa con Rubro
        if ruc not in empresas:
            empresas[ruc] = {
                'razon_social': row.get('RAZON SOCIAL', '')[:200],
                'ruc': ruc,
                'direccion': row.get('DIRECCION', '')[:255],
                'distrito': row.get('DISTRITO', '')[:100],
                'provincia': row.get('PROVINCIA', 'LIMA')[:100],
                'departamento': row.get('DEPARTAMENTO', 'LIMA')[:100],
                'rubro': normalize_rubro(row.get('RUBRO', '')),
                'cliente_key': cliente_key
            }
        
        # Sede
        sedes.append({
            'ruc': ruc,
            'nombre_comercial': (row.get('NOMBRE COMERCIAL', '') or row.get('RAZON SOCIAL', 'Sede'))[:200],
            'direccion': row.get('DIRECCION', '')[:255],
            'distrito': row.get('DISTRITO', '')[:100],
            'provincia': row.get('PROVINCIA', 'LIMA')[:100],
            'departamento': row.get('DEPARTAMENTO', 'LIMA')[:100],
            'horario': row.get('HORARIO', '')[:255],
            'contacto': row.get('CONTACTO', '')[:100],
            'telefono': row.get('TELEFONO PARA PROGRAMAR', '')[:20],
            'activo': is_active(row.get('STATUS', '')),
            'fecha_inicio': row.get('FECHA INICIO CONTRATO', ''),
            'fecha_fin': row.get('VIGENCIA', ''),
            'peso_limite': row.get('LIMITE DE PESO', ''),
            'tarifa': row.get('TARIFA', ''),
            'frecuencia': row.get('FRECUENCIA', ''),
            'metodo_pago': row.get('METODO PAGO', ''),
            'observacion': row.get('OBSERVACION', '')
        })
    
    # Contar rubros únicos
    rubros_unicos = set(e['rubro'] for e in empresas.values())
    
    print(f"📊 Resumen:")
    print(f"   Clientes: {len(clientes)}")
    print(f"   Empresas: {len(empresas)}")
    print(f"   Sedes:    {len(sedes)}")
    print(f"   Rubros:   {len(rubros_unicos)} ({', '.join(sorted(rubros_unicos)[:5])}...)")
    
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write("-- ============================================\n")
        f.write("-- IO Group - Importación de Datos CSV\n")
        f.write(f"-- Generado: {datetime.now().strftime('%Y-%m-%d %H:%M')}\n")
        f.write("-- ============================================\n")
        f.write("-- IMPORTANTE: Ejecutar primero migration_add_rubro.sql\n")
        f.write("-- Tablas: Cliente, Empresa (con rubro), Sede, ContratoServicio\n")
        f.write("-- ============================================\n\n")
        f.write("SET FOREIGN_KEY_CHECKS = 0;\n")
        f.write("SET NAMES utf8mb4;\n\n")
        
        # CLIENTES
        f.write("-- ============================================\n")
        f.write(f"-- CLIENTES ({len(clientes)} registros)\n")
        f.write("-- ============================================\n")
        for key, c in clientes.items():
            dni_val = escape_sql(c['dni'])
            f.write(f"INSERT INTO Cliente (nombre, dni, telefono, activo) VALUES ({escape_sql(c['nombre'])}, {dni_val}, {escape_sql(c['telefono'])}, 1);\n")
        f.write("\n")
        
        # EMPRESAS con RUBRO
        f.write("-- ============================================\n")
        f.write(f"-- EMPRESAS ({len(empresas)} registros)\n")
        f.write("-- ============================================\n")
        for ruc, emp in empresas.items():
            cliente_dni = clientes.get(emp['cliente_key'], {}).get('dni')
            f.write(f"INSERT IGNORE INTO Empresa (id_cliente, razon_social, ruc, direccion_fiscal, distrito, provincia, departamento, rubro, activo) VALUES (\n")
            if cliente_dni:
                f.write(f"  (SELECT id_cliente FROM Cliente WHERE dni = {escape_sql(cliente_dni)} LIMIT 1),\n")
            else:
                f.write(f"  (SELECT id_cliente FROM Cliente WHERE nombre = {escape_sql(clientes.get(emp['cliente_key'], {}).get('nombre', ''))} LIMIT 1),\n")
            f.write(f"  {escape_sql(emp['razon_social'])}, {escape_sql(emp['ruc'])},\n")
            f.write(f"  {escape_sql(emp['direccion'])}, {escape_sql(emp['distrito'])},\n")
            f.write(f"  {escape_sql(emp['provincia'])}, {escape_sql(emp['departamento'])},\n")
            f.write(f"  {escape_sql(emp['rubro'])}, 1\n);\n")
        f.write("\n")
        
        # SEDES Y CONTRATOS
        f.write("-- ============================================\n")
        f.write(f"-- SEDES Y CONTRATOS ({len(sedes)} registros)\n")
        f.write("-- ============================================\n")
        for sede in sedes:
            f.write(f"INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, referencia, contacto_nombre, contacto_telefono, activo) VALUES (\n")
            f.write(f"  (SELECT id_empresa FROM Empresa WHERE ruc = {escape_sql(sede['ruc'])} LIMIT 1),\n")
            f.write(f"  {escape_sql(sede['nombre_comercial'], False)}, {escape_sql(sede['direccion'], False)},\n")
            f.write(f"  {escape_sql(sede['distrito'])}, {escape_sql(sede['provincia'])},\n")
            f.write(f"  {escape_sql(sede['departamento'])}, {escape_sql(sede['horario'])},\n")
            f.write(f"  {escape_sql(sede['contacto'])}, {escape_sql(sede['telefono'])}, {sede['activo']}\n);\n")
            
            f.write(f"SET @last_sede = LAST_INSERT_ID();\n")
            
            fecha_inicio = parse_date(sede['fecha_inicio'])
            fecha_fin = parse_date(sede['fecha_fin'])
            if fecha_inicio == 'NULL':
                fecha_inicio = "'2024-01-01'"
            
            f.write(f"INSERT INTO ContratoServicio (id_sede, fecha_inicio, fecha_fin, frecuencia, peso_limite_kg, tarifa, tipo_tarifa, observaciones, activo) VALUES (\n")
            f.write(f"  @last_sede, {fecha_inicio}, {fecha_fin},\n")
            f.write(f"  '{normalize_frecuencia(sede['frecuencia'])}', {parse_weight(sede['peso_limite'])}, {parse_tarifa(sede['tarifa'])}, 'mensual_fijo',\n")
            f.write(f"  {escape_sql((sede['metodo_pago'] + '. ' + sede['observacion'])[:500])}, {sede['activo']}\n);\n\n")
        
        f.write("SET FOREIGN_KEY_CHECKS = 1;\n")
        f.write(f"\n-- Importación completada: {len(clientes)} clientes, {len(empresas)} empresas, {len(sedes)} sedes\n")
    
    print(f"\n✅ Generado: {os.path.getsize(OUTPUT_FILE)/1024:.1f} KB")


if __name__ == '__main__':
    main()
