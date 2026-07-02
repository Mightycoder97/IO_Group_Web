<?php
/**
 * IO Group - Dashboard Comercial API
 * Métricas avanzadas de ventas, funnel, pérdidas y rendimiento
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

try {
    if ($method !== 'GET' && $method !== 'POST') {
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
        exit;
    }

    switch ($action) {
        case 'funnel': getFunnel(); break;
        case 'perdidas': getPerdidas(); break;
        case 'vendedores': getVendedores(); break;
        case 'tendencias': getTendencias(); break;
        case 'whatsapp': getWhatsAppMetrics(); break;
        case 'motivos-perdida':
            if ($method === 'POST') createMotivo();
            else getMotivos();
            break;
        case 'resumen': getResumen(); break;
        default:
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Acción no válida']);
    }
} catch (\Throwable $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Error interno: ' . $e->getMessage()]);
}

/**
 * Datos del funnel de ventas
 */
function getFunnel()
{
    canView();
    $filters = getDateFilters();

    // Conteo por estado
    $sql = "SELECT estado, COUNT(*) as total FROM Prospecto WHERE activo = 1";
    $params = [];
    if ($filters['desde']) { $sql .= " AND fecha_creacion >= ?"; $params[] = $filters['desde']; }
    if ($filters['hasta']) { $sql .= " AND fecha_creacion <= ?"; $params[] = $filters['hasta'] . ' 23:59:59'; }
    if ($filters['vendedor']) {
        $sql .= " AND (id_usuario_asignado IN (SELECT id_usuario FROM Usuario WHERE nombre_completo = ?) OR notas LIKE ?)";
        $params[] = $filters['vendedor'];
        $params[] = '%"vendedor":"' . $filters['vendedor'] . '"%';
    }
    $sql .= " GROUP BY estado";
    $estados = db()->query($sql, $params);

    $funnel = [
        'nuevo' => 0, 'contactado' => 0, 'interesado' => 0,
        'propuesta' => 0, 'negociacion' => 0, 'ganado' => 0, 'perdido' => 0
    ];
    foreach ($estados as $row) {
        $est = $row['estado'] === 'negociacion' ? 'negociacion' : $row['estado'];
        $funnel[$est] = intval($row['total']);
    }

    // Tasas de conversión entre pasos
    $steps = ['nuevo', 'contactado', 'interesado', 'propuesta', 'negociacion', 'ganado'];
    $conversiones = [];
    for ($i = 0; $i < count($steps) - 1; $i++) {
        $from = $funnel[$steps[$i]];
        $to = $funnel[$steps[$i + 1]];
        $total = 0;
        for ($j = $i; $j < count($steps); $j++) $total += $funnel[$steps[$j]];
        $conversiones[] = [
            'de' => $steps[$i],
            'a' => $steps[$i + 1],
            'total_en_paso' => $total,
            'pasan' => $funnel[$steps[$i + 1]],
            'tasa' => $total > 0 ? round(($funnel[$steps[$i + 1]] / $total) * 100, 1) : 0
        ];
    }

    // Tiempo promedio en cada estado (desde ProspectoHistorial)
    $tiempos = [];
    try {
        $tiemposDb = db()->query(
            "SELECT estado_anterior, AVG(duracion_estado_anterior) as promedio_segundos, COUNT(*) as transiciones
             FROM ProspectoHistorial 
             WHERE duracion_estado_anterior IS NOT NULL AND duracion_estado_anterior > 0
             GROUP BY estado_anterior"
        );
        foreach ($tiemposDb as $t) {
            $tiempos[$t['estado_anterior']] = [
                'promedio_horas' => round(intval($t['promedio_segundos']) / 3600, 1),
                'promedio_dias' => round(intval($t['promedio_segundos']) / 86400, 1),
                'transiciones' => intval($t['transiciones'])
            ];
        }
    } catch (\Exception $e) { /* Tabla puede no existir aún */ }

    echo json_encode([
        'success' => true,
        'data' => [
            'funnel' => $funnel,
            'conversiones' => $conversiones,
            'tiempos_promedio' => $tiempos,
            'total_activos' => array_sum($funnel) - $funnel['perdido']
        ]
    ]);
}

/**
 * Análisis de pérdidas
 */
