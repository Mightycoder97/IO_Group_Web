<?php
/**
 * IO Group - Ingresos API
 * Income tracking and consolidation
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? null;
$id = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        if ($action === 'servicios') getIngresosServicios();
        elseif ($action === 'nuevos-clientes') getIngresosNuevosClientes();
        elseif ($action === 'consolidacion') getConsolidacion();
        else getConsolidacion();
        break;
    case 'POST':
        if ($action === 'nuevo-cliente') createIngresoNuevoCliente();
        else http_response_code(400);
        break;
    case 'DELETE':
        if ($action === 'nuevo-cliente' && $id) deleteIngresoNuevoCliente($id);
        else http_response_code(400);
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

/**
 * Get income from paid services
 */
function getIngresosServicios() {
    canView();
    
    $fecha_desde = $_GET['fecha_desde'] ?? date('Y-m-01');
    $fecha_hasta = $_GET['fecha_hasta'] ?? date('Y-m-t');
    $forma_pago = $_GET['forma_pago'] ?? null;
    $id_sede = $_GET['id_sede'] ?? null;
    
    $sql = "SELECT s.id_servicio, s.mes_servicio, s.fecha_ejecucion, s.fecha_pago, s.forma_pago,
            se.nombre_comercial as sede_nombre, se.tarifa_servicio as monto,
            e.razon_social as empresa_razon_social
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            WHERE s.estado_pago = 'pagado'
            AND s.fecha_pago BETWEEN ? AND ?";
    $params = [$fecha_desde, $fecha_hasta];
    
    if ($forma_pago) {
        $sql .= " AND s.forma_pago = ?";
        $params[] = $forma_pago;
    }
    
    if ($id_sede) {
        $sql .= " AND s.id_sede = ?";
        $params[] = $id_sede;
    }
    
    $sql .= " ORDER BY s.fecha_pago DESC";
    
    $data = db()->query($sql, $params);
    
    // Totales por método de pago
    $totales = db()->queryOne("
        SELECT 
            SUM(se.tarifa_servicio) as total,
            SUM(CASE WHEN s.forma_pago = 'transferencia' THEN se.tarifa_servicio ELSE 0 END) as transferencia,
            SUM(CASE WHEN s.forma_pago IN ('yape', 'plin') THEN se.tarifa_servicio ELSE 0 END) as yape_plin,
            SUM(CASE WHEN s.forma_pago = 'efectivo' THEN se.tarifa_servicio ELSE 0 END) as efectivo,
            SUM(CASE WHEN s.forma_pago IS NULL OR s.forma_pago NOT IN ('transferencia', 'yape', 'plin', 'efectivo') THEN se.tarifa_servicio ELSE 0 END) as otros,
            COUNT(*) as cantidad
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        WHERE s.estado_pago = 'pagado'
        AND s.fecha_pago BETWEEN ? AND ?
    ", [$fecha_desde, $fecha_hasta]);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'periodo' => ['desde' => $fecha_desde, 'hasta' => $fecha_hasta],
        'totales' => [
            'total' => floatval($totales['total'] ?? 0),
            'transferencia' => floatval($totales['transferencia'] ?? 0),
            'yape_plin' => floatval($totales['yape_plin'] ?? 0),
            'efectivo' => floatval($totales['efectivo'] ?? 0),
            'otros' => floatval($totales['otros'] ?? 0),
            'cantidad' => intval($totales['cantidad'] ?? 0)
        ]
    ]);
}

/**
 * Get advance payments from new clients
 */
function getIngresosNuevosClientes() {
    canView();
    
    $fecha_desde = $_GET['fecha_desde'] ?? date('Y-m-01');
    $fecha_hasta = $_GET['fecha_hasta'] ?? date('Y-m-t');
    
    $sql = "SELECT i.*, 
            se.nombre_comercial as sede_nombre,
            e.razon_social as empresa_razon_social,
            c.codigo_contrato, c.tarifa
            FROM IngresoNuevoCliente i
            INNER JOIN Sede se ON i.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            LEFT JOIN ContratoServicio c ON i.id_contrato = c.id_contrato
            WHERE i.fecha_pago BETWEEN ? AND ?
            ORDER BY i.fecha_pago DESC";
    
    $data = db()->query($sql, [$fecha_desde, $fecha_hasta]);
    
    $totales = db()->queryOne("
        SELECT 
            SUM(monto_total) as total,
            SUM(meses_pagados) as meses,
            COUNT(*) as cantidad
        FROM IngresoNuevoCliente
        WHERE fecha_pago BETWEEN ? AND ?
    ", [$fecha_desde, $fecha_hasta]);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'periodo' => ['desde' => $fecha_desde, 'hasta' => $fecha_hasta],
        'totales' => [
            'total' => floatval($totales['total'] ?? 0),
            'meses' => intval($totales['meses'] ?? 0),
            'cantidad' => intval($totales['cantidad'] ?? 0)
        ]
    ]);
}

