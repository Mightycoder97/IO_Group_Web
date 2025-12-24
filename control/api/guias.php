<?php
/**
 * IO Group - Guias API
 * CRUD operations for transport guides
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
    $sede = $_GET['sede'] ?? null;
    $search = $_GET['search'] ?? '';
    
    // Paginación
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(200, max(10, intval($_GET['limit'] ?? 50)));
    $offset = ($page - 1) * $limit;
    
    // Consulta optimizada - solo campos necesarios
    $sql = "SELECT g.id_guia, g.serie, g.numero_guia, g.fecha_emision,
            g.punto_partida, g.punto_llegada,
            s.codigo_servicio, s.id_servicio,
            se.nombre_comercial as sede_nombre, se.id_sede
            FROM Guia g
            INNER JOIN Servicio s ON g.id_servicio = s.id_servicio
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            WHERE 1=1";
    $params = [];
    
    if ($servicio) {
        $sql .= " AND g.id_servicio = ?";
        $params[] = $servicio;
    }
    
    if ($sede) {
        $sql .= " AND se.id_sede = ?";
        $params[] = $sede;
    }
    
    if ($search) {
        $sql .= " AND (g.numero_guia LIKE ? OR g.serie LIKE ? OR se.nombre_comercial LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm]);
    }
    
    // Count total
    $countSql = preg_replace('/SELECT .* FROM/', 'SELECT COUNT(*) as total FROM', $sql, 1);
    $totalResult = db()->queryOne($countSql, $params);
    $total = $totalResult['total'] ?? 0;
    
    $sql .= " ORDER BY g.fecha_emision DESC LIMIT ? OFFSET ?";
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
    
    $guia = db()->queryOne(
        "SELECT g.*, s.codigo_servicio, se.nombre_comercial as sede_nombre
         FROM Guia g 
         INNER JOIN Servicio s ON g.id_servicio = s.id_servicio 
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         WHERE g.id_guia = ?",
        [$id]
    );
    
    if (!$guia) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Guía no encontrada']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $guia
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_servicio = $data['id_servicio'] ?? null;
    $numero_guia = $data['numero_guia'] ?? '';
    $fecha_emision = $data['fecha_emision'] ?? null;
    
    if (empty($id_servicio) || empty($numero_guia) || empty($fecha_emision)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Servicio, número de guía y fecha de emisión son requeridos']);
        return;
    }
    
    // Check if service already has guide
    $existing = db()->queryOne("SELECT id_guia FROM Guia WHERE id_servicio = ?", [$id_servicio]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'El servicio ya tiene una guía']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Guia (id_servicio, serie, numero_guia, fecha_emision, punto_partida, punto_llegada, observaciones) 
         VALUES (?, ?, ?, ?, ?, ?, ?)",
        [
            $id_servicio,
            $data['serie'] ?? null,
            $numero_guia,
            $fecha_emision,
            $data['punto_partida'] ?? null,
            $data['punto_llegada'] ?? null,
            $data['observaciones'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Guia', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Guía creada exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Guia WHERE id_guia = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Guía no encontrada']);
        return;
    }
    
    db()->execute(
        "UPDATE Guia SET 
            serie = ?,
            numero_guia = COALESCE(?, numero_guia),
            fecha_emision = COALESCE(?, fecha_emision),
            punto_partida = ?,
            punto_llegada = ?,
            observaciones = ?,
            fecha_modificacion = NOW()
         WHERE id_guia = ?",
        [
            $data['serie'] ?? $existing['serie'],
            $data['numero_guia'] ?? null,
            $data['fecha_emision'] ?? null,
            $data['punto_partida'] ?? $existing['punto_partida'],
            $data['punto_llegada'] ?? $existing['punto_llegada'],
            $data['observaciones'] ?? $existing['observaciones'],
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Guia', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Guía actualizada exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    db()->execute("DELETE FROM Guia WHERE id_guia = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Guia', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Guía eliminada exitosamente'
    ]);
}
