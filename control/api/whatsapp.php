<?php
/**
 * IO Group - WhatsApp API interna
 * Gestión de conversaciones y mensajes desde el panel de control
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';
require_once __DIR__ . '/helpers/whatsapp_api.php';
require_once __DIR__ . '/helpers/message_distributor.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';
$id = $_GET['id'] ?? null;

try {
    switch ($method) {
        case 'GET':
            switch ($action) {
                case 'conversations': getConversations(); break;
                case 'conversation': getConversation($id); break;
                case 'messages': getMessages($id); break;
                case 'stats': getStats(); break;
                case 'templates': getTemplates(); break;
                case 'agents': getAgents(); break;
                default:
                    http_response_code(400);
                    echo json_encode(['success' => false, 'message' => 'Acción no válida']);
            }
            break;
        case 'POST':
            switch ($action) {
                case 'send': sendMessage(); break;
                case 'send-template': sendTemplate(); break;
                case 'agent': addAgent(); break;
                case 'conversation': createConversation(); break;
                default:
                    http_response_code(400);
                    echo json_encode(['success' => false, 'message' => 'Acción no válida']);
            }
            break;
        case 'PUT':
            switch ($action) {
                case 'assign': assignConversation($id); break;
                case 'close': closeConversation($id); break;
                case 'agent-limit': updateAgentLimit(); break;
                case 'agent-status': toggleAgentStatus(); break;
                default:
                    http_response_code(400);
                    echo json_encode(['success' => false, 'message' => 'Acción no válida']);
            }
            break;
        default:
            http_response_code(405);
            echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    }
} catch (\Throwable $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Error interno: ' . $e->getMessage()]);
}

/**
 * Listar conversaciones con filtros
 */
function getConversations()
{
    $user = canView();

    $estado = $_GET['estado'] ?? null;
    $search = $_GET['search'] ?? '';
    $asignado = $_GET['asignado'] ?? null;
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = 30;
    $offset = ($page - 1) * $limit;

    $sql = "SELECT wc.*, 
                   p.nombre_comercial AS prospecto_nombre, p.estado AS prospecto_estado,
                   COALESCE(u.nombre_completo, u.username) AS agente_nombre,
                   (SELECT contenido FROM WhatsAppMessage WHERE id_conversation = wc.id_conversation ORDER BY fecha_creacion DESC LIMIT 1) AS ultimo_mensaje,
                   (SELECT fecha_creacion FROM WhatsAppMessage WHERE id_conversation = wc.id_conversation ORDER BY fecha_creacion DESC LIMIT 1) AS ultimo_mensaje_fecha
            FROM WhatsAppConversation wc
            LEFT JOIN Prospecto p ON wc.id_prospecto = p.id_prospecto
            LEFT JOIN Usuario u ON wc.id_usuario_asignado = u.id_usuario
            WHERE 1=1";
    $params = [];

    if ($estado) {
        $sql .= " AND wc.estado = ?";
        $params[] = $estado;
    }

    if ($search) {
        $sql .= " AND (wc.wa_phone LIKE ? OR wc.wa_profile_name LIKE ? OR p.nombre_comercial LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm]);
    }

    if ($asignado === 'me') {
        $userId = $user['id'] ?? $user['id_usuario'];
        $sql .= " AND wc.id_usuario_asignado = ?";
        $params[] = $userId;
    } elseif ($asignado === 'unassigned') {
        $sql .= " AND wc.id_usuario_asignado IS NULL AND wc.estado != 'cerrada'";
    } elseif ($asignado === 'bot') {
        $sql .= " AND wc.estado = 'bot'";
    }

    $sql .= " ORDER BY wc.ultima_actividad DESC LIMIT $limit OFFSET $offset";

    $conversations = db()->query($sql, $params);

    // Contar total
    $countSql = str_replace(
        "SELECT wc.*",
        "SELECT COUNT(*) as total",
        explode("ORDER BY", $sql)[0]
    );
    // Simplificado: contar sin subqueries
    $totalResult = db()->queryOne(
        "SELECT COUNT(*) as total FROM WhatsAppConversation wc 
         LEFT JOIN Prospecto p ON wc.id_prospecto = p.id_prospecto
         WHERE 1=1" . ($estado ? " AND wc.estado = '$estado'" : ""),
        []
    );

    echo json_encode([
        'success' => true,
        'data' => $conversations,
        'total' => $totalResult['total'] ?? count($conversations),
        'page' => $page,
        'per_page' => $limit
    ]);
}

