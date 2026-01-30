<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: text/plain');

require_once __DIR__ . '/config/database.php';

echo "=== Debug Ruta ID 202 ===\n\n";

try {
    $ruta = db()->queryOne(
        "SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca
         FROM Ruta r 
         INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo 
         WHERE r.id_ruta = ?",
        [202]
    );
    echo "1. Ruta: " . ($ruta ? "Found" : "Not found") . "\n";
    if ($ruta) print_r($ruta);
} catch (Exception $e) {
    echo "1. ERROR: " . $e->getMessage() . "\n";
}

echo "\n2. Testing Servicio query...\n";
try {
    $servicios = db()->query(
        "SELECT s.*, se.nombre_comercial as sede_nombre, se.distrito, se.direccion, se.telefono
         FROM Servicio s 
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         WHERE s.id_ruta = ? ORDER BY s.id_servicio",
        [202]
    );
    echo "   Found: " . count($servicios) . " servicios\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "\n3. Checking Servicio table columns...\n";
try {
    $cols = db()->query("SHOW COLUMNS FROM Servicio");
    echo "   Columns: " . implode(', ', array_column($cols, 'Field')) . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}
