<?php
/**
 * Vertex AI Gemini helper for structured document extraction.
 *
 * Uses a base64-encoded service account JSON from VERTEX_SERVICE_ACCOUNT_JSON_BASE64.
 * No Google SDK dependency is required; this is meant for shared PHP hosting.
 */

class VertexGeminiClient {
    private $projectId;
    private $location;
    private $model;
    private $serviceAccount;
    private $accessToken = null;
    private $accessTokenExp = 0;

    public function __construct() {
        $this->projectId = trim(getenv('VERTEX_PROJECT_ID') ?: '');
        $this->location = trim(getenv('VERTEX_LOCATION') ?: 'global');
        $this->model = trim(getenv('VERTEX_MODEL') ?: 'gemini-2.5-flash');

        $encoded = trim(getenv('VERTEX_SERVICE_ACCOUNT_JSON_BASE64') ?: '');
        if ($encoded !== '') {
            $json = base64_decode($encoded, true);
            $this->serviceAccount = $json ? json_decode($json, true) : null;
        }
    }

    public function isConfigured() {
        return $this->projectId !== ''
            && is_array($this->serviceAccount)
            && !empty($this->serviceAccount['client_email'])
            && !empty($this->serviceAccount['private_key']);
    }

    public function extractStructuredDocument($filePath, $mimeType, $prompt, $schema) {
        if (!$this->isConfigured()) {
            throw new Exception('Vertex AI no esta configurado. Revise VERTEX_PROJECT_ID y VERTEX_SERVICE_ACCOUNT_JSON_BASE64.');
        }

        if (!is_readable($filePath)) {
            throw new Exception('No se puede leer el archivo para procesarlo.');
        }

        $fileBytes = file_get_contents($filePath);
        if ($fileBytes === false || $fileBytes === '') {
            throw new Exception('El archivo esta vacio o no se pudo leer.');
        }

        $modelName = sprintf(
            'projects/%s/locations/%s/publishers/google/models/%s',
            $this->projectId,
            $this->location,
            $this->model
        );

        $endpointHost = $this->location === 'global'
            ? 'aiplatform.googleapis.com'
            : $this->location . '-aiplatform.googleapis.com';
        $url = sprintf('https://%s/v1/%s:generateContent', $endpointHost, $modelName);

        $body = [
            'contents' => [[
                'role' => 'user',
                'parts' => [
                    ['text' => $prompt],
                    [
                        'inlineData' => [
                            'mimeType' => $mimeType,
                            'data' => base64_encode($fileBytes)
                        ]
                    ]
                ]
            ]],
            'generationConfig' => [
                'temperature' => 0.1,
                'topP' => 0.8,
                'maxOutputTokens' => 8192,
                'responseMimeType' => 'application/json',
                'responseSchema' => $schema
            ]
        ];

        $response = $this->postJson($url, $body, [
            'Authorization: Bearer ' . $this->getAccessToken()
        ]);

        $text = $response['candidates'][0]['content']['parts'][0]['text'] ?? null;
        if (!$text) {
            $reason = $response['candidates'][0]['finishReason'] ?? 'sin contenido';
            throw new Exception('Vertex no devolvio JSON util: ' . $reason);
        }

        $decoded = json_decode($this->stripJsonFences($text), true);
        if (!is_array($decoded)) {
            throw new Exception('Vertex devolvio una respuesta que no es JSON valido.');
        }

        return $decoded;
    }

    private function getAccessToken() {
        if ($this->accessToken && $this->accessTokenExp > time() + 60) {
            return $this->accessToken;
        }

        $now = time();
        $header = $this->base64UrlEncode(json_encode(['alg' => 'RS256', 'typ' => 'JWT']));
        $payload = $this->base64UrlEncode(json_encode([
            'iss' => $this->serviceAccount['client_email'],
            'scope' => 'https://www.googleapis.com/auth/cloud-platform',
            'aud' => 'https://oauth2.googleapis.com/token',
            'iat' => $now,
            'exp' => $now + 3600
        ]));

        $unsigned = $header . '.' . $payload;
        $signature = '';
        $ok = openssl_sign($unsigned, $signature, $this->serviceAccount['private_key'], OPENSSL_ALGO_SHA256);
        if (!$ok) {
            throw new Exception('No se pudo firmar el JWT de service account.');
        }

        $assertion = $unsigned . '.' . $this->base64UrlEncode($signature);
        $ch = curl_init('https://oauth2.googleapis.com/token');
        curl_setopt_array($ch, [
            CURLOPT_POST => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTPHEADER => ['Content-Type: application/x-www-form-urlencoded'],
            CURLOPT_POSTFIELDS => http_build_query([
                'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
                'assertion' => $assertion
            ])
        ]);

        $raw = curl_exec($ch);
        $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);

        if ($raw === false || $status < 200 || $status >= 300) {
            throw new Exception('No se pudo obtener token OAuth de Google: ' . ($error ?: $raw));
        }

        $data = json_decode($raw, true);
        if (empty($data['access_token'])) {
            throw new Exception('Google OAuth no devolvio access_token.');
        }

        $this->accessToken = $data['access_token'];
        $this->accessTokenExp = $now + intval($data['expires_in'] ?? 3600);
        return $this->accessToken;
    }

    private function postJson($url, $body, $headers = []) {
        $ch = curl_init($url);
        curl_setopt_array($ch, [
            CURLOPT_POST => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_TIMEOUT => 120,
            CURLOPT_HTTPHEADER => array_merge(['Content-Type: application/json'], $headers),
            CURLOPT_POSTFIELDS => json_encode($body)
        ]);

        $raw = curl_exec($ch);
        $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $error = curl_error($ch);
        curl_close($ch);

        if ($raw === false || $status < 200 || $status >= 300) {
            throw new Exception('Error al llamar Vertex AI: ' . ($error ?: $raw));
        }

        $data = json_decode($raw, true);
        if (!is_array($data)) {
            throw new Exception('Vertex AI devolvio una respuesta no JSON.');
        }

        return $data;
    }

    private function stripJsonFences($text) {
        $text = trim($text);
        if (strpos($text, '```') === 0) {
            $text = preg_replace('/^```(?:json)?\s*/i', '', $text);
            $text = preg_replace('/\s*```$/', '', $text);
        }
        return trim($text);
    }

    private function base64UrlEncode($data) {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }
}