/**
 * Obtener una conversación con sus mensajes
 */
function getConversation($id)
{
    canView();

    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }

    $conversation = db()->queryOne(
        "SELECT wc.*, 
                p.nombre_comercial AS prospecto_nombre, p.estado AS prospecto_estado,
                p.tipo_cliente, p.email AS prospecto_email, p.distrito,
                p.notas AS prospecto_notas, p.id_prospecto,
                COALESCE(u.nombre_completo, u.username) AS agente_nombre
         FROM WhatsAppConversation wc
         LEFT JOIN Prospecto p ON wc.id_prospecto = p.id_prospecto
         LEFT JOIN Usuario u ON wc.id_usuario_asignado = u.id_usuario
         WHERE wc.id_conversation = ?",
        [$id]
    );

    if (!$conversation) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Conversación no encontrada']);
        return;
    }

    // Últimos 50 mensajes
    $messages = db()->query(
        "SELECT wm.*, COALESCE(u.nombre_completo, u.username) AS enviado_por_nombre
         FROM WhatsAppMessage wm
         LEFT JOIN Usuario u ON wm.enviado_por = u.id_usuario
         WHERE wm.id_conversation = ?
         ORDER BY wm.fecha_creacion ASC
         LIMIT 50",
        [$id]
    );

    // Resetear no leídos
    db()->execute(
        "UPDATE WhatsAppConversation SET mensajes_no_leidos = 0 WHERE id_conversation = ?",
        [$id]
    );

    // Parsear notas del prospecto
    if ($conversation['prospecto_notas']) {
        $notas = json_decode($conversation['prospecto_notas'], true);
        $conversation['prospecto_tipo_negocio'] = $notas['tipo_negocio'] ?? '';
        $conversation['prospecto_observaciones'] = $notas['observaciones'] ?? '';
    }

    echo json_encode([
        'success' => true,
        'data' => [
            'conversation' => $conversation,
            'messages' => $messages
        ]
    ]);
}

/**
 * Obtener mensajes paginados
 */
function getMessages($id)
{
    canView();

    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }

    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = 20;
    $offset = ($page - 1) * $limit;

    $messages = db()->query(
        "SELECT wm.*, COALESCE(u.nombre_completo, u.username) AS enviado_por_nombre
         FROM WhatsAppMessage wm
         LEFT JOIN Usuario u ON wm.enviado_por = u.id_usuario
         WHERE wm.id_conversation = ?
         ORDER BY wm.fecha_creacion ASC
         LIMIT $limit OFFSET $offset",
        [$id]
    );

    $total = db()->queryOne(
        "SELECT COUNT(*) as total FROM WhatsAppMessage WHERE id_conversation = ?",
        [$id]
    );

    echo json_encode([
        'success' => true,
        'data' => $messages,
        'total' => $total['total'] ?? 0,
        'page' => $page,
        'per_page' => $limit
    ]);
}

/**
 * Enviar mensaje de texto
 */
