<?php
/**
 * IO Group - Script Temporal de Ejecución de Migración de Servicios 2026
 * 
 * Este script debe ser accedido via HTTP con un token de seguridad:
 * https://iogroup.pe/control/run_db_migration_temp.php?token=io_group_migration_2026_secret_9988
 */

// Deshabilitar salida de errores crudos al navegador, pero logearlos
ini_set('display_errors', 0);
error_reporting(E_ALL);

header('Content-Type: application/json; charset=UTF-8');
putenv("APP_DEBUG=true");

$token = $_GET['token'] ?? '';
$secret = 'io_group_migration_2026_secret_9988';

if ($token !== $secret) {
    http_response_code(403);
    echo json_encode([
        "success" => false,
        "message" => "Acceso denegado. Token inválido."
    ]);
    exit();
}

require_once __DIR__ . "/api/config/database.php";

$sql_file = __DIR__ . "/database/migrations/import_servicios_2026_lima_sur.sql";

if (!file_exists($sql_file)) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Archivo SQL no encontrado en la ruta esperada: " . basename($sql_file)
    ]);
    exit();
}

try {
    $db = Database::getInstance();
    $pdo = $db->getConnection();
    
    // Iniciar transacción
    $pdo->beginTransaction();
    
    // 1. Limpieza de importaciones previas para evitar duplicados y conflictos de PKs
    // Se elimina en orden de dependencias de claves foráneas
    $pdo->exec("DELETE FROM Manifiesto WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM Guia WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM Factura WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM ServicioEmpleado WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM GestionCobranza WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM Servicio WHERE id_servicio >= 50000");
    
    // 2. Leer y ejecutar el archivo SQL
    $sql_content = file_get_contents($sql_file);
    
    // Ejecutar el lote de consultas
    $pdo->exec($sql_content);
    
    // 3. Obtener estadísticas para verificar
    $srv_count = $pdo->query("SELECT COUNT(*) FROM Servicio WHERE id_servicio >= 50000")->fetchColumn();
    $man_count = $pdo->query("SELECT COUNT(*) FROM Manifiesto WHERE id_servicio >= 50000")->fetchColumn();
    $guia_count = $pdo->query("SELECT COUNT(*) FROM Guia WHERE id_servicio >= 50000")->fetchColumn();
    $fac_count = $pdo->query("SELECT COUNT(*) FROM Factura WHERE id_servicio >= 50000")->fetchColumn();
    
    // Si todo salió bien, guardamos cambios
    $pdo->commit();
    
    echo json_encode([
        "success" => true,
        "message" => "Migración ejecutada exitosamente y confirmada (COMMIT).",
        "stats" => [
            "servicios" => intval($srv_count),
            "manifiestos" => intval($man_count),
            "guias" => intval($guia_count),
            "facturas" => intval($fac_count)
        ]
    ]);
    
} catch (PDOException $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Error de PDO durante la migración: " . $e->getMessage()
    ]);
} catch (Exception $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Error general: " . $e->getMessage()
    ]);
}
