"""
Script para extraer datos del archivo Datos.xlsx y generar un script SQL
con información de CLIENTES, EMPRESAS y SEDES, incluyendo coordenadas GPS PRECISAS.

Geocodifica CADA DIRECCIÓN INDIVIDUAL para mayor precisión.
Usa Geopy con múltiples proveedores para geocodificación.
"""

import pandas as pd
import time
import re
import json
import os
from geopy.geocoders import Nominatim, Photon
from geopy.exc import GeocoderTimedOut, GeocoderServiceError

# Archivo de cache para no repetir geocodificaciones
CACHE_FILE = 'control/database/geocode_cache.json'

# Cargar cache existente
if os.path.exists(CACHE_FILE):
    with open(CACHE_FILE, 'r', encoding='utf-8') as f:
        geocode_cache = json.load(f)
    print(f"Cache cargado: {len(geocode_cache)} direcciones en cache")
else:
    geocode_cache = {}

# Configuración de geocoders (múltiples proveedores)
geolocators = [
    Nominatim(user_agent="iogroup_geocoder_precise_v2", timeout=15),
    Photon(user_agent="iogroup_geocoder_precise_v2", timeout=15),
]

def clean_string(s):
    """Limpia y escapa strings para SQL"""
    if pd.isna(s) or s is None:
        return None
    s = str(s).strip()
    s = s.replace('\t', ' ').replace('\n', ' ').replace('\r', ' ')
    s = re.sub(r'\s+', ' ', s)
    s = s.replace("'", "''")
    s = s.replace('"', '')
    return s

def save_cache():
    """Guarda el cache a disco"""
    with open(CACHE_FILE, 'w', encoding='utf-8') as f:
        json.dump(geocode_cache, f, ensure_ascii=False, indent=2)

def get_precise_coordinates(direccion, distrito, departamento):
    """Obtiene coordenadas GPS precisas para una dirección individual"""
    if not direccion:
        return None
    
    # Crear key para cache
    cache_key = f"{direccion}|{distrito}|{departamento}"
    
    # Verificar cache
    if cache_key in geocode_cache:
        return geocode_cache[cache_key]
    
    # Limpiar dirección para búsqueda
    clean_dir = re.sub(r'[Mm][Zz]\s*[A-Z0-9]+', '', direccion)  # Remover Mz X
    clean_dir = re.sub(r'[Ll][Tt]\s*[0-9]+', '', clean_dir)  # Remover Lt X
    clean_dir = re.sub(r'[Nn][Rr][Oo]\.?\s*', ' ', clean_dir)  # Remover NRO.
    clean_dir = re.sub(r'[Ii][Nn][Tt]\.?\s*[0-9A-Z]+', '', clean_dir)  # Remover INT. X
    clean_dir = re.sub(r'[Oo][Ff]\.?\s*[0-9]+', '', clean_dir)  # Remover OF. X
    clean_dir = re.sub(r'[Dd][Pp][Tt][Oo]\.?\s*[0-9A-Z]+', '', clean_dir)  # Remover DPTO. X
    clean_dir = re.sub(r'[Uu][Rr][Bb]\.?\s*', '', clean_dir)  # Simplificar URB.
    clean_dir = re.sub(r'\s+', ' ', clean_dir).strip()
    
    # Queries a intentar (del más específico al más general)
    queries = [
        f"{clean_dir}, {distrito}, {departamento}, Peru",
        f"{direccion}, {distrito}, Lima, Peru",
        f"{clean_dir}, {distrito}, Lima, Peru",
        f"{distrito}, {departamento}, Peru",
    ]
    
    for query in queries:
        for geolocator in geolocators:
            try:
                location = geolocator.geocode(query, exactly_one=True)
                if location:
                    coords = f"{location.latitude:.6f},{location.longitude:.6f}"
                    geocode_cache[cache_key] = coords
                    return coords
            except (GeocoderTimedOut, GeocoderServiceError) as e:
                time.sleep(0.5)
                continue
            except Exception as e:
                continue
            finally:
                time.sleep(1.1)  # Rate limiting estricto para Nominatim
    
    # Si no encontró nada, usar coordenadas del distrito como fallback
    fallback_key = f"|{distrito}|{departamento}"
    if fallback_key in geocode_cache:
        coords = geocode_cache[fallback_key]
        geocode_cache[cache_key] = coords
        return coords
    
    # Último intento: solo distrito
    for geolocator in geolocators:
        try:
            location = geolocator.geocode(f"{distrito}, {departamento}, Peru")
            if location:
                coords = f"{location.latitude:.6f},{location.longitude:.6f}"
                geocode_cache[fallback_key] = coords
                geocode_cache[cache_key] = coords
                return coords
        except:
            continue
        finally:
            time.sleep(1.1)
    
    geocode_cache[cache_key] = None
    return None

