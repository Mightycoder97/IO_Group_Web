<?php
/**
 * IO Group - Bot Config API
 * Configuración del bot de ventas (solo admin)
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

try {
    switch ($method) {
        case 'GET':
            if ($action === 'stats') getBotStats();
            else getConfig();
            break;
        case 'PUT':
            updateConfig();
            break;
        case 'POST':
            if ($action === 'test') testBot();
            else {
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
    echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
}

/**
 * Obtener configuración actual del bot
 */
function getConfig()
{
    requireRole(['admin']);

    $config = db()->queryOne("SELECT * FROM BotConfig WHERE activo = 1 ORDER BY id DESC LIMIT 1");

    if (!$config) {
        echo json_encode(['success' => true, 'data' => null, 'message' => 'Bot no configurado']);
        return;
    }

    // Decodificar JSON fields
    $config['horario_activo'] = json_decode($config['horario_activo'] ?? '{}', true);
    $config['auto_transfer_keywords'] = json_decode($config['auto_transfer_keywords'] ?? '[]', true);

    echo json_encode(['success' => true, 'data' => $config]);
}

/**
 * Actualizar configuración del bot
 */
function updateConfig()
{
    requireRole(['admin']);

    $data = json_decode(file_get_contents('php://input'), true);

    $config = db()->queryOne("SELECT id FROM BotConfig ORDER BY id DESC LIMIT 1");

    if (!$config) {
        // Crear configuración por defecto
        $id = db()->insert(
            "INSERT INTO BotConfig (nombre, system_prompt, activo) VALUES ('Bot de Ventas', '', 1)"
        );
    } else {
        $id = $config['id'];
    }

    // Construir UPDATE dinámico con los campos proporcionados
    $allowedFields = [
        'nombre', 'system_prompt', 'knowledge_base', 'modelo', 'temperature',
        'max_tokens', 'max_bot_messages', 'mensaje_bienvenida',
        'mensaje_transferencia', 'activo'
    ];

    $sets = [];
    $params = [];

    foreach ($allowedFields as $field) {
        if (array_key_exists($field, $data)) {
            $sets[] = "$field = ?";
            $params[] = $data[$field];
        }
    }

    // Campos JSON
    if (array_key_exists('horario_activo', $data)) {
        $sets[] = "horario_activo = ?";
        $params[] = is_string($data['horario_activo']) ? $data['horario_activo'] : json_encode($data['horario_activo']);
    }
    if (array_key_exists('auto_transfer_keywords', $data)) {
        $sets[] = "auto_transfer_keywords = ?";
        $params[] = is_string($data['auto_transfer_keywords']) ? $data['auto_transfer_keywords'] : json_encode($data['auto_transfer_keywords']);
    }

    if (empty($sets)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'No hay campos para actualizar']);
        return;
    }

    $params[] = $id;
    db()->execute(
        "UPDATE BotConfig SET " . implode(', ', $sets) . " WHERE id = ?",
        $params
    );

    echo json_encode(['success' => true, 'message' => 'Configuración actualizada']);
}

/**
 * Probar el bot con un mensaje simulado
 */
function testBot()
{
    requireRole(['admin']);

    $data = json_decode(file_get_contents('php://input'), true);
    $message = trim($data['message'] ?? '');
    $history = $data['history'] ?? [];

    if (empty($message)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Mensaje requerido']);
        return;
    }

    require_once __DIR__ . '/helpers/sales_bot.php';

    $bot = new SalesBot();
    $result = $bot->testMessage($message, $history);

    echo json_encode([
        'success' => $result['success'],
        'data' => [
            'response' => $result['text'] ?? '',
            'usage' => $result['usage'] ?? null
        ],
        'message' => $result['message'] ?? null
    ]);
}

/**
 * Estadísticas del bot
 */
function getBotStats()
{
    requireRole(['admin']);

    try {
        // Total mensajes enviados por bot
        $totalBot = db()->queryOne(
            "SELECT COUNT(*) as total FROM WhatsAppMessage WHERE es_bot = 1"
        );

        // Mensajes hoy
        $botHoy = db()->queryOne(
            "SELECT COUNT(*) as total FROM WhatsAppMessage WHERE es_bot = 1 AND DATE(fecha_creacion) = CURDATE()"
        );

        // Conversaciones gestionadas por bot
        $convBot = db()->queryOne(
            "SELECT COUNT(DISTINCT id_conversation) as total FROM WhatsAppMessage WHERE es_bot = 1"
        );

        // Tasa de transferencia
        $transferidas = db()->queryOne(
            "SELECT COUNT(*) as total FROM WhatsAppConversation 
             WHERE estado = 'asignada' 
               AND id_conversation IN (SELECT DISTINCT id_conversation FROM WhatsAppMessage WHERE es_bot = 1)"
        );

        $tasaTransferencia = intval($convBot['total'] ?? 0) > 0
            ? round((intval($transferidas['total'] ?? 0) / intval($convBot['total'])) * 100, 1)
            : 0;

        // Promedio de mensajes bot antes de transferencia
        $promMsgBot = db()->queryOne(
            "SELECT AVG(cnt) as promedio FROM (
                SELECT id_conversation, COUNT(*) as cnt 
                FROM WhatsAppMessage 
                WHERE es_bot = 1 
                GROUP BY id_conversation
             ) as sub"
        );

        echo json_encode([
            'success' => true,
            'data' => [
                'total_mensajes_bot' => intval($totalBot['total'] ?? 0),
                'mensajes_bot_hoy' => intval($botHoy['total'] ?? 0),
                'conversaciones_bot' => intval($convBot['total'] ?? 0),
                'tasa_transferencia' => $tasaTransferencia,
                'promedio_mensajes_antes_transferencia' => round(floatval($promMsgBot['promedio'] ?? 0), 1)
            ]
        ]);
    } catch (\Exception $e) {
        echo json_encode([
            'success' => true,
            'data' => [
                'total_mensajes_bot' => 0,
                'mensajes_bot_hoy' => 0,
                'conversaciones_bot' => 0,
                'tasa_transferencia' => 0,
                'promedio_mensajes_antes_transferencia' => 0
            ]
        ]);
    }
}
