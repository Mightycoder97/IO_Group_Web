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
        // Cache current date values to avoid repeated function calls in SQL
        $currentYear = date('Y');
        $currentMonth = date('m');
        
        // Sedes activas
        $sedesActivasResult = db()->queryOne("SELECT COUNT(*) as count FROM Sede WHERE activo = 1");
        $sedesActivas = $sedesActivasResult ? $sedesActivasResult['count'] : 0;
        
        // Sedes con servicio este mes (únicas) - usando fecha_ejecucion
        $sedesConServicioResult = db()->queryOne(
            "SELECT COUNT(DISTINCT s.id_sede) as count 
             FROM Servicio sv 
             INNER JOIN Sede s ON sv.id_sede = s.id_sede
             WHERE MONTH(sv.fecha_ejecucion) = MONTH(CURDATE()) 
             AND YEAR(sv.fecha_ejecucion) = YEAR(CURDATE())
             AND sv.estado IN ('completado', 'en_curso', 'programado')"
        );
        $sedesConServicio = $sedesConServicioResult ? $sedesConServicioResult['count'] : 0;
        
        // Porcentaje de sedes con servicio
        $porcentajeServicio = $sedesActivas > 0 ? round(($sedesConServicio / $sedesActivas) * 100, 1) : 0;
        
        // Facturación últimos 12 meses - basado en servicios con factura y tarifa de sede
        $facturacion12Meses = db()->query(
            "SELECT 
                DATE_FORMAT(s.fecha_ejecucion, '%Y-%m') as mes,
                DATE_FORMAT(s.fecha_ejecucion, '%b %Y') as mes_label,
                COALESCE(SUM(cs.tarifa), 0) as total
             FROM Servicio s
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Factura f ON s.id_servicio = f.id_servicio
             LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
             WHERE s.fecha_ejecucion >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
             AND s.estado = 'completado'
             GROUP BY DATE_FORMAT(s.fecha_ejecucion, '%Y-%m')
             ORDER BY mes ASC"
        );
        if (!$facturacion12Meses) $facturacion12Meses = [];
        
        // Pagos pendientes - servicios completados con estado_pago pendiente
        $pagosPendientes = db()->queryOne(
            "SELECT 
                COUNT(*) as total_facturas,
                COALESCE(SUM(cs.tarifa), 0) as monto_total
             FROM Servicio s
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
             WHERE s.estado = 'completado'
             AND COALESCE(s.estado_pago, 'pendiente') = 'pendiente'"
        );
        if (!$pagosPendientes) {
            $pagosPendientes = ['total_facturas' => 0, 'monto_total' => 0];
        }
        
        // Empresas con pagos pendientes
        $empresasPendientesResult = db()->queryOne(
            "SELECT COUNT(DISTINCT e.id_empresa) as count
             FROM Servicio s
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             WHERE s.estado = 'completado'
             AND COALESCE(s.estado_pago, 'pendiente') = 'pendiente'"
        );
        $empresasPendientes = $empresasPendientesResult ? $empresasPendientesResult['count'] : 0;
        
        // Ingresos este mes - servicios completados y pagados este mes
        $ingresosMesResult = db()->queryOne(
            "SELECT COALESCE(SUM(cs.tarifa), 0) as total 
             FROM Servicio s
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
             WHERE MONTH(s.fecha_ejecucion) = MONTH(CURDATE()) 
             AND YEAR(s.fecha_ejecucion) = YEAR(CURDATE())
             AND s.estado = 'completado'
             AND s.estado_pago = 'pagado'"
        );
        $ingresosMes = $ingresosMesResult ? $ingresosMesResult['total'] : 0;
        
        // Servicios este mes - usando fecha_ejecucion
        $serviciosMesResult = db()->queryOne(
            "SELECT COUNT(*) as count FROM Servicio 
             WHERE MONTH(fecha_ejecucion) = MONTH(CURDATE()) AND YEAR(fecha_ejecucion) = YEAR(CURDATE())"
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