/**
 * Create a new client advance payment record
 */
function createIngresoNuevoCliente() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_contrato = $data['id_contrato'] ?? null;
    $id_sede = $data['id_sede'] ?? null;
    $meses_pagados = $data['meses_pagados'] ?? null;
    $monto_total = $data['monto_total'] ?? null;
    $fecha_pago = $data['fecha_pago'] ?? date('Y-m-d');
    
    if (!$id_sede || !$meses_pagados || !$monto_total) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Sede, meses y monto son requeridos']);
        return;
    }
    
    // Get contract if not provided
    if (!$id_contrato) {
        $contrato = db()->queryOne(
            "SELECT id_contrato FROM ContratoServicio WHERE id_sede = ? AND activo = 1 ORDER BY fecha_inicio DESC LIMIT 1",
            [$id_sede]
        );
        $id_contrato = $contrato['id_contrato'] ?? null;
    }
    
    $id = db()->insert(
        "INSERT INTO IngresoNuevoCliente (id_contrato, id_sede, meses_pagados, monto_total, fecha_pago, metodo_pago, observaciones)
         VALUES (?, ?, ?, ?, ?, ?, ?)",
        [
            $id_contrato,
            $id_sede,
            $meses_pagados,
            $monto_total,
            $fecha_pago,
            $data['metodo_pago'] ?? null,
            $data['observaciones'] ?? null
        ]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Ingreso registrado exitosamente',
        'id' => $id
    ]);
}

/**
 * Delete a new client income record
 */
function deleteIngresoNuevoCliente($id) {
    canEdit();
    
    $existing = db()->queryOne("SELECT * FROM IngresoNuevoCliente WHERE id = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Registro no encontrado']);
        return;
    }
    
    db()->execute("DELETE FROM IngresoNuevoCliente WHERE id = ?", [$id]);
    
    echo json_encode([
        'success' => true,
        'message' => 'Registro eliminado exitosamente'
    ]);
}

/**
 * Get consolidated income view
 */
function getConsolidacion() {
    canView();
    
    $fecha_desde = $_GET['fecha_desde'] ?? date('Y-m-01');
    $fecha_hasta = $_GET['fecha_hasta'] ?? date('Y-m-t');
    
    // Ingresos por servicios
    $servicios = db()->queryOne("
        SELECT 
            COUNT(*) as cantidad,
            SUM(se.tarifa_servicio) as total
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        WHERE s.estado_pago = 'pagado'
        AND s.fecha_pago BETWEEN ? AND ?
    ", [$fecha_desde, $fecha_hasta]);
    
    // Ingresos nuevos clientes
    $nuevos = db()->queryOne("
        SELECT 
            COUNT(*) as cantidad,
            SUM(monto_total) as total
        FROM IngresoNuevoCliente
        WHERE fecha_pago BETWEEN ? AND ?
    ", [$fecha_desde, $fecha_hasta]);
    
    // Desglose por método de pago (servicios)
    $metodos = db()->query("
        SELECT 
            COALESCE(s.forma_pago, 'no_especificado') as metodo,
            COUNT(*) as cantidad,
            SUM(se.tarifa_servicio) as total
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        WHERE s.estado_pago = 'pagado'
        AND s.fecha_pago BETWEEN ? AND ?
        GROUP BY COALESCE(s.forma_pago, 'no_especificado')
        ORDER BY total DESC
    ", [$fecha_desde, $fecha_hasta]);
    
    // Ingresos por día (últimos 30 días)
    $porDia = db()->query("
        SELECT 
            s.fecha_pago as fecha,
            SUM(se.tarifa_servicio) as total
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        WHERE s.estado_pago = 'pagado'
        AND s.fecha_pago BETWEEN ? AND ?
        GROUP BY s.fecha_pago
        ORDER BY s.fecha_pago
    ", [$fecha_desde, $fecha_hasta]);
    
    $total_servicios = floatval($servicios['total'] ?? 0);
    $total_nuevos = floatval($nuevos['total'] ?? 0);
    
    echo json_encode([
        'success' => true,
        'periodo' => ['desde' => $fecha_desde, 'hasta' => $fecha_hasta],
        'resumen' => [
            'servicios' => [
                'cantidad' => intval($servicios['cantidad'] ?? 0),
                'total' => $total_servicios
            ],
            'nuevos_clientes' => [
                'cantidad' => intval($nuevos['cantidad'] ?? 0),
                'total' => $total_nuevos
            ],
            'total_general' => $total_servicios + $total_nuevos
        ],
        'metodos_pago' => $metodos,
        'por_dia' => $porDia
    ]);
}
