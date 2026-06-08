<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/config/database.php';

try {
    echo "Attempting database connection...\n";
    $db = Database::getInstance()->getConnection();
    echo "Connection successful!\n";
    
    // Check if we can list tables
    $stmt = $db->query("SHOW TABLES");
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);
    echo "Tables in database:\n";
    print_r($tables);
} catch (Exception $e) {
    echo "Connection failed: " . $e->getMessage() . "\n";
}
