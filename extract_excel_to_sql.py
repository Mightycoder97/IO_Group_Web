"""
Script para extraer datos del Excel "PAGOS CLIENTES LIMA.xlsx" 
y generar SQL para importar a la base de datos IO Group.

VERSIÓN 2: Corregido para evitar errores de sintaxis SQL
- Sanitiza caracteres especiales en comentarios
- Evita saltos de línea en strings
"""

import pandas as pd
import warnings
import re
from datetime import datetime
from collections import defaultdict

warnings.filterwarnings('ignore')

# ============================================
# CONFIGURACIÓN
# ============================================
EXCEL_FILE = 'PAGOS CLIENTES LIMA.xlsx'
OUTPUT_SQL_FILE = 'pagos_lima_insert.sql'
DUPLICATES_REPORT_FILE = 'facturas_duplicadas_report.txt'

# Planta de tratamiento predeterminada
PLANTA_INFO = {
    'razon_social': 'Incineragas S.A.C.',
    'ruc': '20537973421',
    'nombre_comercial': 'Incineragas',
    'direccion': 'Av. Separadora Industrial, Mz A. Lote 3A Asoc. Sumac Pacha',
    'distrito': 'Lurin',
    'provincia': 'Lima',
    'departamento': 'Lima',
    'tipo_tratamiento': 'Incineracion'
}

def limpiar_string_sql(s):
    """Limpia y escapa strings para usar dentro de SQL VALUES"""
    if pd.isna(s) or s is None:
        return None
    s = str(s).strip()
    # Reemplazar caracteres problemáticos
    s = s.replace("'", "''")  # Escapar comillas simples
    s = s.replace("\\", "")   # Eliminar backslashes
    s = s.replace("\n", " ")  # Eliminar saltos de línea
    s = s.replace("\r", " ")  # Eliminar retornos de carro
    s = s.replace("\t", " ")  # Eliminar tabs
    # Eliminar caracteres de control
    s = ''.join(c for c in s if ord(c) >= 32 or c in '\n\t')
    return s if s else None

def limpiar_para_comentario(s):
    """Limpia string para usar en comentarios SQL (solo ASCII)"""
    if pd.isna(s) or s is None:
        return ""
    s = str(s).strip()
    # Reemplazar caracteres especiales con equivalentes ASCII
    replacements = {
        'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
        'Á': 'A', 'É': 'E', 'Í': 'I', 'Ó': 'O', 'Ú': 'U',
        'ñ': 'n', 'Ñ': 'N', 'ü': 'u', 'Ü': 'U',
        '–': '-', '—': '-', '"': '"', '"': '"', "'": "'", "'": "'"
    }
    for old, new in replacements.items():
        s = s.replace(old, new)
    # Eliminar cualquier carácter no ASCII restante
    s = ''.join(c if ord(c) < 128 else '' for c in s)
    # Eliminar saltos de línea
    s = s.replace('\n', ' ').replace('\r', ' ')
    return s[:40]  # Limitar longitud

def parsear_fecha(fecha_val):
    """Convierte varios formatos de fecha a YYYY-MM-DD"""
    if pd.isna(fecha_val) or fecha_val is None:
        return None
    
    fecha_str = str(fecha_val).strip()
    
    # Si ya es formato datetime
    if 'datetime' in str(type(fecha_val)).lower():
        try:
            return fecha_val.strftime('%Y-%m-%d')
        except:
            pass
    
    # Intentar varios formatos
    formatos = [
        '%Y-%m-%d %H:%M:%S',
        '%Y-%m-%d',
        '%d/%m/%y',
        '%d/%m/%Y',
        '%d-%m-%Y',
        '%d-%m-%y'
    ]
    
    for fmt in formatos:
        try:
            return datetime.strptime(fecha_str.split(' ')[0], fmt).strftime('%Y-%m-%d')
        except:
            continue
    
    return None

def parsear_monto(monto_val):
    """Convierte monto a decimal"""
    if pd.isna(monto_val) or monto_val is None:
        return None
    
    try:
        monto_str = str(monto_val).strip()
        monto_str = monto_str.replace(',', '.')
        monto_str = re.sub(r'[^\d.]', '', monto_str)
        return float(monto_str) if monto_str else None
    except:
        return None

