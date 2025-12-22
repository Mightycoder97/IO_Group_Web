<?php
/**
 * IO Group - Clientes API
 * CRUD operations for clients
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
    
    $sql = "SELECT c.*, 
            (SELECT COUNT(*) FROM Empresa e WHERE e.id_cliente = c.id_cliente) as total_empresas
            FROM Cliente c WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (c.nombre LIKE ? OR c.dni LIKE ? OR c.email LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm]);
    }
    
    if ($activo !== null) {
        $sql .= " AND c.activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    $sql .= " ORDER BY c.nombre";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $client = db()->queryOne("SELECT * FROM Cliente WHERE id_cliente = ?", [$id]);
    
    if (!$client) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Cliente no encontrado']);
        return;
    }
    
    $empresas = db()->query(
        "SELECT * FROM Empresa WHERE id_cliente = ? ORDER BY razon_social",
        [$id]
    );
    
    $client['empresas'] = $empresas;
    
    echo json_encode([
        'success' => true,
        'data' => $client
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $nombre = $data['nombre'] ?? '';
    $dni = $data['dni'] ?? null;
    $telefono = $data['telefono'] ?? null;
    $email = $data['email'] ?? null;
    $direccion = $data['direccion'] ?? null;
    $notas = $data['notas'] ?? null;
    
    if (empty($nombre)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'El nombre es requerido']);
        return;
    }
    
    // Check DNI uniqueness
    if ($dni) {
        $existing = db()->queryOne("SELECT id_cliente FROM Cliente WHERE dni = ?", [$dni]);
        if ($existing) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Ya existe un cliente con ese DNI']);
            return;
        }
    }
    
    $id = db()->insert(
        "INSERT INTO Cliente (nombre, dni, telefono, email, direccion, notas) VALUES (?, ?, ?, ?, ?, ?)",
        [$nombre, $dni, $telefono, $email, $direccion, $notas]
    );
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Cliente', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode(['nombre' => $nombre, 'dni' => $dni])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Cliente creado exitosamente',
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
    
    // Check if exists
    $existing = db()->queryOne("SELECT * FROM Cliente WHERE id_cliente = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Cliente no encontrado']);
        return;
    }
    
    $nombre = $data['nombre'] ?? $existing['nombre'];
    $dni = $data['dni'] ?? $existing['dni'];
    $telefono = $data['telefono'] ?? $existing['telefono'];
    $email = $data['email'] ?? $existing['email'];
    $direccion = $data['direccion'] ?? $existing['direccion'];
    $notas = $data['notas'] ?? $existing['notas'];
    $activo = isset($data['activo']) ? $data['activo'] : $existing['activo'];
    
    // Check DNI uniqueness for other clients
    if ($dni) {
        $dniCheck = db()->queryOne(
            "SELECT id_cliente FROM Cliente WHERE dni = ? AND id_cliente != ?",
            [$dni, $id]
        );
        if ($dniCheck) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Ya existe otro cliente con ese DNI']);
            return;
        }
    }
    
    db()->execute(
        "UPDATE Cliente SET nombre = ?, dni = ?, telefono = ?, email = ?, direccion = ?, notas = ?, activo = ?, fecha_modificacion = NOW() WHERE id_cliente = ?",
        [$nombre, $dni, $telefono, $email, $direccion, $notas, $activo, $id]
    );
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Cliente', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Cliente actualizado exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    // Check for active companies
    $empresas = db()->queryOne(
        "SELECT COUNT(*) as count FROM Empresa WHERE id_cliente = ? AND activo = 1",
        [$id]
    );
    
    if ($empresas['count'] > 0) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'No se puede eliminar: el cliente tiene empresas activas asociadas'
        ]);
        return;
    }
    
    // Soft delete
    db()->execute(
        "UPDATE Cliente SET activo = 0, fecha_modificacion = NOW() WHERE id_cliente = ?",
        [$id]
    );
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Cliente', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Cliente eliminado exitosamente'
    ]);
}
