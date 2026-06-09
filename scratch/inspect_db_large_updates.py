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
        for sid in [2738, 60072]:
            print(f"\n--- Service ID: {sid} ---")
            
            # Guia
            cursor.execute("SELECT numero_guia FROM Guia WHERE id_servicio = %s", (sid,))
            guias = [r['numero_guia'] for r in cursor.fetchall()]
            print(f"  Guias: {guias}")
            
            # Factura
            cursor.execute("SELECT numero_factura FROM Factura WHERE id_servicio = %s", (sid,))
            facturas = [r['numero_factura'] for r in cursor.fetchall()]
            print(f"  Facturas: {facturas}")
            
            # Manifiesto
            cursor.execute("SELECT numero_manifiesto FROM Manifiesto WHERE id_servicio = %s", (sid,))
            manif = [r['numero_manifiesto'] for r in cursor.fetchall()]
            print(f"  Manifiestos: {manif}")
            
    connection.close()
except Exception as e:
    print(f"Error: {e}")
