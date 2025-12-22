<?php
/**
 * IO Group - Vehiculos API
 * CRUD operations for vehicles
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
    
    $search = $_GET['search'] ?? '';
    $activo = $_GET['activo'] ?? null;
    
    $sql = "SELECT * FROM Vehiculo WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (placa LIKE ? OR marca LIKE ? OR modelo LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm]);
    }
    
    if ($activo !== null) {
        $sql .= " AND activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    $sql .= " ORDER BY placa";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $vehiculo = db()->queryOne("SELECT * FROM Vehiculo WHERE id_vehiculo = ?", [$id]);
    
    if (!$vehiculo) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Vehículo no encontrado']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $vehiculo
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $placa = $data['placa'] ?? '';
    
    if (empty($placa)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'La placa es requerida']);
        return;
    }
    
    // Check placa uniqueness
    $existing = db()->queryOne("SELECT id_vehiculo FROM Vehiculo WHERE placa = ?", [$placa]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Ya existe un vehículo con esa placa']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Vehiculo (placa, marca, modelo, anio, color, tonelaje_max, tipo, numero_motor, numero_chasis, fecha_venc_soat, fecha_venc_revision, fecha_venc_mtc) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $placa,
            $data['marca'] ?? null,
            $data['modelo'] ?? null,
            $data['anio'] ?? null,
            $data['color'] ?? null,
            $data['tonelaje_max'] ?? null,
            $data['tipo'] ?? 'camion',
            $data['numero_motor'] ?? null,
            $data['numero_chasis'] ?? null,
            $data['fecha_venc_soat'] ?? null,
            $data['fecha_venc_revision'] ?? null,
            $data['fecha_venc_mtc'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Vehiculo', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode(['placa' => $placa])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Vehículo creado exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Vehiculo WHERE id_vehiculo = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Vehículo no encontrado']);
        return;
    }
    
    $placa = $data['placa'] ?? $existing['placa'];
    
    // Check placa uniqueness for other vehicles
    $placaCheck = db()->queryOne(
        "SELECT id_vehiculo FROM Vehiculo WHERE placa = ? AND id_vehiculo != ?",
        [$placa, $id]
    );
    if ($placaCheck) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Ya existe otro vehículo con esa placa']);
        return;
    }
    
    db()->execute(
        "UPDATE Vehiculo SET 
            placa = ?,
            marca = ?,
            modelo = ?,
            anio = ?,
            color = ?,
            tonelaje_max = ?,
            tipo = ?,
            numero_motor = ?,
            numero_chasis = ?,
            fecha_venc_soat = ?,
            fecha_venc_revision = ?,
            fecha_venc_mtc = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_vehiculo = ?",
        [
            $placa,
            $data['marca'] ?? $existing['marca'],
            $data['modelo'] ?? $existing['modelo'],
            $data['anio'] ?? $existing['anio'],
            $data['color'] ?? $existing['color'],
            $data['tonelaje_max'] ?? $existing['tonelaje_max'],
            $data['tipo'] ?? $existing['tipo'],
            $data['numero_motor'] ?? $existing['numero_motor'],
            $data['numero_chasis'] ?? $existing['numero_chasis'],
            $data['fecha_venc_soat'] ?? $existing['fecha_venc_soat'],
            $data['fecha_venc_revision'] ?? $existing['fecha_venc_revision'],
            $data['fecha_venc_mtc'] ?? $existing['fecha_venc_mtc'],
            isset($data['activo']) ? $data['activo'] : null,
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Vehiculo', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Vehículo actualizado exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    db()->execute(
        "UPDATE Vehiculo SET activo = 0, fecha_modificacion = NOW() WHERE id_vehiculo = ?",
        [$id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Vehiculo', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Vehículo eliminado exitosamente'
    ]);
}
