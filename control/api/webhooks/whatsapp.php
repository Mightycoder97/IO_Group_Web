<?php
/**
 * IO Group - Webhook de WhatsApp (Meta Cloud API)
 * Endpoint público para recibir mensajes entrantes
 * NO requiere autenticación JWT
 */

// Carga de dependencias
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../helpers/whatsapp_api.php';

// Desactivar CORS restrictivo para este endpoint público
header('Content-Type: application/json; charset=UTF-8');

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        verifyWebhook();
        break;
    case 'POST':
        handleIncoming();
        break;
    default:
        http_response_code(405);
        echo json_encode(['error' => 'Método no permitido']);
}

/**
 * Verificación del webhook por Meta
 * GET /api/webhooks/whatsapp?hub.mode=subscribe&hub.verify_token=XXX&hub.challenge=YYY
 */
function verifyWebhook()
{
    $mode = $_GET['hub_mode'] ?? $_GET['hub.mode'] ?? '';
    $token = $_GET['hub_verify_token'] ?? $_GET['hub.verify_token'] ?? '';
    $challenge = $_GET['hub_challenge'] ?? $_GET['hub.challenge'] ?? '';

    $verifyToken = getenv('WHATSAPP_VERIFY_TOKEN') ?: '';

    if ($mode === 'subscribe' && $token === $verifyToken && !empty($verifyToken)) {
        // Verificación exitosa
        http_response_code(200);
        header('Content-Type: text/plain');
        echo $challenge;
        exit;
    }

    http_response_code(403);
    echo json_encode(['error' => 'Verificación fallida']);
}

/**
 * Procesar mensajes entrantes de WhatsApp
 */
function handleIncoming()
{
    // Leer payload
    $rawPayload = file_get_contents('php://input');

    // Validar firma del webhook
    $signature = $_SERVER['HTTP_X_HUB_SIGNATURE_256'] ?? '';
    $appSecret = getenv('WHATSAPP_APP_SECRET') ?: '';

    if (!empty($appSecret) && !empty($signature)) {
        if (!WhatsAppCloudAPI::validateSignature($rawPayload, $signature, $appSecret)) {
            error_log('WhatsApp Webhook: Firma inválida');
            http_response_code(401);
            echo json_encode(['error' => 'Firma inválida']);
            return;
        }
    }

    // Responder 200 inmediatamente (Meta requiere respuesta < 5 segundos)
    http_response_code(200);
    echo json_encode(['status' => 'ok']);

    // Cerrar la conexión con el cliente para procesar en background
    if (function_exists('fastcgi_finish_request')) {
        fastcgi_finish_request();
    } else {
        // Alternativa para servidores no-FPM
        ob_end_flush();
        flush();
        if (function_exists('litespeed_finish_request')) {
            litespeed_finish_request();
        }
    }

    // Procesar el payload
    $payload = json_decode($rawPayload, true);
    if (empty($payload)) return;

    $parsed = WhatsAppCloudAPI::parseWebhookPayload($payload);
    $waApi = new WhatsAppCloudAPI();

    // Procesar mensajes entrantes
    foreach ($parsed['messages'] as $msg) {
        processIncomingMessage($msg, $waApi);
    }

    // Procesar actualizaciones de estado
    foreach ($parsed['statuses'] as $status) {
        processStatusUpdate($status);
    }
}

/**
 * Procesar un mensaje entrante individual
 */
