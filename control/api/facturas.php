<?php
/**
 * IO Group - Facturas API
 * CRUD operations for invoices
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
    $estado = $_GET['estado'] ?? null;
    $fecha_desde = $_GET['fecha_desde'] ?? null;
    $fecha_hasta = $_GET['fecha_hasta'] ?? null;
    $sede = $_GET['sede'] ?? null;
    
    // Paginación
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(500, max(10, intval($_GET['limit'] ?? 100)));
    $offset = ($page - 1) * $limit;
    
    // Consulta optimizada - solo campos esenciales
    $sql = "SELECT f.id_factura, f.numero_factura, f.fecha_emision, f.monto_total, 
            f.estado, f.metodo_pago, f.id_servicio,
            s.codigo_servicio, se.nombre_comercial as sede_nombre, s.id_sede
            FROM Factura f
            INNER JOIN Servicio s ON f.id_servicio = s.id_servicio
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            WHERE 1=1";
    $params = [];
    
    if ($servicio) {
        $sql .= " AND f.id_servicio = ?";
        $params[] = $servicio;
    }
    
    if ($sede) {
        $sql .= " AND s.id_sede = ?";
        $params[] = $sede;
    }
    
    if ($estado) {
        $sql .= " AND f.estado = ?";
        $params[] = $estado;
    }
    
    if ($fecha_desde) {
        $sql .= " AND f.fecha_emision >= ?";
        $params[] = $fecha_desde;
    }
    
    if ($fecha_hasta) {
        $sql .= " AND f.fecha_emision <= ?";
        $params[] = $fecha_hasta;
    }
    
    // Count total
    $countSql = preg_replace('/SELECT .* FROM/', 'SELECT COUNT(*) as total FROM', $sql, 1);
    $totalResult = db()->queryOne($countSql, $params);
    $total = $totalResult['total'] ?? 0;
    
    $sql .= " ORDER BY f.fecha_emision DESC LIMIT ? OFFSET ?";
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
    
    $factura = db()->queryOne(
        "SELECT f.*, s.codigo_servicio, se.nombre_comercial as sede_nombre, e.razon_social as empresa_razon_social
         FROM Factura f 
         INNER JOIN Servicio s ON f.id_servicio = s.id_servicio 
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         WHERE f.id_factura = ?",
        [$id]
    );
    
    if (!$factura) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Factura no encontrada']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $factura
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_servicio = $data['id_servicio'] ?? null;
    $numero_factura = $data['numero_factura'] ?? '';
    $fecha_emision = $data['fecha_emision'] ?? null;
    $monto_total = $data['monto_total'] ?? null;
    
    if (empty($id_servicio) || empty($numero_factura) || empty($fecha_emision) || empty($monto_total)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Servicio, número de factura, fecha de emisión y monto total son requeridos']);
        return;
    }
    
    // Check if service already has invoice
    $existing = db()->queryOne("SELECT id_factura FROM Factura WHERE id_servicio = ?", [$id_servicio]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'El servicio ya tiene una factura']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Factura (id_servicio, serie, numero_factura, fecha_emision, monto_subtotal, igv, monto_total, estado, fecha_vencimiento, metodo_pago, observaciones) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $id_servicio,
            $data['serie'] ?? null,
            $numero_factura,
            $fecha_emision,
            $data['monto_subtotal'] ?? null,
            $data['igv'] ?? null,
            $monto_total,
            $data['estado'] ?? 'emitida',
            $data['fecha_vencimiento'] ?? null,
            $data['metodo_pago'] ?? null,
            $data['observaciones'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Factura', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Factura creada exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Factura WHERE id_factura = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Factura no encontrada']);
        return;
    }
    
    db()->execute(
        "UPDATE Factura SET 
            serie = ?,
            numero_factura = COALESCE(?, numero_factura),
            fecha_emision = COALESCE(?, fecha_emision),
            monto_subtotal = ?,
            igv = ?,
            monto_total = COALESCE(?, monto_total),
            estado = ?,
            fecha_vencimiento = ?,
            fecha_pago = ?,
            metodo_pago = ?,
            observaciones = ?,
            fecha_modificacion = NOW()
         WHERE id_factura = ?",
        [
            $data['serie'] ?? $existing['serie'],
            $data['numero_factura'] ?? null,
            $data['fecha_emision'] ?? null,
            $data['monto_subtotal'] ?? $existing['monto_subtotal'],
            $data['igv'] ?? $existing['igv'],
            $data['monto_total'] ?? null,
            $data['estado'] ?? $existing['estado'],
            $data['fecha_vencimiento'] ?? $existing['fecha_vencimiento'],
            $data['fecha_pago'] ?? $existing['fecha_pago'],
            $data['metodo_pago'] ?? $existing['metodo_pago'],
            $data['observaciones'] ?? $existing['observaciones'],
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Factura', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Factura actualizada exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    db()->execute("DELETE FROM Factura WHERE id_factura = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Factura', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Factura eliminada exitosamente'
    ]);
}
