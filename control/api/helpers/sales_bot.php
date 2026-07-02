<?php
/**
 * IO Group - Bot de Ventas con LLM
 * Motor de respuestas automáticas usando Gemini Flash
 */

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/whatsapp_api.php';
require_once __DIR__ . '/message_distributor.php';

class SalesBot
{
    private $config;
    private $waApi;
    private $distributor;

    public function __construct()
    {
        $this->config = db()->queryOne(
            "SELECT * FROM BotConfig WHERE activo = 1 ORDER BY id DESC LIMIT 1"
        );
        $this->waApi = new WhatsAppCloudAPI();
        $this->distributor = new MessageDistributor();
    }

    /**
     * Verificar si el bot está activo y dentro del horario configurado
     */
    public function isActive()
    {
        if (!$this->config || !$this->config['activo']) return false;

        // Verificar horario
        $horario = json_decode($this->config['horario_activo'] ?? '{}', true);
        if (empty($horario)) return true; // Si no hay horario, siempre activo

        $dias = ['domingo', 'lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado'];
        $now = new \DateTime('now', new \DateTimeZone('America/Lima'));
        $diaActual = $dias[(int)$now->format('w')];
        $horaActual = $now->format('H:i');

        if (!isset($horario[$diaActual]) || $horario[$diaActual] === null) {
            return false; // Día no activo
        }

        $inicio = $horario[$diaActual]['inicio'] ?? '00:00';
        $fin = $horario[$diaActual]['fin'] ?? '23:59';

        return $horaActual >= $inicio && $horaActual <= $fin;
    }

    /**
     * Verificar si debe transferir a un agente humano
     */
    public function shouldTransferToHuman($messageText, $conversationId)
    {
        // 1. Verificar keywords de transferencia
        $keywords = json_decode($this->config['auto_transfer_keywords'] ?? '[]', true);
        $messageLower = mb_strtolower($messageText, 'UTF-8');

        foreach ($keywords as $keyword) {
            if (mb_strpos($messageLower, mb_strtolower($keyword, 'UTF-8')) !== false) {
                return true;
            }
        }

        // 2. Verificar límite de mensajes del bot
        $maxBotMessages = intval($this->config['max_bot_messages'] ?? 10);
        $botMessageCount = db()->queryOne(
            "SELECT COUNT(*) as total FROM WhatsAppMessage 
             WHERE id_conversation = ? AND es_bot = 1",
            [$conversationId]
        );

        if (($botMessageCount['total'] ?? 0) >= $maxBotMessages) {
            return true;
        }

        return false;
    }

