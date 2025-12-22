<?php
/**
 * IO Group - Reportes API
 * Dashboard statistics and reports
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? 'dashboard';

if ($method !== 'GET') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit;
}

canView();

switch ($action) {
    case 'dashboard':
        getDashboard();
        break;
    case 'servicios':
        getServiciosReport();
        break;
    case 'facturacion':
        getFacturacionReport();
        break;
    default:
        getDashboard();
}

function getDashboard() {
    // Basic counts
    $clientes = db()->queryOne("SELECT COUNT(*) as count FROM Cliente WHERE activo = 1")['count'];
    $empresas = db()->queryOne("SELECT COUNT(*) as count FROM Empresa WHERE activo = 1")['count'];
    $sedes = db()->queryOne("SELECT COUNT(*) as count FROM Sede WHERE activo = 1")['count'];
    $empleados = db()->queryOne("SELECT COUNT(*) as count FROM Empleado WHERE activo = 1")['count'];
    $vehiculos = db()->queryOne("SELECT COUNT(*) as count FROM Vehiculo WHERE activo = 1")['count'];
    
    // Services this month
    $serviciosMes = db()->queryOne(
        "SELECT COUNT(*) as count FROM Servicio 
         WHERE MONTH(fecha_programada) = MONTH(CURDATE()) AND YEAR(fecha_programada) = YEAR(CURDATE())"
    )['count'];
    
    // Services by status
    $serviciosPorEstado = db()->query(
        "SELECT estado, COUNT(*) as count FROM Servicio GROUP BY estado"
    );
    
    // Revenue this month
    $ingresosMes = db()->queryOne(
        "SELECT COALESCE(SUM(monto_total), 0) as total FROM Factura 
         WHERE MONTH(fecha_emision) = MONTH(CURDATE()) AND YEAR(fecha_emision) = YEAR(CURDATE())
         AND estado != 'anulada'"
    )['total'];
    
    // Pending invoices
    $facturasPendientes = db()->queryOne(
        "SELECT COUNT(*) as count FROM Factura WHERE estado = 'emitida'"
    )['count'];
    
    // Recent services
    $serviciosRecientes = db()->query(
        "SELECT s.id_servicio, s.codigo_servicio, s.fecha_programada, s.estado,
                se.nombre_comercial as sede_nombre
         FROM Servicio s
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         ORDER BY s.fecha_programada DESC LIMIT 5"
    );
    
    // Total weight this month
    $pesoMes = db()->queryOne(
        "SELECT COALESCE(SUM(m.peso_kg), 0) as total FROM Manifiesto m
         INNER JOIN Servicio s ON m.id_servicio = s.id_servicio
         WHERE MONTH(s.fecha_programada) = MONTH(CURDATE()) AND YEAR(s.fecha_programada) = YEAR(CURDATE())"
    )['total'];
    
    echo json_encode([
        'success' => true,
        'data' => [
            'counters' => [
                'clientes' => $clientes,
                'empresas' => $empresas,
                'sedes' => $sedes,
                'empleados' => $empleados,
                'vehiculos' => $vehiculos,
                'servicios_mes' => $serviciosMes
            ],
            'servicios_por_estado' => $serviciosPorEstado,
            'ingresos_mes' => floatval($ingresosMes),
            'facturas_pendientes' => $facturasPendientes,
            'peso_mes_kg' => floatval($pesoMes),
            'servicios_recientes' => $serviciosRecientes
        ]
    ]);
}

function getServiciosReport() {
    $mes = $_GET['mes'] ?? date('m');
    $anio = $_GET['anio'] ?? date('Y');
    
    $servicios = db()->query(
        "SELECT s.*, se.nombre_comercial as sede_nombre, e.razon_social as empresa_razon_social,
                p.nombre_comercial as planta_nombre, m.peso_kg, m.tipo_residuo
         FROM Servicio s
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         INNER JOIN Planta p ON s.id_planta = p.id_planta
         LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
         WHERE MONTH(s.fecha_programada) = ? AND YEAR(s.fecha_programada) = ?
         ORDER BY s.fecha_programada",
        [$mes, $anio]
    );
    
    $totales = db()->queryOne(
        "SELECT COUNT(*) as total_servicios, COALESCE(SUM(m.peso_kg), 0) as total_peso
         FROM Servicio s
         LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
         WHERE MONTH(s.fecha_programada) = ? AND YEAR(s.fecha_programada) = ?",
        [$mes, $anio]
    );
    
    echo json_encode([
        'success' => true,
        'data' => $servicios,
        'totales' => $totales
    ]);
}

function getFacturacionReport() {
    $mes = $_GET['mes'] ?? date('m');
    $anio = $_GET['anio'] ?? date('Y');
    
    $facturas = db()->query(
        "SELECT f.*, s.codigo_servicio, e.razon_social as empresa_razon_social
         FROM Factura f
         INNER JOIN Servicio s ON f.id_servicio = s.id_servicio
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         WHERE MONTH(f.fecha_emision) = ? AND YEAR(f.fecha_emision) = ?
         ORDER BY f.fecha_emision",
        [$mes, $anio]
    );
    
    $totales = db()->queryOne(
        "SELECT 
            COUNT(*) as total_facturas,
            COALESCE(SUM(monto_total), 0) as total_facturado,
            COALESCE(SUM(CASE WHEN estado = 'pagada' THEN monto_total ELSE 0 END), 0) as total_cobrado,
            COALESCE(SUM(CASE WHEN estado = 'emitida' THEN monto_total ELSE 0 END), 0) as total_pendiente
         FROM Factura 
         WHERE MONTH(fecha_emision) = ? AND YEAR(fecha_emision) = ? AND estado != 'anulada'",
        [$mes, $anio]
    );
    
    echo json_encode([
        'success' => true,
        'data' => $facturas,
        'totales' => $totales
    ]);
}