function sendMessage()
{
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);

    $convId = $data['id_conversation'] ?? null;
    $contenido = trim($data['contenido'] ?? '');
    $tipo = $data['tipo'] ?? 'texto';

    if (!$convId || empty($contenido)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Conversación y contenido son requeridos']);
        return;
    }

    // Obtener conversación
    $conversation = db()->queryOne(
        "SELECT * FROM WhatsAppConversation WHERE id_conversation = ?",
        [$convId]
    );

    if (!$conversation) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Conversación no encontrada']);
        return;
    }

    // Enviar por WhatsApp API
    $waApi = new WhatsAppCloudAPI();
    $result = $waApi->sendTextMessage($conversation['wa_phone'], $contenido);

    if (!$result['success']) {
        http_response_code(502);
        echo json_encode(['success' => false, 'message' => 'Error enviando mensaje: ' . ($result['message'] ?? 'Error desconocido')]);
        return;
    }

    // Guardar en BD
    $waMessageId = $result['data']['messages'][0]['id'] ?? null;
    $userId = $user['id'] ?? $user['id_usuario'];

    $msgId = db()->insert(
        "INSERT INTO WhatsAppMessage (id_conversation, wa_message_id, direccion, tipo, contenido, enviado_por, estado_envio) 
         VALUES (?, ?, 'saliente', ?, ?, ?, 'enviado')",
        [$convId, $waMessageId, $tipo, $contenido, $userId]
    );

    // Actualizar conversación
    db()->execute(
        "UPDATE WhatsAppConversation SET ultima_actividad = NOW() WHERE id_conversation = ?",
        [$convId]
    );

    // Si no estaba asignada, asignar al usuario actual
    if (!$conversation['id_usuario_asignado']) {
        db()->execute(
            "UPDATE WhatsAppConversation SET id_usuario_asignado = ?, estado = 'asignada' WHERE id_conversation = ?",
            [$userId, $convId]
        );
    }

    echo json_encode([
        'success' => true,
        'message' => 'Mensaje enviado',
        'data' => [
            'id_message' => $msgId,
            'wa_message_id' => $waMessageId
        ]
    ]);
}

/**
 * Enviar plantilla
 */
function sendTemplate()
{
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);

    $phone = $data['phone'] ?? null;
    $templateName = $data['template_name'] ?? null;
    $language = $data['language'] ?? 'es';
    $components = $data['components'] ?? [];

    if (!$phone || !$templateName) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Teléfono y nombre de plantilla son requeridos']);
        return;
    }

    $waApi = new WhatsAppCloudAPI();
    $result = $waApi->sendTemplate($phone, $templateName, $language, $components);

    if ($result['success']) {
        // Normalizar teléfono
        $cleanPhone = preg_replace('/[\s\-\(\)\+]/', '', $phone);
        if (!preg_match('/^51/', $cleanPhone) && preg_match('/^9\d{8}$/', $cleanPhone)) {
            $cleanPhone = '51' . $cleanPhone;
        }

        // Buscar conversación
        $conversation = db()->queryOne(
            "SELECT * FROM WhatsAppConversation WHERE wa_phone = ? AND estado != 'cerrada' ORDER BY fecha_creacion DESC LIMIT 1",
            [$cleanPhone]
        );

        $userId = $user['id'] ?? $user['id_usuario'];

        if (!$conversation) {
            // Encontrar o crear prospecto
            $prospecto = db()->queryOne("SELECT id_prospecto FROM Prospecto WHERE telefono = ? AND activo = 1 LIMIT 1", [$cleanPhone]);
            if (!$prospecto && preg_match('/^51(\d{9})$/', $cleanPhone, $matches)) {
                $prospecto = db()->queryOne("SELECT id_prospecto FROM Prospecto WHERE (telefono = ? OR telefono = ?) AND activo = 1 LIMIT 1", [$matches[1], '+' . $cleanPhone]);
            }
            
            $prospectoId = $prospecto ? $prospecto['id_prospecto'] : null;

            $convId = db()->insert(
                "INSERT INTO WhatsAppConversation (wa_phone, wa_profile_name, estado, origen, id_prospecto, id_usuario_asignado) VALUES (?, ?, 'asignada', 'manual', ?, ?)",
                [$cleanPhone, 'Prospecto ' . substr($cleanPhone, -4), $prospectoId, $userId]
            );
        } else {
            $convId = $conversation['id_conversation'];
            // Actualizar actividad y asignación
            db()->execute(
                "UPDATE WhatsAppConversation SET ultima_actividad = NOW(), id_usuario_asignado = ?, estado = 'asignada' WHERE id_conversation = ?",
                [$userId, $convId]
            );
        }

        // Guardar mensaje
        $waMessageId = $result['data']['messages'][0]['id'] ?? null;
        db()->insert(
            "INSERT INTO WhatsAppMessage (id_conversation, wa_message_id, direccion, tipo, contenido, enviado_por, estado_envio) 
             VALUES (?, ?, 'saliente', 'plantilla', ?, ?, 'enviado')",
            [$convId, $waMessageId, "Plantilla: " . $templateName, $userId]
        );

        $result['id_conversation'] = $convId;
    }

    echo json_encode($result);
}

