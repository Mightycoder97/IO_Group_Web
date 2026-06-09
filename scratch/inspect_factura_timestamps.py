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
        # Check table structure of Factura
        cursor.execute("DESCRIBE Factura")
        print("--- Factura schema ---")
        for col in cursor.fetchall():
            print(col)
            
        cursor.execute("""
            SELECT id_factura, id_servicio, numero_factura, fecha_creacion
            FROM Factura 
            WHERE numero_factura = '42379'
        """)
        print("\n--- Facturas matching '42379' ---")
        for row in cursor.fetchall():
            print(row)
            
    connection.close()
except Exception as e:
    print(f"Error: {e}")
