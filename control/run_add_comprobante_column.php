<?php
/**
 * Migration: Add comprobante_pago column to ContratoServicio table
 * Run this once on the server, then delete the file.
 */
require_once __DIR__ . '/api/config/database.php';

try {
    $pdo = db()->getConnection();
    
    // Check if column already exists
    $stmt = $pdo->query("SHOW COLUMNS FROM ContratoServicio LIKE 'comprobante_pago'");
    if ($stmt->rowCount() === 0) {
        $pdo->exec("ALTER TABLE ContratoServicio ADD COLUMN comprobante_pago VARCHAR(500) NULL AFTER doc_escaneado");
        echo "✅ Column 'comprobante_pago' added to ContratoServicio.\n";
    } else {
        echo "ℹ️ Column 'comprobante_pago' already exists.\n";
    }
    
} catch (Exception $e) {
    echo "❌ Error: " . $e->getMessage() . "\n";
}
