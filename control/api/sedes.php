<?php
/**
 * IO Group - Sedes API
 * CRUD operations for locations/branches
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
    $empresa = $_GET['empresa'] ?? null;
    $activo = $_GET['activo'] ?? null;
    $mapa = $_GET['mapa'] ?? null;
    
    // Paginación
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(500, max(10, intval($_GET['limit'] ?? 100)));
    $offset = ($page - 1) * $limit;
    
    // Si es para el mapa, devolvemos solo campos esenciales
    if ($mapa) {
        $sql = "SELECT s.id_sede, s.nombre_comercial, s.direccion, s.distrito, s.provincia,
                s.coordenadas_gps, e.razon_social as empresa_razon_social
                FROM Sede s
                INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
                WHERE s.coordenadas_gps IS NOT NULL AND s.coordenadas_gps != '' AND s.activo = 1
                ORDER BY s.nombre_comercial";
        $data = db()->query($sql);
        
        echo json_encode([
            'success' => true,
            'data' => $data,
            'total' => count($data)
        ]);
        return;
    }
    
    // Consulta optimizada - solo campos necesarios
    $sql = "SELECT s.id_sede, s.nombre_comercial, s.direccion, s.distrito, s.activo,
            s.contacto_telefono, s.coordenadas_gps,
            e.razon_social as empresa_razon_social, e.ruc as empresa_ruc
            FROM Sede s
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (s.nombre_comercial LIKE ? OR s.direccion LIKE ? OR e.razon_social LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm]);
    }
    
    if ($empresa) {
        $sql .= " AND s.id_empresa = ?";
        $params[] = $empresa;
    }
    
    if ($activo !== null) {
        $sql .= " AND s.activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    // Count total
    $countSql = preg_replace('/SELECT .* FROM/', 'SELECT COUNT(*) as total FROM', $sql, 1);
    $totalResult = db()->queryOne($countSql, $params);
    $total = $totalResult['total'] ?? 0;
    
    $sql .= " ORDER BY s.nombre_comercial LIMIT ? OFFSET ?";
    $params[] = $limit;
    $params[] = $offset;
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => $total,
        'page' => $page,
        'limit' => $limit,
        'pages' => ceil($total / $limit)
    ]);
}

function getOne($id) {
    canView();
    
    $sede = db()->queryOne(
        "SELECT s.*, e.razon_social as empresa_razon_social, e.ruc as empresa_ruc
         FROM Sede s 
         INNER JOIN Empresa e ON s.id_empresa = e.id_empresa 
         WHERE s.id_sede = ?",
        [$id]
    );
    
    if (!$sede) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Sede no encontrada']);
        return;
    }
    
    // Get contracts
    $contratos = db()->query(
        "SELECT * FROM ContratoServicio WHERE id_sede = ? ORDER BY fecha_inicio DESC",
        [$id]
    );
    
    $sede['contratos'] = $contratos;
    
    echo json_encode([
        'success' => true,
        'data' => $sede
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_empresa = $data['id_empresa'] ?? null;
    $nombre_comercial = $data['nombre_comercial'] ?? '';
    $direccion = $data['direccion'] ?? '';
    
    if (empty($id_empresa) || empty($nombre_comercial) || empty($direccion)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Empresa, nombre comercial y dirección son requeridos']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, referencia, coordenadas_gps, contacto_nombre, contacto_telefono, contacto_email) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $id_empresa,
            $nombre_comercial,
            $direccion,
            $data['distrito'] ?? null,
            $data['provincia'] ?? null,
            $data['departamento'] ?? null,
            $data['referencia'] ?? null,
            $data['coordenadas_gps'] ?? null,
            $data['contacto_nombre'] ?? null,
            $data['contacto_telefono'] ?? null,
            $data['contacto_email'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Sede', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode(['nombre_comercial' => $nombre_comercial])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Sede creada exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Sede WHERE id_sede = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Sede no encontrada']);
        return;
    }
    
    db()->execute(
        "UPDATE Sede SET 
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
            contacto_email = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_sede = ?",
        [
            $data['id_empresa'] ?? null,
            $data['nombre_comercial'] ?? null,
            $data['direccion'] ?? null,
            $data['distrito'] ?? $existing['distrito'],
            $data['provincia'] ?? $existing['provincia'],
            $data['departamento'] ?? $existing['departamento'],
            $data['referencia'] ?? $existing['referencia'],
            $data['coordenadas_gps'] ?? $existing['coordenadas_gps'],
            $data['contacto_nombre'] ?? $existing['contacto_nombre'],
            $data['contacto_telefono'] ?? $existing['contacto_telefono'],
            $data['contacto_email'] ?? $existing['contacto_email'],
            isset($data['activo']) ? $data['activo'] : null,
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Sede', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Sede actualizada exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    // Check for active contracts
    $contratos = db()->queryOne(
        "SELECT COUNT(*) as count FROM ContratoServicio WHERE id_sede = ? AND activo = 1",
        [$id]
    );
    
    if ($contratos['count'] > 0) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'No se puede eliminar: la sede tiene contratos activos asociados'
        ]);
        return;
    }
    
    db()->execute(
        "UPDATE Sede SET activo = 0, fecha_modificacion = NOW() WHERE id_sede = ?",
        [$id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Sede', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Sede eliminada exitosamente'
    ]);
}