    /**
     * Procesar un mensaje entrante y generar respuesta
     */
    public function processMessage($conversationId, $incomingText)
    {
        try {
            if (!$this->config) return;

            // Verificar si debe transferir a humano
            if ($this->shouldTransferToHuman($incomingText, $conversationId)) {
                $this->transferToHuman($conversationId);
                return;
            }

            // Cargar historial de conversación (últimos 10 mensajes)
            $history = db()->query(
                "SELECT direccion, contenido, es_bot FROM WhatsAppMessage 
                 WHERE id_conversation = ? AND contenido IS NOT NULL AND contenido != ''
                 ORDER BY fecha_creacion DESC LIMIT 10",
                [$conversationId]
            );
            $history = array_reverse($history); // Ordenar cronológicamente

            // Cargar info del prospecto
            $prospecto = db()->queryOne(
                "SELECT p.nombre_comercial, p.telefono, p.distrito, p.notas
                 FROM WhatsAppConversation wc
                 JOIN Prospecto p ON wc.id_prospecto = p.id_prospecto
                 WHERE wc.id_conversation = ?",
                [$conversationId]
            );

            // Construir mensajes para el LLM
            $messages = [];
            foreach ($history as $msg) {
                $role = ($msg['direccion'] === 'entrante') ? 'user' : 'model';
                $messages[] = [
                    'role' => $role,
                    'parts' => [['text' => $msg['contenido']]]
                ];
            }

            // Agregar contexto del prospecto al system prompt
            $systemPrompt = $this->config['system_prompt'];
            if ($this->config['knowledge_base']) {
                $systemPrompt .= "\n\nInformación del negocio:\n" . $this->config['knowledge_base'];
            }
            if ($prospecto) {
                $notas = json_decode($prospecto['notas'] ?? '{}', true);
                $systemPrompt .= "\n\nContexto del cliente actual:";
                $systemPrompt .= "\n- Nombre: " . ($prospecto['nombre_comercial'] ?? 'Desconocido');
                if (!empty($prospecto['distrito'])) {
                    $systemPrompt .= "\n- Ubicación: " . $prospecto['distrito'];
                }
                if (!empty($notas['tipo_negocio'])) {
                    $systemPrompt .= "\n- Tipo de negocio: " . $notas['tipo_negocio'];
                }
            }

            // Llamar al LLM
            $response = $this->callGeminiAPI($messages, $systemPrompt);

            if (!$response['success'] || empty($response['text'])) {
                error_log("Bot: Error generando respuesta - " . ($response['message'] ?? 'Sin texto'));
                return;
            }

            $responseText = $response['text'];

            // Verificar si la respuesta del LLM indica transferencia
            if (mb_strpos(mb_strtolower($responseText), '[transferir]') !== false) {
                $this->transferToHuman($conversationId);
                return;
            }

            // Enviar respuesta por WhatsApp
            $conversation = db()->queryOne(
                "SELECT wa_phone FROM WhatsAppConversation WHERE id_conversation = ?",
                [$conversationId]
            );

            if ($conversation) {
                $waResult = $this->waApi->sendTextMessage($conversation['wa_phone'], $responseText);

                if ($waResult['success']) {
                    $waMessageId = $waResult['data']['messages'][0]['id'] ?? null;

                    // Guardar mensaje del bot
                    db()->insert(
                        "INSERT INTO WhatsAppMessage (id_conversation, wa_message_id, direccion, tipo, contenido, es_bot, estado_envio) 
                         VALUES (?, ?, 'saliente', 'texto', ?, 1, 'enviado')",
                        [$conversationId, $waMessageId, $responseText]
                    );

                    // Actualizar conversación
                    db()->execute(
                        "UPDATE WhatsAppConversation SET ultima_actividad = NOW() WHERE id_conversation = ?",
                        [$conversationId]
                    );
                }
            }

        } catch (\Exception $e) {
            error_log("SalesBot Error: " . $e->getMessage());
        }
    }

    /**
     * Enviar mensaje de bienvenida
     */
    public function sendWelcome($conversationId)
    {
        $bienvenida = $this->config['mensaje_bienvenida'] ?? '¡Hola! 👋 Bienvenido a IO Group. ¿En qué puedo ayudarte?';

        $conversation = db()->queryOne(
            "SELECT wa_phone FROM WhatsAppConversation WHERE id_conversation = ?",
            [$conversationId]
        );

        if (!$conversation) return;

        $waResult = $this->waApi->sendTextMessage($conversation['wa_phone'], $bienvenida);

        if ($waResult['success']) {
            $waMessageId = $waResult['data']['messages'][0]['id'] ?? null;
            db()->insert(
                "INSERT INTO WhatsAppMessage (id_conversation, wa_message_id, direccion, tipo, contenido, es_bot, estado_envio) 
                 VALUES (?, ?, 'saliente', 'texto', ?, 1, 'enviado')",
                [$conversationId, $waMessageId, $bienvenida]
            );
        }
    }

