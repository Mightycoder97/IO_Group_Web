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
        elseif ($action === 'por-ruta') getIngresosPorRuta();
        else getConsolidacion();
        break;
    case 'POST':
        if ($action === 'nuevo-cliente') createIngresoNuevoCliente();
        elseif ($action === 'confirmar-pago') confirmarPagoServicio();
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
            se.nombre_comercial as sede_nombre, COALESCE(s.monto_cobrado, 0) as monto,
            cs.tarifa as tarifa_servicio, s.monto_cobrado,
            e.razon_social as empresa_razon_social
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
            WHERE s.estado_pago = 'pagado'
            AND s.fecha_pago BETWEEN ? AND ?";
    $params = [$fecha_desde, $fecha_hasta];
    
    if ($forma_pago) {
        $sql .= " AND LOWER(s.forma_pago) = LOWER(?)";
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
            SUM(COALESCE(s.monto_cobrado, 0)) as total,
            SUM(CASE WHEN LOWER(s.forma_pago) = 'transferencia' THEN COALESCE(s.monto_cobrado, 0) ELSE 0 END) as transferencia,
            SUM(CASE WHEN LOWER(s.forma_pago) IN ('yape', 'plin') THEN COALESCE(s.monto_cobrado, 0) ELSE 0 END) as yape_plin,
            SUM(CASE WHEN LOWER(s.forma_pago) = 'efectivo' THEN COALESCE(s.monto_cobrado, 0) ELSE 0 END) as efectivo,
            SUM(CASE WHEN s.forma_pago IS NULL OR LOWER(s.forma_pago) NOT IN ('transferencia', 'yape', 'plin', 'efectivo') THEN COALESCE(s.monto_cobrado, 0) ELSE 0 END) as otros,
            COUNT(*) as cantidad
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
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
            c.tarifa
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
            SUM(COALESCE(s.monto_cobrado, 0)) as total
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
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
            SUM(COALESCE(s.monto_cobrado, 0)) as total
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
        WHERE s.estado_pago = 'pagado'
        AND s.fecha_pago BETWEEN ? AND ?
        GROUP BY COALESCE(s.forma_pago, 'no_especificado')
        ORDER BY total DESC
    ", [$fecha_desde, $fecha_hasta]);
    
    // Ingresos por día (últimos 30 días)
    $porDia = db()->query("
        SELECT 
            s.fecha_pago as fecha,
            SUM(COALESCE(s.monto_cobrado, 0)) as total
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
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

/**
 * Get routes with services for a specific date (for payment confirmation)
 */
function getIngresosPorRuta() {
    canView();
    
    $fecha = $_GET['fecha'] ?? date('Y-m-d');
    
    // Get routes for the date
    $rutas = db()->query("
        SELECT r.id_ruta, r.codigo_ruta, r.fecha, r.estado,
               v.placa as vehiculo_placa, v.marca as vehiculo_marca
        FROM Ruta r
        INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
        WHERE r.fecha = ?
        ORDER BY r.id_ruta
    ", [$fecha]);
    
    // For each route, get its services with payment status
    foreach ($rutas as &$ruta) {
        $servicios = db()->query("
            SELECT s.id_servicio, s.fecha_ejecucion, s.estado,
                   COALESCE(s.estado_pago, 'pendiente') as estado_pago,
                   s.fecha_pago, s.forma_pago,
                   se.id_sede, se.nombre_comercial as sede_nombre, 
                   se.direccion as sede_direccion, se.distrito,
                   CASE WHEN s.estado_pago = 'pagado' THEN COALESCE(s.monto_cobrado, 0) ELSE COALESCE(s.monto_cobrado, cs.tarifa, 0) END as monto,
                   cs.tarifa as tarifa_servicio, s.monto_cobrado,
                   e.razon_social as empresa_razon_social
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
            WHERE s.id_ruta = ?
            ORDER BY s.id_servicio
        ", [$ruta['id_ruta']]);
        
        $ruta['servicios'] = $servicios;
        $ruta['total_servicios'] = count($servicios);
        $ruta['servicios_pagados'] = count(array_filter($servicios, fn($s) => $s['estado_pago'] === 'pagado'));
        $ruta['monto_total'] = array_reduce($servicios, fn($sum, $s) => $sum + floatval($s['monto'] ?? 0), 0);
        $ruta['monto_pagado'] = array_reduce(
            array_filter($servicios, fn($s) => $s['estado_pago'] === 'pagado'), 
            fn($sum, $s) => $sum + floatval($s['monto'] ?? 0), 
            0
        );
    }
    
    // Calculate totals
    $totalServicios = array_reduce($rutas, fn($sum, $r) => $sum + $r['total_servicios'], 0);
    $totalPagados = array_reduce($rutas, fn($sum, $r) => $sum + $r['servicios_pagados'], 0);
    $montoTotal = array_reduce($rutas, fn($sum, $r) => $sum + $r['monto_total'], 0);
    $montoPagado = array_reduce($rutas, fn($sum, $r) => $sum + $r['monto_pagado'], 0);
    
    echo json_encode([
        'success' => true,
        'fecha' => $fecha,
        'rutas' => $rutas,
        'resumen' => [
            'total_rutas' => count($rutas),
            'total_servicios' => $totalServicios,
            'servicios_pagados' => $totalPagados,
            'servicios_pendientes' => $totalServicios - $totalPagados,
            'monto_total' => $montoTotal,
            'monto_pagado' => $montoPagado,
            'monto_pendiente' => $montoTotal - $montoPagado
        ]
    ]);
}

/**
 * Confirm payment for a service
 */
function confirmarPagoServicio() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_servicio = $data['id_servicio'] ?? null;
    $forma_pago = $data['forma_pago'] ?? null;
    $fecha_pago = $data['fecha_pago'] ?? date('Y-m-d');
    
    if (!$id_servicio) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID de servicio requerido']);
        return;
    }
    
    // Check service exists
    $servicio = db()->queryOne("SELECT * FROM Servicio WHERE id_servicio = ?", [$id_servicio]);
    if (!$servicio) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Servicio no encontrado']);
        return;
    }
    
    // Update payment status
    db()->execute(
        "UPDATE Servicio SET 
            estado_pago = 'pagado',
            fecha_pago = ?,
            forma_pago = ?,
            fecha_modificacion = NOW()
         WHERE id_servicio = ?",
        [$fecha_pago, $forma_pago, $id_servicio]
    );
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Servicio', ?, 'UPDATE', ?, ?)",
        [
            $user['id'], 
            $id_servicio, 
            json_encode(['estado_pago' => $servicio['estado_pago'], 'fecha_pago' => $servicio['fecha_pago'], 'forma_pago' => $servicio['forma_pago']]),
            json_encode(['estado_pago' => 'pagado', 'fecha_pago' => $fecha_pago, 'forma_pago' => $forma_pago])
        ]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Pago confirmado exitosamente'
    ]);
}
