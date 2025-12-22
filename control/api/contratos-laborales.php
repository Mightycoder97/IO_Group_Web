<?php
/**
 * IO Group - Contratos Laborales API
 * CRUD operations for labor contracts
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
    
    $empleado = $_GET['empleado'] ?? null;
    $activo = $_GET['activo'] ?? null;
    
    $sql = "SELECT cl.*, CONCAT(e.nombres, ' ', e.apellidos) as empleado_nombre, e.dni as empleado_dni
            FROM ContratoLaboral cl
            INNER JOIN Empleado e ON cl.id_empleado = e.id_empleado
            WHERE 1=1";
    $params = [];
    
    if ($empleado) {
        $sql .= " AND cl.id_empleado = ?";
        $params[] = $empleado;
    }
    
    if ($activo !== null) {
        $sql .= " AND cl.activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    $sql .= " ORDER BY cl.fecha_inicio DESC";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $contrato = db()->queryOne(
        "SELECT cl.*, CONCAT(e.nombres, ' ', e.apellidos) as empleado_nombre
         FROM ContratoLaboral cl 
         INNER JOIN Empleado e ON cl.id_empleado = e.id_empleado 
         WHERE cl.id_contrato_laboral = ?",
        [$id]
    );
    
    if (!$contrato) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Contrato no encontrado']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $contrato
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_empleado = $data['id_empleado'] ?? null;
    $cargo = $data['cargo'] ?? '';
    $fecha_inicio = $data['fecha_inicio'] ?? null;
    
    if (empty($id_empleado) || empty($cargo) || empty($fecha_inicio)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Empleado, cargo y fecha de inicio son requeridos']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO ContratoLaboral (id_empleado, cargo, fecha_inicio, fecha_fin, sueldo, tipo_contrato) 
         VALUES (?, ?, ?, ?, ?, ?)",
        [
            $id_empleado,
            $cargo,
            $fecha_inicio,
            $data['fecha_fin'] ?? null,
            $data['sueldo'] ?? null,
            $data['tipo_contrato'] ?? 'indefinido'
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ContratoLaboral', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Contrato laboral creado exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM ContratoLaboral WHERE id_contrato_laboral = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Contrato no encontrado']);
        return;
    }
    
    db()->execute(
        "UPDATE ContratoLaboral SET 
            id_empleado = COALESCE(?, id_empleado),
            cargo = COALESCE(?, cargo),
            fecha_inicio = COALESCE(?, fecha_inicio),
            fecha_fin = ?,
            sueldo = ?,
            tipo_contrato = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_contrato_laboral = ?",
        [
            $data['id_empleado'] ?? null,
            $data['cargo'] ?? null,
            $data['fecha_inicio'] ?? null,
            $data['fecha_fin'] ?? $existing['fecha_fin'],
            $data['sueldo'] ?? $existing['sueldo'],
            $data['tipo_contrato'] ?? $existing['tipo_contrato'],
            isset($data['activo']) ? $data['activo'] : null,
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'ContratoLaboral', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Contrato laboral actualizado exitosamente'
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
        "UPDATE ContratoLaboral SET activo = 0, fecha_modificacion = NOW() WHERE id_contrato_laboral = ?",
        [$id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'ContratoLaboral', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Contrato laboral eliminado exitosamente'
    ]);
}
