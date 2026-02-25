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

try {
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
} catch (\Throwable $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Internal DB Error: ' . $e->getMessage()
    ]);
    exit;
}

/**
 * Maps the database row to the structure the frontend expects.
 */
function mapProspectoToFrontend($row) {
    if (!$row) return null;
    
    $notas = json_decode($row['notas'], true) ?: [];
    
    return [
        'id_prospecto' => $row['id_prospecto'],
        'nombre_contacto' => $notas['nombre_contacto'] ?? $row['nombre_comercial'],
        'razon_social' => ($row['tipo_cliente'] === 'empresa') ? $row['nombre_comercial'] : '',
        'ruc' => $row['ruc'],
        'telefono' => $row['telefono'],
        'email' => $row['email'],
        'direccion' => $row['direccion'],
        'distrito' => $row['distrito'],
        'latitud' => $notas['latitud'] ?? null,
        'longitud' => $notas['longitud'] ?? null,
        'tipo_negocio' => $notas['tipo_negocio'] ?? 'Otro',
        'observaciones' => $notas['observaciones'] ?? '',
        'vendedor' => $row['vendedor_nombre'] ?? $notas['vendedor'] ?? '',
        'id_usuario_asignado' => $row['id_usuario_asignado'] ?? null,
        'estado' => $row['estado'] === 'negociacion' ? 'negociando' : $row['estado'],
        'fecha_siguiente_contacto' => $row['fecha_proximo_contacto'],
        'notas_seguimiento' => $notas['notas_seguimiento'] ?? '',
        'fecha_creacion' => $row['fecha_creacion'],
        'fecha_modificacion' => $row['fecha_modificacion']
    ];
}

/**
 * Helper function to check if current user is the owner of a prospecto
 */
function isOwner($prospecto, $user) {
    if (!$prospecto || !$user) return false;
    
    // Check by ID if available
    $ownerId = $prospecto['id_usuario_asignado'] ?? null;
    $userId = $user['id_usuario'] ?? $user['id'] ?? null;
    if ($ownerId && $userId && $ownerId == $userId) {
        return true;
    }
    
    // Fallback to name check
    $vendedor = $prospecto['vendedor'] ?? $prospecto['vendedor_nombre'] ?? '';
    // Unpack from JSON notas if available
    if (!$vendedor && isset($prospecto['notas'])) {
        $n = json_decode($prospecto['notas'], true);
        $vendedor = $n['vendedor'] ?? '';
    }
    $userName = $user['nombre_completo'] ?? $user['nombre'] ?? $user['username'] ?? '';
    if ($vendedor && $userName) {
        return strtolower(trim($vendedor)) === strtolower(trim($userName));
    }
    
    return false;
}

/**
 * Get all prospectos with filters
 */
function getAll() {
    $user = canView();
    
    $search = $_GET['search'] ?? '';
    $estado = $_GET['estado'] ?? null;
    $vendedor = $_GET['vendedor'] ?? null;
    $tipo = $_GET['tipo'] ?? null;
    
    $sql = "SELECT p.*, COALESCE(u.nombre_completo, u.username) AS vendedor_nombre 
            FROM Prospecto p
            LEFT JOIN Usuario u ON p.id_usuario_asignado = u.id_usuario
            WHERE p.activo = 1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (p.nombre_comercial LIKE ? OR p.telefono LIKE ? OR p.distrito LIKE ? OR p.ruc LIKE ? OR p.notas LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm]);
    }
    
    if ($estado) {
        if ($estado === 'negociando') $estado = 'negociacion';
        $sql .= " AND p.estado = ?";
        $params[] = $estado;
    }
    
    if ($vendedor) {
        $sql .= " AND (u.nombre_completo = ? OR u.username = ? OR p.notas LIKE ?)";
        $params[] = $vendedor;
        $params[] = $vendedor;
        $params[] = "%\"vendedor\":\"$vendedor\"%";
    }
    
    if ($tipo) {
        $sql .= " AND p.notas LIKE ?";
        $params[] = "%\"tipo_negocio\":\"$tipo\"%";
    }
    
    $sql .= " ORDER BY p.fecha_creacion DESC";
    
    $data = db()->query($sql, $params);
    
    $mappedData = [];
    foreach ($data as $row) {
        $prospecto = mapProspectoToFrontend($row);
        $prospecto['es_propietario'] = isOwner($row, $user);
        $mappedData[] = $prospecto;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $mappedData,
        'total' => count($mappedData)
    ]);
}

