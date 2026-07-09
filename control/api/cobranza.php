<?php
/**
 * IO Group - Cobranza API
 * Collection management with history tracking
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? null;
$id = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        if ($action === 'gestiones') getGestiones();
        elseif ($action === 'reporte') getReporteDiario();
        elseif ($action === 'pendientes') getPendientes();
        else getPendientes();
        break;
    case 'POST':
        if ($action === 'gestion') createGestion();
        else http_response_code(400);
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

/**
 * Get pending payments grouped by sede
 * Optimized: replaced subqueries with JOINs for better performance
 */
function getPendientes() {
    canView();
    
    $cliente = $_GET['cliente'] ?? null;
    $estado = isset($_GET['estado']) && $_GET['estado'] !== '' ? $_GET['estado'] : null;
    $fecha_inicio = $_GET['fecha_inicio'] ?? null;
    $fecha_fin = $_GET['fecha_fin'] ?? null;
    $limit = min(500, max(10, intval($_GET['limit'] ?? 100)));
    
    // Optimized query using LEFT JOIN instead of correlated subqueries
    $sql = "SELECT s.id_servicio, s.id_sede, s.mes_servicio,
            s.fecha_ejecucion as fecha_servicio,
            COALESCE(s.estado_pago, 'pendiente') as estado_pago,
            s.fecha_pago, s.forma_pago,
            COALESCE(se.nombre_comercial, 'Sin Sede') as sede_nombre, 
            se.contacto_telefono, 
            COALESCE(s.monto_cobrado, IF(cs.tipo_tarifa = 'por_kg', COALESCE(m.peso_kg, 0) * cs.tarifa, cs.tarifa), 0) as tarifa_servicio,
            cs.tarifa as tarifa_contrato, s.monto_cobrado,
            se.distrito, se.direccion,
            COALESCE(e.razon_social, 'Sin Empresa') as empresa_razon_social, 
            e.ruc as empresa_ruc,
            f.numero_factura, f.id_factura,
            COALESCE(gc_stats.num_gestiones, 0) as num_gestiones,
            gc_stats.ultima_gestion,
            r.id_ruta, r.fecha as fecha_ruta,
            v.placa as vehiculo_placa,
            (COALESCE(deuda_total.cantidad_deuda_total, 0) - CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' THEN 1 ELSE 0 END) as deuda_cantidad,
            (COALESCE(deuda_total.monto_deuda_total, 0) - CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' THEN COALESCE(s.monto_cobrado, IF(cs.tipo_tarifa = 'por_kg', COALESCE(m.peso_kg, 0) * cs.tarifa, cs.tarifa), 0) ELSE 0 END) as deuda_monto
            FROM Servicio s
            LEFT JOIN Ruta r ON s.id_ruta = r.id_ruta
            LEFT JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
            LEFT JOIN Sede se ON s.id_sede = se.id_sede
            LEFT JOIN Empresa e ON se.id_empresa = e.id_empresa
            LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
            LEFT JOIN Factura f ON s.id_servicio = f.id_servicio
            LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
            LEFT JOIN (
                SELECT id_servicio, 
                       COUNT(*) as num_gestiones,
                       MAX(fecha_gestion) as ultima_gestion
                FROM GestionCobranza 
                GROUP BY id_servicio
            ) gc_stats ON gc_stats.id_servicio = s.id_servicio
            LEFT JOIN (
                SELECT s_deuda.id_sede, 
                       COUNT(s_deuda.id_servicio) as cantidad_deuda_total,
                       SUM(COALESCE(s_deuda.monto_cobrado, IF(cs_deuda.tipo_tarifa = 'por_kg', COALESCE(m_deuda.peso_kg, 0) * cs_deuda.tarifa, cs_deuda.tarifa), 0)) as monto_deuda_total
                FROM Servicio s_deuda
                LEFT JOIN ContratoServicio cs_deuda ON s_deuda.id_contrato = cs_deuda.id_contrato
                LEFT JOIN Manifiesto m_deuda ON s_deuda.id_servicio = m_deuda.id_servicio
                WHERE COALESCE(s_deuda.estado_pago, 'pendiente') = 'pendiente' 
                GROUP BY s_deuda.id_sede
            ) deuda_total ON deuda_total.id_sede = s.id_sede
            WHERE 1=1";
    
    $params = [];
    
    if ($estado) {
        $sql .= " AND (
            s.id_ruta IN (
                SELECT id_ruta FROM Servicio s2 
                WHERE s2.id_ruta IS NOT NULL AND COALESCE(s2.estado_pago, 'pendiente') = ?";
        $params[] = $estado;

        if ($fecha_inicio) {
            $sql .= " AND s2.fecha_ejecucion >= ?";
            $params[] = $fecha_inicio;
        }
        if ($fecha_fin) {
            $sql .= " AND s2.fecha_ejecucion <= ?";
            $params[] = $fecha_fin;
        }

        $sql .= "
            ) 
            OR (s.id_ruta IS NULL AND COALESCE(s.estado_pago, 'pendiente') = ?)
        )";
        $params[] = $estado;
    }

    if ($fecha_inicio) {
        $sql .= " AND s.fecha_ejecucion >= ?";
        $params[] = $fecha_inicio;
    }

    if ($fecha_fin) {
        $sql .= " AND s.fecha_ejecucion <= ?";
        $params[] = $fecha_fin;
    }
    
    if ($cliente) {
        $sql .= " AND (se.nombre_comercial LIKE ? OR e.razon_social LIKE ? OR f.numero_factura LIKE ?)";
        $params[] = "%$cliente%";
        $params[] = "%$cliente%";
        $params[] = "%$cliente%";
    }
    
    $sql .= " ORDER BY s.fecha_ejecucion DESC";
    
    $data = db()->query($sql, $params);
    
    $stats = db()->queryOne("
        SELECT 
            SUM(CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' THEN COALESCE(s.monto_cobrado, IF(cs.tipo_tarifa = 'por_kg', COALESCE(m.peso_kg, 0) * cs.tarifa, cs.tarifa), 0) ELSE 0 END) as total_pendiente,
            SUM(CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' 
                AND DATEDIFF(CURDATE(), s.fecha_ejecucion) > 30 
                THEN COALESCE(s.monto_cobrado, IF(cs.tipo_tarifa = 'por_kg', COALESCE(m.peso_kg, 0) * cs.tarifa, cs.tarifa), 0) ELSE 0 END) as total_vencido,
            SUM(CASE WHEN s.estado_pago = 'pagado' 
                AND MONTH(s.fecha_pago) = MONTH(CURDATE()) 
                AND YEAR(s.fecha_pago) = YEAR(CURDATE())
                THEN COALESCE(s.monto_cobrado, IF(cs.tipo_tarifa = 'por_kg', COALESCE(m.peso_kg, 0) * cs.tarifa, cs.tarifa), 0) ELSE 0 END) as cobrado_mes,
            COUNT(CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' THEN 1 END) as count_pendientes
        FROM Servicio s
        LEFT JOIN Sede se ON s.id_sede = se.id_sede
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
        LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
    ");
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'stats' => [
            'total_pendiente' => floatval($stats['total_pendiente'] ?? 0),
            'total_vencido' => floatval($stats['total_vencido'] ?? 0),
            'cobrado_mes' => floatval($stats['cobrado_mes'] ?? 0),
            'count_pendientes' => intval($stats['count_pendientes'] ?? 0)
        ]
    ]);
}

/**
 * Get collection history for a specific service
 */
function getGestiones() {
    canView();
    
    $id_servicio = $_GET['id_servicio'] ?? null;
    $id_sede = $_GET['id_sede'] ?? null;
    
    $sql = "SELECT g.*, u.nombre_completo as usuario_nombre
            FROM GestionCobranza g
            LEFT JOIN Usuario u ON g.gestionado_por = u.id_usuario
            WHERE 1=1";
    $params = [];
    
    if ($id_servicio) {
        $sql .= " AND g.id_servicio = ?";
        $params[] = $id_servicio;
    }
    
    if ($id_sede) {
        $sql .= " AND g.id_sede = ?";
        $params[] = $id_sede;
    }
    
    $sql .= " ORDER BY g.fecha_gestion DESC LIMIT 50";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data
    ]);
}

