<?php
/**
 * Debug script for dashboard API - Updated for new schema
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: text/plain');

echo "=== Debug Dashboard API (Updated) ===\n\n";

// Load dependencies
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$db = db();

echo "1. Testing Sede query...\n";
try {
    $result = $db->queryOne("SELECT COUNT(*) as count FROM Sede WHERE activo = 1");
    echo "   OK - Sedes activas: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "2. Testing Servicio with fecha_ejecucion...\n";
try {
    $result = $db->queryOne(
        "SELECT COUNT(DISTINCT s.id_sede) as count 
         FROM Servicio sv 
         INNER JOIN Sede s ON sv.id_sede = s.id_sede
         WHERE MONTH(sv.fecha_ejecucion) = MONTH(CURDATE()) 
         AND YEAR(sv.fecha_ejecucion) = YEAR(CURDATE())
         AND sv.estado IN ('completado', 'en_curso', 'programado')"
    );
    echo "   OK - Sedes con servicio: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "3. Testing Facturacion 12 meses (new schema)...\n";
try {
    $result = $db->query(
        "SELECT 
            DATE_FORMAT(s.fecha_ejecucion, '%Y-%m') as mes,
            DATE_FORMAT(s.fecha_ejecucion, '%b %Y') as mes_label,
            COALESCE(SUM(se.tarifa_servicio), 0) as total
         FROM Servicio s
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Factura f ON s.id_servicio = f.id_servicio
         WHERE s.fecha_ejecucion >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
         AND s.estado = 'completado'
         GROUP BY DATE_FORMAT(s.fecha_ejecucion, '%Y-%m')
         ORDER BY mes ASC"
    );
    echo "   OK - Rows: " . count($result) . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "4. Testing Pagos pendientes (estado_pago)...\n";
try {
    $result = $db->queryOne(
        "SELECT 
            COUNT(*) as total_facturas,
            COALESCE(SUM(se.tarifa_servicio), 0) as monto_total
         FROM Servicio s
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         WHERE s.estado = 'completado'
         AND COALESCE(s.estado_pago, 'pendiente') = 'pendiente'"
    );
    echo "   OK - Facturas: " . ($result ? $result['total_facturas'] : 'NULL') . ", Monto: " . ($result ? $result['monto_total'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "5. Testing Empresas pendientes...\n";
try {
    $result = $db->queryOne(
        "SELECT COUNT(DISTINCT e.id_empresa) as count
         FROM Servicio s
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         WHERE s.estado = 'completado'
         AND COALESCE(s.estado_pago, 'pendiente') = 'pendiente'"
    );
    echo "   OK - Empresas: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "6. Testing Ingresos mes...\n";
try {
    $result = $db->queryOne(
        "SELECT COALESCE(SUM(se.tarifa_servicio), 0) as total 
         FROM Servicio s
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         WHERE MONTH(s.fecha_ejecucion) = MONTH(CURDATE()) 
         AND YEAR(s.fecha_ejecucion) = YEAR(CURDATE())
         AND s.estado = 'completado'
         AND s.estado_pago = 'pagado'"
    );
    echo "   OK - Ingresos: " . ($result ? $result['total'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "7. Testing Servicios mes (fecha_ejecucion)...\n";
try {
    $result = $db->queryOne(
        "SELECT COUNT(*) as count FROM Servicio 
         WHERE MONTH(fecha_ejecucion) = MONTH(CURDATE()) AND YEAR(fecha_ejecucion) = YEAR(CURDATE())"
    );
    echo "   OK - Servicios: " . ($result ? $result['count'] : 'NULL') . "\n";
} catch (Exception $e) {
    echo "   ERROR: " . $e->getMessage() . "\n";
}

echo "8. Testing Rutas mes...\n";
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
