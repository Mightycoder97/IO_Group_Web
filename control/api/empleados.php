<?php
/**
 * IO Group - Empleados API
 * CRUD operations for employees
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
    
    $sql = "SELECT * FROM Empleado WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (nombres LIKE ? OR apellidos LIKE ? OR dni LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm]);
    }
    
    if ($activo !== null) {
        $sql .= " AND activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    $sql .= " ORDER BY apellidos, nombres";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $empleado = db()->queryOne("SELECT * FROM Empleado WHERE id_empleado = ?", [$id]);
    
    if (!$empleado) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Empleado no encontrado']);
        return;
    }
    
    // Get labor contracts
    $contratos = db()->query(
        "SELECT * FROM ContratoLaboral WHERE id_empleado = ? ORDER BY fecha_inicio DESC",
        [$id]
    );
    
    $empleado['contratos_laborales'] = $contratos;
    
    echo json_encode([
        'success' => true,
        'data' => $empleado
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $dni = $data['dni'] ?? '';
    $nombres = $data['nombres'] ?? '';
    $apellidos = $data['apellidos'] ?? '';
    
    if (empty($dni) || empty($nombres) || empty($apellidos)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'DNI, nombres y apellidos son requeridos']);
        return;
    }
    
    // Check DNI uniqueness
    $existing = db()->queryOne("SELECT id_empleado FROM Empleado WHERE dni = ?", [$dni]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Ya existe un empleado con ese DNI']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Empleado (dni, nombres, apellidos, telefono, email, direccion, fecha_nacimiento, licencia_conducir, categoria_licencia, fecha_venc_licencia) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $dni,
            $nombres,
            $apellidos,
            $data['telefono'] ?? null,
            $data['email'] ?? null,
            $data['direccion'] ?? null,
            $data['fecha_nacimiento'] ?? null,
            $data['licencia_conducir'] ?? null,
            $data['categoria_licencia'] ?? null,
            $data['fecha_venc_licencia'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Empleado', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode(['dni' => $dni, 'nombres' => $nombres, 'apellidos' => $apellidos])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Empleado creado exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Empleado WHERE id_empleado = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Empleado no encontrado']);
        return;
    }
    
    $dni = $data['dni'] ?? $existing['dni'];
    
    // Check DNI uniqueness for other employees
    $dniCheck = db()->queryOne(
        "SELECT id_empleado FROM Empleado WHERE dni = ? AND id_empleado != ?",
        [$dni, $id]
    );
    if ($dniCheck) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Ya existe otro empleado con ese DNI']);
        return;
    }
    
    db()->execute(
        "UPDATE Empleado SET 
            dni = ?,
            nombres = COALESCE(?, nombres),
            apellidos = COALESCE(?, apellidos),
            telefono = ?,
            email = ?,
            direccion = ?,
            fecha_nacimiento = ?,
            licencia_conducir = ?,
            categoria_licencia = ?,
            fecha_venc_licencia = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_empleado = ?",
        [
            $dni,
            $data['nombres'] ?? null,
            $data['apellidos'] ?? null,
            $data['telefono'] ?? $existing['telefono'],
            $data['email'] ?? $existing['email'],
            $data['direccion'] ?? $existing['direccion'],
            $data['fecha_nacimiento'] ?? $existing['fecha_nacimiento'],
            $data['licencia_conducir'] ?? $existing['licencia_conducir'],
            $data['categoria_licencia'] ?? $existing['categoria_licencia'],
            $data['fecha_venc_licencia'] ?? $existing['fecha_venc_licencia'],
            isset($data['activo']) ? $data['activo'] : null,
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Empleado', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Empleado actualizado exitosamente'
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
        "UPDATE Empleado SET activo = 0, fecha_modificacion = NOW() WHERE id_empleado = ?",
        [$id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Empleado', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Empleado eliminado exitosamente'
    ]);
}
