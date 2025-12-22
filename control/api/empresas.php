<?php
/**
 * IO Group - Empresas API
 * CRUD operations for companies
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
    $cliente = $_GET['cliente'] ?? null;
    $activo = $_GET['activo'] ?? null;
    
    $sql = "SELECT e.*, c.nombre as cliente_nombre,
            (SELECT COUNT(*) FROM Sede s WHERE s.id_empresa = e.id_empresa) as total_sedes
            FROM Empresa e
            INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
            WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (e.razon_social LIKE ? OR e.ruc LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm]);
    }
    
    if ($cliente) {
        $sql .= " AND e.id_cliente = ?";
        $params[] = $cliente;
    }
    
    if ($activo !== null) {
        $sql .= " AND e.activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    $sql .= " ORDER BY e.razon_social";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $empresa = db()->queryOne(
        "SELECT e.*, c.nombre as cliente_nombre 
         FROM Empresa e 
         INNER JOIN Cliente c ON e.id_cliente = c.id_cliente 
         WHERE e.id_empresa = ?",
        [$id]
    );
    
    if (!$empresa) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Empresa no encontrada']);
        return;
    }
    
    $sedes = db()->query(
        "SELECT * FROM Sede WHERE id_empresa = ? ORDER BY nombre_comercial",
        [$id]
    );
    
    $empresa['sedes'] = $sedes;
    
    echo json_encode([
        'success' => true,
        'data' => $empresa
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_cliente = $data['id_cliente'] ?? null;
    $razon_social = $data['razon_social'] ?? '';
    $ruc = $data['ruc'] ?? '';
    $direccion_fiscal = $data['direccion_fiscal'] ?? null;
    $distrito = $data['distrito'] ?? null;
    $provincia = $data['provincia'] ?? null;
    $departamento = $data['departamento'] ?? null;
    $telefono = $data['telefono'] ?? null;
    $email = $data['email'] ?? null;
    
    if (empty($id_cliente) || empty($razon_social) || empty($ruc)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Cliente, razón social y RUC son requeridos']);
        return;
    }
    
    // Check RUC uniqueness
    $existing = db()->queryOne("SELECT id_empresa FROM Empresa WHERE ruc = ?", [$ruc]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Ya existe una empresa con ese RUC']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Empresa (id_cliente, razon_social, ruc, direccion_fiscal, distrito, provincia, departamento, telefono, email) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [$id_cliente, $razon_social, $ruc, $direccion_fiscal, $distrito, $provincia, $departamento, $telefono, $email]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Empresa', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode(['razon_social' => $razon_social, 'ruc' => $ruc])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Empresa creada exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Empresa WHERE id_empresa = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Empresa no encontrada']);
        return;
    }
    
    $ruc = $data['ruc'] ?? $existing['ruc'];
    
    // Check RUC uniqueness for other companies
    if ($ruc) {
        $rucCheck = db()->queryOne(
            "SELECT id_empresa FROM Empresa WHERE ruc = ? AND id_empresa != ?",
            [$ruc, $id]
        );
        if ($rucCheck) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Ya existe otra empresa con ese RUC']);
            return;
        }
    }
    
    db()->execute(
        "UPDATE Empresa SET 
            id_cliente = COALESCE(?, id_cliente),
            razon_social = COALESCE(?, razon_social),
            ruc = ?,
            direccion_fiscal = ?,
            distrito = ?,
            provincia = ?,
            departamento = ?,
            telefono = ?,
            email = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_empresa = ?",
        [
            $data['id_cliente'] ?? null,
            $data['razon_social'] ?? null,
            $ruc,
            $data['direccion_fiscal'] ?? $existing['direccion_fiscal'],
            $data['distrito'] ?? $existing['distrito'],
            $data['provincia'] ?? $existing['provincia'],
            $data['departamento'] ?? $existing['departamento'],
            $data['telefono'] ?? $existing['telefono'],
            $data['email'] ?? $existing['email'],
            isset($data['activo']) ? $data['activo'] : null,
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Empresa', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Empresa actualizada exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    // Check for active sedes
    $sedes = db()->queryOne(
        "SELECT COUNT(*) as count FROM Sede WHERE id_empresa = ? AND activo = 1",
        [$id]
    );
    
    if ($sedes['count'] > 0) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'No se puede eliminar: la empresa tiene sedes activas asociadas'
        ]);
        return;
    }
    
    db()->execute(
        "UPDATE Empresa SET activo = 0, fecha_modificacion = NOW() WHERE id_empresa = ?",
        [$id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Empresa', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Empresa eliminada exitosamente'
    ]);
}
