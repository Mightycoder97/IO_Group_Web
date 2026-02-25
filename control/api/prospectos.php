<?php
/**
 * IO Group - Prospectos API
 * CRM para gestión de leads/prospectos
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

// Enable CORS for public form
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

$method = $_SERVER['REQUEST_METHOD'];
$id = $_GET['id'] ?? null;
$action = $_GET['action'] ?? null;

switch ($method) {
    case 'GET':
        if ($action === 'stats') {
            getStats();
        } else {
            $id ? getOne($id) : getAll();
        }
        break;
    case 'POST':
        create();
        break;
    case 'PUT':
        if ($action === 'estado') {
            updateEstado($id);
        } else {
            update($id);
        }
        break;
    case 'DELETE':
        delete($id);
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

/**
 * Helper function to check if current user is the owner of a prospecto
 */
function isOwner($prospecto, $user) {
    if (!$prospecto || !$user) return false;
    $vendedor = $prospecto['vendedor'] ?? '';
    $userName = $user['nombre_completo'] ?? $user['nombre'] ?? $user['username'] ?? '';
    return strtolower(trim($vendedor)) === strtolower(trim($userName));
}

/**
 * Get all prospectos with filters
 * Hides phone number for non-owners
 */
function getAll() {
    $user = canView();
    $userName = $user['nombre_completo'] ?? $user['nombre'] ?? $user['username'] ?? '';
    
    $search = $_GET['search'] ?? '';
    $estado = $_GET['estado'] ?? null;
    $vendedor = $_GET['vendedor'] ?? null;
    $tipo = $_GET['tipo'] ?? null;
    
    $sql = "SELECT * FROM Prospecto WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (nombre_contacto LIKE ? OR razon_social LIKE ? OR telefono LIKE ? OR distrito LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm, $searchTerm]);
    }
    
    if ($estado) {
        $sql .= " AND estado = ?";
        $params[] = $estado;
    }
    
    if ($vendedor) {
        $sql .= " AND vendedor = ?";
        $params[] = $vendedor;
    }
    
    if ($tipo) {
        $sql .= " AND tipo_negocio = ?";
        $params[] = $tipo;
    }
    
    $sql .= " ORDER BY fecha_creacion DESC";
    
    $data = db()->query($sql, $params);
    
    // Add ownership flag
    foreach ($data as &$prospecto) {
        $prospecto['es_propietario'] = isOwner($prospecto, $user);
    }
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

/**
 * Get single prospecto
 * Adds ownership flag for edit restrictions
 */
function getOne($id) {
    $user = canView();
    
    $prospecto = db()->queryOne("SELECT * FROM Prospecto WHERE id_prospecto = ?", [$id]);
    
    if (!$prospecto) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Prospecto no encontrado']);
        return;
    }
    
    $prospecto['es_propietario'] = isOwner($prospecto, $user);
    
    echo json_encode([
        'success' => true,
        'data' => $prospecto
    ]);
}

/**
 * Get statistics for dashboard
 */
function getStats() {
    canView();
    
    $stats = [];
    
    // Counts by estado
    $estados = db()->query("SELECT estado, COUNT(*) as count FROM Prospecto GROUP BY estado");
    $stats['por_estado'] = array_column($estados, 'count', 'estado');
    
    // Counts by vendedor
    $vendedores = db()->query("SELECT vendedor, COUNT(*) as count FROM Prospecto GROUP BY vendedor");
    $stats['por_vendedor'] = array_column($vendedores, 'count', 'vendedor');
    
    // This month stats
    $mesActual = db()->queryOne(
        "SELECT COUNT(*) as total, 
                SUM(CASE WHEN estado = 'ganado' THEN 1 ELSE 0 END) as ganados
         FROM Prospecto 
         WHERE MONTH(fecha_creacion) = MONTH(CURRENT_DATE) AND YEAR(fecha_creacion) = YEAR(CURRENT_DATE)"
    );
    $stats['mes_actual'] = $mesActual;
    
    // Conversion rate
    $total = db()->queryOne("SELECT COUNT(*) as total FROM Prospecto");
    $ganados = db()->queryOne("SELECT COUNT(*) as total FROM Prospecto WHERE estado = 'ganado'");
    $stats['total'] = $total['total'];
    $stats['ganados'] = $ganados['total'];
    $stats['tasa_conversion'] = $total['total'] > 0 ? round(($ganados['total'] / $total['total']) * 100, 1) : 0;
    
    echo json_encode([
        'success' => true,
        'data' => $stats
    ]);
}