def clean_ruc(ruc):
    """Limpia y valida RUC"""
    if pd.isna(ruc):
        return None
    ruc = str(ruc).strip()
    ruc = re.sub(r'[^0-9]', '', ruc)
    if len(ruc) == 11:
        return ruc
    return None

def clean_documento(doc, tipo):
    """Limpia número de documento según el tipo"""
    if pd.isna(doc):
        return None
    doc = str(doc).strip()
    doc = re.sub(r'[^0-9A-Za-z]', '', doc)
    
    if tipo == 'DNI':
        doc = re.sub(r'[^0-9]', '', doc)
        if len(doc) >= 7 and len(doc) <= 8:
            return doc.zfill(8)
    elif tipo == 'Carnet de Extranjeria':
        if len(doc) >= 6 and len(doc) <= 15:
            return doc
    
    if len(doc) >= 6 and len(doc) <= 15:
        return doc
    return None

def normalize_tipo_documento(tipo):
    """Normaliza el tipo de documento"""
    if pd.isna(tipo):
        return 'DNI'
    tipo = str(tipo).strip().upper()
    
    if 'DNI' in tipo:
        return 'DNI'
    elif 'CARNET' in tipo or 'EXTRANJERIA' in tipo or 'CE' in tipo:
        return 'Carnet de Extranjeria'
    elif 'RUC' in tipo:
        return 'RUC'
    else:
        return 'Otro'