function getPerdidas()
{
    canView();
    $filters = getDateFilters();

    // Motivos de pérdida con conteos
    $motivos = [];
    try {
        $sql = "SELECT mp.nombre, COUNT(p.id_prospecto) as total,
                       COALESCE(SUM(p.valor_potencial), 0) as valor_perdido
                FROM MotivoPerdida mp
                LEFT JOIN Prospecto p ON p.id_motivo_perdida = mp.id AND p.estado = 'perdido' AND p.activo = 1";
        $params = [];
        if ($filters['desde']) { $sql .= " AND p.fecha_creacion >= ?"; $params[] = $filters['desde']; }
        if ($filters['hasta']) { $sql .= " AND p.fecha_creacion <= ?"; $params[] = $filters['hasta'] . ' 23:59:59'; }
        $sql .= " WHERE mp.activo = 1 GROUP BY mp.id, mp.nombre ORDER BY total DESC";
        $motivos = db()->query($sql, $params);
    } catch (\Exception $e) { /* Tabla puede no existir */ }

    // En qué estado se pierden más
    $estadosPerdida = [];
    try {
        $estadosPerdida = db()->query(
            "SELECT estado_anterior, COUNT(*) as total 
             FROM ProspectoHistorial 
             WHERE estado_nuevo IN ('perdido') 
             GROUP BY estado_anterior 
             ORDER BY total DESC"
        );
    } catch (\Exception $e) {}

    // Tendencia de pérdidas por mes (últimos 6 meses)
    $tendencia = db()->query(
        "SELECT DATE_FORMAT(fecha_creacion, '%Y-%m') as mes, COUNT(*) as total
         FROM Prospecto 
         WHERE estado = 'perdido' AND activo = 1 
           AND fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
         GROUP BY mes ORDER BY mes"
    );

    // Total perdido
    $totalPerdido = db()->queryOne(
        "SELECT COUNT(*) as total, COALESCE(SUM(valor_potencial), 0) as valor_total 
         FROM Prospecto WHERE estado = 'perdido' AND activo = 1"
    );

    echo json_encode([
        'success' => true,
        'data' => [
            'motivos' => $motivos,
            'estados_perdida' => $estadosPerdida,
            'tendencia_mensual' => $tendencia,
            'total_perdidos' => intval($totalPerdido['total'] ?? 0),
            'valor_total_perdido' => floatval($totalPerdido['valor_total'] ?? 0)
        ]
    ]);
}

/**
 * Performance por vendedor
 */
function getVendedores()
{
    canView();
    $filters = getDateFilters();

    $sql = "SELECT 
                COALESCE(u.nombre_completo, u.username, 'Sin asignar') as vendedor,
                u.id_usuario,
                COUNT(p.id_prospecto) as total,
                SUM(CASE WHEN p.estado = 'ganado' THEN 1 ELSE 0 END) as ganados,
                SUM(CASE WHEN p.estado IN ('perdido') THEN 1 ELSE 0 END) as perdidos,
                SUM(CASE WHEN p.estado NOT IN ('ganado', 'perdido') THEN 1 ELSE 0 END) as en_proceso,
                COALESCE(SUM(CASE WHEN p.estado NOT IN ('ganado', 'perdido') THEN p.valor_potencial ELSE 0 END), 0) as pipeline,
                COALESCE(SUM(CASE WHEN p.estado = 'ganado' THEN p.valor_potencial ELSE 0 END), 0) as valor_ganado
            FROM Prospecto p
            LEFT JOIN Usuario u ON p.id_usuario_asignado = u.id_usuario
            WHERE p.activo = 1";
    $params = [];
    if ($filters['desde']) { $sql .= " AND p.fecha_creacion >= ?"; $params[] = $filters['desde']; }
    if ($filters['hasta']) { $sql .= " AND p.fecha_creacion <= ?"; $params[] = $filters['hasta'] . ' 23:59:59'; }
    $sql .= " GROUP BY u.id_usuario, vendedor ORDER BY ganados DESC, total DESC";

    $vendedores = db()->query($sql, $params);

    // Calcular tasas de conversión
    foreach ($vendedores as &$v) {
        $cerrados = intval($v['ganados']) + intval($v['perdidos']);
        $v['tasa_conversion'] = $cerrados > 0
            ? round((intval($v['ganados']) / $cerrados) * 100, 1)
            : 0;
    }

    echo json_encode(['success' => true, 'data' => $vendedores]);
}