/**
 * Create new prospecto (public access - no auth required)
 */
function create() {
    // Rate limiting for public endpoint: max 3 per minute per IP (SEC-12)
    $ip = $_SERVER['REMOTE_ADDR'] ?? 'unknown';
    $rateLimitFile = sys_get_temp_dir() . '/iogroup_prospecto_' . md5($ip) . '.json';
    $now = time();
    $attempts = [];
    if (@file_exists($rateLimitFile)) {
        $attempts = @json_decode(@file_get_contents($rateLimitFile), true) ?: [];
        $attempts = array_filter($attempts, fn($t) => $t > $now - 60);
    }
    if (count($attempts) >= 3) {
        http_response_code(429);
        echo json_encode(['success' => false, 'message' => 'Demasiadas solicitudes. Intente nuevamente en 1 minuto.']);
        return;
    }
    $attempts[] = $now;
    @file_put_contents($rateLimitFile, json_encode(array_values($attempts)));

    $data = json_decode(file_get_contents('php://input'), true);
    
    // Validate required fields
    $nombre = !empty($data['nombre']) ? $data['nombre'] : (!empty($data['nombre_contacto']) ? $data['nombre_contacto'] : '');
    $telefono = !empty($data['telefono']) ? $data['telefono'] : '';
    $vendedor = !empty($data['vendedor']) ? $data['vendedor'] : '';
    
    if (empty($nombre) || empty($telefono) || empty($vendedor)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Nombre, teléfono y vendedor son requeridos']);
        return;
    }
    
    // Map fields from public form - correctly handle empty strings as NULL
    $razonSocial = !empty($data['razonSocial']) ? $data['razonSocial'] : (!empty($data['razon_social']) ? $data['razon_social'] : null);
    $ruc = !empty($data['ruc']) ? $data['ruc'] : null;
    $email = !empty($data['email']) ? $data['email'] : null;
    $direccion = !empty($data['direccion']) ? $data['direccion'] : null;
    $distrito = !empty($data['distrito']) ? $data['distrito'] : null;
    $latitud = ($data['latitud'] !== '' && $data['latitud'] !== null) ? $data['latitud'] : null;
    $longitud = ($data['longitud'] !== '' && $data['longitud'] !== null) ? $data['longitud'] : null;
    $tipoNegocio = !empty($data['tipoNegocio']) ? $data['tipoNegocio'] : (!empty($data['tipo_negocio']) ? $data['tipo_negocio'] : 'Otro');
    $observaciones = $data['observaciones'] ?? null;
    
    $id = db()->insert(
        "INSERT INTO Prospecto (nombre_contacto, razon_social, ruc, telefono, email, direccion, distrito, 
                                latitud, longitud, tipo_negocio, observaciones, vendedor, estado) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'nuevo')",
        [$nombre, $razonSocial, $ruc, $telefono, $email, $direccion, $distrito, 
         $latitud, $longitud, $tipoNegocio, $observaciones, $vendedor]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Prospecto registrado exitosamente',
        'id' => $id
    ]);
}

/**
 * Update prospecto (requires auth and ownership)
 */
