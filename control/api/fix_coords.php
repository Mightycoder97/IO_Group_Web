<?php
// Fix Coordinates Script
// Access this via browser to populate missing GPS coordinates
ini_set('display_errors', 1);
error_reporting(E_ALL);
set_time_limit(300); // 5 minutes

header('Content-Type: text/plain');

require_once __DIR__ . '/config/database.php';

// API Key from environment (SEC-09)
$mapsConfig = require __DIR__ . '/config/maps.php';
$GOOGLE_API_KEY = $mapsConfig['api_key'];

// Function to Geocode
function geocode($address, $key) {
    $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . urlencode($address) . "&key=" . $key . "&region=pe&language=es";
    
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $response = curl_exec($ch);
    curl_close($ch);
    
    if ($response) {
        $json = json_decode($response, true);
        if ($json['status'] === 'OK' && !empty($json['results'])) {
            $loc = $json['results'][0]['geometry']['location'];
            return number_format($loc['lat'], 6, '.', '') . ', ' . number_format($loc['lng'], 6, '.', '');
        }
    }
    return null;
}

echo "Starting Coordinate Fix...\n";

try {
    // 1. Get Sedes without coordinates
    $sql = "SELECT id_sede, nombre_comercial, direccion, distrito, provincia FROM Sede WHERE (coordenadas_gps IS NULL OR coordenadas_gps = '') AND activo = 1";
    $sedes = db()->query($sql);
    
    echo "Found " . count($sedes) . " sedes without coordinates.\n\n";
    
    if (count($sedes) === 0) {
        echo "Nothing to fix.\n";
        exit;
    }
    
    $updated = 0;
    
    foreach ($sedes as $sede) {
        $fullAddress = $sede['direccion'];
        if ($sede['distrito'] && stripos($sede['direccion'], $sede['distrito']) === false) {
            $fullAddress .= ", " . $sede['distrito'];
        }
        $fullAddress .= ", Peru";
        
        echo "Processing [{$sede['id_sede']}] {$sede['nombre_comercial']} ($fullAddress)... ";
        
        $coords = geocode($fullAddress, $GOOGLE_API_KEY);
        
        if ($coords) {
            db()->execute("UPDATE Sede SET coordenadas_gps = ? WHERE id_sede = ?", [$coords, $sede['id_sede']]);
            echo "UPDATED -> $coords\n";
            $updated++;
        } else {
            echo "FAILED (Geocoding)\n";
        }
        
        // Rate limit
        usleep(100000); // 100ms
        flush();
    }
    
    echo "\nCompleted. Updated $updated records.\n";
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
