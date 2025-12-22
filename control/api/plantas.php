<?php
/**
 * IO Group - Plantas API
 * CRUD operations for treatment plants
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
    
    $sql = "SELECT * FROM Planta WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (razon_social LIKE ? OR ruc LIKE ? OR nombre_comercial LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm]);
    }
    
    if ($activo !== null) {
        $sql .= " AND activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    $sql .= " ORDER BY razon_social";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $planta = db()->queryOne("SELECT * FROM Planta WHERE id_planta = ?", [$id]);
    
    if (!$planta) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Planta no encontrada']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $planta
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $razon_social = $data['razon_social'] ?? '';
    $ruc = $data['ruc'] ?? '';
    $direccion = $data['direccion'] ?? '';
    
    if (empty($razon_social) || empty($ruc) || empty($direccion)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Razón social, RUC y dirección son requeridos']);
        return;
    }
    
    // Check RUC uniqueness
    $existing = db()->queryOne("SELECT id_planta FROM Planta WHERE ruc = ?", [$ruc]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Ya existe una planta con ese RUC']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Planta (razon_social, ruc, nombre_comercial, direccion, distrito, provincia, departamento, tipo_tratamiento, codigo_eps, telefono, contacto_nombre, contacto_email) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $razon_social,
            $ruc,
            $data['nombre_comercial'] ?? null,
            $direccion,
            $data['distrito'] ?? null,
            $data['provincia'] ?? null,
            $data['departamento'] ?? null,
            $data['tipo_tratamiento'] ?? null,
            $data['codigo_eps'] ?? null,
            $data['telefono'] ?? null,
            $data['contacto_nombre'] ?? null,
            $data['contacto_email'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Planta', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode(['razon_social' => $razon_social, 'ruc' => $ruc])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Planta creada exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Planta WHERE id_planta = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Planta no encontrada']);
        return;
    }
    
    $ruc = $data['ruc'] ?? $existing['ruc'];
    
    // Check RUC uniqueness for other plants
    $rucCheck = db()->queryOne(
        "SELECT id_planta FROM Planta WHERE ruc = ? AND id_planta != ?",
        [$ruc, $id]
    );
    if ($rucCheck) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Ya existe otra planta con ese RUC']);
        return;
    }
    
    db()->execute(
        "UPDATE Planta SET 
            razon_social = COALESCE(?, razon_social),
            ruc = ?,
            nombre_comercial = ?,
            direccion = COALESCE(?, direccion),
            distrito = ?,
            provincia = ?,
            departamento = ?,
            tipo_tratamiento = ?,
            codigo_eps = ?,
            telefono = ?,
            contacto_nombre = ?,
            contacto_email = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_planta = ?",
        [
            $data['razon_social'] ?? null,
            $ruc,
            $data['nombre_comercial'] ?? $existing['nombre_comercial'],
            $data['direccion'] ?? null,
            $data['distrito'] ?? $existing['distrito'],
            $data['provincia'] ?? $existing['provincia'],
            $data['departamento'] ?? $existing['departamento'],
            $data['tipo_tratamiento'] ?? $existing['tipo_tratamiento'],
            $data['codigo_eps'] ?? $existing['codigo_eps'],
            $data['telefono'] ?? $existing['telefono'],
            $data['contacto_nombre'] ?? $existing['contacto_nombre'],
            $data['contacto_email'] ?? $existing['contacto_email'],
            isset($data['activo']) ? $data['activo'] : null,
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Planta', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Planta actualizada exitosamente'
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
        "UPDATE Planta SET activo = 0, fecha_modificacion = NOW() WHERE id_planta = ?",
        [$id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Planta', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Planta eliminada exitosamente'
    ]);
}