function update($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Check if exists
    $existing = db()->queryOne("SELECT * FROM Prospecto WHERE id_prospecto = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Prospecto no encontrado']);
        return;
    }
    
    // Check ownership - only owner can edit
    if (!isOwner($existing, $user)) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'No tiene permisos para editar este prospecto']);
        return;
    }
    
    // Update fields
    $nombre = $data['nombre_contacto'] ?? $existing['nombre_contacto'];
    $razonSocial = $data['razon_social'] ?? $existing['razon_social'];
    $ruc = $data['ruc'] ?? $existing['ruc'];
    $telefono = $data['telefono'] ?? $existing['telefono'];
    $email = $data['email'] ?? $existing['email'];
    $direccion = $data['direccion'] ?? $existing['direccion'];
    $distrito = $data['distrito'] ?? $existing['distrito'];
    $latitud = $data['latitud'] ?? $existing['latitud'];
    $longitud = $data['longitud'] ?? $existing['longitud'];
    $tipoNegocio = $data['tipo_negocio'] ?? $existing['tipo_negocio'];
    $observaciones = $data['observaciones'] ?? $existing['observaciones'];
    $vendedor = $data['vendedor'] ?? $existing['vendedor'];
    $estado = $data['estado'] ?? $existing['estado'];
    $fechaSiguiente = $data['fecha_siguiente_contacto'] ?? $existing['fecha_siguiente_contacto'];
    $notasSeguimiento = $data['notas_seguimiento'] ?? $existing['notas_seguimiento'];
    
    db()->execute(
        "UPDATE Prospecto SET 
            nombre_contacto = ?, razon_social = ?, ruc = ?, telefono = ?, email = ?,
            direccion = ?, distrito = ?, latitud = ?, longitud = ?, tipo_negocio = ?,
            observaciones = ?, vendedor = ?, estado = ?, fecha_siguiente_contacto = ?, 
            notas_seguimiento = ?, fecha_modificacion = NOW()
         WHERE id_prospecto = ?",
        [$nombre, $razonSocial, $ruc, $telefono, $email, $direccion, $distrito,
         $latitud, $longitud, $tipoNegocio, $observaciones, $vendedor, $estado,
         $fechaSiguiente, $notasSeguimiento, $id]
    );
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) 
         VALUES (?, 'Prospecto', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Prospecto actualizado exitosamente'
    ]);
}

/**
 * Update only estado (requires ownership)
 */
function updateEstado($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $data = json_decode(file_get_contents('php://input'), true);
    $estado = $data['estado'] ?? null;
    
    if (!$estado) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Estado requerido']);
        return;
    }
    
    $validEstados = ['nuevo', 'contactado', 'interesado', 'negociando', 'ganado', 'perdido'];
    if (!in_array($estado, $validEstados)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Estado inválido']);
        return;
    }
    
    $existing = db()->queryOne("SELECT * FROM Prospecto WHERE id_prospecto = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Prospecto no encontrado']);
        return;
    }
    
    // Check ownership - only owner can update estado
    if (!isOwner($existing, $user)) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'No tiene permisos para modificar este prospecto']);
        return;
    }
    
    db()->execute(
        "UPDATE Prospecto SET estado = ?, fecha_modificacion = NOW() WHERE id_prospecto = ?",
        [$estado, $id]
    );
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) 
         VALUES (?, 'Prospecto', ?, 'UPDATE', ?)",
        [$user['id'], $id, json_encode(['estado' => $estado, 'estado_anterior' => $existing['estado']])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Estado actualizado a: ' . $estado
    ]);
}

/**
 * Delete prospecto (requires ownership)
 */
function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $existing = db()->queryOne("SELECT * FROM Prospecto WHERE id_prospecto = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Prospecto no encontrado']);
        return;
    }
    
    // Check ownership - only owner can delete
    if (!isOwner($existing, $user)) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'No tiene permisos para eliminar este prospecto']);
        return;
    }
    
    db()->execute("DELETE FROM Prospecto WHERE id_prospecto = ?", [$id]);
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores) 
         VALUES (?, 'Prospecto', ?, 'DELETE', ?)",
        [$user['id'], $id, json_encode($existing)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Prospecto eliminado exitosamente'
    ]);
}