def extraer_peso(observ_col, kilos_col=None):
    """Extrae peso en KG de columnas de observación o kilos"""
    peso = None
    
    if kilos_col is not None and not pd.isna(kilos_col):
        peso_str = str(kilos_col)
        match = re.search(r'([\d.]+)\s*(?:KG|kg)?', peso_str)
        if match:
            try:
                peso = float(match.group(1))
                return peso if peso > 0 else None
            except:
                pass
    
    if observ_col is not None and not pd.isna(observ_col):
        observ = str(observ_col).upper()
        match = re.search(r'([\d.]+)\s*KG', observ)
        if match:
            try:
                peso = float(match.group(1))
                return peso if peso > 0 else None
            except:
                pass
    
    return peso

def mapear_estado_pago(observacion):
    """Mapea observación a estado de factura"""
    if pd.isna(observacion) or observacion is None:
        return 'emitida'
    
    obs_upper = str(observacion).upper().strip()
    
    if 'CANCEL' in obs_upper:
        return 'pagada'
    elif 'PENDIENTE' in obs_upper:
        return 'emitida'
    elif 'ANULAD' in obs_upper:
        return 'anulada'
    else:
        return 'pagada'

def mapear_metodo_pago(forma_pago):
    """Limpia y estandariza forma de pago"""
    if pd.isna(forma_pago) or forma_pago is None:
        return 'Efectivo'
    
    forma = str(forma_pago).upper().strip()
    
    if 'TRANSFER' in forma:
        return 'Transferencia'
    elif 'EFECT' in forma:
        return 'Efectivo'
    elif 'DEPOSIT' in forma:
        return 'Deposito'
    elif 'CHEQUE' in forma:
        return 'Cheque'
    elif 'YAPE' in forma:
        return 'Yape'
    else:
        try:
            float(forma.replace(',', '.'))
            return 'Efectivo'
        except:
            return 'Efectivo'

def extraer_cabecera(df):
    """Extrae datos de cabecera de la hoja"""
    cabecera = {
        'razon_social': None,
        'nombre_comercial': None,
        'ruc': None,
        'email': None,
        'fecha_inicio': None
    }
    
    if len(df) > 0 and len(df.columns) > 0:
        val = df.iloc[0, 0]
        if not pd.isna(val):
            cabecera['razon_social'] = limpiar_string_sql(val)
    
    if len(df) > 1 and len(df.columns) > 1:
        fila1_col0 = str(df.iloc[1, 0]).lower() if not pd.isna(df.iloc[1, 0]) else ''
        if 'comercial' in fila1_col0:
            val = df.iloc[1, 1]
            if not pd.isna(val):
                cabecera['nombre_comercial'] = limpiar_string_sql(val)
    
    for row_idx in range(1, min(5, len(df))):
        if len(df.columns) > 1:
            col0 = str(df.iloc[row_idx, 0]).upper() if not pd.isna(df.iloc[row_idx, 0]) else ''
            if 'RUC' in col0:
                val = df.iloc[row_idx, 1]
                if not pd.isna(val):
                    ruc_str = str(val).strip()
                    ruc_clean = re.sub(r'\D', '', ruc_str)
                    if len(ruc_clean) == 11:
                        cabecera['ruc'] = ruc_clean
                    elif len(ruc_clean) in [8, 10]:
                        cabecera['ruc'] = ruc_clean.zfill(11)
                break
    
    for row_idx in range(1, min(6, len(df))):
        if len(df.columns) > 1:
            col0 = str(df.iloc[row_idx, 0]).upper() if not pd.isna(df.iloc[row_idx, 0]) else ''
            if 'CORREO' in col0 or 'EMAIL' in col0 or 'CORRREO' in col0:
                val = df.iloc[row_idx, 1]
                if not pd.isna(val) and '@' in str(val):
                    cabecera['email'] = limpiar_string_sql(val)
                break
    
    for row_idx in range(1, min(6, len(df))):
        if len(df.columns) > 1:
            col0 = str(df.iloc[row_idx, 0]).upper() if not pd.isna(df.iloc[row_idx, 0]) else ''
            if 'FECHA' in col0 and 'INICIO' in col0:
                val = df.iloc[row_idx, 1]
                cabecera['fecha_inicio'] = parsear_fecha(val)
                break
    
    return cabecera

def encontrar_fila_encabezados(df):
    """Encuentra la fila donde están los encabezados de datos"""
    for row_idx in range(min(10, len(df))):
        row = df.iloc[row_idx]
        for val in row:
            if not pd.isna(val) and 'FECHA PAGO' in str(val).upper():
                return row_idx
    return 5

