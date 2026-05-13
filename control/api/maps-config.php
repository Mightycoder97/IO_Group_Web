<?php
/**
 * Public browser Maps configuration for authenticated screens.
 * Google Maps browser keys are public by design; restrict the key by HTTP referrer in Google Cloud.
 */

require_once __DIR__ . '/config/jwt.php';

canView();

$mapsConfig = require __DIR__ . '/config/maps.php';
$apiKey = trim($mapsConfig['api_key'] ?? '');
$configured = $apiKey !== '' && stripos($apiKey, 'YOUR_') === false;

echo json_encode([
    'success' => true,
    'data' => [
        'configured' => $configured,
        'googleMapsApiKey' => $configured ? $apiKey : null,
    ],
]);
