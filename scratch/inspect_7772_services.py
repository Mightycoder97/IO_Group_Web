import pymysql

db_config = {
    'host': '31.97.208.99',
    'port': 3306,
    'user': 'u511863531_Sebastian',
    'password': 'Sebas0920%',
    'database': 'u511863531_IOGroupBD',
    'charset': 'utf8mb4'
}

try:
    connection = pymysql.connect(**db_config)
    with connection.cursor(pymysql.cursors.DictCursor) as cursor:
        query = """
            SELECT s.id_servicio, se.nombre_comercial, e.razon_social, s.fecha_ejecucion, s.monto_cobrado, s.estado_pago, s.fecha_creacion, s.fecha_modificacion, s.observaciones
            FROM Servicio s
            JOIN Sede se ON s.id_sede = se.id_sede
            JOIN Empresa e ON se.id_empresa = e.id_empresa
            WHERE s.monto_cobrado = 7772.00
        """
        cursor.execute(query)
        rows = cursor.fetchall()
        print(f"Services with monto_cobrado = 7772.00: {len(rows)}")
        for row in rows:
            print(f"  ID: {row['id_servicio']} | Client: {row['razon_social']} | Date: {row['fecha_ejecucion']} | Pago: {row['estado_pago']} | Created: {row['fecha_creacion']} | Mod: {row['fecha_modificacion']} | Obs: {row['observaciones']}")
            
    connection.close()
except Exception as e:
    print(f"Error: {e}")
