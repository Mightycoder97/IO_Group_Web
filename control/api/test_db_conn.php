<?php
require_once __DIR__ . '/config/config.php';

header('Content-Type: text/plain; charset=UTF-8');

try {
    echo "--- DIAGNÓSTICO DE CONEXIÓN A BASE DE DATOS ---\n";
    echo "Host: " . DB_HOST . "\n";
    echo "User: " . DB_USER . "\n";
    echo "DB: " . DB_NAME . "\n";
    echo "Port: " . DB_PORT . "\n";
    echo "Charset: " . DB_CHARSET . "\n";
    echo "Env Loaded: " . (ENV_LOADED ? "SÍ" : "NO") . "\n";
    echo "Env Paths Checked: " . ENV_LOADED_PATH . "\n";
    
    $dsn = "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
    echo "DSN generado: " . $dsn . "\n";
    
    echo "Intentando conexión PDO directa...\n";
    $pdo = new PDO($dsn, DB_USER, DB_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_TIMEOUT => 5
    ]);
    echo "¡Conexión exitosa a la base de datos!\n";
    
    $stmt = $pdo->query("SHOW TABLES");
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);
    echo "Tablas encontradas: " . count($tables) . "\n";
} catch (PDOException $e) {
    echo "ERROR DE CONEXIÓN DIRECTA: " . $e->getMessage() . "\n";
}