/**
 * Tendencias temporales
 */
function getTendencias()
{
    canView();

    // Nuevos por semana (últimas 12 semanas)
    $nuevos = db()->query(
        "SELECT YEARWEEK(fecha_creacion, 1) as semana, 
                MIN(DATE(fecha_creacion)) as fecha_inicio,
                COUNT(*) as total
         FROM Prospecto 
         WHERE activo = 1 AND fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 12 WEEK)
         GROUP BY semana ORDER BY semana"
    );

    // Ganados por semana
    $ganados = [];
    try {
        $ganados = db()->query(
            "SELECT YEARWEEK(ph.fecha_cambio, 1) as semana,
                    MIN(DATE(ph.fecha_cambio)) as fecha_inicio,
                    COUNT(*) as total
             FROM ProspectoHistorial ph
             WHERE ph.estado_nuevo = 'ganado' 
               AND ph.fecha_cambio >= DATE_SUB(CURDATE(), INTERVAL 12 WEEK)
             GROUP BY semana ORDER BY semana"
        );
    } catch (\Exception $e) {
        // Fallback sin historial
        $ganados = db()->query(
            "SELECT YEARWEEK(fecha_modificacion, 1) as semana,
                    MIN(DATE(fecha_modificacion)) as fecha_inicio,
                    COUNT(*) as total
             FROM Prospecto 
             WHERE estado = 'ganado' AND activo = 1 
               AND fecha_modificacion >= DATE_SUB(CURDATE(), INTERVAL 12 WEEK)
             GROUP BY semana ORDER BY semana"
        );
    }

    // Perdidos por semana
    $perdidos = db()->query(
        "SELECT YEARWEEK(fecha_modificacion, 1) as semana,
                MIN(DATE(fecha_modificacion)) as fecha_inicio,
                COUNT(*) as total
         FROM Prospecto 
         WHERE estado = 'perdido' AND activo = 1 
           AND fecha_modificacion >= DATE_SUB(CURDATE(), INTERVAL 12 WEEK)
         GROUP BY semana ORDER BY semana"
    );

    // Tasa de conversión mensual (últimos 6 meses)
    $conversionMensual = db()->query(
        "SELECT DATE_FORMAT(fecha_creacion, '%Y-%m') as mes,
                COUNT(*) as total,
                SUM(CASE WHEN estado = 'ganado' THEN 1 ELSE 0 END) as ganados
         FROM Prospecto 
         WHERE activo = 1 AND fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
         GROUP BY mes ORDER BY mes"
    );

    foreach ($conversionMensual as &$row) {
        $row['tasa'] = intval($row['total']) > 0
            ? round((intval($row['ganados']) / intval($row['total'])) * 100, 1)
            : 0;
    }

    // Pipeline value
    $pipeline = db()->queryOne(
        "SELECT COALESCE(SUM(valor_potencial), 0) as total 
         FROM Prospecto 
         WHERE estado NOT IN ('ganado', 'perdido') AND activo = 1"
    );

    echo json_encode([
        'success' => true,
        'data' => [
            'nuevos_semana' => $nuevos,
            'ganados_semana' => $ganados,
            'perdidos_semana' => $perdidos,
            'conversion_mensual' => $conversionMensual,
            'pipeline_value' => floatval($pipeline['total'] ?? 0)
        ]
    ]);
}

/**
 * Métricas de WhatsApp
 */
