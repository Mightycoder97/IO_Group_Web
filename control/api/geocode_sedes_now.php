<?php
/**
 * Geocode all sedes that are missing GPS coordinates.
 * 
 * Run from browser: https://iogroup.pe/control/api/geocode_sedes_now.php
 * Or CLI: php geocode_sedes_now.php
 * 
 * Outputs SQL file + JSON results
 */

header('Content-Type: text/plain; charset=utf-8');

require_once __DIR__ . '/config/database.php';

// API Key (from config.js)
$GOOGLE_API_KEY = 'AIzaSyA5BSUAso_yWVNijpWB1NbHhhX5n4HIwsU';

echo "=== IO Group - Geocodificacion de Sedes ===\n\n";

// Get all active sedes with addresses but WITHOUT coordinates
$sedes = db()->query("
    SELECT id_sede, nombre_comercial, direccion, distrito, provincia, departamento, coordenadas_gps
    FROM Sede 
    WHERE activo = 1 
    AND direccion IS NOT NULL 
    AND direccion != ''
    AND (coordenadas_gps IS NULL OR coordenadas_gps = '' OR TRIM(coordenadas_gps) = '')
    ORDER BY id_sede
");

$totalAll = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE activo = 1")['c'];
$totalWithCoords = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE activo = 1 AND coordenadas_gps IS NOT NULL AND coordenadas_gps != ''")['c'];

echo "Total sedes activas: $totalAll\n";
echo "Con coordenadas: $totalWithCoords\n";
echo "Sin coordenadas (a geocodificar): " . count($sedes) . "\n\n";

if (count($sedes) === 0) {
    echo "¡Todas las sedes ya tienen coordenadas!\n";
    exit;
}

$results = [];
$updates = [];
$errors = [];

foreach ($sedes as $sede) {
    $id = $sede['id_sede'];
    $address = trim($sede['direccion']);
    $distrito = trim($sede['distrito'] ?? '');
    $provincia = trim($sede['provincia'] ?? '');
    $departamento = trim($sede['departamento'] ?? '');
    
    // Build full address for geocoding
    $fullAddress = $address;
    if ($distrito && stripos($address, $distrito) === false) {
        $fullAddress .= ", " . $distrito;
    }
    if ($provincia && $provincia !== $distrito && stripos($address, $provincia) === false) {
        $fullAddress .= ", " . $provincia;
    }
    $fullAddress .= ", Peru";
    
    echo "[$id] {$sede['nombre_comercial']}\n";
    echo "    Direccion: $fullAddress\n";
    echo "    ";
    
    // Call Google Maps Geocoding API
    $url = "https://maps.googleapis.com/maps/api/geocode/json"
         . "?address=" . urlencode($fullAddress)
         . "&key=" . $GOOGLE_API_KEY
         . "&region=pe&language=es";
    
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 15);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $curlError = curl_error($ch);
    curl_close($ch);
    
    if ($curlError) {
        echo "CURL ERROR: $curlError\n\n";
        $errors[] = ['id' => $id, 'nombre' => $sede['nombre_comercial'], 'error' => "CURL: $curlError", 'address' => $fullAddress];
        continue;
    }
    
    if ($httpCode !== 200) {
        echo "HTTP ERROR ($httpCode)\n\n";
        $errors[] = ['id' => $id, 'nombre' => $sede['nombre_comercial'], 'error' => "HTTP $httpCode", 'address' => $fullAddress];
        continue;
    }
    
    $data = json_decode($response, true);
    
    if (!$data || $data['status'] !== 'OK') {
        $status = $data['status'] ?? 'UNKNOWN';
        $errorMsg = $data['error_message'] ?? '';
        echo "API ERROR ($status) $errorMsg\n\n";
        $errors[] = ['id' => $id, 'nombre' => $sede['nombre_comercial'], 'error' => "$status $errorMsg", 'address' => $fullAddress];
        
        // If REQUEST_DENIED, the key might be invalid - stop
        if ($status === 'REQUEST_DENIED') {
            echo "\n*** API KEY DENIED - Stopping. Check that Geocoding API is enabled for this key. ***\n";
            break;
        }
        continue;
    }
    
    if (empty($data['results'])) {
        echo "NO RESULTS\n\n";
        $errors[] = ['id' => $id, 'nombre' => $sede['nombre_comercial'], 'error' => 'No results found', 'address' => $fullAddress];
        continue;
    }
    
    $result = $data['results'][0];
    $location = $result['geometry']['location'];
    $lat = round($location['lat'], 6);
    $lng = round($location['lng'], 6);
    $coordsGps = "$lat,$lng";
    
    echo "OK -> $coordsGps ({$result['formatted_address']})\n\n";
    
    $results[] = [
        'id_sede' => $id,
        'nombre' => $sede['nombre_comercial'],
        'direccion_buscada' => $fullAddress,
        'coordenadas' => $coordsGps,
        'google_address' => $result['formatted_address']
    ];
    
    // Escape for SQL
    $safeCoords = addslashes($coordsGps);
    $updates[] = "UPDATE Sede SET coordenadas_gps = '$safeCoords' WHERE id_sede = $id;";
    
    // Rate limiting
    usleep(200000); // 200ms between requests
}

echo "\n========================================\n";
echo "RESULTADOS\n";
echo "========================================\n";
echo "Geocodificadas exitosamente: " . count($results) . "\n";
echo "Errores: " . count($errors) . "\n\n";

// Generate SQL file
if (count($updates) > 0) {
    $sqlContent = "-- Geocoding GPS Updates - Generado " . date('Y-m-d H:i:s') . "\n";
    $sqlContent .= "-- Total actualizaciones: " . count($updates) . "\n\n";
    $sqlContent .= implode("\n", $updates) . "\n";
    
    $sqlFile = __DIR__ . '/../database/migrations/geocode_coordinates.sql';
    file_put_contents($sqlFile, $sqlContent);
    echo "Archivo SQL guardado en: $sqlFile\n";
    
    // Also output the SQL directly
    echo "\n========================================\n";
    echo "SQL OUTPUT (copiar y ejecutar):\n";
    echo "========================================\n\n";
    echo $sqlContent;
}

// Output errors
if (!empty($errors)) {
    echo "\n========================================\n";
    echo "ERRORES DETALLADOS\n";
    echo "========================================\n";
    foreach ($errors as $err) {
        echo "  ID {$err['id']} ({$err['nombre']}): {$err['error']}\n";
        echo "    Direccion: {$err['address']}\n\n";
    }
}

// Save JSON results
$jsonFile = __DIR__ . '/geocode_results.json';
file_put_contents($jsonFile, json_encode([
    'generated' => date('Y-m-d H:i:s'),
    'total_sedes' => count($sedes),
    'successful' => count($results),
    'errors' => count($errors),
    'results' => $results,
    'error_details' => $errors
], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));

echo "\nJSON guardado en: $jsonFile\n";
echo "\n=== FIN ===\n";
