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
    try {
        // Sedes activas
        $sedesActivasResult = db()->queryOne("SELECT COUNT(*) as count FROM Sede WHERE activo = 1");
        $sedesActivas = $sedesActivasResult ? $sedesActivasResult['count'] : 0;
        
        // Sedes con servicio este mes (únicas)
        $sedesConServicioResult = db()->queryOne(
            "SELECT COUNT(DISTINCT s.id_sede) as count 
             FROM Servicio sv 
             INNER JOIN Sede s ON sv.id_sede = s.id_sede
             WHERE MONTH(sv.fecha_programada) = MONTH(CURDATE()) 
             AND YEAR(sv.fecha_programada) = YEAR(CURDATE())
             AND sv.estado IN ('completado', 'en_curso', 'programado')"
        );
        $sedesConServicio = $sedesConServicioResult ? $sedesConServicioResult['count'] : 0;
        
        // Porcentaje de sedes con servicio
        $porcentajeServicio = $sedesActivas > 0 ? round(($sedesConServicio / $sedesActivas) * 100, 1) : 0;
        
        // Facturación últimos 12 meses
        $facturacion12Meses = db()->query(
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
        if (!$facturacion12Meses) $facturacion12Meses = [];
        
        // Pagos pendientes (facturas emitidas no pagadas)
        $pagosPendientes = db()->queryOne(
            "SELECT 
                COUNT(*) as total_facturas,
                COALESCE(SUM(f.monto_total), 0) as monto_total
             FROM Factura f
             WHERE f.estado = 'emitida'"
        );
        if (!$pagosPendientes) {
            $pagosPendientes = ['total_facturas' => 0, 'monto_total' => 0];
        }
        
        // Empresas con pagos pendientes - usando LEFT JOIN para evitar errores con id_servicio NULL
        $empresasPendientesResult = db()->queryOne(
            "SELECT COUNT(DISTINCT e.id_empresa) as count
             FROM Factura f
             LEFT JOIN Servicio sv ON f.id_servicio = sv.id_servicio
             LEFT JOIN Sede se ON sv.id_sede = se.id_sede
             LEFT JOIN Empresa e ON se.id_empresa = e.id_empresa
             WHERE f.estado = 'emitida'
             AND e.id_empresa IS NOT NULL"
        );
        $empresasPendientes = $empresasPendientesResult ? $empresasPendientesResult['count'] : 0;
        
        // Ingresos este mes
        $ingresosMesResult = db()->queryOne(
            "SELECT COALESCE(SUM(monto_total), 0) as total FROM Factura 
             WHERE MONTH(fecha_emision) = MONTH(CURDATE()) AND YEAR(fecha_emision) = YEAR(CURDATE())
             AND estado != 'anulada'"
        );
        $ingresosMes = $ingresosMesResult ? $ingresosMesResult['total'] : 0;
        
        // Servicios este mes
        $serviciosMesResult = db()->queryOne(
            "SELECT COUNT(*) as count FROM Servicio 
             WHERE MONTH(fecha_programada) = MONTH(CURDATE()) AND YEAR(fecha_programada) = YEAR(CURDATE())"
        );
        $serviciosMes = $serviciosMesResult ? $serviciosMesResult['count'] : 0;
        
        // Rutas este mes
        $rutasMesResult = db()->queryOne(
            "SELECT COUNT(*) as count FROM Ruta 
             WHERE MONTH(fecha) = MONTH(CURDATE()) AND YEAR(fecha) = YEAR(CURDATE())"
        );
        $rutasMes = $rutasMesResult ? $rutasMesResult['count'] : 0;
        
        echo json_encode([
            'success' => true,
            'data' => [
                'sedes_activas' => intval($sedesActivas),
                'sedes_con_servicio' => intval($sedesConServicio),
                'porcentaje_servicio' => $porcentajeServicio,
                'facturacion_12_meses' => $facturacion12Meses,
                'empresas_pendientes' => intval($empresasPendientes),
                'monto_pendiente' => floatval($pagosPendientes['monto_total']),
                'facturas_pendientes' => intval($pagosPendientes['total_facturas']),
                'ingresos_mes' => floatval($ingresosMes),
                'servicios_mes' => intval($serviciosMes),
                'rutas_mes' => intval($rutasMes)
            ]
        ]);
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Error al cargar dashboard: ' . $e->getMessage()
        ]);
    }
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
