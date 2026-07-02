<?php
/**
 * IO Group - WhatsApp Cloud API Helper
 * Interacción con Meta WhatsApp Cloud API v21.0
 */

class WhatsAppCloudAPI
{
    private $phoneNumberId;
    private $accessToken;
    private $apiVersion;
    private $baseUrl;

    public function __construct()
    {
        $this->phoneNumberId = getenv('WHATSAPP_PHONE_NUMBER_ID') ?: '';
        $this->accessToken = getenv('WHATSAPP_ACCESS_TOKEN') ?: '';
        $this->apiVersion = getenv('WHATSAPP_API_VERSION') ?: 'v21.0';
        $this->baseUrl = "https://graph.facebook.com/{$this->apiVersion}";
    }

    /**
     * Enviar mensaje de texto
     */
    public function sendTextMessage($phone, $text)
    {
        $phone = $this->normalizePhone($phone);
        $payload = [
            'messaging_product' => 'whatsapp',
            'recipient_type' => 'individual',
            'to' => $phone,
            'type' => 'text',
            'text' => ['body' => $text]
        ];
        return $this->sendMessage($payload);
    }

    /**
     * Enviar mensaje con plantilla
     */
    public function sendTemplate($phone, $templateName, $languageCode = 'es', $components = [])
    {
        $phone = $this->normalizePhone($phone);
        $template = [
            'name' => $templateName,
            'language' => ['code' => $languageCode]
        ];
        if (!empty($components)) {
            $template['components'] = $components;
        }
        $payload = [
            'messaging_product' => 'whatsapp',
            'recipient_type' => 'individual',
            'to' => $phone,
            'type' => 'template',
            'template' => $template
        ];
        return $this->sendMessage($payload);
    }

    /**
     * Enviar mensaje interactivo (botones o lista)
     */
    public function sendInteractive($phone, $interactiveData)
    {
        $phone = $this->normalizePhone($phone);
        $payload = [
            'messaging_product' => 'whatsapp',
            'recipient_type' => 'individual',
            'to' => $phone,
            'type' => 'interactive',
            'interactive' => $interactiveData
        ];
        return $this->sendMessage($payload);
    }

    /**
     * Enviar imagen
     */
    public function sendImage($phone, $imageUrl, $caption = null)
    {
        $phone = $this->normalizePhone($phone);
        $image = ['link' => $imageUrl];
        if ($caption) $image['caption'] = $caption;
        $payload = [
            'messaging_product' => 'whatsapp',
            'recipient_type' => 'individual',
            'to' => $phone,
            'type' => 'image',
            'image' => $image
        ];
        return $this->sendMessage($payload);
    }

    /**
     * Marcar mensaje como leído
     */
    public function markAsRead($messageId)
    {
        $url = "{$this->baseUrl}/{$this->phoneNumberId}/messages";
        $payload = [
            'messaging_product' => 'whatsapp',
            'status' => 'read',
            'message_id' => $messageId
        ];
        return $this->makeRequest('POST', $url, $payload);
    }

    /**
     * Obtener URL de media
     */
    public function getMediaUrl($mediaId)
    {
        $url = "{$this->baseUrl}/{$mediaId}";
        return $this->makeRequest('GET', $url);
    }

    /**
     * Listar plantillas aprobadas
     */
    public function getTemplates()
    {
        $wabaId = getenv('WHATSAPP_WABA_ID') ?: '';
        $url = "{$this->baseUrl}/{$wabaId}/message_templates?status=APPROVED";
        return $this->makeRequest('GET', $url);
    }

    /**
     * Subir media
     */
    public function uploadMedia($filePath, $mimeType)
    {
        $url = "{$this->baseUrl}/{$this->phoneNumberId}/media";
        $ch = curl_init($url);
        curl_setopt_array($ch, [
            CURLOPT_POST => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => [
                "Authorization: Bearer {$this->accessToken}"
            ],
            CURLOPT_POSTFIELDS => [
                'file' => new CURLFile($filePath, $mimeType),
                'messaging_product' => 'whatsapp',
                'type' => $mimeType
            ],
            CURLOPT_TIMEOUT => 30
        ]);
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);

        if ($error) {
            return ['success' => false, 'message' => "Error de conexión: $error"];
        }