/**
 * Asignar conversación a un agente
 */
function assignConversation($id)
{
    canEdit();

    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }

    $data = json_decode(file_get_contents('php://input'), true);
    $userId = $data['id_usuario'] ?? null;
    $autoAssign = $data['auto_assign'] ?? false;

    if ($autoAssign) {
        // Usar distribuidor round-robin
        $distributor = new MessageDistributor();
        $result = $distributor->assignConversation($id);

        if (!$result) {
            http_response_code(409);
            echo json_encode(['success' => false, 'message' => 'No hay agentes disponibles']);
            return;
        }

        echo json_encode([
            'success' => true,
            'message' => 'Conversación asignada a ' . $result['nombre'],
            'data' => $result
        ]);
        return;
    }

    if (!$userId) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID de usuario requerido']);
        return;
    }

    db()->execute(
        "UPDATE WhatsAppConversation SET id_usuario_asignado = ?, estado = 'asignada' WHERE id_conversation = ?",
        [$userId, $id]
    );

    echo json_encode(['success' => true, 'message' => 'Conversación asignada']);
}

/**
 * Cerrar conversación
 */
function closeConversation($id)
{
    canEdit();

    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }

    // Liberar slot del agente
    $distributor = new MessageDistributor();
    $distributor->releaseConversation($id);

    db()->execute(
        "UPDATE WhatsAppConversation SET estado = 'cerrada' WHERE id_conversation = ?",
        [$id]
    );

    echo json_encode(['success' => true, 'message' => 'Conversación cerrada']);
}

/**
 * Estadísticas generales
 */
function getStats()
{
    canView();

    $stats = [];

    // Conteo por estado
    $estados = db()->query(
        "SELECT estado, COUNT(*) as count FROM WhatsAppConversation GROUP BY estado"
    );
    $stats['por_estado'] = [];
    foreach ($estados as $row) {
        $stats['por_estado'][$row['estado']] = intval($row['count']);
    }

    // Mensajes hoy
    $hoy = db()->queryOne(
        "SELECT COUNT(*) as total FROM WhatsAppMessage WHERE DATE(fecha_creacion) = CURDATE()"
    );
    $stats['mensajes_hoy'] = intval($hoy['total'] ?? 0);

    // No leídos
    $noLeidos = db()->queryOne(
        "SELECT SUM(mensajes_no_leidos) as total FROM WhatsAppConversation WHERE estado != 'cerrada'"
    );
    $stats['no_leidos'] = intval($noLeidos['total'] ?? 0);

    // Total conversaciones activas
    $activas = db()->queryOne(
        "SELECT COUNT(*) as total FROM WhatsAppConversation WHERE estado IN ('abierta', 'asignada', 'bot')"
    );
    $stats['activas'] = intval($activas['total'] ?? 0);

    echo json_encode(['success' => true, 'data' => $stats]);
}

/**
 * Listar plantillas de WhatsApp
 */
function getTemplates()
{
    canView();

    $waApi = new WhatsAppCloudAPI();
    $result = $waApi->getTemplates();

    if ($result['success']) {
        $templates = $result['data']['data'] ?? [];
        echo json_encode(['success' => true, 'data' => $templates]);
    } else {
        echo json_encode(['success' => false, 'message' => $result['message'] ?? 'Error obteniendo plantillas']);
    }
}

/**
 * Listar agentes disponibles para asignación
 */
function getAgents()
{
    canView();

    $agents = db()->query(
        "SELECT ad.*, u.nombre_completo, u.username, u.email
         FROM AgentDistribution ad
         JOIN Usuario u ON ad.id_usuario = u.id_usuario
         WHERE u.activo = 1
         ORDER BY u.nombre_completo"
    );

    echo json_encode(['success' => true, 'data' => $agents]);
}