    /**
     * Transferir conversación a un agente humano
     */
    private function transferToHuman($conversationId)
    {
        $mensajeTransfer = $this->config['mensaje_transferencia']
            ?? 'Te conecto con uno de nuestros asesores especializados. Un momento por favor. 🙏';

        // Enviar mensaje de transferencia
        $conversation = db()->queryOne(
            "SELECT wa_phone FROM WhatsAppConversation WHERE id_conversation = ?",
            [$conversationId]
        );

        if ($conversation) {
            $waResult = $this->waApi->sendTextMessage($conversation['wa_phone'], $mensajeTransfer);
            if ($waResult['success']) {
                $waMessageId = $waResult['data']['messages'][0]['id'] ?? null;
                db()->insert(
                    "INSERT INTO WhatsAppMessage (id_conversation, wa_message_id, direccion, tipo, contenido, es_bot, estado_envio) 
                     VALUES (?, ?, 'saliente', 'texto', ?, 1, 'enviado')",
                    [$conversationId, $waMessageId, $mensajeTransfer]
                );
            }
        }

        // Asignar a agente via distribuidor
        $result = $this->distributor->assignConversation($conversationId);

        if (!$result) {
            // Si no hay agentes, mantener abierta
            db()->execute(
                "UPDATE WhatsAppConversation SET estado = 'abierta' WHERE id_conversation = ?",
                [$conversationId]
            );
        }
    }

    /**
     * Llamar a la API de Gemini
     */
    private function callGeminiAPI($messages, $systemPrompt)
    {
        $apiKey = getenv('GOOGLE_API_KEY') ?: '';
        $model = $this->config['modelo'] ?? 'gemini-2.5-flash';
        $temperature = floatval($this->config['temperature'] ?? 0.7);
        $maxTokens = intval($this->config['max_tokens'] ?? 500);

        if (empty($apiKey)) {
            return ['success' => false, 'message' => 'GOOGLE_API_KEY no configurada'];
        }

        $url = "https://generativelanguage.googleapis.com/v1beta/models/{$model}:generateContent?key={$apiKey}";

        $body = [
            'contents' => $messages,
            'systemInstruction' => [
                'parts' => [['text' => $systemPrompt]]
            ],
            'generationConfig' => [
                'temperature' => $temperature,
                'maxOutputTokens' => $maxTokens,
                'topP' => 0.95
            ]
        ];

        $ch = curl_init($url);
        curl_setopt_array($ch, [
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => json_encode($body),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
            CURLOPT_TIMEOUT => 30,
            CURLOPT_SSL_VERIFYPEER => true
        ]);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);

        if ($error) {
            return ['success' => false, 'message' => "Error de conexión: $error"];
        }

        $data = json_decode($response, true);

        if ($httpCode !== 200) {
            $errorMsg = $data['error']['message'] ?? 'Error desconocido';
            error_log("Gemini API Error ($httpCode): $errorMsg");
            return ['success' => false, 'message' => $errorMsg];
        }

        // Extraer texto de la respuesta
        $text = '';
        if (!empty($data['candidates'][0]['content']['parts'])) {
            foreach ($data['candidates'][0]['content']['parts'] as $part) {
                if (isset($part['text'])) {
                    $text .= $part['text'];
                }
            }
        }

        return [
            'success' => true,
            'text' => $text,
            'usage' => $data['usageMetadata'] ?? null
        ];
    }

    /**
     * Probar el bot con un mensaje simulado (sin enviar por WhatsApp)
     */
    public function testMessage($messageText, $conversationHistory = [])
    {
        if (!$this->config) {
            return ['success' => false, 'message' => 'Bot no configurado'];
        }

        $messages = [];
        foreach ($conversationHistory as $msg) {
            $messages[] = [
                'role' => $msg['role'] ?? 'user',
                'parts' => [['text' => $msg['text'] ?? '']]
            ];
        }
        // Agregar el mensaje actual
        $messages[] = [
            'role' => 'user',
            'parts' => [['text' => $messageText]]
        ];

        $systemPrompt = $this->config['system_prompt'];
        if ($this->config['knowledge_base']) {
            $systemPrompt .= "\n\nInformación del negocio:\n" . $this->config['knowledge_base'];
        }

        return $this->callGeminiAPI($messages, $systemPrompt);
    }
}
