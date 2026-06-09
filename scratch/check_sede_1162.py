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
        # Check Sede 1162
        cursor.execute("""
            SELECT s.id_sede, s.nombre_comercial, s.id_empresa, e.razon_social 
            FROM Sede s 
            JOIN Empresa e ON s.id_empresa = e.id_empresa 
            WHERE s.id_sede = 1162
        """)
        print("Sede 1162 Info:")
        print(cursor.fetchone())
        
        # Check Clinivet Lassy
        cursor.execute("""
            SELECT s.id_sede, s.nombre_comercial, e.id_empresa, e.razon_social 
            FROM Sede s 
            JOIN Empresa e ON s.id_empresa = e.id_empresa 
            WHERE e.razon_social LIKE '%LASSY%' OR s.nombre_comercial LIKE '%LASSY%'
        """)
        print("\nClinivet Lassy Sedes in DB:")
        for row in cursor.fetchall():
            print(row)
            
    connection.close()
except Exception as e:
    print(f"Error: {e}")
