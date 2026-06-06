<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

/**
 * Public browser Maps configuration for authenticated screens.
 * Google Maps browser keys are public by design; restrict the key by HTTP referrer in Google Cloud.
 */

require_once __DIR__ . '/config/jwt.php';

canView();

// Load API key from environment directly, with optional fallback to maps.php config file if exists
$apiKey = '';
$mapsConfigPath = __DIR__ . '/config/maps.php';
if (file_exists($mapsConfigPath)) {
    $mapsConfig = include $mapsConfigPath;
    $apiKey = trim($mapsConfig['api_key'] ?? '');
}
if ($apiKey === '') {
    $apiKey = trim(getenv('GOOGLE_MAPS_API_KEY') ?: '');
}
$configured = $apiKey !== '' && stripos($apiKey, 'YOUR_') === false;

echo json_encode([
    'success' => true,
    'data' => [
        'configured' => $configured,
        'googleMapsApiKey' => $configured ? $apiKey : null,
    ],
]);
