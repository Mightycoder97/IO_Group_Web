<?php
/**
 * SUNAT RUC Proxy - Evita problemas de CORS
 * Este archivo actúa como proxy para consultar el API de apis.net.pe
 */

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

// Handle preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// Get RUC from query parameter
$ruc = isset($_GET['ruc']) ? trim($_GET['ruc']) : '';

// Validate RUC
if (empty($ruc) || strlen($ruc) !== 11 || !ctype_digit($ruc)) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'error' => 'RUC inválido. Debe tener 11 dígitos numéricos.'
    ]);
    exit;
}

// API Token - apis.net.pe
$token = 'sk_12866.VCQaSeG78qshfzt3EFgmgfEXO7PH4HEI';

// API URL
$url = "https://api.apis.net.pe/v2/sunat/ruc?numero=" . urlencode($ruc);

// Initialize cURL
$ch = curl_init();
curl_setopt_array($ch, [
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_TIMEOUT => 15,
    CURLOPT_HTTPHEADER => [
        'Accept: application/json',
        'Authorization: Bearer ' . $token
    ],
    CURLOPT_SSL_VERIFYPEER => true,
    CURLOPT_FOLLOWLOCATION => true
]);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$error = curl_error($ch);
curl_close($ch);

// Handle cURL errors
if ($error) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error' => 'Error de conexión: ' . $error
    ]);
    exit;
}

// Parse response
$data = json_decode($response, true);

// Check for API errors
if ($httpCode !== 200) {
    http_response_code($httpCode);
    echo json_encode([
        'success' => false,
        'error' => $data['message'] ?? 'Error del servidor SUNAT',
        'httpCode' => $httpCode
    ]);
    exit;
}

// Return successful response
if ($data && (isset($data['razonSocial']) || isset($data['nombre']))) {
    echo json_encode([
        'success' => true,
        'data' => [
            'ruc' => $ruc,
            'razonSocial' => $data['razonSocial'] ?? $data['nombre'] ?? '',
            'direccion' => $data['direccion'] ?? $data['direccionCompleta'] ?? '',
            'distrito' => $data['distrito'] ?? '',
            'provincia' => $data['provincia'] ?? '',
            'departamento' => $data['departamento'] ?? '',
            'estado' => $data['estado'] ?? '',
            'condicion' => $data['condicion'] ?? '',
            'ubigeo' => $data['ubigeo'] ?? ''
        ]
    ]);
} else {
    echo json_encode([
        'success' => false,
        'error' => 'No se encontraron datos para este RUC'
    ]);
}
