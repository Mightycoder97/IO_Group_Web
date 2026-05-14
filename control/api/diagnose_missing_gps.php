<?php
/**
 * Diagnóstico: encuentra sedes sin GPS válido según la lógica del frontend (parseGPS)
 * Uso: php diagnose_missing_gps.php o acceder vía navegador
 */
header('Content-Type: text/plain; charset=utf-8');
require_once __DIR__ . '/config/database.php';

echo "=== Diagnóstico de Sedes sin GPS Válido ===\n";
echo "Lógica: parseGPS del frontend (listar.html:2236)\n";
echo "  1. coordenadas_gps no puede ser NULL o vacío\n";
echo "  2. Debe tener formato 'lat,lng' y ser números finitos\n";
echo "  3. Lat entre -18 y -3, Lng entre -82 y -68 (Perú)\n\n";

// 1. Sin coordenadas (NULL o vacío)
$sinCoords = db()->query("
    SELECT id_sede, nombre_comercial, distrito, provincia, departamento, coordenadas_gps
    FROM Sede
    WHERE activo = 1
      AND (coordenadas_gps IS NULL OR TRIM(coordenadas_gps) = '')
    ORDER BY id_sede
");

echo "--- 1. Sedes con coordenadas_gps NULL o vacío ---\n";
if (count($sinCoords) === 0) {
    echo "  ✓ Ninguna\n\n";
} else {
    echo "  ✗ " . count($sinCoords) . " encontradas:\n";
    foreach ($sinCoords as $s) {
        echo "    id_sede={$s['id_sede']} | {$s['nombre_comercial']} | {$s['distrito']}, {$s['provincia']}\n";
    }
    echo "\n";
}

// 2. Sin coma (formato inválido)
$sinComa = db()->query("
    SELECT id_sede, nombre_comercial, distrito, provincia, coordenadas_gps
    FROM Sede
    WHERE activo = 1
      AND coordenadas_gps IS NOT NULL
      AND TRIM(coordenadas_gps) != ''
      AND coordenadas_gps NOT LIKE '%,%'
    ORDER BY id_sede
");

echo "--- 2. Sedes con coordenadas_gps sin coma (formato inválido) ---\n";
if (count($sinComa) === 0) {
    echo "  ✓ Ninguna\n\n";
} else {
    echo "  ✗ " . count($sinComa) . " encontradas:\n";
    foreach ($sinComa as $s) {
        echo "    id_sede={$s['id_sede']} | {$s['nombre_comercial']} | valor='{$s['coordenadas_gps']}'\n";
    }
    echo "\n";
}

// 3. Con coma pero fuera de los límites de Perú
// Hacemos el parse en PHP que es equivalente al JS
$todasConCoords = db()->query("
    SELECT id_sede, nombre_comercial, direccion, distrito, provincia, departamento, coordenadas_gps
    FROM Sede
    WHERE activo = 1
      AND coordenadas_gps IS NOT NULL
      AND TRIM(coordenadas_gps) != ''
      AND coordenadas_gps LIKE '%,%'
    ORDER BY id_sede
");

echo "--- 3. Sedes con coordenadas fuera de los límites de Perú ---\n";
$fueraDeLimites = [];
foreach ($todasConCoords as $s) {
    $parts = explode(',', $s['coordenadas_gps']);
    $lat = floatval(trim($parts[0]));
    $lng = floatval(trim($parts[1] ?? ''));
    if (!is_finite($lat) || !is_finite($lng)) {
        $fueraDeLimites[] = $s + ['razon' => "No son números finitos: lat=$lat, lng=$lng"];
    } elseif ($lat < -18 || $lat > -3 || $lng < -82 || $lng > -68) {
        $fueraDeLimites[] = $s + ['razon' => "Fuera de Perú: lat={$lat}, lng={$lng}"];
    }
}

if (count($fueraDeLimites) === 0) {
    echo "  ✓ Ninguna\n\n";
} else {
    echo "  ✗ " . count($fueraDeLimites) . " encontradas:\n";
    foreach ($fueraDeLimites as $s) {
        echo "    id_sede={$s['id_sede']} | {$s['nombre_comercial']} | {$s['coordenadas_gps']} | {$s['razon']}\n";
    }
    echo "\n";
}

// RESUMEN
$totalMal = count($sinCoords) + count($sinComa) + count($fueraDeLimites);
echo "=== RESUMEN ===\n";
echo "Total sedes con problemas de GPS: $totalMal\n";

if ($totalMal === 0) {
    echo "✓ Todas las sedes activas tienen GPS válido.\n";
} else {
    echo "\nPara ejecutar geocodificación de las que faltan:\n";
    echo "  php geocode_sedes_now.php\n";
}

// También mostramos info sobre sedes inactivas sin GPS
$inactivasSinGPS = db()->query("
    SELECT COUNT(*) as c FROM Sede
    WHERE activo = 0
      AND (coordenadas_gps IS NULL OR TRIM(coordenadas_gps) = '')
");
$c = $inactivasSinGPS[0]['c'];
if ($c > 0) {
    echo "\nNota: Hay $c sedes INACTIVAS sin GPS (no afectan el mapa/rutas).\n";
}
