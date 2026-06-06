<?php
/**
 * IO Group - Script Temporal v6 de Ejecución de Migración de Servicios 2026
 * 
 * Este script debe ser accedido via HTTP con un token de seguridad:
 * https://iogroup.pe/control/run_db_migration_temp_v6.php?token=io_group_migration_2026_secret_9988
 */

// Deshabilitar salida de errores crudos al navegador, pero logearlos
ini_set('display_errors', 0);
error_reporting(E_ALL);

header('Content-Type: application/json; charset=UTF-8');

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

require_once __DIR__ . "/api/config/config.php";

$sql_file = __DIR__ . "/database/migrations/import_servicios_2026_lima_sur.sql";

if (!file_exists($sql_file)) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Archivo SQL no encontrado en la ruta esperada: " . basename($sql_file)
    ]);
    exit();
}

// Búsqueda recursiva de archivos .env a partir del home del usuario
$found_env_files = [];
function find_env_files($dir, &$results, $depth = 0) {
    if ($depth > 3) return; // Limitar profundidad para evitar timeout
    if (!is_dir($dir) || !is_readable($dir)) return;
    $files = scandir($dir);
    foreach ($files as $file) {
        if ($file === '.' || $file === '..') continue;
        $path = $dir . '/' . $file;
        if (is_dir($path)) {
            if ($file === 'node_modules' || $file === '.git' || $file === 'uploads' || $file === 'docs' || $file === 'excel_data') continue;
            find_env_files($path, $results, $depth + 1);
        } else {
            if (strpos($file, '.env') !== false) {
                $results[] = $path . " (" . (is_readable($path) ? "readable" : "unreadable") . ")";
            }
        }
    }
}

find_env_files("/home/u511863531", $found_env_files);

try {
    // Conexión directa con PDO
    $dsn = "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci",
    ];
    
    $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
    
    // Iniciar transacción
    $pdo->beginTransaction();
    
    // 1. Limpieza de importaciones previas
    $pdo->exec("DELETE FROM Manifiesto WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM Guia WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM Factura WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM ServicioEmpleado WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM GestionCobranza WHERE id_servicio >= 50000");
    $pdo->exec("DELETE FROM Servicio WHERE id_servicio >= 50000");
    
    // 2. Leer y ejecutar el archivo SQL
    $sql_content = file_get_contents($sql_file);
    $pdo->exec($sql_content);
    
    // 3. Obtener estadísticas
    $srv_count = $pdo->query("SELECT COUNT(*) FROM Servicio WHERE id_servicio >= 50000")->fetchColumn();
    $man_count = $pdo->query("SELECT COUNT(*) FROM Manifiesto WHERE id_servicio >= 50000")->fetchColumn();
    $guia_count = $pdo->query("SELECT COUNT(*) FROM Guia WHERE id_servicio >= 50000")->fetchColumn();
    $fac_count = $pdo->query("SELECT COUNT(*) FROM Factura WHERE id_servicio >= 50000")->fetchColumn();
    
    $pdo->commit();
    
    echo json_encode([
        "success" => true,
        "message" => "Migración ejecutada exitosamente y confirmada (COMMIT).",
        "stats" => [
            "servicios" => intval($srv_count),
            "manifiestos" => intval($man_count),
            "guias" => intval($guia_count),
            "facturas" => intval($fac_count)
        ],
        "found_env_files" => $found_env_files
    ]);
    
} catch (PDOException $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Error de base de datos durante la migración: " . $e->getMessage(),
        "connection_details" => [
            "db_host" => DB_HOST,
            "db_port" => DB_PORT,
            "db_name" => DB_NAME,
            "db_user" => DB_USER,
            "env_loaded" => defined("ENV_LOADED") && ENV_LOADED,
            "env_path" => defined("ENV_LOADED_PATH") ? ENV_LOADED_PATH : "not set",
            "found_env_files" => $found_env_files,
            "dir_path" => __DIR__
        ]
    ]);
} catch (Exception $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Error general: " . $e->getMessage(),
        "found_env_files" => $found_env_files
    ]);
}
