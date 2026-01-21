<?php
/**
 * IO Group - Facturas API (Simplificada)
 * Solo: id_factura, id_servicio, numero_factura, doc_escaneado
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
    
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(500, max(10, intval($_GET['limit'] ?? 100)));
    $offset = ($page - 1) * $limit;
    
    $sql = "SELECT f.id_factura, f.id_servicio, f.numero_factura, f.doc_escaneado, f.fecha_creacion,
            s.mes_servicio, s.fecha_programada as fecha_servicio,
            se.nombre_comercial as sede_nombre, se.tarifa_servicio
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
    
    $sql .= " ORDER BY f.fecha_creacion DESC LIMIT ? OFFSET ?";
    $params[] = $limit;
    $params[] = $offset;
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data
    ]);
}

function getOne($id) {
    canView();
    
    $factura = db()->queryOne(
        "SELECT f.*, s.mes_servicio, s.fecha_programada as fecha_servicio,
                se.nombre_comercial as sede_nombre, se.tarifa_servicio
         FROM Factura f
         INNER JOIN Servicio s ON f.id_servicio = s.id_servicio
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         WHERE f.id_factura = ?",
        [$id]
    );
    
    if (!$factura) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Factura no encontrada']);
        return;
    }
    
    echo json_encode(['success' => true, 'data' => $factura]);
}

function create() {
    $user = canEdit();
    
    // Handle file upload or JSON
    $contentType = $_SERVER['CONTENT_TYPE'] ?? '';
    
    if (strpos($contentType, 'multipart/form-data') !== false) {
        $id_servicio = $_POST['id_servicio'] ?? null;
        $numero_factura = $_POST['numero_factura'] ?? null;
    } else {
        $data = json_decode(file_get_contents('php://input'), true);
        $id_servicio = $data['id_servicio'] ?? null;
        $numero_factura = $data['numero_factura'] ?? null;
    }
    
    if (empty($id_servicio) || empty($numero_factura)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'id_servicio y numero_factura son requeridos']);
        return;
    }
    
    // Handle PDF upload
    $doc_escaneado = null;
    if (isset($_FILES['archivo_pdf']) && $_FILES['archivo_pdf']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = __DIR__ . '/../uploads/facturas/';
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }
        $fileName = time() . '_' . basename($_FILES['archivo_pdf']['name']);
        $filePath = $uploadDir . $fileName;
        
        if (move_uploaded_file($_FILES['archivo_pdf']['tmp_name'], $filePath)) {
            $doc_escaneado = '/uploads/facturas/' . $fileName;
        }
    }
    
    $id = db()->insert(
        "INSERT INTO Factura (id_servicio, numero_factura, doc_escaneado) VALUES (?, ?, ?)",
        [$id_servicio, $numero_factura, $doc_escaneado]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Factura', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode(['id_servicio' => $id_servicio, 'numero_factura' => $numero_factura])]
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
    
    $existing = db()->queryOne("SELECT * FROM Factura WHERE id_factura = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Factura no encontrada']);
        return;
    }
    
    // Handle file upload or JSON
    $contentType = $_SERVER['CONTENT_TYPE'] ?? '';
    
    if (strpos($contentType, 'multipart/form-data') !== false) {
        $numero_factura = $_POST['numero_factura'] ?? $existing['numero_factura'];
    } else {
        $data = json_decode(file_get_contents('php://input'), true);
        $numero_factura = $data['numero_factura'] ?? $existing['numero_factura'];
    }
    
    // Handle PDF upload
    $doc_escaneado = $existing['doc_escaneado'];
    if (isset($_FILES['archivo_pdf']) && $_FILES['archivo_pdf']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = __DIR__ . '/../uploads/facturas/';
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }
        $fileName = time() . '_' . basename($_FILES['archivo_pdf']['name']);
        $filePath = $uploadDir . $fileName;
        
        if (move_uploaded_file($_FILES['archivo_pdf']['tmp_name'], $filePath)) {
            $doc_escaneado = '/uploads/facturas/' . $fileName;
        }
    }
    
    db()->execute(
        "UPDATE Factura SET numero_factura = ?, doc_escaneado = ? WHERE id_factura = ?",
        [$numero_factura, $doc_escaneado, $id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Factura', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode(['numero_factura' => $numero_factura])]
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
    
    $existing = db()->queryOne("SELECT * FROM Factura WHERE id_factura = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Factura no encontrada']);
        return;
    }
    
    db()->execute("DELETE FROM Factura WHERE id_factura = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores) VALUES (?, 'Factura', ?, 'DELETE', ?)",
        [$user['id'], $id, json_encode($existing)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Factura eliminada exitosamente'
    ]);
}