def main():
    print("=" * 70)
    print("GEOCODIFICACIÓN PRECISA - Procesando direcciones individuales")
    print("=" * 70)
    
    # Leer archivo Excel
    df = pd.read_excel('Datos.xlsx', sheet_name='Sedes')
    print(f"Total registros a procesar: {len(df)}")
    print(f"Direcciones en cache: {len(geocode_cache)}")
    print("\nEsto puede tomar varios minutos. Por favor espere...\n")
    
    # Diccionarios para almacenar entidades únicas
    clientes = {}
    empresas = {}
    sedes = []
    
    # Procesar cada fila
    for idx, row in df.iterrows():
        representante = clean_string(row.get('REPRESENTANTE'))
        tipo_doc_raw = row.get('Tipo de Documento')
        tipo_documento = normalize_tipo_documento(tipo_doc_raw)
        numero_documento = clean_documento(row.get('Numero de Documento'), tipo_documento)
        
        razon_social = clean_string(row.get('Razon Social'))
        ruc = clean_ruc(row.get('RUC'))
        nombre_comercial = clean_string(row.get('Nombre Comercial'))
        rubro = clean_string(row.get('Rubro'))
        direccion = clean_string(row.get('Direccion'))
        distrito = clean_string(row.get('Distrito'))
        departamento = clean_string(row.get('Departamento'))
        
        if not ruc:
            continue
        
        if not representante:
            representante = razon_social if razon_social else "No especificado"
        
        cliente_key = (representante.lower() if representante else "desconocido", tipo_documento, numero_documento)
        
        if cliente_key not in clientes:
            clientes[cliente_key] = {
                'nombre': representante or "No especificado",
                'tipo_documento': tipo_documento,
                'numero_documento': numero_documento
            }
        
        if ruc not in empresas:
            empresas[ruc] = {
                'ruc': ruc,
                'razon_social': razon_social or nombre_comercial or "No especificado",
                'cliente_key': cliente_key
            }
        
        sedes.append({
            'ruc': ruc,
            'nombre_comercial': nombre_comercial or razon_social or "Sin nombre",
            'direccion': direccion or "Sin dirección",
            'distrito': distrito,
            'departamento': departamento,
            'referencia': rubro
        })
    
    print(f"Entidades identificadas:")
    print(f"  - Clientes: {len(clientes)}")
    print(f"  - Empresas: {len(empresas)}")
    print(f"  - Sedes: {len(sedes)}")
    
    # Geocodificar CADA dirección individualmente
    print("\n" + "=" * 70)
    print("GEOCODIFICANDO DIRECCIONES INDIVIDUALES (puede tomar 15-30 minutos)")
    print("=" * 70)
    
    coords_found = 0
    coords_from_cache = 0
    
    for i, sede in enumerate(sedes):
        cache_key = f"{sede['direccion']}|{sede['distrito']}|{sede['departamento']}"
        
        # Verificar si ya está en cache
        if cache_key in geocode_cache:
            sede['coordenadas'] = geocode_cache[cache_key]
            coords_from_cache += 1
            if sede['coordenadas']:
                coords_found += 1
            continue
        
        # Mostrar progreso cada 20 direcciones
        if i % 20 == 0:
            print(f"  [{i+1}/{len(sedes)}] Procesando: {sede['distrito'][:20]}... ({coords_found} encontradas)")
            save_cache()  # Guardar cache periódicamente
        
        coords = get_precise_coordinates(sede['direccion'], sede['distrito'], sede['departamento'])
        sede['coordenadas'] = coords
        
        if coords:
            coords_found += 1
    
    save_cache()  # Guardar cache final
    
    print(f"\n✓ Geocodificación completada!")
    print(f"  - Coordenadas encontradas: {coords_found}/{len(sedes)}")
    print(f"  - Desde cache: {coords_from_cache}")
    print(f"  - Nuevas geocodificaciones: {len(sedes) - coords_from_cache}")
    
    # Generar SQL
    print("\n" + "=" * 70)
    print("GENERANDO SCRIPT SQL...")
    print("=" * 70)
    
    sql_lines = []
    sql_lines.append("-- ============================================")
    sql_lines.append("-- IO Group - Datos importados desde Excel")
    sql_lines.append("-- Archivo: Datos.xlsx")
    sql_lines.append(f"-- Generado: {time.strftime('%Y-%m-%d %H:%M:%S')}")
    sql_lines.append("-- GEOCODIFICACIÓN PRECISA POR DIRECCIÓN")
    sql_lines.append("-- ============================================")
    sql_lines.append("")
    sql_lines.append("SET FOREIGN_KEY_CHECKS = 0;")
    sql_lines.append("SET NAMES utf8mb4;")
    sql_lines.append("")
    
    # Insertar Clientes
    sql_lines.append("-- ============================================")
    sql_lines.append("-- CLIENTES")
    sql_lines.append("-- ============================================")
    
    cliente_ids = {}
    cliente_id = 1
    for key, cliente in clientes.items():
        nombre = cliente['nombre']
        tipo_doc = cliente['tipo_documento']
        num_doc = cliente['numero_documento']
        num_doc_sql = f"'{num_doc}'" if num_doc else 'NULL'
        
        sql_lines.append(
            f"INSERT INTO Cliente (id_cliente, nombre, tipo_documento, dni, activo) "
            f"VALUES ({cliente_id}, '{nombre}', '{tipo_doc}', {num_doc_sql}, 1);"
        )
        cliente_ids[key] = cliente_id
        cliente_id += 1
    
    sql_lines.append("")
    
    # Insertar Empresas
    sql_lines.append("-- ============================================")
    sql_lines.append("-- EMPRESAS")
    sql_lines.append("-- ============================================")
    
    empresa_ids = {}
    empresa_id = 1
    for ruc, empresa in empresas.items():
        razon_social = empresa['razon_social']
        cliente_key = empresa['cliente_key']
        id_cliente = cliente_ids.get(cliente_key, 1)
        
        sql_lines.append(
            f"INSERT INTO Empresa (id_empresa, id_cliente, razon_social, ruc, activo) "
            f"VALUES ({empresa_id}, {id_cliente}, '{razon_social}', '{ruc}', 1);"
        )
        empresa_ids[ruc] = empresa_id
        empresa_id += 1
    
    sql_lines.append("")
    
    # Insertar Sedes
    sql_lines.append("-- ============================================")
    sql_lines.append("-- SEDES (con coordenadas GPS precisas)")
    sql_lines.append("-- ============================================")
    
    sede_id = 1
    for sede in sedes:
        ruc = sede['ruc']
        id_empresa = empresa_ids.get(ruc)
        
        if not id_empresa:
            continue
        
        nombre_comercial = sede['nombre_comercial']
        direccion = sede['direccion']
        distrito = sede['distrito'] if sede['distrito'] else ''
        departamento = sede['departamento'] if sede['departamento'] else ''
        provincia = distrito
        referencia = sede['referencia'] if sede['referencia'] else ''
        coordenadas = sede.get('coordenadas')
        
        coords_sql = f"'{coordenadas}'" if coordenadas else 'NULL'
        ref_sql = f"'{referencia}'" if referencia else 'NULL'
        
        sql_lines.append(
            f"INSERT INTO Sede (id_sede, id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, referencia, coordenadas_gps, activo) "
            f"VALUES ({sede_id}, {id_empresa}, '{nombre_comercial}', '{direccion}', '{distrito}', '{provincia}', '{departamento}', {ref_sql}, {coords_sql}, 1);"
        )
        sede_id += 1
    
    sql_lines.append("")
    sql_lines.append("SET FOREIGN_KEY_CHECKS = 1;")
    sql_lines.append("")
    sql_lines.append("-- ============================================")
    sql_lines.append("-- Resumen de datos importados")
    sql_lines.append(f"-- Clientes: {len(clientes)}")
    sql_lines.append(f"-- Empresas: {len(empresas)}")
    sql_lines.append(f"-- Sedes: {sede_id - 1}")
    sql_lines.append(f"-- Sedes con GPS preciso: {coords_found}")
    sql_lines.append("-- ============================================")
    
    # Guardar archivo SQL
    output_file = 'control/database/datos_excel_insert.sql'
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f"\n✓ Script SQL generado: {output_file}")
    print(f"  Total líneas: {len(sql_lines)}")
    print("\n¡PROCESO COMPLETADO EXITOSAMENTE!")

if __name__ == "__main__":
    main()