function getWhatsAppMetrics()
{
    canView();

    try {
        // Mensajes por día (últimos 7 días)
        $mensajesDia = db()->query(
            "SELECT DATE(fecha_creacion) as fecha, 
                    direccion,
                    COUNT(*) as total
             FROM WhatsAppMessage 
             WHERE fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
             GROUP BY fecha, direccion ORDER BY fecha"
        );

        // Tiempo promedio de primera respuesta
        $tiempoRespuesta = db()->queryOne(
            "SELECT AVG(TIMESTAMPDIFF(SECOND, 
                (SELECT MIN(m1.fecha_creacion) FROM WhatsAppMessage m1 WHERE m1.id_conversation = wc.id_conversation AND m1.direccion = 'entrante'),
                (SELECT MIN(m2.fecha_creacion) FROM WhatsAppMessage m2 WHERE m2.id_conversation = wc.id_conversation AND m2.direccion = 'saliente')
             )) as promedio_segundos
             FROM WhatsAppConversation wc
             WHERE wc.fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)"
        );

        // Bot vs humano
        $botHumano = db()->query(
            "SELECT 
                CASE WHEN es_bot = 1 THEN 'bot' ELSE 'humano' END as tipo,
                COUNT(*) as total
             FROM WhatsAppMessage 
             WHERE direccion = 'saliente' 
               AND fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
             GROUP BY tipo"
        );

        // Total conversaciones
        $totalConv = db()->queryOne(
            "SELECT COUNT(*) as total FROM WhatsAppConversation"
        );

        echo json_encode([
            'success' => true,
            'data' => [
                'mensajes_dia' => $mensajesDia,
                'tiempo_respuesta_promedio' => intval($tiempoRespuesta['promedio_segundos'] ?? 0),
                'bot_vs_humano' => $botHumano,
                'total_conversaciones' => intval($totalConv['total'] ?? 0)
            ]
        ]);
    } catch (\Exception $e) {
        echo json_encode([
            'success' => true,
            'data' => null,
            'message' => 'Módulo WhatsApp no configurado'
        ]);
    }
}

/**
 * Resumen general para KPIs
 */
function getResumen()
{
    canView();

    $totalActivos = db()->queryOne(
        "SELECT COUNT(*) as total FROM Prospecto WHERE estado NOT IN ('ganado', 'perdido') AND activo = 1"
    );

    $totalGeneral = db()->queryOne(
        "SELECT COUNT(*) as total FROM Prospecto WHERE activo = 1"
    );
    $totalGanados = db()->queryOne(
        "SELECT COUNT(*) as total FROM Prospecto WHERE estado = 'ganado' AND activo = 1"
    );

    $tasaConversion = intval($totalGeneral['total'] ?? 0) > 0
        ? round((intval($totalGanados['total'] ?? 0) / intval($totalGeneral['total'])) * 100, 1)
        : 0;

    $pipeline = db()->queryOne(
        "SELECT COALESCE(SUM(valor_potencial), 0) as total 
         FROM Prospecto WHERE estado NOT IN ('ganado', 'perdido') AND activo = 1"
    );

    // Tiempo promedio de cierre (días)
    $tiempoCierre = 0;
    try {
        $tc = db()->queryOne(
            "SELECT AVG(TIMESTAMPDIFF(DAY, p.fecha_creacion, ph.fecha_cambio)) as promedio_dias
             FROM ProspectoHistorial ph
             JOIN Prospecto p ON ph.id_prospecto = p.id_prospecto
             WHERE ph.estado_nuevo = 'ganado'"
        );
        $tiempoCierre = round(floatval($tc['promedio_dias'] ?? 0), 1);
    } catch (\Exception $e) {}

    echo json_encode([
        'success' => true,
        'data' => [
            'total_activos' => intval($totalActivos['total'] ?? 0),
            'tasa_conversion' => $tasaConversion,
            'pipeline_value' => floatval($pipeline['total'] ?? 0),
            'tiempo_promedio_cierre' => $tiempoCierre
        ]
    ]);
}

/**
 * Listar motivos de pérdida
 */
function getMotivos()
{
    canView();
    try {
        $motivos = db()->query("SELECT * FROM MotivoPerdida WHERE activo = 1 ORDER BY nombre");
        echo json_encode(['success' => true, 'data' => $motivos]);
    } catch (\Exception $e) {
        echo json_encode(['success' => true, 'data' => []]);
    }
}

/**
 * Crear motivo de pérdida
 */
function createMotivo()
{
    requireRole(['admin']);
    $data = json_decode(file_get_contents('php://input'), true);
    $nombre = trim($data['nombre'] ?? '');
    if (empty($nombre)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Nombre requerido']);
        return;
    }
    $id = db()->insert(
        "INSERT INTO MotivoPerdida (nombre, descripcion) VALUES (?, ?)",
        [$nombre, $data['descripcion'] ?? null]
    );
    echo json_encode(['success' => true, 'id' => $id]);
}

/**
 * Helper: obtener filtros de fecha desde query params
 */
function getDateFilters()
{
    return [
        'desde' => $_GET['desde'] ?? null,
        'hasta' => $_GET['hasta'] ?? null,
        'vendedor' => $_GET['vendedor'] ?? null
    ];
}
