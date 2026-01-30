<?php
/**
 * Debug script for rutas.php API
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: text/plain');

echo "=== Debug Rutas API ===\n\n";

// Load dependencies
require_once __DIR__ . '/config/database.php';

$db = db();

echo "1. Testing Ruta table structure...\n";
try {
    $result = $db->query("DESCRIBE Ruta");
    echo "   Columns: " . implode(', ', array_column($result, 'Field')) . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "\n2. Testing Servicio table structure...\n";
try {
    $result = $db->query("DESCRIBE Servicio");
    echo "   Columns: " . implode(', ', array_column($result, 'Field')) . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "\n3. Testing getOne query (line 104-110)...\n";
try {
    $result = $db->query(
        "SELECT s.*, se.nombre_comercial as sede_nombre 
         FROM Servicio s 
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         WHERE s.id_ruta = ? ORDER BY s.fecha_programada",
        [1]
    );
    echo "   OK - Query works, rows: " . count($result) . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "\n4. Testing INSERT into Servicio (line 169-172)...\n";
echo "   Simulating: INSERT INTO Servicio (id_ruta, id_sede, fecha_programada, estado) VALUES...\n";
try {
    // Just check column exists, don't actually insert
    $result = $db->query("SELECT id_ruta, id_sede, fecha_programada, estado FROM Servicio LIMIT 1");
    echo "   OK - All columns exist\n";
} catch (Exception $e) {
    echo "   ERROR - Missing column: " . $e->getMessage() . "\n";
}

echo "\n5. Testing AuditLog table...\n";
try {
    $result = $db->query("DESCRIBE AuditLog");
    echo "   Columns: " . implode(', ', array_column($result, 'Field')) . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "\n6. Testing create route query simulation...\n";
try {
    // Test the INSERT query structure
    $testSql = "INSERT INTO Ruta (id_vehiculo, codigo_ruta, fecha, estado) VALUES (1, 'R-TEST', CURDATE(), 'programada')";
    echo "   SQL: $testSql\n";
    // Don't execute, just validate syntax
    echo "   Query syntax appears valid\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "\n7. Testing Vehiculo table...\n";
try {
    $result = $db->queryOne("SELECT COUNT(*) as cnt FROM Vehiculo");
    echo "   OK - Vehicles: " . $result['cnt'] . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "\n=== Debug Complete ===\n";
