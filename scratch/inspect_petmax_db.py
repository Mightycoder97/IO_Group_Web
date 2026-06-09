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
            SELECT s.id_servicio, s.id_sede, se.nombre_comercial, s.fecha_ejecucion, s.monto_cobrado, s.estado_pago, s.observaciones
            FROM Servicio s
            JOIN Sede se ON s.id_sede = se.id_sede
            JOIN Empresa e ON se.id_empresa = e.id_empresa
            WHERE e.razon_social LIKE '%PETMAX%'
              AND s.fecha_ejecucion >= '2026-02-01' AND s.fecha_ejecucion <= '2026-02-28'
            ORDER BY s.fecha_ejecucion ASC
        """
        cursor.execute(query)
        rows = cursor.fetchall()
        print(f"Total services in Feb 2026 for Petmax: {len(rows)}")
        for r in rows:
            print(f"  ID: {r['id_servicio']} | Sede ID: {r['id_sede']} ({r['nombre_comercial']}) | Date: {r['fecha_ejecucion']} | Monto: {r['monto_cobrado']} | Pago: {r['estado_pago']} | Obs: {r['observaciones']}")
            
    connection.close()
except Exception as e:
    print(f"Error: {e}")
