<?php
/**
 * IO Group - Rutas API
 * CRUD operations for transport routes
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$id = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        $id ? getOne($id) : getAll();
        break;
    case 'POST':
        create();
        break;
    case 'PUT':
        update($id);
        break;
    case 'DELETE':
        delete($id);
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

function getAll() {
    canView();
    
    $vehiculo = $_GET['vehiculo'] ?? null;
    $estado = $_GET['estado'] ?? null;
    $fecha = $_GET['fecha'] ?? null;
    
    $sql = "SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca, v.modelo as vehiculo_modelo,
            (SELECT COUNT(*) FROM Servicio s WHERE s.id_ruta = r.id_ruta) as total_servicios
            FROM Ruta r
            INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
            WHERE 1=1";
    $params = [];
    
    if ($vehiculo) {
        $sql .= " AND r.id_vehiculo = ?";
        $params[] = $vehiculo;
    }
    
    if ($estado) {
        $sql .= " AND r.estado = ?";
        $params[] = $estado;
    }
    
    if ($fecha) {
        $sql .= " AND r.fecha = ?";
        $params[] = $fecha;
    }
    
    $sql .= " ORDER BY r.fecha DESC, r.hora_salida DESC";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $ruta = db()->queryOne(
        "SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca
         FROM Ruta r 
         INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo 
         WHERE r.id_ruta = ?",
        [$id]
    );
    
    if (!$ruta) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Ruta no encontrada']);
        return;
    }
    
    // Get services for this route
    $servicios = db()->query(
        "SELECT s.*, se.nombre_comercial as sede_nombre 
         FROM Servicio s 
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         WHERE s.id_ruta = ? ORDER BY s.fecha_programada",
        [$id]
    );
    
    $ruta['servicios'] = $servicios;
    
    echo json_encode([
        'success' => true,
        'data' => $ruta
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_vehiculo = $data['id_vehiculo'] ?? null;
    $fecha = $data['fecha'] ?? null;
    
    if (empty($id_vehiculo) || empty($fecha)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Vehículo y fecha son requeridos']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Ruta (id_vehiculo, codigo_ruta, fecha, hora_salida, hora_retorno, km_inicial, km_final, estado, observaciones) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $id_vehiculo,
            $data['codigo_ruta'] ?? null,
            $fecha,
            $data['hora_salida'] ?? null,
            $data['hora_retorno'] ?? null,
            $data['km_inicial'] ?? null,
            $data['km_final'] ?? null,
            $data['estado'] ?? 'programada',
            $data['observaciones'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Ruta', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Ruta creada exitosamente',
        'id' => $id
    ]);
}

function update($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    $existing = db()->queryOne("SELECT * FROM Ruta WHERE id_ruta = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Ruta no encontrada']);
        return;
    }
    
    db()->execute(
        "UPDATE Ruta SET 
            id_vehiculo = COALESCE(?, id_vehiculo),
            codigo_ruta = ?,
            fecha = COALESCE(?, fecha),
            hora_salida = ?,
            hora_retorno = ?,
            km_inicial = ?,
            km_final = ?,
            estado = ?,
            observaciones = ?,
            fecha_modificacion = NOW()
         WHERE id_ruta = ?",
        [
            $data['id_vehiculo'] ?? null,
            $data['codigo_ruta'] ?? $existing['codigo_ruta'],
            $data['fecha'] ?? null,
            $data['hora_salida'] ?? $existing['hora_salida'],
            $data['hora_retorno'] ?? $existing['hora_retorno'],
            $data['km_inicial'] ?? $existing['km_inicial'],
            $data['km_final'] ?? $existing['km_final'],
            $data['estado'] ?? $existing['estado'],
            $data['observaciones'] ?? $existing['observaciones'],
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Ruta', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Ruta actualizada exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    // Check for services
    $servicios = db()->queryOne(
        "SELECT COUNT(*) as count FROM Servicio WHERE id_ruta = ?",
        [$id]
    );
    
    if ($servicios['count'] > 0) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'No se puede eliminar: la ruta tiene servicios asociados'
        ]);
        return;
    }
    
    db()->execute("DELETE FROM Ruta WHERE id_ruta = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Ruta', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Ruta eliminada exitosamente'
    ]);
}