/**
 * Get single prospecto
 */
function getOne($id) {
    $user = canView();
    
    $sql = "SELECT p.*, COALESCE(u.nombre_completo, u.username) AS vendedor_nombre 
            FROM Prospecto p
            LEFT JOIN Usuario u ON p.id_usuario_asignado = u.id_usuario
            WHERE p.id_prospecto = ? AND p.activo = 1";
    $prospecto = db()->queryOne($sql, [$id]);
    
    if (!$prospecto) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Prospecto no encontrado']);
        return;
    }
    
    $mapped = mapProspectoToFrontend($prospecto);
    $mapped['es_propietario'] = isOwner($prospecto, $user);
    
    echo json_encode([
        'success' => true,
        'data' => $mapped
    ]);
}

/**
 * Get statistics for dashboard
 */
function getStats() {
    canView();
    
    $stats = [];
    
    $estados = db()->query("SELECT estado, COUNT(*) as count FROM Prospecto WHERE activo = 1 GROUP BY estado");
    $stats['por_estado'] = [];
    foreach ($estados as $row) {
        $est = $row['estado'] === 'negociacion' ? 'negociando' : $row['estado'];
        if (!isset($stats['por_estado'][$est])) $stats['por_estado'][$est] = 0;
        $stats['por_estado'][$est] += $row['count'];
    }
    
    $vendedores = db()->query("SELECT COALESCE(u.nombre_completo, u.username, 'Sin asignar') as vendedor, COUNT(*) as count 
                               FROM Prospecto p 
                               LEFT JOIN Usuario u ON p.id_usuario_asignado = u.id_usuario 
                               WHERE p.activo = 1 
                               GROUP BY p.id_usuario_asignado, vendedor");
    $stats['por_vendedor'] = [];
    foreach ($vendedores as $row) {
         $v = $row['vendedor'];
         if (!isset($stats['por_vendedor'][$v])) $stats['por_vendedor'][$v] = 0;
         $stats['por_vendedor'][$v] += $row['count'];
    }
    
    $mesActual = db()->queryOne(
        "SELECT COUNT(*) as total, 
                SUM(CASE WHEN estado = 'ganado' THEN 1 ELSE 0 END) as ganados
         FROM Prospecto 
         WHERE activo = 1 AND MONTH(fecha_creacion) = MONTH(CURRENT_DATE) AND YEAR(fecha_creacion) = YEAR(CURRENT_DATE)"
    );
    $stats['mes_actual'] = $mesActual;
    
    $total = db()->queryOne("SELECT COUNT(*) as total FROM Prospecto WHERE activo = 1");
    $ganados = db()->queryOne("SELECT COUNT(*) as total FROM Prospecto WHERE estado = 'ganado' AND activo = 1");
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
    // Rate limiting for public endpoint: max 3 per minute per IP
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
    
    $razonSocial = !empty($data['razonSocial']) ? $data['razonSocial'] : (!empty($data['razon_social']) ? $data['razon_social'] : null);
    $ruc = !empty($data['ruc']) ? $data['ruc'] : null;
    $email = !empty($data['email']) ? $data['email'] : null;
    $direccion = !empty($data['direccion']) ? $data['direccion'] : null;
    $distrito = !empty($data['distrito']) ? $data['distrito'] : null;
    $latitud = ($data['latitud'] !== '' && $data['latitud'] !== null) ? $data['latitud'] : null;
    $longitud = ($data['longitud'] !== '' && $data['longitud'] !== null) ? $data['longitud'] : null;
    $tipoNegocio = !empty($data['tipoNegocio']) ? $data['tipoNegocio'] : (!empty($data['tipo_negocio']) ? $data['tipo_negocio'] : 'Otro');
    $observaciones = $data['observaciones'] ?? null;
    $notasSeguimiento = $data['notas_seguimiento'] ?? null;
    
    $estadoFrontend = $data['estado'] ?? 'nuevo';
    $estadoDb = $estadoFrontend === 'negociando' ? 'negociacion' : $estadoFrontend;
    if (!in_array($estadoDb, ['nuevo','contactado','interesado','propuesta','negociacion','ganado','perdido'])) {
        $estadoDb = 'nuevo';
    }

    $idUsuario = null;
    if ($vendedor) {
        $u = db()->queryOne("SELECT id_usuario FROM Usuario WHERE nombre_completo = ? OR username = ?", [$vendedor, $vendedor]);
        if ($u) $idUsuario = $u['id_usuario'];
    }

    $notasArr = [
        'nombre_contacto' => $nombre,
        'latitud' => $latitud,
        'longitud' => $longitud,
        'tipo_negocio' => $tipoNegocio,
        'observaciones' => $observaciones,
        'notas_seguimiento' => $notasSeguimiento,
        'vendedor' => $vendedor
    ];
    $notasJson = json_encode(array_filter($notasArr, fn($v) => $v !== null && $v !== ''));

    $tipoCliente = ($ruc || $razonSocial) ? 'empresa' : 'persona';
    $nombreComercial = $razonSocial ?: $nombre;

    $id = db()->insert(
        "INSERT INTO Prospecto (nombre_comercial, tipo_cliente, ruc, telefono, email, direccion, distrito, 
                                notas, id_usuario_asignado, estado, fecha_proximo_contacto) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [$nombreComercial, $tipoCliente, $ruc, $telefono, $email, $direccion, $distrito, 
         $notasJson, $idUsuario, $estadoDb, $data['fecha_siguiente_contacto'] ?? null]
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
    
    $sql = "SELECT p.*, COALESCE(u.nombre_completo, u.username) AS vendedor_nombre 
            FROM Prospecto p
            LEFT JOIN Usuario u ON p.id_usuario_asignado = u.id_usuario
            WHERE p.id_prospecto = ? AND p.activo = 1";
    $existing = db()->queryOne($sql, [$id]);
    
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Prospecto no encontrado']);
        return;
    }
    
    if (!isOwner($existing, $user)) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'No tiene permisos para editar este prospecto']);
        return;
    }
    
    $mapped = mapProspectoToFrontend($existing);
    
    $nombre = $data['nombre_contacto'] ?? $mapped['nombre_contacto'];
    $razonSocial = $data['razon_social'] ?? $data['razonSocial'] ?? $mapped['razon_social'];
    $ruc = $data['ruc'] ?? $mapped['ruc'];
    $telefono = $data['telefono'] ?? $mapped['telefono'];
    $email = $data['email'] ?? $mapped['email'];
    $direccion = $data['direccion'] ?? $mapped['direccion'];
    $distrito = $data['distrito'] ?? $mapped['distrito'];
    $latitud = $data['latitud'] ?? $mapped['latitud'];
    $longitud = $data['longitud'] ?? $mapped['longitud'];
    $tipoNegocio = $data['tipo_negocio'] ?? $data['tipoNegocio'] ?? $mapped['tipo_negocio'];
    $observaciones = $data['observaciones'] ?? $mapped['observaciones'];
    $vendedor = $data['vendedor'] ?? $mapped['vendedor'];
    $estado = $data['estado'] ?? $mapped['estado'];
    $fechaSiguiente = $data['fecha_siguiente_contacto'] ?? $mapped['fecha_siguiente_contacto'];
    $notasSeguimiento = $data['notas_seguimiento'] ?? $mapped['notas_seguimiento'];
    
    $estadoDb = $estado === 'negociando' ? 'negociacion' : $estado;

    $idUsuario = $existing['id_usuario_asignado'];
    if (isset($data['vendedor']) && $data['vendedor'] !== $mapped['vendedor']) {
        $u = db()->queryOne("SELECT id_usuario FROM Usuario WHERE nombre_completo = ? OR username = ?", [$vendedor, $vendedor]);
        if ($u) $idUsuario = $u['id_usuario'];
    }

    $notasArr = [
        'nombre_contacto' => $nombre,
        'latitud' => $latitud,
        'longitud' => $longitud,
        'tipo_negocio' => $tipoNegocio,
        'observaciones' => $observaciones,
        'notas_seguimiento' => $notasSeguimiento,
        'vendedor' => $vendedor
    ];
    $notasJson = json_encode(array_filter($notasArr, fn($v) => $v !== null && $v !== ''));

    $tipoCliente = ($ruc || $razonSocial) ? 'empresa' : 'persona';
    $nombreComercial = $razonSocial ?: $nombre;

    db()->execute(
        "UPDATE Prospecto SET 
            nombre_comercial = ?, tipo_cliente = ?, ruc = ?, telefono = ?, email = ?,
            direccion = ?, distrito = ?, notas = ?, id_usuario_asignado = ?, estado = ?, 
            fecha_proximo_contacto = ?
         WHERE id_prospecto = ?",
        [$nombreComercial, $tipoCliente, $ruc, $telefono, $email, $direccion, $distrito,
         $notasJson, $idUsuario, $estadoDb, $fechaSiguiente, $id]
    );
    
    // Audit log
    $adminId = $user['id'] ?? $user['id_usuario'] ?? null;
    if ($adminId) {
        db()->execute(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) 
             VALUES (?, 'Prospecto', ?, 'UPDATE', ?, ?)",
            [$adminId, $id, json_encode($mapped), json_encode($data)]
        );
    }
    
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
    
    $estadoDb = $estado === 'negociando' ? 'negociacion' : $estado;
    $validEstados = ['nuevo', 'contactado', 'interesado', 'negociacion', 'propuesta', 'ganado', 'perdido'];
    if (!in_array($estadoDb, $validEstados)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Estado inválido']);
        return;
    }
    
    $existing = db()->queryOne("SELECT * FROM Prospecto WHERE id_prospecto = ? AND activo = 1", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Prospecto no encontrado']);
        return;
    }
    
    if (!isOwner($existing, $user)) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'No tiene permisos para modificar este prospecto']);
        return;
    }
    
    db()->execute(
        "UPDATE Prospecto SET estado = ? WHERE id_prospecto = ?",
        [$estadoDb, $id]
    );
    
    // Audit log
    $adminId = $user['id'] ?? $user['id_usuario'] ?? null;
    if ($adminId) {
        db()->execute(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) 
             VALUES (?, 'Prospecto', ?, 'UPDATE', ?)",
            [$adminId, $id, json_encode(['estado' => $estadoDb, 'estado_anterior' => $existing['estado']])]
        );
    }
    
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
    
    $existing = db()->queryOne("SELECT * FROM Prospecto WHERE id_prospecto = ? AND activo = 1", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Prospecto no encontrado']);
        return;
    }
    
    if (!isOwner($existing, $user)) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'No tiene permisos para eliminar este prospecto']);
        return;
    }
    
    db()->execute("UPDATE Prospecto SET activo = 0 WHERE id_prospecto = ?", [$id]);
    
    // Audit log
    $adminId = $user['id'] ?? $user['id_usuario'] ?? null;
    if ($adminId) {
        db()->execute(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores) 
             VALUES (?, 'Prospecto', ?, 'DELETE', ?)",
            [$adminId, $id, json_encode($existing)]
        );
    }
    
    echo json_encode([
        'success' => true,
        'message' => 'Prospecto eliminado exitosamente'
    ]);
}
