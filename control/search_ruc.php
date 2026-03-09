<?php
require_once __DIR__ . '/api/config/database.php';

try {
    $pdo = db()->getConnection();
    
    echo "--- Buscando en Cliente ---\n";
    $stmt = $pdo->query("SELECT * FROM Cliente WHERE dni = '10214843183' OR nombre LIKE '%10214843183%'");
    print_r($stmt->fetchAll(PDO::FETCH_ASSOC));
    
    echo "--- Buscando en Empresa ---\n";
    $stmt = $pdo->query("SELECT * FROM Empresa WHERE ruc = '10214843183'");
    print_r($stmt->fetchAll(PDO::FETCH_ASSOC));
    
    echo "--- Buscando en DATA cruda (si existe tabla temporal) ---\n";
    $tables = $pdo->query("SHOW TABLES LIKE '%2026%'")->fetchAll(PDO::FETCH_COLUMN);
    foreach ($tables as $t) {
        echo "Tabla: $t\n";
        // Check if there are columns like ruc or cliente
        $cols = $pdo->query("SHOW COLUMNS FROM `$t`")->fetchAll(PDO::FETCH_COLUMN);
        $condition = [];
        foreach ($cols as $c) {
            $condition[] = "`$c` LIKE '%10214843183%'";
        }
        if (!empty($condition)) {
            $where = implode(' OR ', $condition);
            $stmt = $pdo->query("SELECT * FROM `$t` WHERE $where");
            $res = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($res) print_r($res);
        }
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