/**
 * Create a new collection activity record
 */
function createGestion() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_servicio = $data['id_servicio'] ?? null;
    $id_sede = $data['id_sede'] ?? null;
    $tipo_gestion = $data['tipo_gestion'] ?? null;
    $resultado = $data['resultado'] ?? null;
    
    if (!$id_servicio || !$tipo_gestion || !$resultado) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Servicio, tipo y resultado son requeridos']);
        return;
    }
    
    // Get sede if not provided
    if (!$id_sede) {
        $servicio = db()->queryOne("SELECT id_sede FROM Servicio WHERE id_servicio = ?", [$id_servicio]);
        $id_sede = $servicio['id_sede'] ?? null;
    }
    
    $id = db()->insert(
        "INSERT INTO GestionCobranza (id_servicio, id_sede, tipo_gestion, resultado, observaciones, fecha_proxima_gestion, gestionado_por)
         VALUES (?, ?, ?, ?, ?, ?, ?)",
        [
            $id_servicio,
            $id_sede,
            $tipo_gestion,
            $resultado,
            $data['observaciones'] ?? null,
            $data['fecha_proxima_gestion'] ?? null,
            $user['id']
        ]
    );
    
    // If result is 'pagado', update the service
    if ($resultado === 'pagado') {
        db()->execute(
            "UPDATE Servicio SET estado_pago = 'pagado', fecha_pago = CURDATE(), forma_pago = ? WHERE id_servicio = ?",
            [$data['forma_pago'] ?? 'no_especificado', $id_servicio]
        );
    }
    
    echo json_encode([
        'success' => true,
        'message' => 'Gestión registrada exitosamente',
        'id' => $id
    ]);
}

