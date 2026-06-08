import pymysql

try:
    connection = pymysql.connect(
        host='31.97.208.99',
        port=3306,
        user='u511863531_Sebastian',
        password='Sebas0920%',
        database='u511863531_IOGroupBD',
        charset='utf8mb4'
    )
    with connection.cursor() as cursor:
        print("--- BUSCANDO MONTOS EXTREMOS EN LA BASE DE DATOS (> 10,000) ---")
        cursor.execute("""
            SELECT s.id_servicio, se.nombre_comercial, s.fecha_ejecucion, s.mes_servicio, s.monto_cobrado 
            FROM Servicio s
            JOIN Sede se ON s.id_sede = se.id_sede
            WHERE s.monto_cobrado > 10000
        """)
        rows = cursor.fetchall()
        print(f"Total registros extremos encontrados: {len(rows)}")
        for row in rows:
            print(f"ID: {row[0]} | Sede: {row[1]} | Fecha: {row[2]} | Mes: {row[3]} | Monto: {row[4]}")
            
    connection.close()
except Exception as e:
    print(f"Error: {e}")