def extraer_registros(df, fila_encabezados):
    """Extrae registros de servicios/pagos"""
    registros = []
    fila_datos_inicio = fila_encabezados + 1
    
    for row_idx in range(fila_datos_inicio, len(df)):
        row = df.iloc[row_idx]
        
        fecha_pago = parsear_fecha(row.iloc[0] if len(row) > 0 else None)
        monto = parsear_monto(row.iloc[1] if len(row) > 1 else None)
        
        if fecha_pago is None or monto is None:
            continue
        
        desc = str(row.iloc[4]).upper() if len(row) > 4 and not pd.isna(row.iloc[4]) else ''
        if 'TOTAL' in desc:
            continue
        
        registro = {
            'fecha_pago': fecha_pago,
            'monto': monto,
            'mes_servicio': limpiar_string_sql(row.iloc[2] if len(row) > 2 else None),
            'fecha_servicio': parsear_fecha(row.iloc[3] if len(row) > 3 else None),
            'descripcion': limpiar_string_sql(row.iloc[4] if len(row) > 4 else None),
            'forma_pago': mapear_metodo_pago(row.iloc[5] if len(row) > 5 else None),
            'num_servicio': limpiar_string_sql(row.iloc[6] if len(row) > 6 else None),
            'num_factura': limpiar_string_sql(row.iloc[7] if len(row) > 7 else None),
            'num_contrato': limpiar_string_sql(row.iloc[8] if len(row) > 8 else None),
            'num_manifiesto': limpiar_string_sql(row.iloc[9] if len(row) > 9 else None),
            'observacion': limpiar_string_sql(row.iloc[10] if len(row) > 10 else None),
            'peso_kg': extraer_peso(
                row.iloc[10] if len(row) > 10 else None,
                row.iloc[11] if len(row) > 11 else None
            ),
            'estado_pago': mapear_estado_pago(row.iloc[10] if len(row) > 10 else None)
        }
        
        if registro['num_factura'] or registro['num_servicio'] or registro['fecha_servicio']:
            registros.append(registro)
    
    return registros