        $data = json_decode($response, true);
        return [
            'success' => $httpCode >= 200 && $httpCode < 300,
            'data' => $data,
            'http_code' => $httpCode
        ];
    }

    /**
     * Enviar mensaje (interno)
     */
    private function sendMessage($payload)
    {
        $url = "{$this->baseUrl}/{$this->phoneNumberId}/messages";
        return $this->makeRequest('POST', $url, $payload);
    }

    /**
     * Hacer petición HTTP a la API de Meta
     */
    private function makeRequest($method, $url, $data = null)
    {
        $ch = curl_init($url);
        $headers = [
            "Authorization: Bearer {$this->accessToken}",
            'Content-Type: application/json'
        ];

        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => $headers,
            CURLOPT_TIMEOUT => 15,
            CURLOPT_SSL_VERIFYPEER => true
        ]);

        if ($method === 'POST') {
            curl_setopt($ch, CURLOPT_POST, true);
            if ($data) {
                curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
            }
        }

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);

        if ($error) {
            error_log("WhatsApp API Error: $error | URL: $url");
            return ['success' => false, 'message' => "Error de conexión: $error"];
        }

        $responseData = json_decode($response, true);

        if ($httpCode >= 200 && $httpCode < 300) {
            return [
                'success' => true,
                'data' => $responseData
            ];
        }

        $errorMsg = $responseData['error']['message'] ?? 'Error desconocido';
        $errorCode = $responseData['error']['code'] ?? $httpCode;
        error_log("WhatsApp API Error ($errorCode): $errorMsg | URL: $url");

        return [
            'success' => false,
            'message' => $errorMsg,
            'error_code' => $errorCode,
            'http_code' => $httpCode
        ];
    }

    /**
     * Normalizar número de teléfono al formato internacional
     */
    private function normalizePhone($phone)
    {
        // Eliminar espacios y guiones
        $phone = preg_replace('/[\s\-\(\)]/', '', $phone);
        // Si empieza con 0, reemplazar con código de Perú
        if (preg_match('/^0/', $phone)) {
            $phone = '51' . substr($phone, 1);
        }
        // Si no tiene código de país, agregar Perú (+51)
        if (preg_match('/^9\d{8}$/', $phone)) {
            $phone = '51' . $phone;
        }
        // Eliminar el + si lo tiene
        $phone = ltrim($phone, '+');
        return $phone;
    }

    /**
     * Parsear payload del webhook de Meta
     */
    public static function parseWebhookPayload($payload)
    {
        $results = [
            'messages' => [],
            'statuses' => [],
            'errors' => []
        ];

        if (empty($payload['entry'])) return $results;

        foreach ($payload['entry'] as $entry) {
            if (empty($entry['changes'])) continue;

            foreach ($entry['changes'] as $change) {
                $value = $change['value'] ?? [];

                // Parsear mensajes entrantes
                if (!empty($value['messages'])) {
                    $contacts = $value['contacts'] ?? [];
                    foreach ($value['messages'] as $msg) {
                        $phone = $msg['from'] ?? '';
                        $profileName = '';
                        foreach ($contacts as $contact) {
                            if (($contact['wa_id'] ?? '') === $phone) {
                                $profileName = $contact['profile']['name'] ?? '';
                                break;
                            }
                        }

                        $parsed = [
                            'wa_message_id' => $msg['id'] ?? '',
                            'phone' => $phone,
                            'profile_name' => $profileName,
                            'timestamp' => $msg['timestamp'] ?? '',
                            'type' => $msg['type'] ?? 'text',
                            'content' => '',
                            'media_id' => null,
                            'media_mime' => null,
                            'context' => $msg['context'] ?? null
                        ];

                        // Extraer contenido según tipo
                        switch ($msg['type'] ?? 'text') {
                            case 'text':
                                $parsed['content'] = $msg['text']['body'] ?? '';
                                break;
                            case 'image':
                                $parsed['content'] = $msg['image']['caption'] ?? '';
                                $parsed['media_id'] = $msg['image']['id'] ?? null;
                                $parsed['media_mime'] = $msg['image']['mime_type'] ?? 'image/jpeg';
                                break;
                            case 'audio':
                                $parsed['media_id'] = $msg['audio']['id'] ?? null;
                                $parsed['media_mime'] = $msg['audio']['mime_type'] ?? 'audio/ogg';
                                break;
                            case 'video':
                                $parsed['content'] = $msg['video']['caption'] ?? '';
                                $parsed['media_id'] = $msg['video']['id'] ?? null;
                                $parsed['media_mime'] = $msg['video']['mime_type'] ?? 'video/mp4';
                                break;
                            case 'document':
                                $parsed['content'] = $msg['document']['filename'] ?? '';
                                $parsed['media_id'] = $msg['document']['id'] ?? null;
                                $parsed['media_mime'] = $msg['document']['mime_type'] ?? 'application/pdf';
                                break;
                            case 'location':
                                $lat = $msg['location']['latitude'] ?? 0;
                                $lng = $msg['location']['longitude'] ?? 0;
                                $parsed['content'] = "Ubicación: {$lat}, {$lng}";
                                break;
                            case 'interactive':
                                $interactive = $msg['interactive'] ?? [];
                                $parsed['content'] = $interactive['button_reply']['title']
                                    ?? $interactive['list_reply']['title']
                                    ?? 'Respuesta interactiva';
                                break;
                        }

                        $results['messages'][] = $parsed;
                    }
                }

                // Parsear actualizaciones de estado
                if (!empty($value['statuses'])) {
                    foreach ($value['statuses'] as $status) {
                        $results['statuses'][] = [
                            'wa_message_id' => $status['id'] ?? '',
                            'status' => $status['status'] ?? '',
                            'timestamp' => $status['timestamp'] ?? '',
                            'phone' => $status['recipient_id'] ?? ''
                        ];
                    }
                }

                // Parsear errores
                if (!empty($value['errors'])) {
                    $results['errors'] = array_merge($results['errors'], $value['errors']);
                }
            }
        }

        return $results;
    }

    /**
     * Validar firma del webhook
     */
    public static function validateSignature($payload, $signature, $appSecret)
    {
        if (empty($signature) || empty($appSecret)) return false;
        $expectedHash = hash_hmac('sha256', $payload, $appSecret);
        $receivedHash = str_replace('sha256=', '', $signature);
        return hash_equals($expectedHash, $receivedHash);
    }
}
