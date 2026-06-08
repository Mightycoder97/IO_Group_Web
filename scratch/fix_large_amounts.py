import pymysql

updates = {
    55813: 1228.52,
    56105: 1040.40,
    64959: 893.94,
    65273: 400.00,
    71036: 113.80
}

try:
    connection = pymysql.connect(
        host='31.97.208.99',
        port=3306,
        user='u511863531_Sebastian',
        password='Sebas0920%',
        database='u511863531_IOGroupBD',
        charset='utf8mb4'
    )
    connection.autocommit(False)
    
    with connection.cursor() as cursor:
        print("--- CORRIGIENDO MONTOS EXTREMOS EN LA BD ---")
        
        # 1. Corregir los 5 montos con coma decimal mal parseada
        for srv_id, correct_val in updates.items():
            cursor.execute("""
                UPDATE Servicio 
                SET monto_cobrado = %s 
                WHERE id_servicio = %s
            """, (correct_val, srv_id))
            print(f"Servicio ID {srv_id} actualizado a S/ {correct_val:.2f} (Filas afectadas: {cursor.rowcount})")
            
        # 2. Corregir los montos 99999999.99 estableciéndolos en NULL
        cursor.execute("""
            UPDATE Servicio 
            SET monto_cobrado = NULL 
            WHERE monto_cobrado = 99999999.99
        """)
        print(f"Establecido en NULL {cursor.rowcount} servicios con monto 99999999.99 (caerán en tarifa por defecto).")
        
        connection.commit()
        print("\n¡Cambios confirmados (COMMIT) con éxito!")
        
    connection.close()
except Exception as e:
    print(f"Error: {e}")
    if 'connection' in locals():
        connection.rollback()
        print("Se ha realizado un ROLLBACK.")
