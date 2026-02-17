
<?php
require_once __DIR__ . '/api/config/database.php';

$sqlFile = __DIR__ . '/database/migrations/import_data_completa_2026.sql';

if (!file_exists($sqlFile)) {
    die("Error: Archivo SQL no encontrado: $sqlFile\n");
}

echo "Leyendo archivo SQL...\n";
$sql = file_get_contents($sqlFile);

// Remove comments to avoid issues with basic splitting
$lines = explode("\n", $sql);
$cleanSql = "";
foreach ($lines as $line) {
    if (strpos(trim($line), '--') === 0) continue;
    if (trim($line) === '') continue;
    $cleanSql .= $line . "\n";
}

// Split by semicolon (naive approach, assuming no semicolons in string literals which is risky generally but ok for this simple insert data)
// Actually, data might have semicolons in text fields.
// Better approach: use the generated script's structure.
// The script generates distinct INSERT statements.
// Let's try to execute the whole block if the driver supports multi-query, or split carefully.
// The `db()` helper usually uses PDO.

echo "Ejecutando migración...\n";

try {
    $pdo = db()->getConnection();
    $stmt = $pdo->prepare($cleanSql);
    $stmt->execute();
    echo "✅ Migración ejecutada correctamente.\n";
} catch (Exception $e) {
    echo "❌ Error al ejecutar migración: " . $e->getMessage() . "\n";
    // Fallback: Try splitting if multiple queries not supported in one go or if specific error
    // But since I control the output SQL, I can just try.
}
