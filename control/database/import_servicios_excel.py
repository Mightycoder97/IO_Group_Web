"""
Script para importar servicios desde Excel a SQL
Incluye el campo mes_servicio basado en el nombre de la columna Excel
"""
import pandas as pd
from datetime import datetime
import re

def clean_text(text):
    """Limpia texto para SQL"""
    if pd.isna(text):
        return None
    text = str(text).strip()
    text = text.replace('\r', '').replace('\n', ' ')
    text = text.replace("'", "''")
    text = ' '.join(text.split())
    return text

def main():
    df = pd.read_excel('../../Datos.xlsx')
    
    print(f"Total de filas: {len(df)}")
    
    # Mapeo de columnas a meses
    date_columns = [
        ('FECHA DE SERVICIO ENERO', 'Enero', 1),
        ('FECHA DE SERVICIO FEBRERO', 'Febrero', 2),
        ('FECHA DE SERVICIO MARZO', 'Marzo', 3),
        ('FECHA DE SERVICIO ABRIL', 'Abril', 4),
        ('FECHA DE SERVICIO MAYO', 'Mayo', 5),
        ('FECHA DE SERVICIO JUNIO', 'Junio', 6),
        ('FECHA DE SERVICIO JULIO', 'Julio', 7),
        ('FECHA DE SERVICIO AGOSTO', 'Agosto', 8),
        ('FECHA DE SERVICIO SETIEMBRE', 'Septiembre', 9),
        ('FECHA DE SERVICIO OCTUBRE', 'Octubre', 10),
        ('FECHA DE SERVICIO NOVIEMBRE', 'Noviembre', 11),
        ('FECHA DE SERVICIO DICIEMBRE', 'Diciembre', 12)
    ]
    
    sql_lines = []
    sql_lines.append("-- ===========================================")
    sql_lines.append("-- Importacion de Servicios desde Excel")
    sql_lines.append(f"-- Generado: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    sql_lines.append("-- ===========================================")
    sql_lines.append("")
    sql_lines.append("-- Primero insertar la Planta Incineragas EIRL si no existe")
    sql_lines.append("INSERT INTO Planta (razon_social, ruc, nombre_comercial, direccion, distrito, provincia, departamento, tipo_tratamiento, codigo_eps, telefono, activo)")
    sql_lines.append("SELECT 'INCINERAGAS E.I.R.L.', '20537973421', 'Incineragas', 'Av. Separadora Industrial, Mza. A, Lote 3A, Asoc. Agropecuaria Sumac Pacha', 'Lurin', 'Lima', 'Lima', 'Incineracion de Residuos Solidos Peligrosos y No Peligrosos', 'EO-RS', '014303030', 1")
    sql_lines.append("WHERE NOT EXISTS (SELECT 1 FROM Planta WHERE ruc = '20537973421');")
    sql_lines.append("")
    sql_lines.append("-- Obtener la planta Incineragas")
    sql_lines.append("SET @id_planta_default = (SELECT id_planta FROM Planta WHERE ruc = '20537973421' LIMIT 1);")
    sql_lines.append("SET @id_planta_default = IFNULL(@id_planta_default, (SELECT id_planta FROM Planta LIMIT 1));")
    sql_lines.append("")
    
    service_count = 0
    no_service_count = 0
    
    for idx, row in df.iterrows():
        ruc = clean_text(row.get('RUC', ''))
        nombre_comercial = clean_text(row.get('Nombre Comercial', ''))
        razon_social = clean_text(row.get('Razon Social', ''))
        representante = clean_text(row.get('REPRESENTANTE', ''))
        
        if not ruc or not nombre_comercial:
            continue
        
        sql_lines.append(f"-- Cliente: {representante} | Empresa: {razon_social} | Sede: {nombre_comercial}")
        sql_lines.append(f"SET @sede_id = (SELECT s.id_sede FROM Sede s INNER JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '{ruc}' AND s.nombre_comercial = '{nombre_comercial}' LIMIT 1);")
        sql_lines.append("")
        
        for col_name, mes_nombre, month_num in date_columns:
            fecha_valor = row.get(col_name)
            
            if pd.notna(fecha_valor):
                if isinstance(fecha_valor, datetime):
                    fecha_str = fecha_valor.strftime('%Y-%m-%d')
                else:
                    try:
                        fecha_dt = pd.to_datetime(fecha_valor)
                        fecha_str = fecha_dt.strftime('%Y-%m-%d')
                    except:
                        fecha_str = f"2025-{month_num:02d}-15"
                
                estado = 'completado'
                service_count += 1
                observaciones = 'Importado desde Excel'
            else:
                fecha_str = f"2025-{month_num:02d}-01"
                estado = 'cancelado'
                no_service_count += 1
                observaciones = 'Sin servicio en este mes - Importado desde Excel'
            
            codigo_servicio = f"SRV-{idx:04d}-{month_num:02d}"
            
            # Incluir mes_servicio en el INSERT
            sql_lines.append(f"INSERT INTO Servicio (id_sede, id_planta, codigo_servicio, mes_servicio, fecha_programada, fecha_ejecucion, estado, observaciones)")
            if estado == 'completado':
                sql_lines.append(f"SELECT @sede_id, @id_planta_default, '{codigo_servicio}', '{mes_nombre}', '{fecha_str}', '{fecha_str}', '{estado}', '{observaciones}'")
            else:
                sql_lines.append(f"SELECT @sede_id, @id_planta_default, '{codigo_servicio}', '{mes_nombre}', '{fecha_str}', NULL, '{estado}', '{observaciones}'")
            sql_lines.append(f"WHERE @sede_id IS NOT NULL;")
            sql_lines.append("")
    
    sql_lines.append("-- ===========================================")
    sql_lines.append(f"-- Total servicios con fecha: {service_count}")
    sql_lines.append(f"-- Total sin servicio (cancelados): {no_service_count}")
    sql_lines.append("-- ===========================================")
    
    output_file = 'servicios_excel_import.sql'
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f"\nArchivo generado: {output_file}")
    print(f"Total servicios con fecha: {service_count}")
    print(f"Total sin servicio (cancelados): {no_service_count}")
    print(f"Total lineas SQL: {len(sql_lines)}")

if __name__ == "__main__":
    main()