/**
 * Get daily collection report
 */
function getReporteDiario() {
    canView();
    
    $fecha = $_GET['fecha'] ?? date('Y-m-d');
    
    // Gestiones del día
    $gestiones = db()->queryOne("
        SELECT 
            COUNT(*) as total,
            SUM(CASE WHEN tipo_gestion = 'whatsapp' THEN 1 ELSE 0 END) as whatsapp,
            SUM(CASE WHEN tipo_gestion = 'llamada' THEN 1 ELSE 0 END) as llamadas,
            SUM(CASE WHEN tipo_gestion = 'visita' THEN 1 ELSE 0 END) as visitas,
            SUM(CASE WHEN resultado = 'contactado' THEN 1 ELSE 0 END) as contactados,
            SUM(CASE WHEN resultado = 'promesa_pago' THEN 1 ELSE 0 END) as promesas,
            SUM(CASE WHEN resultado = 'pagado' THEN 1 ELSE 0 END) as pagados
        FROM GestionCobranza
        WHERE DATE(fecha_gestion) = ?
    ", [$fecha]);
    
    // Pagos del día
    $pagos = db()->queryOne("
        SELECT 
            COUNT(*) as cantidad,
            SUM(COALESCE(s.monto_cobrado, 0)) as total,
            SUM(CASE WHEN LOWER(s.forma_pago) = 'transferencia' THEN COALESCE(s.monto_cobrado, 0) ELSE 0 END) as transferencia,
            SUM(CASE WHEN LOWER(s.forma_pago) IN ('yape', 'plin') THEN COALESCE(s.monto_cobrado, 0) ELSE 0 END) as yape_plin,
            SUM(CASE WHEN LOWER(s.forma_pago) = 'efectivo' THEN COALESCE(s.monto_cobrado, 0) ELSE 0 END) as efectivo
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
        WHERE s.fecha_pago = ? AND s.estado_pago = 'pagado'
    ", [$fecha]);
    
    // Pendientes totales
    $pendientes = db()->queryOne("
        SELECT 
            COUNT(*) as cantidad,
            SUM(COALESCE(s.monto_cobrado, IF(cs.tipo_tarifa = 'por_kg', COALESCE(m.peso_kg, 0) * cs.tarifa, cs.tarifa))) as total,
            SUM(CASE WHEN DATEDIFF(CURDATE(), s.fecha_ejecucion) > 30 THEN COALESCE(s.monto_cobrado, IF(cs.tipo_tarifa = 'por_kg', COALESCE(m.peso_kg, 0) * cs.tarifa, cs.tarifa)) ELSE 0 END) as vencido
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
        LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
        WHERE COALESCE(s.estado_pago, 'pendiente') = 'pendiente'
        AND COALESCE(s.monto_cobrado, IF(cs.tipo_tarifa = 'por_kg', COALESCE(m.peso_kg, 0) * cs.tarifa, cs.tarifa)) > 0
    ");
    
    echo json_encode([
        'success' => true,
        'fecha' => $fecha,
        'gestiones' => [
            'total' => intval($gestiones['total'] ?? 0),
            'whatsapp' => intval($gestiones['whatsapp'] ?? 0),
            'llamadas' => intval($gestiones['llamadas'] ?? 0),
            'visitas' => intval($gestiones['visitas'] ?? 0),
            'contactados' => intval($gestiones['contactados'] ?? 0),
            'promesas' => intval($gestiones['promesas'] ?? 0),
            'pagados' => intval($gestiones['pagados'] ?? 0)
        ],
        'pagos' => [
            'cantidad' => intval($pagos['cantidad'] ?? 0),
            'total' => floatval($pagos['total'] ?? 0),
            'transferencia' => floatval($pagos['transferencia'] ?? 0),
            'yape_plin' => floatval($pagos['yape_plin'] ?? 0),
            'efectivo' => floatval($pagos['efectivo'] ?? 0)
        ],
        'pendientes' => [
            'cantidad' => intval($pendientes['cantidad'] ?? 0),
            'total' => floatval($pendientes['total'] ?? 0),
            'vencido' => floatval($pendientes['vencido'] ?? 0)
        ]
    ]);
}