/**
 * Agregar agente al pool de distribución
 */
function addAgent()
{
    requireRole(['admin']);

    $data = json_decode(file_get_contents('php://input'), true);
    $userId = $data['id_usuario'] ?? null;
    $maxConversaciones = intval($data['max_conversaciones'] ?? 10);

    if (!$userId) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID de usuario requerido']);
        return;
    }

    $distributor = new MessageDistributor();
    $result = $distributor->addAgent($userId, $maxConversaciones);

    if ($result) {
        echo json_encode(['success' => true, 'message' => 'Agente agregado al pool de distribución']);
    } else {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error agregando agente al pool']);
    }
}

/**
 * Actualizar límite de conversaciones de un agente
 */
function updateAgentLimit()
{
    requireRole(['admin']);

    $data = json_decode(file_get_contents('php://input'), true);
    $userId = $data['id_usuario'] ?? null;
    $maxConversaciones = intval($data['max_conversaciones'] ?? 10);

    if (!$userId) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID de usuario requerido']);
        return;
    }

    db()->execute(
        "UPDATE AgentDistribution SET max_conversaciones = ? WHERE id_usuario = ?",
        [$maxConversaciones, $userId]
    );

    echo json_encode(['success' => true, 'message' => 'Límite de conversaciones actualizado']);
}

/**
 * Activar o desactivar un agente del pool
 */
function toggleAgentStatus()
{
    requireRole(['admin']);

    $data = json_decode(file_get_contents('php://input'), true);
    $userId = $data['id_usuario'] ?? null;
    $activo = isset($data['activo']) ? intval($data['activo']) : 1;

    if (!$userId) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID de usuario requerido']);
        return;
    }

    db()->execute(
        "UPDATE AgentDistribution SET activo = ? WHERE id_usuario = ?",
        [$activo, $userId]
    );

    echo json_encode(['success' => true, 'message' => 'Estado del agente actualizado']);
}

/**
 * Obtener o crear una conversación por número de teléfono
 */
function createConversation()
{
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    $phone = $data['phone'] ?? null;

    if (!$phone) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Teléfono requerido']);
        return;
    }

    $cleanPhone = preg_replace('/[\s\-\(\)\+]/', '', $phone);
    if (!preg_match('/^51/', $cleanPhone) && preg_match('/^9\d{8}$/', $cleanPhone)) {
        $cleanPhone = '51' . $cleanPhone;
    }

    $conversation = db()->queryOne(
        "SELECT * FROM WhatsAppConversation WHERE wa_phone = ? AND estado != 'cerrada' ORDER BY fecha_creacion DESC LIMIT 1",
        [$cleanPhone]
    );

    $userId = $user['id'] ?? $user['id_usuario'];

    if (!$conversation) {
        $prospecto = db()->queryOne("SELECT id_prospecto FROM Prospecto WHERE telefono = ? AND activo = 1 LIMIT 1", [$cleanPhone]);
        if (!$prospecto && preg_match('/^51(\d{9})$/', $cleanPhone, $matches)) {
            $prospecto = db()->queryOne("SELECT id_prospecto FROM Prospecto WHERE (telefono = ? OR telefono = ?) AND activo = 1 LIMIT 1", [$matches[1], '+' . $cleanPhone]);
        }
        $prospectoId = $prospecto ? $prospecto['id_prospecto'] : null;

        $convId = db()->insert(
            "INSERT INTO WhatsAppConversation (wa_phone, wa_profile_name, estado, origen, id_prospecto, id_usuario_asignado) VALUES (?, ?, 'asignada', 'manual', ?, ?)",
            [$cleanPhone, 'Prospecto ' . substr($cleanPhone, -4), $prospectoId, $userId]
        );

        $conversation = db()->queryOne(
            "SELECT * FROM WhatsAppConversation WHERE id_conversation = ?",
            [$convId]
        );
    }

    echo json_encode(['success' => true, 'data' => $conversation]);
}
