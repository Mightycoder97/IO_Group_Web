<?php
require_once __DIR__ . '/api/config/database.php';

$sqlFile = __DIR__ . '/database/migrations/add_tarifa_adicional_kg.sql';

if (!file_exists($sqlFile)) {
    die("Error: SQL file not found: $sqlFile\n");
}

echo "Leyendo archivo SQL...\n";
$sql = file_get_contents($sqlFile);

echo "Ejecutando migración...\n";

try {
    $pdo = db()->getConnection();
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    echo "✅ Migración ejecutada correctamente.\n";
} catch (Exception $e) {
    echo "❌ Error al ejecutar migración: " . $e->getMessage() . "\n";
}
