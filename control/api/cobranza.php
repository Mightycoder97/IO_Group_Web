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
 */
function getPendientes() {
    canView();
    
    $cliente = $_GET['cliente'] ?? null;
    $estado = $_GET['estado'] ?? 'pendiente';
    $limit = min(500, max(10, intval($_GET['limit'] ?? 100)));
    
    $sql = "SELECT s.id_servicio, s.id_sede, s.mes_servicio,
            s.fecha_ejecucion as fecha_servicio,
            COALESCE(s.estado_pago, 'pendiente') as estado_pago,
            s.fecha_pago, s.forma_pago,
            se.nombre_comercial as sede_nombre, 
            se.contacto_telefono, se.tarifa_servicio, se.distrito, se.direccion,
            e.razon_social as empresa_razon_social,
            (SELECT COUNT(*) FROM GestionCobranza gc WHERE gc.id_servicio = s.id_servicio) as num_gestiones,
            (SELECT fecha_gestion FROM GestionCobranza gc WHERE gc.id_servicio = s.id_servicio ORDER BY fecha_gestion DESC LIMIT 1) as ultima_gestion
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            WHERE se.tarifa_servicio > 0";
    
    $params = [];
    
    if ($estado) {
        $sql .= " AND COALESCE(s.estado_pago, 'pendiente') = ?";
        $params[] = $estado;
    }
    
    if ($cliente) {
        $sql .= " AND (se.nombre_comercial LIKE ? OR e.razon_social LIKE ?)";
        $params[] = "%$cliente%";
        $params[] = "%$cliente%";
    }
    
    $sql .= " ORDER BY s.fecha_ejecucion DESC LIMIT ?";
    $params[] = $limit;
    
    $data = db()->query($sql, $params);
    
    // Calculate summary stats
    $stats = db()->queryOne("
        SELECT 
            SUM(CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' THEN se.tarifa_servicio ELSE 0 END) as total_pendiente,
            SUM(CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' 
                AND DATEDIFF(CURDATE(), s.fecha_ejecucion) > 30 
                THEN se.tarifa_servicio ELSE 0 END) as total_vencido,
            SUM(CASE WHEN s.estado_pago = 'pagado' 
                AND MONTH(s.fecha_pago) = MONTH(CURDATE()) 
                AND YEAR(s.fecha_pago) = YEAR(CURDATE())
                THEN se.tarifa_servicio ELSE 0 END) as cobrado_mes,
            COUNT(CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' THEN 1 END) as count_pendientes
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        WHERE se.tarifa_servicio > 0
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
            SUM(se.tarifa_servicio) as total,
            SUM(CASE WHEN s.forma_pago = 'transferencia' THEN se.tarifa_servicio ELSE 0 END) as transferencia,
            SUM(CASE WHEN s.forma_pago IN ('yape', 'plin') THEN se.tarifa_servicio ELSE 0 END) as yape_plin,
            SUM(CASE WHEN s.forma_pago = 'efectivo' THEN se.tarifa_servicio ELSE 0 END) as efectivo
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        WHERE s.fecha_pago = ? AND s.estado_pago = 'pagado'
    ", [$fecha]);
    
    // Pendientes totales
    $pendientes = db()->queryOne("
        SELECT 
            COUNT(*) as cantidad,
            SUM(se.tarifa_servicio) as total,
            SUM(CASE WHEN DATEDIFF(CURDATE(), s.fecha_ejecucion) > 30 THEN se.tarifa_servicio ELSE 0 END) as vencido
        FROM Servicio s
        INNER JOIN Sede se ON s.id_sede = se.id_sede
        WHERE COALESCE(s.estado_pago, 'pendiente') = 'pendiente'
        AND se.tarifa_servicio > 0
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
