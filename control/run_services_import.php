<?php
/**
 * IO Group - Importación de Servicios 2026
 * Ejecuta la migración de servicios de Enero-Junio 2026.
 * Uso por línea de comandos:
 *   php control/run_services_import.php          (Modo simulación / dry-run)
 *   php control/run_services_import.php --commit (Modo producción / guarda cambios)
 */

require_once __DIR__ . "/api/config/database.php";

$commit = in_array('--commit', $argv);
$sql_file = __DIR__ . "/database/migrations/import_servicios_2026_lima_sur.sql";

if (!file_exists($sql_file)) {
    echo "Error: Archivo SQL no encontrado en: $sql_file\n";
    exit(1);
}

echo "=== MIGRACIÓN DE SERVICIOS 2026 (LIMA Y SUR) ===\n";
echo "Archivo: " . basename($sql_file) . "\n";
echo "Modo: " . ($commit ? "PRODUCCIÓN (COMMIT)" : "SIMULACIÓN (DRY-RUN / ROLLBACK)") . "\n";
echo "------------------------------------------------\n";

try {
    $db = Database::getInstance();
    $pdo = $db->getConnection();
    
    echo "Conexión a la base de datos establecida exitosamente.\n";
    
    // Read SQL file
    echo "Leyendo archivo SQL...\n";
    $sql = file_get_contents($sql_file);
    
    // We split statements by semicolon, but we need to be careful with transactions
    // Since PDO doesn't easily run multi-query strings under transactions in some setups,
    // we can either execute the whole batch or parse statements.
    // However, PDO connection allows multi-queries in exec() directly on MySQL.
    // Let's wrap everything in a PHP PDO Transaction so we can control COMMIT vs ROLLBACK.
    
    echo "Iniciando transacción...\n";
    $pdo->beginTransaction();
    
    echo "Ejecutando consultas SQL (esto puede tomar unos segundos)...\n";
    $start_time = microtime(true);
    
    // Execute the raw SQL string
    $pdo->exec($sql);
    
    $elapsed = round(microtime(true) - $start_time, 2);
    echo "Consultas ejecutadas con éxito en $elapsed segundos.\n";
    
    // Count inserted records for verification
    $srv_count = $pdo->query("SELECT COUNT(*) FROM Servicio WHERE id_servicio >= 50000")->fetchColumn();
    $man_count = $pdo->query("SELECT COUNT(*) FROM Manifiesto WHERE id_manifiesto >= 80000")->fetchColumn();
    $guia_count = $pdo->query("SELECT COUNT(*) FROM Guia WHERE id_guia >= 3000")->fetchColumn();
    $fac_count = $pdo->query("SELECT COUNT(*) FROM Factura WHERE id_factura >= 80000")->fetchColumn();
    
    echo "\nEstadísticas de registros procesados en la sesión:\n";
    echo "  - Servicios: $srv_count\n";
    echo "  - Manifiestos: $man_count\n";
    echo "  - Guías de transporte: $guia_count\n";
    echo "  - Facturas: $fac_count\n";
    
    if ($commit) {
        echo "\nGuardando cambios (COMMIT)...\n";
        $pdo->commit();
        echo "¡Importación completada con éxito en la base de datos!\n";
    } else {
        echo "\nDeshaciendo cambios (ROLLBACK)...\n";
        $pdo->rollBack();
        echo "¡Simulación completada con éxito! No se guardó ningún cambio en la base de datos.\n";
    }
    
} catch (PDOException $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    echo "\nError durante la ejecución del SQL:\n";
    echo $e->getMessage() . "\n";
    exit(1);
} catch (Exception $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    echo "\nError general:\n";
    echo $e->getMessage() . "\n";
    exit(1);
}
