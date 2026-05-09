<?php
/**
 * Vertex AI Gemini helper for structured document extraction.
 *
 * Supports either:
 * - Service account JSON from VERTEX_SERVICE_ACCOUNT_JSON_BASE64.
 * - Vertex AI API key from GOOGLE_API_KEY or VERTEX_API_KEY.
 * No Google SDK dependency is required; this is meant for shared PHP hosting.
 */

class VertexGeminiClient {
    private $projectId;
    private $location;
    private $model;
    private $apiKey;
    private $serviceAccount;
    private $accessToken = null;
    private $accessTokenExp = 0;

    public function __construct() {
        $this->projectId = $this->envValue(['VERTEX_PROJECT_ID', 'GOOGLE_CLOUD_PROJECT', 'GOOGLE_PROJECT_ID']);
        $this->location = $this->envValue(['VERTEX_LOCATION', 'GOOGLE_CLOUD_LOCATION'], 'global');
        $this->model = $this->envValue(['VERTEX_MODEL', 'GEMINI_VERTEX_MODEL', 'GEMINI_MODEL'], 'gemini-2.5-flash');
        $this->apiKey = $this->envValue(['VERTEX_API_KEY', 'GOOGLE_API_KEY']);

        $encoded = $this->envValue(['VERTEX_SERVICE_ACCOUNT_JSON_BASE64', 'GOOGLE_SERVICE_ACCOUNT_JSON_BASE64', 'GOOGLE_APPLICATION_CREDENTIALS_JSON_BASE64']);
        if ($encoded !== '') {
            $json = base64_decode($encoded, true);
            $this->serviceAccount = $json ? json_decode($json, true) : null;
        }
    }

    public function isConfigured() {
        return $this->hasApiKeyAuth() || $this->hasServiceAccountAuth();
    }

    private function hasApiKeyAuth() {
        return $this->apiKey !== '';
    }

    private function hasServiceAccountAuth() {
        return $this->projectId !== ''
            && is_array($this->serviceAccount)
            && !empty($this->serviceAccount['client_email'])
            && !empty($this->serviceAccount['private_key']);
    }

    public function diagnostics() {
        return [
            'configured' => $this->isConfigured(),
            'auth_mode' => $this->hasApiKeyAuth() ? 'api_key' : ($this->hasServiceAccountAuth() ? 'service_account' : 'none'),
            'project_id_present' => $this->projectId !== '',
            'location' => $this->location,
            'model' => $this->model,
            'api_key' => $this->describeEnv(['VERTEX_API_KEY', 'GOOGLE_API_KEY']),
            'service_account_json' => $this->describeEnv(['VERTEX_SERVICE_ACCOUNT_JSON_BASE64', 'GOOGLE_SERVICE_ACCOUNT_JSON_BASE64', 'GOOGLE_APPLICATION_CREDENTIALS_JSON_BASE64']),
            'service_account_valid' => $this->hasServiceAccountAuth()
        ];
    }

    public function extractStructuredDocument($filePath, $mimeType, $prompt, $schema) {
        if (!$this->isConfigured()) {
            throw new Exception('Vertex AI no esta configurado. Configure GOOGLE_API_KEY o VERTEX_SERVICE_ACCOUNT_JSON_BASE64.');
        }

        if (!is_readable($filePath)) {
            throw new Exception('No se puede leer el archivo para procesarlo.');
        }

        $fileBytes = file_get_contents($filePath);
        if ($fileBytes === false || $fileBytes === '') {
            throw new Exception('El archivo esta vacio o no se pudo leer.');
        }

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

        $endpoint = $this->buildGenerateContentEndpoint();
        $response = $this->postJson($endpoint['url'], $body, $endpoint['headers']);

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

    private function buildGenerateContentEndpoint() {
        $endpointHost = $this->location === 'global'
            ? 'aiplatform.googleapis.com'
            : $this->location . '-aiplatform.googleapis.com';

        if ($this->hasApiKeyAuth()) {
            return [
                'url' => sprintf(
                    'https://%s/v1/publishers/google/models/%s:generateContent?key=%s',
                    $endpointHost,
                    rawurlencode($this->model),
                    rawurlencode($this->apiKey)
                ),
                'headers' => []
            ];
        }

        $modelName = sprintf(
            'projects/%s/locations/%s/publishers/google/models/%s',
            $this->projectId,
            $this->location,
            $this->model
        );

        return [
            'url' => sprintf('https://%s/v1/%s:generateContent', $endpointHost, $modelName),
            'headers' => ['Authorization: Bearer ' . $this->getAccessToken()]
        ];
    }

    private function envValue($keys, $default = '') {
        foreach ($keys as $key) {
            $value = getenv($key);
            if ($value !== false && trim((string)$value) !== '') {
                return trim((string)$value);
            }
            if (isset($_ENV[$key]) && trim((string)$_ENV[$key]) !== '') {
                return trim((string)$_ENV[$key]);
            }
            if (isset($_SERVER[$key]) && trim((string)$_SERVER[$key]) !== '') {
                return trim((string)$_SERVER[$key]);
            }
        }
        return $default;
    }

    private function describeEnv($keys) {
        $items = [];
        foreach ($keys as $key) {
            $sources = [];
            $value = false;
            $fromGetenv = getenv($key);
            if ($fromGetenv !== false && trim((string)$fromGetenv) !== '') {
                $sources[] = 'getenv';
                $value = (string)$fromGetenv;
            }
            if (isset($_ENV[$key]) && trim((string)$_ENV[$key]) !== '') {
                $sources[] = '_ENV';
                if ($value === false) $value = (string)$_ENV[$key];
            }
            if (isset($_SERVER[$key]) && trim((string)$_SERVER[$key]) !== '') {
                $sources[] = '_SERVER';
                if ($value === false) $value = (string)$_SERVER[$key];
            }
            $items[$key] = [
                'present' => $value !== false && trim($value) !== '',
                'length' => $value === false ? 0 : strlen(trim($value)),
                'sources' => $sources
            ];
        }
        return $items;
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