function processIncomingMessage($msg, $waApi)
{
    try {
        $phone = $msg['phone'];
        $profileName = $msg['profile_name'];

        // 1. Buscar o crear conversación
        $conversation = db()->queryOne(
            "SELECT * FROM WhatsAppConversation WHERE wa_phone = ? AND estado != 'cerrada' ORDER BY fecha_creacion DESC LIMIT 1",
            [$phone]
        );

        if (!$conversation) {
            // Crear nueva conversación
            $convId = db()->insert(
                "INSERT INTO WhatsAppConversation (wa_phone, wa_profile_name, estado, origen) VALUES (?, ?, 'abierta', 'whatsapp')",
                [$phone, $profileName]
            );

            $conversation = db()->queryOne(
                "SELECT * FROM WhatsAppConversation WHERE id_conversation = ?",
                [$convId]
            );
        } else {
            // Actualizar nombre de perfil si cambió
            if ($profileName && $profileName !== $conversation['wa_profile_name']) {
                db()->execute(
                    "UPDATE WhatsAppConversation SET wa_profile_name = ? WHERE id_conversation = ?",
                    [$profileName, $conversation['id_conversation']]
                );
            }
        }

        $convId = $conversation['id_conversation'];

        // 2. Auto-crear Prospecto si no existe
        if (!$conversation['id_prospecto']) {
            $prospecto = db()->queryOne(
                "SELECT id_prospecto FROM Prospecto WHERE telefono = ? AND activo = 1 LIMIT 1",
                [$phone]
            );

            // Intentar también con formato nacional
            if (!$prospecto && preg_match('/^51(\d{9})$/', $phone, $matches)) {
                $prospecto = db()->queryOne(
                    "SELECT id_prospecto FROM Prospecto WHERE (telefono = ? OR telefono = ?) AND activo = 1 LIMIT 1",
                    [$matches[1], '+' . $phone]
                );
            }

            if (!$prospecto) {
                // Crear nuevo prospecto
                $nombre = $profileName ?: 'WhatsApp ' . substr($phone, -4);
                $notasArr = [
                    'nombre_contacto' => $nombre,
                    'tipo_negocio' => 'Otro',
                    'observaciones' => 'Prospecto generado automáticamente desde WhatsApp'
                ];

                $prospectoId = db()->insert(
                    "INSERT INTO Prospecto (nombre_comercial, tipo_cliente, telefono, fuente, estado, notas) VALUES (?, 'persona', ?, 'whatsapp', 'nuevo', ?)",
                    [$nombre, $phone, json_encode($notasArr)]
                );
            } else {
                $prospectoId = $prospecto['id_prospecto'];
            }

            // Vincular prospecto a la conversación
            db()->execute(
                "UPDATE WhatsAppConversation SET id_prospecto = ? WHERE id_conversation = ?",
                [$prospectoId, $convId]
            );
        }

        // 3. Obtener URL de media si aplica
        $mediaUrl = null;
        if (!empty($msg['media_id'])) {
            $mediaResult = $waApi->getMediaUrl($msg['media_id']);
            if ($mediaResult['success']) {
                $mediaUrl = $mediaResult['data']['url'] ?? null;
            }
        }

        // 4. Insertar mensaje
        db()->insert(
            "INSERT INTO WhatsAppMessage (id_conversation, wa_message_id, direccion, tipo, contenido, media_url, media_mime, estado_envio) 
             VALUES (?, ?, 'entrante', ?, ?, ?, ?, 'entregado')",
            [
                $convId,
                $msg['wa_message_id'],
                $msg['type'],
                $msg['content'],
                $mediaUrl,
                $msg['media_mime']
            ]
        );

        // 5. Actualizar conversación
        db()->execute(
            "UPDATE WhatsAppConversation SET ultima_actividad = NOW(), mensajes_no_leidos = mensajes_no_leidos + 1 WHERE id_conversation = ?",
            [$convId]
        );

        // 6. Marcar como leído en WhatsApp
        if (!empty($msg['wa_message_id'])) {
            $waApi->markAsRead($msg['wa_message_id']);
        }

        // 7. Si la conversación está en modo bot, procesar con el bot
        if ($conversation['estado'] === 'bot' || $conversation['estado'] === 'abierta') {
            processBotResponse($convId, $msg['content'], $conversation);
        }

    } catch (\Exception $e) {
        error_log("Error procesando mensaje de WhatsApp: " . $e->getMessage());
    }
}

/**
 * Procesar respuesta del bot (si está activo)
 */
function processBotResponse($conversationId, $messageText, $conversation)
{
    try {
        // Verificar si el bot está disponible
        $botConfigFile = __DIR__ . '/../helpers/sales_bot.php';
        if (!file_exists($botConfigFile)) return;

        require_once $botConfigFile;
        require_once __DIR__ . '/../helpers/message_distributor.php';

        $bot = new SalesBot();

        if (!$bot->isActive()) return;

        // Si es una conversación nueva, enviar bienvenida
        $msgCount = db()->queryOne(
            "SELECT COUNT(*) as total FROM WhatsAppMessage WHERE id_conversation = ?",
            [$conversationId]
        )['total'] ?? 0;

        if ($msgCount <= 1) {
            $bot->sendWelcome($conversationId);
            // Actualizar estado a 'bot'
            db()->execute(
                "UPDATE WhatsAppConversation SET estado = 'bot' WHERE id_conversation = ? AND estado = 'abierta'",
                [$conversationId]
            );
        } else {
            // Procesar mensaje con el bot
            $bot->processMessage($conversationId, $messageText);
        }
    } catch (\Exception $e) {
        error_log("Error en bot de ventas: " . $e->getMessage());
    }
}

/**
 * Procesar actualización de estado de mensaje (entregado/leído)
 */
function processStatusUpdate($status)
{
    try {
        $statusMap = [
            'sent' => 'enviado',
            'delivered' => 'entregado',
            'read' => 'leido',
            'failed' => 'fallido'
        ];

        $dbStatus = $statusMap[$status['status']] ?? null;
        if (!$dbStatus || empty($status['wa_message_id'])) return;

        db()->execute(
            "UPDATE WhatsAppMessage SET estado_envio = ? WHERE wa_message_id = ?",
            [$dbStatus, $status['wa_message_id']]
        );
    } catch (\Exception $e) {
        error_log("Error actualizando estado de mensaje: " . $e->getMessage());
    }
}
