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
            SELECT s.id_servicio, se.nombre_comercial, e.razon_social, s.fecha_ejecucion, s.monto_cobrado, s.estado_pago, s.fecha_modificacion, s.observaciones
            FROM Servicio s
            JOIN Sede se ON s.id_sede = se.id_sede
            JOIN Empresa e ON se.id_empresa = e.id_empresa
            WHERE s.fecha_modificacion >= '2026-06-09 15:00:00' AND s.fecha_modificacion <= '2026-06-09 17:00:00'
            ORDER BY s.fecha_modificacion ASC
        """
        cursor.execute(query)
        rows = cursor.fetchall()
        print(f"Total services modified in that window: {len(rows)}")
        
        # Let's group by modification timestamp to see the batches
        from collections import defaultdict
        by_time = defaultdict(list)
        for r in rows:
            by_time[str(r['fecha_modificacion'])].append(r)
            
        for t, list_svcs in sorted(by_time.items()):
            print(f"\n--- Timestamp: {t} (Count: {len(list_svcs)}) ---")
            for r in list_svcs[:10]: # print up to 10
                print(f"  ID: {r['id_servicio']} | Client: {r['razon_social']} | Date: {r['fecha_ejecucion']} | Monto: {r['monto_cobrado']} | Pago: {r['estado_pago']} | Obs: {r['observaciones']}")
            if len(list_svcs) > 10:
                print(f"  ... and {len(list_svcs) - 10} more.")

    connection.close()
except Exception as e:
    print(f"Error: {e}")
