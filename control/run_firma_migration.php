<?php
/**
 * Migration: Create FirmaDigital table
 * Run this once on the server, then delete the file.
 */
require_once __DIR__ . '/api/config/database.php';

try {
    $pdo = db()->getConnection();
    
    $pdo->exec("CREATE TABLE IF NOT EXISTS FirmaDigital (
        id_firma INT AUTO_INCREMENT PRIMARY KEY,
        id_proceso INT NOT NULL,
        token VARCHAR(64) NOT NULL UNIQUE,
        firmado TINYINT(1) DEFAULT 0,
        firma_imagen VARCHAR(500) NULL,
        ip_firmante VARCHAR(45) NULL,
        user_agent TEXT NULL,
        fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
        fecha_firma DATETIME NULL,
        FOREIGN KEY (id_proceso) REFERENCES ProcesoAlta(id_proceso) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
    
    echo "✅ Table 'FirmaDigital' created successfully.\n";
    
    // Also ensure uploads/firmas directory exists
    $firmasDir = __DIR__ . '/uploads/firmas';
    if (!is_dir($firmasDir)) {
        mkdir($firmasDir, 0755, true);
        echo "✅ Directory 'uploads/firmas' created.\n";
    } else {
        echo "ℹ️ Directory 'uploads/firmas' already exists.\n";
    }
    
} catch (Exception $e) {
    echo "❌ Error: " . $e->getMessage() . "\n";
}