def main():
    print("=" * 60)
    print("EXTRACCION DE DATOS EXCEL -> SQL (Version 2)")
    print("=" * 60)
    print(f"Archivo: {EXCEL_FILE}")
    print()
    
    print("Cargando Excel (esto puede tomar unos minutos)...")
    xls = pd.ExcelFile(EXCEL_FILE)
    total_hojas = len(xls.sheet_names)
    print(f"Total de hojas encontradas: {total_hojas}")
    print()
    
    empresas = {}
    sedes = []
    contratos = []
    servicios = []
    manifiestos = []
    facturas = []
    facturas_por_numero = defaultdict(list)
    
    print("Procesando hojas...")
    errores = []
    
    for idx, sheet_name in enumerate(xls.sheet_names):
        if (idx + 1) % 100 == 0:
            print(f"  Procesadas {idx + 1}/{total_hojas} hojas...")
        
        try:
            df = pd.read_excel(xls, sheet_name=sheet_name, header=None)
            cabecera = extraer_cabecera(df)
            
            if not cabecera['ruc']:
                errores.append(f"Hoja '{sheet_name}': Sin RUC valido")
                continue
            
            ruc = cabecera['ruc']
            if ruc not in empresas:
                empresas[ruc] = {
                    'razon_social': cabecera['razon_social'] or limpiar_string_sql(sheet_name),
                    'email': cabecera['email'],
                    'sheet_name': sheet_name
                }
            
            sede_info = {
                'ruc': ruc,
                'nombre_comercial': cabecera['nombre_comercial'] or cabecera['razon_social'] or limpiar_string_sql(sheet_name),
                'sheet_name': sheet_name
            }
            sedes.append(sede_info)
            sede_idx = len(sedes)
            
            contrato_info = {
                'sede_idx': sede_idx,
                'fecha_inicio': cabecera['fecha_inicio'],
                'codigo_contrato': None
            }
            
            fila_enc = encontrar_fila_encabezados(df)
            registros = extraer_registros(df, fila_enc)
            
            for reg in registros:
                if reg['num_contrato'] and not contrato_info['codigo_contrato']:
                    contrato_info['codigo_contrato'] = reg['num_contrato']
                
                servicio_info = {
                    'sede_idx': sede_idx,
                    'codigo_servicio': reg['num_servicio'],
                    'fecha_programada': reg['fecha_servicio'] or reg['fecha_pago'],
                    'fecha_ejecucion': reg['fecha_servicio'],
                    'descripcion': reg['descripcion'],
                    'ruc': ruc
                }
                servicios.append(servicio_info)
                servicio_idx = len(servicios)
                
                if reg['num_manifiesto']:
                    manifiesto_info = {
                        'servicio_idx': servicio_idx,
                        'numero_manifiesto': reg['num_manifiesto'],
                        'peso_kg': reg['peso_kg'] or 1.0,
                        'tipo_residuo': 'Residuos Solidos Hospitalarios'
                    }
                    manifiestos.append(manifiesto_info)
                
                if reg['num_factura']:
                    num_fact = reg['num_factura'].strip().lstrip('\t')
                    
                    factura_info = {
                        'servicio_idx': servicio_idx,
                        'numero_factura': num_fact,
                        'fecha_emision': reg['fecha_pago'],
                        'monto_total': reg['monto'],
                        'estado': reg['estado_pago'],
                        'metodo_pago': reg['forma_pago'],
                        'observaciones': reg['observacion'],
                        'ruc_empresa': ruc
                    }
                    facturas.append(factura_info)
                    
                    facturas_por_numero[num_fact].append({
                        'ruc': ruc,
                        'sheet': sheet_name,
                        'monto': reg['monto'],
                        'fecha': reg['fecha_pago']
                    })
            
            contratos.append(contrato_info)
            
        except Exception as e:
            errores.append(f"Hoja '{sheet_name}': Error - {str(e)}")
    
    print(f"\nProcesamiento completado.")
    print(f"  Empresas unicas: {len(empresas)}")
    print(f"  Sedes: {len(sedes)}")
    print(f"  Servicios: {len(servicios)}")
    print(f"  Manifiestos: {len(manifiestos)}")
    print(f"  Facturas: {len(facturas)}")
    print(f"  Errores: {len(errores)}")
    
    # GENERAR SQL
    print("\n" + "=" * 60)
    print("GENERANDO ARCHIVO SQL")
    print("=" * 60)
    
    with open(OUTPUT_SQL_FILE, 'w', encoding='utf-8') as f:
        f.write("-- ============================================\n")
        f.write("-- SQL Generado desde PAGOS CLIENTES LIMA.xlsx\n")
        f.write(f"-- Fecha: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("-- ============================================\n\n")
        
        f.write("SET FOREIGN_KEY_CHECKS = 0;\n\n")
        
        # 1. Crear Planta
        f.write("-- PLANTA DE TRATAMIENTO\n")
        f.write(f"INSERT INTO Planta (razon_social, ruc, nombre_comercial, direccion, distrito, provincia, departamento, tipo_tratamiento) ")
        f.write(f"SELECT '{PLANTA_INFO['razon_social']}', '{PLANTA_INFO['ruc']}', '{PLANTA_INFO['nombre_comercial']}', ")
        f.write(f"'{PLANTA_INFO['direccion']}', '{PLANTA_INFO['distrito']}', '{PLANTA_INFO['provincia']}', ")
        f.write(f"'{PLANTA_INFO['departamento']}', '{PLANTA_INFO['tipo_tratamiento']}' ")
        f.write(f"FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM Planta WHERE ruc = '{PLANTA_INFO['ruc']}');\n\n")
        f.write(f"SET @id_planta_default = (SELECT id_planta FROM Planta WHERE ruc = '{PLANTA_INFO['ruc']}' LIMIT 1);\n\n")
        
        # 2. Clientes y Empresas
        f.write("-- CLIENTES Y EMPRESAS\n")
        
        ruc_to_empresa_var = {}
        for i, (ruc, emp) in enumerate(empresas.items()):
            var_name = f"@emp_{i}"
            ruc_to_empresa_var[ruc] = var_name
            
            razon = (emp['razon_social'] or 'Sin Nombre')[:100]
            email = (emp['email'] or '')[:100]
            
            f.write(f"SET {var_name} = (SELECT id_empresa FROM Empresa WHERE ruc = '{ruc}' LIMIT 1);\n")
            f.write(f"INSERT INTO Cliente (nombre, email, notas) SELECT '{razon}', '{email}', 'Importado Excel' FROM DUAL WHERE {var_name} IS NULL;\n")
            f.write(f"SET @last_cliente = IFNULL({var_name}, (SELECT id_cliente FROM Cliente ORDER BY id_cliente DESC LIMIT 1));\n")
            f.write(f"INSERT INTO Empresa (id_cliente, razon_social, ruc, email) SELECT @last_cliente, '{razon}', '{ruc}', '{email}' FROM DUAL WHERE {var_name} IS NULL;\n")
            f.write(f"SET {var_name} = (SELECT id_empresa FROM Empresa WHERE ruc = '{ruc}' LIMIT 1);\n\n")
        
        # 3. Sedes
        f.write("-- SEDES\n")
        
        sede_to_var = {}
        for i, sede in enumerate(sedes):
            var_name = f"@sede_{i}"
            sede_to_var[i + 1] = var_name
            
            nombre = (sede['nombre_comercial'] or 'Sede Principal')[:200]
            emp_var = ruc_to_empresa_var.get(sede['ruc'], '@emp_0')
            
            f.write(f"INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito) ")
            f.write(f"SELECT {emp_var}, '{nombre}', 'Direccion por actualizar', 'Lima' FROM DUAL ")
            f.write(f"WHERE NOT EXISTS (SELECT 1 FROM Sede WHERE id_empresa = {emp_var} AND nombre_comercial = '{nombre}');\n")
            f.write(f"SET {var_name} = (SELECT id_sede FROM Sede WHERE id_empresa = {emp_var} AND nombre_comercial = '{nombre}' LIMIT 1);\n\n")
        
        # 4. Contratos
        f.write("-- CONTRATOS DE SERVICIO\n")
        
        for i, contrato in enumerate(contratos):
            sede_var = sede_to_var.get(contrato['sede_idx'], '@sede_0')
            fecha_inicio = contrato['fecha_inicio'] or '2020-01-01'
            codigo = (contrato['codigo_contrato'] or f'AUTO-{i+1:05d}')[:50]
            
            f.write(f"INSERT INTO ContratoServicio (id_sede, codigo_contrato, fecha_inicio, frecuencia, tarifa, tipo_tarifa) ")
            f.write(f"SELECT {sede_var}, '{codigo}', '{fecha_inicio}', 'mensual', 0.00, 'mensual_fijo' FROM DUAL ")
            f.write(f"WHERE NOT EXISTS (SELECT 1 FROM ContratoServicio WHERE id_sede = {sede_var} AND codigo_contrato = '{codigo}');\n")
        
        f.write("\n")
        
        # 5. Servicios, Manifiestos y Facturas
        f.write("-- SERVICIOS, MANIFIESTOS Y FACTURAS\n")
        
        for i, serv in enumerate(servicios):
            serv_idx = i + 1
            
            sede_var = sede_to_var.get(serv['sede_idx'], '@sede_0')
            fecha_prog = serv['fecha_programada'] or '2020-01-01'
            fecha_ejec = serv['fecha_ejecucion'] or fecha_prog
            codigo_serv = (serv['codigo_servicio'] or f'SRV-{serv_idx:06d}')[:50]
            desc = (serv['descripcion'] or 'GESTION DE RR.SS')[:200]
            
            f.write(f"INSERT INTO Servicio (id_sede, id_planta, codigo_servicio, fecha_programada, fecha_ejecucion, estado, observaciones) ")
            f.write(f"VALUES ({sede_var}, @id_planta_default, '{codigo_serv}', '{fecha_prog}', '{fecha_ejec}', 'completado', '{desc}');\n")
            f.write(f"SET @serv_{serv_idx} = LAST_INSERT_ID();\n")
            
            # Manifiesto
            for man in manifiestos:
                if man['servicio_idx'] == serv_idx:
                    peso = man['peso_kg'] or 1.0
                    num_man = (man['numero_manifiesto'] or '')[:50]
                    tipo_res = man['tipo_residuo'][:100]
                    f.write(f"INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (@serv_{serv_idx}, '{num_man}', '{tipo_res}', {peso});\n")
                    break
            
            # Factura
            for fact in facturas:
                if fact['servicio_idx'] == serv_idx:
                    num_fact = (fact['numero_factura'] or '')[:20]
                    fecha_em = fact['fecha_emision'] or fecha_prog
                    monto = fact['monto_total'] or 0
                    estado = fact['estado']
                    metodo = (fact['metodo_pago'] or 'Efectivo')[:50]
                    obs = (fact['observaciones'] or '')[:200]
                    
                    f.write(f"INSERT INTO Factura (id_servicio, numero_factura, fecha_emision, monto_total, estado, metodo_pago, observaciones) ")
                    f.write(f"VALUES (@serv_{serv_idx}, '{num_fact}', '{fecha_em}', {monto}, '{estado}', '{metodo}', '{obs}');\n")
                    break
            
            if (i + 1) % 1000 == 0:
                f.write(f"-- Procesados {i + 1} servicios\n")
        
        f.write("\nSET FOREIGN_KEY_CHECKS = 1;\n")
        f.write("-- FIN DEL SCRIPT\n")
    
    print(f"Archivo SQL generado: {OUTPUT_SQL_FILE}")
    print("\n" + "=" * 60)
    print("PROCESO COMPLETADO")
    print("=" * 60)

if __name__ == '__main__':
    main()
