<?php
require_once __DIR__ . '/config/database.php';
try {
    $id = 1;
    $existing = db()->queryOne('SELECT * FROM Sede WHERE id_sede = ?', [$id]);
    if (!$existing) {
        die('Sede 1 not found');
    }
    db()->execute(
        'UPDATE Sede SET 
            id_empresa = COALESCE(?, id_empresa),
            nombre_comercial = COALESCE(?, nombre_comercial),
            direccion = COALESCE(?, direccion),
            distrito = ?,
            provincia = ?,
            departamento = ?,
            referencia = ?,
            coordenadas_gps = ?,
            contacto_nombre = ?,
            contacto_telefono = ?,
            contacto_telefono_2 = ?,
            contacto_email = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_sede = ?',
        [
            null,
            null,
            null,
            $existing['distrito'],
            $existing['provincia'],
            $existing['departamento'],
            $existing['referencia'],
            $existing['coordenadas_gps'],
            $existing['contacto_nombre'],
            $existing['contacto_telefono'],
            $existing['contacto_telefono_2'],
            $existing['contacto_email'],
            null,
            $id
        ]
    );
    echo "Update successful\n";
    
    // Now test AuditLog
    $data = ['nombre_comercial' => 'Test'];
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Sede', ?, 'UPDATE', ?, ?)",
        [2, $id, json_encode($existing), json_encode($data)]
    );
    echo "AuditLog insert successful\n";
    
} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage();
}
