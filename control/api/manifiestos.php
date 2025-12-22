<?php
/**
 * IO Group - Manifiestos API
 * CRUD operations for waste manifests
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
    
    $servicio = $_GET['servicio'] ?? null;
    
    $sql = "SELECT m.*, s.codigo_servicio, se.nombre_comercial as sede_nombre
            FROM Manifiesto m
            INNER JOIN Servicio s ON m.id_servicio = s.id_servicio
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            WHERE 1=1";
    $params = [];
    
    if ($servicio) {
        $sql .= " AND m.id_servicio = ?";
        $params[] = $servicio;
    }
    
    $sql .= " ORDER BY m.fecha_creacion DESC";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $manifiesto = db()->queryOne(
        "SELECT m.*, s.codigo_servicio, se.nombre_comercial as sede_nombre
         FROM Manifiesto m 
         INNER JOIN Servicio s ON m.id_servicio = s.id_servicio 
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         WHERE m.id_manifiesto = ?",
        [$id]
    );
    
    if (!$manifiesto) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Manifiesto no encontrado']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $manifiesto
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_servicio = $data['id_servicio'] ?? null;
    $tipo_residuo = $data['tipo_residuo'] ?? '';
    $peso_kg = $data['peso_kg'] ?? null;
    
    if (empty($id_servicio) || empty($tipo_residuo) || empty($peso_kg)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Servicio, tipo de residuo y peso son requeridos']);
        return;
    }
    
    // Check if service already has manifest
    $existing = db()->queryOne("SELECT id_manifiesto FROM Manifiesto WHERE id_servicio = ?", [$id_servicio]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'El servicio ya tiene un manifiesto']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, codigo_residuo, descripcion_residuo, peso_kg, unidad_medida, cantidad_bultos, nombre_responsable, cargo_responsable, dni_responsable, observaciones) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $id_servicio,
            $data['numero_manifiesto'] ?? null,
            $tipo_residuo,
            $data['codigo_residuo'] ?? null,
            $data['descripcion_residuo'] ?? null,
            $peso_kg,
            $data['unidad_medida'] ?? 'kg',
            $data['cantidad_bultos'] ?? null,
            $data['nombre_responsable'] ?? null,
            $data['cargo_responsable'] ?? null,
            $data['dni_responsable'] ?? null,
            $data['observaciones'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Manifiesto', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Manifiesto creado exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Manifiesto WHERE id_manifiesto = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Manifiesto no encontrado']);
        return;
    }
    
    db()->execute(
        "UPDATE Manifiesto SET 
            numero_manifiesto = ?,
            tipo_residuo = COALESCE(?, tipo_residuo),
            codigo_residuo = ?,
            descripcion_residuo = ?,
            peso_kg = COALESCE(?, peso_kg),
            unidad_medida = ?,
            cantidad_bultos = ?,
            nombre_responsable = ?,
            cargo_responsable = ?,
            dni_responsable = ?,
            observaciones = ?,
            fecha_modificacion = NOW()
         WHERE id_manifiesto = ?",
        [
            $data['numero_manifiesto'] ?? $existing['numero_manifiesto'],
            $data['tipo_residuo'] ?? null,
            $data['codigo_residuo'] ?? $existing['codigo_residuo'],
            $data['descripcion_residuo'] ?? $existing['descripcion_residuo'],
            $data['peso_kg'] ?? null,
            $data['unidad_medida'] ?? $existing['unidad_medida'],
            $data['cantidad_bultos'] ?? $existing['cantidad_bultos'],
            $data['nombre_responsable'] ?? $existing['nombre_responsable'],
            $data['cargo_responsable'] ?? $existing['cargo_responsable'],
            $data['dni_responsable'] ?? $existing['dni_responsable'],
            $data['observaciones'] ?? $existing['observaciones'],
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Manifiesto', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Manifiesto actualizado exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    db()->execute("DELETE FROM Manifiesto WHERE id_manifiesto = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Manifiesto', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Manifiesto eliminado exitosamente'
    ]);
}
