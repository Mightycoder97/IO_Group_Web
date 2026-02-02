<?php
/**
 * Geocode all sedes using Google Maps API
 * Run this script from command line: php geocode_sedes_google.php
 */

require_once __DIR__ . '/config/database.php';
$mapsConfig = require_once __DIR__ . '/config/maps.php';
$GOOGLE_API_KEY = $mapsConfig['api_key'];

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
    
    // Call Google Maps Geocoding API
    $url = "https://maps.googleapis.com/maps/api/geocode/json";
    $url .= "?address=" . urlencode($fullAddress);
    $url .= "&key=" . $GOOGLE_API_KEY;
    $url .= "&region=pe&language=es";
    
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
    
    if ($data['status'] !== 'OK') {
        echo "ERROR ({$data['status']})\n";
        $errors[] = ['id' => $id, 'error' => $data['status'], 'address' => $fullAddress];
        continue;
    }
    
    if (empty($data['results'])) {
        echo "NOT FOUND\n";
        $errors[] = ['id' => $id, 'error' => 'No results', 'address' => $fullAddress];
        continue;
    }
    
    $result = $data['results'][0];
    $location = $result['geometry']['location'];
    $lat = $location['lat'];
    $lng = $location['lng'];
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
        'place_name' => $result['formatted_address']
    ];
    
    $updates[] = "UPDATE Sede SET coordenadas_gps = '$coordsGps', fecha_modificacion = NOW() WHERE id_sede = $id;";
    
    // Rate limiting - Google standard is 50 requests/sec, but let's be safe
    usleep(100000); // 100ms delay
}

echo "\n=== RESULTS ===\n";
echo "Successfully geocoded: " . count($results) . "\n";
echo "Errors: " . count($errors) . "\n\n";

// Output SQL file
$sqlFile = __DIR__ . '/geocode_updates.sql';
$sqlContent = "-- Google Maps Geocoding Updates - Generated " . date('Y-m-d H:i:s') . "\n";
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
