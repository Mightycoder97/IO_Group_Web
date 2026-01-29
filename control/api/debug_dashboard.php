<?php
/**
 * Debug script for dashboard API
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: text/plain');

echo "=== Debug Dashboard API ===\n\n";

// Test 1: Load dependencies
echo "1. Loading database config...\n";
try {
    require_once __DIR__ . '/config/database.php';
    echo "   OK\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
    exit;
}

echo "2. Loading JWT config...\n";
try {
    require_once __DIR__ . '/config/jwt.php';
    echo "   OK\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
    exit;
}

echo "3. Testing database connection...\n";
try {
    $db = db();
    echo "   OK - Connected\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
    exit;
}

echo "4. Testing Sede query...\n";
try {
    $result = $db->queryOne("SELECT COUNT(*) as count FROM Sede WHERE activo = 1");
    echo "   OK - Sedes activas: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "5. Testing Servicio query...\n";
try {
    $result = $db->queryOne(
        "SELECT COUNT(DISTINCT s.id_sede) as count 
         FROM Servicio sv 
         INNER JOIN Sede s ON sv.id_sede = s.id_sede
         WHERE MONTH(sv.fecha_programada) = MONTH(CURDATE()) 
         AND YEAR(sv.fecha_programada) = YEAR(CURDATE())
         AND sv.estado IN ('completado', 'en_curso', 'programado')"
    );
    echo "   OK - Sedes con servicio: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "6. Testing Factura 12 meses query...\n";
try {
    $result = $db->query(
        "SELECT 
            DATE_FORMAT(fecha_emision, '%Y-%m') as mes,
            DATE_FORMAT(fecha_emision, '%b %Y') as mes_label,
            COALESCE(SUM(monto_total), 0) as total
         FROM Factura 
         WHERE estado != 'anulada'
         AND fecha_emision >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
         GROUP BY DATE_FORMAT(fecha_emision, '%Y-%m')
         ORDER BY mes ASC"
    );
    echo "   OK - Rows: " . count($result) . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "7. Testing Pagos pendientes query...\n";
try {
    $result = $db->queryOne(
        "SELECT 
            COUNT(*) as total_facturas,
            COALESCE(SUM(f.monto_total), 0) as monto_total
         FROM Factura f
         WHERE f.estado = 'emitida'"
    );
    echo "   OK - Facturas: " . ($result ? $result['total_facturas'] : 'NULL') . ", Monto: " . ($result ? $result['monto_total'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "8. Testing Empresas pendientes query (LEFT JOIN)...\n";
try {
    $result = $db->queryOne(
        "SELECT COUNT(DISTINCT e.id_empresa) as count
         FROM Factura f
         LEFT JOIN Servicio sv ON f.id_servicio = sv.id_servicio
         LEFT JOIN Sede se ON sv.id_sede = se.id_sede
         LEFT JOIN Empresa e ON se.id_empresa = e.id_empresa
         WHERE f.estado = 'emitida'
         AND e.id_empresa IS NOT NULL"
    );
    echo "   OK - Empresas: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "9. Testing Ingresos mes query...\n";
try {
    $result = $db->queryOne(
        "SELECT COALESCE(SUM(monto_total), 0) as total FROM Factura 
         WHERE MONTH(fecha_emision) = MONTH(CURDATE()) AND YEAR(fecha_emision) = YEAR(CURDATE())
         AND estado != 'anulada'"
    );
    echo "   OK - Ingresos: " . ($result ? $result['total'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "10. Testing Servicios mes query...\n";
try {
    $result = $db->queryOne(
        "SELECT COUNT(*) as count FROM Servicio 
         WHERE MONTH(fecha_programada) = MONTH(CURDATE()) AND YEAR(fecha_programada) = YEAR(CURDATE())"
    );
    echo "   OK - Servicios: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "11. Testing Rutas mes query...\n";
try {
    $result = $db->queryOne(
        "SELECT COUNT(*) as count FROM Ruta 
         WHERE MONTH(fecha) = MONTH(CURDATE()) AND YEAR(fecha) = YEAR(CURDATE())"
    );
    echo "   OK - Rutas: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "\n=== Debug Complete ===\n";
