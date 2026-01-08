"""
Script para importar servicios desde Excel a SQL
Lee el archivo Datos.xlsx y genera un script SQL para insertar servicios
"""
import pandas as pd
from datetime import datetime
import re

def clean_text(text):
    """Limpia texto para SQL"""
    if pd.isna(text):
        return None
    text = str(text).strip()
    # Remove newlines and carriage returns
    text = text.replace('\r', '').replace('\n', ' ')
    # Escape single quotes
    text = text.replace("'", "''")
    # Remove any other problematic characters
    text = ' '.join(text.split())  # Normalize whitespace
    return text

def main():
    # Leer el archivo Excel
    df = pd.read_excel('../../Datos.xlsx')
    
    print(f"Total de filas: {len(df)}")
    print(f"Columnas: {df.columns.tolist()}")
    
    # Columnas de fechas de servicio
    date_columns = [
        ('FECHA DE SERVICIO ENERO', 1),
        ('FECHA DE SERVICIO FEBRERO', 2),
        ('FECHA DE SERVICIO MARZO', 3),
        ('FECHA DE SERVICIO ABRIL', 4),
        ('FECHA DE SERVICIO MAYO', 5),
        ('FECHA DE SERVICIO JUNIO', 6),
        ('FECHA DE SERVICIO JULIO', 7),
        ('FECHA DE SERVICIO AGOSTO', 8),
        ('FECHA DE SERVICIO SETIEMBRE', 9),
        ('FECHA DE SERVICIO OCTUBRE', 10),
        ('FECHA DE SERVICIO NOVIEMBRE', 11),
        ('FECHA DE SERVICIO DICIEMBRE', 12)
    ]
    
    # Generar SQL
    sql_lines = []
    sql_lines.append("-- ===========================================")
    sql_lines.append("-- Importación de Servicios desde Excel")
    sql_lines.append(f"-- Generado: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    sql_lines.append("-- ===========================================")
    sql_lines.append("")
    sql_lines.append("-- Obtener la planta por defecto")
    sql_lines.append("SET @id_planta_default = (SELECT id_planta FROM Planta WHERE ruc = '20537973421' LIMIT 1);")
    sql_lines.append("")
    sql_lines.append("-- Si no existe planta, usar ID 1")
    sql_lines.append("SET @id_planta_default = IFNULL(@id_planta_default, 1);")
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
        
        # Para cada sede, buscar por nombre comercial y empresa por RUC
        sql_lines.append(f"-- Cliente: {representante} | Empresa: {razon_social} | Sede: {nombre_comercial}")
        sql_lines.append(f"SET @sede_id = (SELECT s.id_sede FROM Sede s INNER JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '{ruc}' AND s.nombre_comercial = '{nombre_comercial}' LIMIT 1);")
        sql_lines.append("")
        
        for col_name, month_num in date_columns:
            fecha_valor = row.get(col_name)
            
            # Determinar el año basado en el contexto (asumimos 2025 por defecto)
            # Las fechas pueden venir como datetime o estar vacías
            if pd.notna(fecha_valor):
                # Si hay fecha de servicio
                if isinstance(fecha_valor, datetime):
                    fecha_str = fecha_valor.strftime('%Y-%m-%d')
                else:
                    # Intentar parsear si es string
                    try:
                        fecha_dt = pd.to_datetime(fecha_valor)
                        fecha_str = fecha_dt.strftime('%Y-%m-%d')
                    except:
                        # Si no podemos parsear, usar fecha por defecto del mes
                        fecha_str = f"2025-{month_num:02d}-15"
                
                estado = 'completado'
                service_count += 1
            else:
                # No hay servicio - registrar como cancelado o sin servicio
                # Usamos el día 1 del mes como referencia
                fecha_str = f"2025-{month_num:02d}-01"
                estado = 'cancelado'
                no_service_count += 1
            
            # Generar código único de servicio
            codigo_servicio = f"SRV-EXCEL-{idx:04d}-{month_num:02d}"
            
            sql_lines.append(f"INSERT INTO Servicio (id_sede, id_planta, codigo_servicio, fecha_programada, fecha_ejecucion, estado, observaciones)")
            if estado == 'completado':
                sql_lines.append(f"SELECT @sede_id, @id_planta_default, '{codigo_servicio}', '{fecha_str}', '{fecha_str}', '{estado}', 'Importado desde Excel'")
            else:
                sql_lines.append(f"SELECT @sede_id, @id_planta_default, '{codigo_servicio}', '{fecha_str}', NULL, '{estado}', 'Sin servicio en este mes - Importado desde Excel'")
            sql_lines.append(f"WHERE @sede_id IS NOT NULL;")
            sql_lines.append("")
    
    sql_lines.append("-- ===========================================")
    sql_lines.append(f"-- Total servicios con fecha: {service_count}")
    sql_lines.append(f"-- Total sin servicio (cancelados): {no_service_count}")
    sql_lines.append("-- ===========================================")
    
    # Guardar el archivo SQL
    output_file = 'servicios_excel_import.sql'
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f"\nArchivo generado: {output_file}")
    print(f"Total servicios con fecha: {service_count}")
    print(f"Total sin servicio (cancelados): {no_service_count}")
    print(f"Total líneas SQL: {len(sql_lines)}")

if __name__ == "__main__":
    main()
