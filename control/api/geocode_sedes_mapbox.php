<?php
/**
 * Geocode all sedes using Mapbox API
 * Run this script from command line: php geocode_sedes_mapbox.php
 */

require_once __DIR__ . '/config/database.php';

// Mapbox Access Token
$MAPBOX_TOKEN = 'pk.eyJ1IjoibWlnaHR5Y29kZXIiLCJhIjoiY21sMmlpZm92MGkwYTNjcHY1aXg3YzRrdiJ9.Flaa7i5dlavkb4r8P9opvQ';

// Get all active sedes with addresses
$sedes = db()->query("
    SELECT id_sede, nombre_comercial, direccion, distrito, provincia, departamento, coordenadas_gps
    FROM Sede 
    WHERE activo = 1 
    AND direccion IS NOT NULL 
    AND direccion != ''
    ORDER BY id_sede
");

echo "Found " . count($sedes) . " sedes to geocode\n\n";

$results = [];
$updates = [];
$errors = [];

foreach ($sedes as $sede) {
    $id = $sede['id_sede'];
    $address = $sede['direccion'];
    $distrito = $sede['distrito'] ?? '';
    $provincia = $sede['provincia'] ?? '';
    $departamento = $sede['departamento'] ?? '';
    
    // Build full address for geocoding
    $fullAddress = $address;
    if ($distrito) $fullAddress .= ", " . $distrito;
    if ($provincia && $provincia != $distrito) $fullAddress .= ", " . $provincia;
    if ($departamento && $departamento != $provincia) $fullAddress .= ", " . $departamento;
    $fullAddress .= ", Peru";
    
    echo "[$id] Geocoding: $fullAddress ... ";
    
    // Call Mapbox Geocoding API
    $url = "https://api.mapbox.com/geocoding/v5/mapbox.places/" . urlencode($fullAddress) . ".json";
    $url .= "?access_token=" . $MAPBOX_TOKEN;
    $url .= "&country=PE&language=es&limit=1";
    
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    
    if ($httpCode !== 200) {
        echo "ERROR (HTTP $httpCode)\n";
        $errors[] = ['id' => $id, 'error' => "HTTP $httpCode", 'address' => $fullAddress];
        continue;
    }
    
    $data = json_decode($response, true);
    
    if (empty($data['features'])) {
        echo "NOT FOUND\n";
        $errors[] = ['id' => $id, 'error' => 'No results', 'address' => $fullAddress];
        continue;
    }
    
    $feature = $data['features'][0];
    $coords = $feature['geometry']['coordinates']; // [lng, lat]
    $lat = $coords[1];
    $lng = $coords[0];
    $coordsGps = "$lat, $lng";
    
    echo "OK -> $coordsGps\n";
    
    $results[] = [
        'id_sede' => $id,
        'nombre' => $sede['nombre_comercial'],
        'direccion' => $fullAddress,
        'old_coords' => $sede['coordenadas_gps'],
        'new_coords' => $coordsGps,
        'lat' => $lat,
        'lng' => $lng,
        'place_name' => $feature['place_name'] ?? ''
    ];
    
    $updates[] = "UPDATE Sede SET coordenadas_gps = '$coordsGps', fecha_modificacion = NOW() WHERE id_sede = $id;";
    
    // Rate limiting - Mapbox allows many requests but let's be nice
    usleep(100000); // 100ms delay between requests
}

echo "\n=== RESULTS ===\n";
echo "Successfully geocoded: " . count($results) . "\n";
echo "Errors: " . count($errors) . "\n\n";

// Output SQL file
$sqlFile = __DIR__ . '/geocode_updates.sql';
$sqlContent = "-- Mapbox Geocoding Updates - Generated " . date('Y-m-d H:i:s') . "\n";
$sqlContent .= "-- Total updates: " . count($updates) . "\n\n";
$sqlContent .= "START TRANSACTION;\n\n";
$sqlContent .= implode("\n", $updates);
$sqlContent .= "\n\nCOMMIT;\n";

file_put_contents($sqlFile, $sqlContent);
echo "SQL file saved to: $sqlFile\n";

// Also output errors if any
if (!empty($errors)) {
    echo "\n=== ERRORS ===\n";
    foreach ($errors as $err) {
        echo "ID {$err['id']}: {$err['error']} - {$err['address']}\n";
    }
}

// Output JSON results for reference
$jsonFile = __DIR__ . '/geocode_results.json';
file_put_contents($jsonFile, json_encode([
    'generated' => date('Y-m-d H:i:s'),
    'total_sedes' => count($sedes),
    'successful' => count($results),
    'errors' => count($errors),
    'results' => $results,
    'error_details' => $errors
], JSON_PRETTY_PRINT));
echo "JSON results saved to: $jsonFile\n";
