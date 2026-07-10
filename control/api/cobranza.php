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
    
    // Select raw database columns for tariff calculations
    $sql = "SELECT s.id_servicio, s.id_sede, s.mes_servicio,
            s.fecha_ejecucion as fecha_servicio,
            COALESCE(s.estado_pago, 'pendiente') as estado_pago,
            s.fecha_pago, s.forma_pago,
            COALESCE(se.nombre_comercial, 'Sin Sede') as sede_nombre, 
            se.contacto_telefono, 
            cs.tarifa, cs.tipo_tarifa, cs.peso_limite_kg, cs.tarifa_adicional_kg, cs.frecuencia,
            m.peso_kg,
            se.distrito, se.direccion,
            COALESCE(e.razon_social, 'Sin Empresa') as empresa_razon_social, 
            e.ruc as empresa_ruc,
            f.numero_factura, f.id_factura,
            COALESCE(gc_stats.num_gestiones, 0) as num_gestiones,
            gc_stats.ultima_gestion,
            r.id_ruta, r.fecha as fecha_ruta,
            v.placa as vehiculo_placa
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
    if (!$data) $data = [];
    
    // Process list to calculate effective tariffs dynamically
    $processedData = calculateEffectiveTariffs($data);
    
    // Map processed values to frontend expected key names
    foreach ($processedData as &$row) {
        $row['tarifa_servicio'] = floatval($row['monto_total']);
    }
    
    // Calculate total historical debts per Sede to populate the deuda_cantidad and deuda_monto columns
    $deudas = getDeudasPorSede();
    foreach ($processedData as &$row) {
        $id_sede = intval($row['id_sede']);
        $deudaSede = $deudas[$id_sede] ?? ['cantidad' => 0, 'monto' => 0.0];
        
        $es_pendiente = ($row['estado_pago'] === 'pendiente');
        $row['deuda_cantidad'] = $deudaSede['cantidad'] - ($es_pendiente ? 1 : 0);
        $row['deuda_monto'] = $deudaSede['monto'] - ($es_pendiente ? floatval($row['tarifa_servicio']) : 0.0);
    }
    
    // Calculate stats dynamically to reflect correct figures
    $allPending = db()->query("
        SELECT s.id_servicio, s.id_sede, s.fecha_ejecucion, s.monto_cobrado, s.estado_pago, s.fecha_pago,
               cs.frecuencia, cs.tarifa, cs.tipo_tarifa, cs.peso_limite_kg, cs.tarifa_adicional_kg, m.peso_kg
        FROM Servicio s
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
        LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
        WHERE s.estado = 'completado'
    ");
    if (!$allPending) $allPending = [];
    $allPendingProcessed = calculateEffectiveTariffs($allPending);
    
    $total_pendiente = 0.0;
    $total_vencido = 0.0;
    $cobrado_mes = 0.0;
    $count_pendientes = 0;
    
    $currentMonth = date('m');
    $currentYear = date('Y');
    
    foreach ($allPendingProcessed as $s) {
        $tarifa_servicio = floatval($s['monto_total']);
        $es_pago_pendiente = (!isset($s['estado_pago']) || $s['estado_pago'] === null || $s['estado_pago'] === 'pendiente');
        
        if ($es_pago_pendiente) {
            $total_pendiente += $tarifa_servicio;
            
            $daysOld = (time() - strtotime($s['fecha_ejecucion'])) / (60 * 60 * 24);
            if ($daysOld > 30) {
                $total_vencido += $tarifa_servicio;
            }
            $count_pendientes++;
        } else if ($s['estado_pago'] === 'pagado') {
            if ($s['fecha_pago']) {
                $payTime = strtotime($s['fecha_pago']);
                if (date('m', $payTime) === $currentMonth && date('Y', $payTime) === $currentYear) {
                    $cobrado_mes += $tarifa_servicio;
                }
            }
        }
    }
    
    echo json_encode([
        'success' => true,
        'data' => $processedData,
        'stats' => [
            'total_pendiente' => $total_pendiente,
            'total_vencido' => $total_vencido,
            'cobrado_mes' => $cobrado_mes,
            'count_pendientes' => $count_pendientes
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
    
    // Pendientes totales (Calculados dinámicamente)
    $allPending = db()->query("
        SELECT s.id_servicio, s.id_sede, s.fecha_ejecucion, s.monto_cobrado, s.estado_pago,
               cs.frecuencia, cs.tarifa, cs.tipo_tarifa, cs.peso_limite_kg, cs.tarifa_adicional_kg, m.peso_kg
        FROM Servicio s
        LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
        LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
        WHERE s.estado = 'completado' AND COALESCE(s.estado_pago, 'pendiente') = 'pendiente'
    ");
    if (!$allPending) $allPending = [];
    $allPendingProcessed = calculateEffectiveTariffs($allPending);
    
    $pendientes_cantidad = 0;
    $pendientes_total = 0.0;
    $pendientes_vencido = 0.0;
    
    foreach ($allPendingProcessed as $s) {
        $tarifa_servicio = floatval($s['monto_total']);
        if ($tarifa_servicio > 0) {
            $pendientes_cantidad++;
            $pendientes_total += $tarifa_servicio;
            
            $daysOld = (time() - strtotime($s['fecha_ejecucion'])) / (60 * 60 * 24);
            if ($daysOld > 30) {
                $pendientes_vencido += $tarifa_servicio;
            }
        }
    }
    
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
            'cantidad' => $pendientes_cantidad,
            'total' => $pendientes_total,
            'vencido' => $pendientes_vencido
        ]
    ]);
}

/**
 * Calculates total historical pending debts per Sede
 */
function getDeudasPorSede() {
    $sql = "SELECT s.id_servicio, s.id_sede, s.fecha_ejecucion, s.monto_cobrado, s.estado_pago,
                   cs.frecuencia, cs.tarifa, cs.tipo_tarifa, cs.peso_limite_kg, cs.tarifa_adicional_kg, m.peso_kg
            FROM Servicio s
            LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
            LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
            WHERE s.estado = 'completado' 
              AND COALESCE(s.estado_pago, 'pendiente') = 'pendiente'";
    $raw = db()->query($sql);
    if (!$raw) $raw = [];
    $processed = calculateEffectiveTariffs($raw);
    
    $deudas = [];
    foreach ($processed as $s) {
        $id_sede = intval($s['id_sede']);
        $monto = floatval($s['monto_total']);
        if (!isset($deudas[$id_sede])) {
            $deudas[$id_sede] = ['cantidad' => 0, 'monto' => 0.0];
        }
        $deudas[$id_sede]['cantidad']++;
        $deudas[$id_sede]['monto'] += $monto;
    }
    return $deudas;
}

/**
 * Calculates effective billing tariffs for each service dynamically based on frequency and weight limits
 */
function calculateEffectiveTariffs($servicesList) {
    if (empty($servicesList)) return [];
    
    // Group services by id_sede and year-month
    $groups = [];
    foreach ($servicesList as $idx => $s) {
        $date = new DateTime($s['fecha_ejecucion']);
        $yearMonth = $date->format('Y-m');
        $id_sede = intval($s['id_sede']);
        
        $groups[$id_sede][$yearMonth][] = [
            'index' => $idx,
            'service' => $s,
            'day' => intval($date->format('d')),
            'week' => intval($date->format('W'))
        ];
    }
    
    $processedList = $servicesList;
    
    // Query weight lookup to get full monthly weights for relevant Sedes and Months
    $sedeIds = array_values(array_unique(array_map(function($s) { return intval($s['id_sede']); }, $servicesList)));
    $weightLookup = [];
    
    if (!empty($sedeIds)) {
        $sedePlaceholders = implode(',', array_fill(0, count($sedeIds), '?'));
        $weightRows = db()->query("
            SELECT s.id_sede, DATE_FORMAT(s.fecha_ejecucion, '%Y-%m') as mes, SUM(COALESCE(m.peso_kg, 0)) as total_peso
            FROM Servicio s
            LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
            WHERE s.estado = 'completado'
              AND s.id_sede IN ($sedePlaceholders)
            GROUP BY s.id_sede, mes
        ", $sedeIds);
        
        if ($weightRows) {
            foreach ($weightRows as $w) {
                $weightLookup[intval($w['id_sede'])][$w['mes']] = floatval($w['total_peso']);
            }
        }
    }
    
    foreach ($groups as $id_sede => $yearMonths) {
        foreach ($yearMonths as $yearMonth => $items) {
            // Sort items by date (day) ascending
            usort($items, function($a, $b) {
                return $a['day'] <=> $b['day'];
            });
            
            // Look up total weight for this month/sede from full DB records
            $totalWeight = $weightLookup[$id_sede][$yearMonth] ?? 0.0;
            
            $chargedPeriods = [];
            
            foreach ($items as $k => $item) {
                $idx = $item['index'];
                $s = $item['service'];
                $peso_kg = isset($s['peso_kg']) ? floatval($s['peso_kg']) : 0.0;
                $tarifa = floatval($s['tarifa']);
                $tipo_tarifa = isset($s['tipo_tarifa']) ? $s['tipo_tarifa'] : 'por_servicio';
                $peso_limite = isset($s['peso_limite_kg']) ? floatval($s['peso_limite_kg']) : 0.0;
                $tarifa_extra = isset($s['tarifa_adicional_kg']) ? floatval($s['tarifa_adicional_kg']) : 0.0;
                $monto_cobrado = isset($s['monto_cobrado']) && $s['monto_cobrado'] !== null ? floatval($s['monto_cobrado']) : null;
                
                if ($tipo_tarifa === 'mensual_fijo') {
                    // Monthly flat fee logic
                    if ($k === 0) {
                        $effective = $tarifa; // Charge base monthly tariff
                        
                        // Calculate weight excess surcharge
                        if ($peso_limite > 0 && $totalWeight > $peso_limite && $tarifa_extra > 0) {
                            $excess = $totalWeight - $peso_limite;
                            $effective += ($excess * $tarifa_extra);
                        }
                    } else {
                        // For subsequent services:
                        // If it has an explicit monto_cobrado that matches the monthly tariff, it is a duplicate -> 0.00
                        // If it has a different monto_cobrado (> 0), it is a custom surcharge -> keep it!
                        if ($monto_cobrado !== null && abs($monto_cobrado - $tarifa) >= 0.01 && $monto_cobrado > 0) {
                            $effective = $monto_cobrado;
                        } else {
                            $effective = 0.0;
                        }
                    }
                } else if ($tipo_tarifa === 'por_kg') {
                    $effective = $monto_cobrado !== null && $monto_cobrado > 0 ? $monto_cobrado : ($peso_kg * $tarifa);
                } else {
                    // por_servicio or fallback
                    $effective = $monto_cobrado !== null && $monto_cobrado > 0 ? $monto_cobrado : $tarifa;
                    
                    // If tipo_tarifa is not mensual_fijo but they use frequency-based monthly rules:
                    $frecuencia = $s['frecuencia'];
                    if ($frecuencia === 'mensual') {
                        $periodKey = 'month';
                        if (!isset($chargedPeriods[$periodKey])) {
                            $chargedPeriods[$periodKey] = true;
                        } else {
                            if ($monto_cobrado !== null && abs($monto_cobrado - $tarifa) < 0.01) {
                                $effective = 0.0;
                            }
                        }
                    }
                }
                
                $processedList[$idx]['monto_total'] = $effective;
            }
        }
    }
    
    return $processedList;
}
