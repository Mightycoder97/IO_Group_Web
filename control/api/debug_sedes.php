<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once __DIR__ . '/config/database.php';

try {
    echo "Checking Sedes for Map...\n";
    
    // Exact query from sedes.php
    $sql = "SELECT s.id_sede, s.nombre_comercial, s.direccion, s.distrito, s.provincia,
            s.coordenadas_gps, e.razon_social as empresa_razon_social,
            (SELECT cs.frecuencia FROM ContratoServicio cs 
                WHERE cs.id_sede = s.id_sede AND cs.activo = 1 
                ORDER BY cs.fecha_inicio DESC LIMIT 1) as frecuencia
            FROM Sede s
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            WHERE s.coordenadas_gps IS NOT NULL AND s.coordenadas_gps != '' AND s.activo = 1
            ORDER BY s.nombre_comercial";
            
    $data = db()->query($sql);
    
    echo "Count: " . count($data) . "\n";
    echo "First 3 rows:\n";
    print_r(array_slice($data, 0, 3));
    
    // Check total active sedes regardless of coordinates
    $totalSql = "SELECT COUNT(*) as total FROM Sede WHERE activo = 1";
    $total = db()->queryOne($totalSql);
    echo "\nTotal Active Sedes: " . $total['total'] . "\n";
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
    echo "Trace: " . $e->getTraceAsString() . "\n";
}
