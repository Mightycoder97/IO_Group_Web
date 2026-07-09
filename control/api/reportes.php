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
        $filterMonth = isset($_GET['month']) ? intval($_GET['month']) : intval(date('m'));
        $filterYear = isset($_GET['year']) ? intval($_GET['year']) : intval(date('Y'));
        
        if ($filterMonth < 1 || $filterMonth > 12) $filterMonth = intval(date('m'));
        if ($filterYear < 2000 || $filterYear > 2100) $filterYear = intval(date('Y'));
        
        $currentMonth = $filterMonth;
        $currentYear = $filterYear;
        
        $filterDateStart = "$currentYear-" . str_pad($currentMonth, 2, '0', STR_PAD_LEFT) . "-01";
        $filterDateEnd = date("Y-m-t", strtotime($filterDateStart));
        $filterDateNext = date("Y-m-d", strtotime("$filterDateEnd +1 day"));
        
        // Auth user name
        $user = getAuthUser();
        $userName = $user ? ($user['nombre'] ?? 'Usuario') : 'Usuario';
        
        $mesesEspanol = [
            1 => 'Enero', 2 => 'Febrero', 3 => 'Marzo', 4 => 'Abril',
            5 => 'Mayo', 6 => 'Junio', 7 => 'Julio', 8 => 'Agosto',
            9 => 'Septiembre', 10 => 'Octubre', 11 => 'Noviembre', 12 => 'Diciembre'
        ];
        $monthName = $mesesEspanol[$currentMonth] ?? 'Mes';
        
        // 1. Clientes Activos
        $clientesTotalesResult = db()->queryOne(
            "SELECT 
                SUM(CASE WHEN activo = 1 THEN 1 ELSE 0 END) as activos,
                SUM(CASE WHEN activo = 0 THEN 1 ELSE 0 END) as inactivos
             FROM Cliente"
        );
        $clientesActivosTotal = $clientesTotalesResult ? intval($clientesTotalesResult['activos']) : 0;
        $clientesInactivosTotal = $clientesTotalesResult ? intval($clientesTotalesResult['inactivos']) : 0;
        
        // Growth calculation (active current month vs previous month based on creation date)
        $activeCurrentMonthResult = db()->queryOne(
            "SELECT COUNT(*) as count 
             FROM Cliente 
             WHERE activo = 1 AND fecha_creacion < ?",
            [$filterDateNext]
        );
        $activeCurrentMonth = $activeCurrentMonthResult ? intval($activeCurrentMonthResult['count']) : 0;
        
        $prevMonthDate = date("Y-m-d", strtotime("$filterDateStart -1 month"));
        $prevMonthEndNext = date("Y-m-d", strtotime("last day of $prevMonthDate +1 day"));
        
        $activePrevMonthResult = db()->queryOne(
            "SELECT COUNT(*) as count 
             FROM Cliente 
             WHERE activo = 1 AND fecha_creacion < ?",
            [$prevMonthEndNext]
        );
        $activePrevMonth = $activePrevMonthResult ? intval($activePrevMonthResult['count']) : 0;
        
        $crecimientoClientes = 0.0;
        if ($activePrevMonth > 0) {
            $crecimientoClientes = round((($activeCurrentMonth - $activePrevMonth) / $activePrevMonth) * 100, 1);
        }
        
        // 2. Cobertura del mes
        $sedesActivasResult = db()->queryOne(
            "SELECT COUNT(*) as count 
             FROM Sede s 
             INNER JOIN Empresa e ON s.id_empresa = e.id_empresa 
             WHERE s.activo = 1 AND e.activo = 1"
        );
        $sedesActivas = $sedesActivasResult ? intval($sedesActivasResult['count']) : 0;
        
        $sedesAtendidasResult = db()->queryOne(
            "SELECT COUNT(DISTINCT s.id_sede) as count 
             FROM Servicio sv 
             INNER JOIN Sede s ON sv.id_sede = s.id_sede
             INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
             WHERE sv.fecha_ejecucion >= ?
             AND sv.fecha_ejecucion < ?
             AND s.activo = 1 AND e.activo = 1
             AND sv.estado IN ('completado', 'en_curso', 'programado')",
            [$filterDateStart, $filterDateNext]
        );
        $sedesAtendidas = $sedesAtendidasResult ? intval($sedesAtendidasResult['count']) : 0;
        $porcentajeCobertura = $sedesActivas > 0 ? round(($sedesAtendidas / $sedesActivas) * 100, 1) : 0.0;
        
        // Cobertura growth compared to previous month
        $prevMonthDateStart = date("Y-m-d", strtotime("$filterDateStart -1 month"));
        $sedesAtendidasPrevResult = db()->queryOne(
            "SELECT COUNT(DISTINCT s.id_sede) as count 
             FROM Servicio sv 
             INNER JOIN Sede s ON sv.id_sede = s.id_sede
             INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
             WHERE sv.fecha_ejecucion >= ?
             AND sv.fecha_ejecucion < ?
             AND s.activo = 1 AND e.activo = 1
             AND sv.estado IN ('completado', 'en_curso', 'programado')",
            [$prevMonthDateStart, $filterDateStart]
        );
        $sedesAtendidasPrev = $sedesAtendidasPrevResult ? intval($sedesAtendidasPrevResult['count']) : 0;
        $porcentajeCoberturaPrev = $sedesActivas > 0 ? round(($sedesAtendidasPrev / $sedesActivas) * 100, 1) : 0.0;
        $crecimientoCobertura = round($porcentajeCobertura - $porcentajeCoberturaPrev, 1);
        
        // List of pending sedes
        $sedesSinServicioRaw = getSedesSinServicioMes($filterDateStart, $filterDateNext);
        $sedesSinServicioLista = [];
        $currentDateTimeObj = new DateTime($filterDateStart);
        
        foreach ($sedesSinServicioRaw as $sedeItem) {
            $ultimoServicio = $sedeItem['ultimo_servicio_fecha'];
            $mesesText = 'Nunca';
            $mesesCount = null;
            if ($ultimoServicio) {
                $lastDateObj = new DateTime($ultimoServicio);
                $diff = $lastDateObj->diff($currentDateTimeObj);
                $mesesCount = ($diff->y * 12) + $diff->m;
                $mesesText = $mesesCount > 0 ? "$mesesCount " . ($mesesCount == 1 ? "mes" : "meses") : "0 meses";
            }
            $sedeItem['meses_sin_servicio'] = $mesesText;
            $sedeItem['meses_sin_servicio_raw'] = $mesesCount;
            $sedesSinServicioLista[] = $sedeItem;
        }
        $cantidadSedesPendientes = count($sedesSinServicioLista);
        
        // 3. Ingresos (Calculado dinámicamente según frecuencia de contrato)
        $servicesQuery = "
            SELECT s.id_servicio, s.id_sede, s.fecha_ejecucion, s.monto_cobrado, s.estado_pago,
                   se.nombre_comercial as sede_nombre, e.razon_social as empresa_razon_social,
                   cs.frecuencia, cs.tarifa, cs.tipo_tarifa, cs.peso_limite_kg, cs.tarifa_adicional_kg, m.peso_kg
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
            LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
            WHERE s.estado = 'completado'
              AND s.fecha_ejecucion >= ?
              AND s.fecha_ejecucion < ?
        ";
        
        $rawServices = db()->query($servicesQuery, [$filterDateStart, $filterDateNext]);
        if (!$rawServices) $rawServices = [];
        $processedServices = calculateEffectiveTariffs($rawServices);
        
        $totalIngresoProducido = 0.0;
        $ingresoPagadoMes = 0.0;
        $ingresoPendienteMes = 0.0;
        $clientesPendientesLista = [];
        
        foreach ($processedServices as $s) {
            $monto_total = floatval($s['monto_total']);
            $totalIngresoProducido += $monto_total;
            
            if (isset($s['estado_pago']) && $s['estado_pago'] === 'pagado') {
                $ingresoPagadoMes += $monto_total;
            } else {
                $ingresoPendienteMes += $monto_total;
                if ($monto_total > 0) {
                    $clientesPendientesLista[] = [
                        'id_servicio' => intval($s['id_servicio']),
                        'fecha_ejecucion' => $s['fecha_ejecucion'],
                        'estado_pago' => $s['estado_pago'] ?: 'pendiente',
                        'sede_nombre' => $s['sede_nombre'],
                        'empresa_razon_social' => $s['empresa_razon_social'],
                        'monto_total' => $monto_total
                    ];
                }
            }
        }
        
        // Sort pending list desc
        usort($clientesPendientesLista, function($a, $b) {
            return $b['monto_total'] <=> $a['monto_total'];
        });
        
        // Previous Month Ingresos (for growth indicator)
        $rawServicesPrev = db()->query($servicesQuery, [$prevMonthDateStart, $filterDateStart]);
        if (!$rawServicesPrev) $rawServicesPrev = [];
        $processedServicesPrev = calculateEffectiveTariffs($rawServicesPrev);
        
        $totalIngresoPrev = 0.0;
        foreach ($processedServicesPrev as $s) {
            $totalIngresoPrev += floatval($s['monto_total']);
        }
        
        $crecimientoIngresos = 0.0;
        if ($totalIngresoPrev > 0) {
            $crecimientoIngresos = round((($totalIngresoProducido - $totalIngresoPrev) / $totalIngresoPrev) * 100, 1);
        }
        
        // 4. Egresos
        $egresosTotalesResult = db()->queryOne(
            "SELECT COALESCE(SUM(monto), 0) as total 
             FROM Egreso 
             WHERE fecha >= ? AND fecha < ?",
            [$filterDateStart, $filterDateNext]
        );
        $totalEgreso = $egresosTotalesResult ? floatval($egresosTotalesResult['total']) : 0.0;
        
        // Egresos by category
        $egresosCategorias = db()->query(
            "SELECT categoria, COALESCE(SUM(monto), 0) as total, COUNT(*) as cantidad
             FROM Egreso
             WHERE fecha >= ? AND fecha < ?
             GROUP BY categoria
             ORDER BY total DESC",
            [$filterDateStart, $filterDateNext]
        );
        if (!$egresosCategorias) $egresosCategorias = [];
        foreach ($egresosCategorias as &$cat) {
            $cat['total'] = floatval($cat['total']);
            $cat['cantidad'] = intval($cat['cantidad']);
        }
        
        // Egresos by vehicle (category 'operativo')
        $egresosCamiones = db()->query(
            "SELECT v.id_vehiculo, v.placa, v.marca, v.modelo, COALESCE(SUM(e.monto), 0) as total, COUNT(*) as cantidad
             FROM Egreso e
             INNER JOIN Vehiculo v ON e.id_vehiculo = v.id_vehiculo
             WHERE e.categoria = 'operativo'
               AND e.fecha >= ?
               AND e.fecha < ?
             GROUP BY v.id_vehiculo, v.placa, v.marca, v.modelo
             ORDER BY total DESC",
            [$filterDateStart, $filterDateNext]
        );
        if (!$egresosCamiones) $egresosCamiones = [];
        foreach ($egresosCamiones as &$cam) {
            $cam['total'] = floatval($cam['total']);
            $cam['cantidad'] = intval($cam['cantidad']);
        }
        
        // 5. Rentabilidad
        $gananciaMes = $totalIngresoProducido - $totalEgreso;
        $rentabilidadMes = $totalIngresoProducido > 0 ? round(($gananciaMes / $totalIngresoProducido) * 100, 1) : 0.0;
        
        // 6. Annual performance breakdown (Ingresos vs Egresos)
        $facturacionAnual = [];
        for ($m = 1; $m <= 12; $m++) {
            $monthStr = str_pad($m, 2, '0', STR_PAD_LEFT);
            $key = "$currentYear-$monthStr";
            $monthStart = "$key-01";
            $monthNext = date("Y-m-d", strtotime("$monthStart +1 month"));
            
            $rawServicesMonth = db()->query($servicesQuery, [$monthStart, $monthNext]);
            if (!$rawServicesMonth) $rawServicesMonth = [];
            $processedServicesMonth = calculateEffectiveTariffs($rawServicesMonth);
            $ingTotal = 0.0;
            foreach ($processedServicesMonth as $s) {
                $ingTotal += floatval($s['monto_total']);
            }
            
            $egQuery = db()->queryOne(
                "SELECT COALESCE(SUM(monto), 0) as total 
                 FROM Egreso 
                 WHERE fecha >= ? AND fecha < ?",
                [$monthStart, $monthNext]
            );
            $egTotal = $egQuery ? floatval($egQuery['total']) : 0.0;
            
            $dateObj = DateTime::createFromFormat('!m', $m);
            $monthAbbr = $dateObj ? $dateObj->format('M') : '';
            
            $facturacionAnual[] = [
                'mes' => $key,
                'mes_label' => $monthAbbr ? "$monthAbbr $currentYear" : $key,
                'ingreso' => $ingTotal,
                'egreso' => $egTotal,
                'ganancia' => $ingTotal - $egTotal
            ];
        }
        
        // 7. CRM Sales Summary
        $crmPipelineResult = db()->queryOne(
            "SELECT COALESCE(SUM(valor_potencial), 0) as total, COUNT(*) as count 
             FROM Prospecto 
             WHERE activo = 1 AND estado NOT IN ('ganado', 'perdido')"
        );
        $pipelineTotalValue = $crmPipelineResult ? floatval($crmPipelineResult['total']) : 0.0;
        $pipelineProspectsCount = $crmPipelineResult ? intval($crmPipelineResult['count']) : 0;
        
        $crmStages = db()->query(
            "SELECT estado, COUNT(*) as cantidad, COALESCE(SUM(valor_potencial), 0) as valor_total
             FROM Prospecto
             WHERE activo = 1
             GROUP BY estado
             ORDER BY FIELD(estado, 'nuevo', 'contactado', 'interesado', 'propuesta', 'negociacion', 'ganado', 'perdido')"
        );
        if (!$crmStages) $crmStages = [];
        foreach ($crmStages as &$stg) {
            $stg['cantidad'] = intval($stg['cantidad']);
            $stg['valor_total'] = floatval($stg['valor_total']);
        }
        
        $crmSources = db()->query(
            "SELECT COALESCE(fuente, 'No Especificado') as fuente, COUNT(*) as cantidad, COALESCE(SUM(valor_potencial), 0) as valor_total
             FROM Prospecto
             WHERE activo = 1
             GROUP BY fuente
             ORDER BY cantidad DESC
             LIMIT 5"
        );
        if (!$crmSources) $crmSources = [];
        foreach ($crmSources as &$src) {
            $src['cantidad'] = intval($src['cantidad']);
            $src['valor_total'] = floatval($src['valor_total']);
        }
        
        // 8. Contratos vencidos
        $contratosVencidosRenovacion = getContratosVencidosRenovacion();
        
        echo json_encode([
            'success' => true,
            'data' => [
                'periodo' => [
                    'month' => $currentMonth,
                    'year' => $currentYear,
                    'month_name' => $monthName
                ],
                'usuario' => [
                    'nombre' => $userName
                ],
                'clientes_activos' => [
                    'total_activos' => $clientesActivosTotal,
                    'total_inactivos' => $clientesInactivosTotal,
                    'crecimiento' => $crecimientoClientes
                ],
                'cobertura' => [
                    'porcentaje' => $porcentajeCobertura,
                    'sedes_atendidas' => $sedesAtendidas,
                    'sedes_activas' => $sedesActivas,
                    'sedes_pendientes_cantidad' => $cantidadSedesPendientes,
                    'sedes_pendientes_lista' => $sedesSinServicioLista,
                    'crecimiento' => $crecimientoCobertura
                ],
                'ingresos' => [
                    'total' => $totalIngresoProducido,
                    'pagado' => $ingresoPagadoMes,
                    'pendiente' => $ingresoPendienteMes,
                    'crecimiento' => $crecimientoIngresos,
                    'clientes_pendientes_lista' => $clientesPendientesLista
                ],
                'egresos' => [
                    'total' => $totalEgreso,
                    'por_categoria' => $egresosCategorias,
                    'por_camion' => $egresosCamiones
                ],
                'rentabilidad' => [
                    'porcentaje' => $rentabilidadMes,
                    'ganancia' => $gananciaMes
                ],
                'comparativo_anual' => $facturacionAnual,
                'crm' => [
                    'pipeline_total' => $pipelineTotalValue,
                    'prospectos_cantidad' => $pipelineProspectsCount,
                    'por_etapa' => $crmStages,
                    'por_fuente' => $crmSources
                ],
                'contratos_vencidos_cantidad' => count($contratosVencidosRenovacion),
                'contratos_vencidos_lista' => $contratosVencidosRenovacion
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

function getSedesSinServicioMes($fechaInicio, $fechaFinExclusiva) {
    $sql = "SELECT
                s.id_sede,
                s.nombre_comercial AS sede_nombre,
                s.direccion AS sede_direccion,
                s.distrito AS sede_distrito,
                s.provincia AS sede_provincia,
                s.contacto_nombre,
                s.contacto_telefono,
                e.id_empresa,
                e.razon_social AS empresa_razon_social,
                e.ruc AS empresa_ruc,
                cs.id_contrato,
                cs.frecuencia,
                cs.tarifa,
                cs.tipo_tarifa,
                cs.peso_limite_kg,
                ult.ultimo_servicio_fecha
             FROM Sede s
             INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
             LEFT JOIN (
                SELECT cs1.*
                FROM ContratoServicio cs1
                INNER JOIN (
                    SELECT id_sede, MAX(id_contrato) AS id_contrato
                    FROM ContratoServicio
                    WHERE activo = 1
                    GROUP BY id_sede
                ) latest ON latest.id_contrato = cs1.id_contrato
             ) cs ON cs.id_sede = s.id_sede
             LEFT JOIN (
                SELECT id_sede, MAX(fecha_ejecucion) AS ultimo_servicio_fecha
                FROM Servicio
                WHERE estado IN ('completado', 'en_curso', 'programado')
                GROUP BY id_sede
             ) ult ON ult.id_sede = s.id_sede
             WHERE s.activo = 1 AND e.activo = 1
               AND NOT EXISTS (
                    SELECT 1
                    FROM Servicio sv
                    WHERE sv.id_sede = s.id_sede
                      AND sv.fecha_ejecucion >= ?
                      AND sv.fecha_ejecucion < ?
                      AND sv.estado IN ('completado', 'en_curso', 'programado')
               )
               AND (
                    cs.frecuencia IS NULL
                    OR cs.frecuencia NOT IN ('bimestral', 'bimensual', 'trimestral', 'quincenal', 'semanal', 'diario', 'diaria', 'interdiario', 'eventual', 'por_llamada')
                    OR cs.frecuencia = 'mensual'
                    OR (cs.frecuencia IN ('bimestral', 'bimensual') AND PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM ?), EXTRACT(YEAR_MONTH FROM COALESCE(ult.ultimo_servicio_fecha, cs.fecha_inicio))) >= 2)
                    OR (cs.frecuencia = 'trimestral' AND PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM ?), EXTRACT(YEAR_MONTH FROM COALESCE(ult.ultimo_servicio_fecha, cs.fecha_inicio))) >= 3)
                    OR (cs.frecuencia = 'quincenal' AND DATEDIFF(LEAST(CAST(? AS DATE), CURDATE()), COALESCE(ult.ultimo_servicio_fecha, cs.fecha_inicio)) >= 15)
                    OR (cs.frecuencia = 'semanal' AND DATEDIFF(LEAST(CAST(? AS DATE), CURDATE()), COALESCE(ult.ultimo_servicio_fecha, cs.fecha_inicio)) >= 7)
                    OR (cs.frecuencia IN ('diario', 'diaria') AND DATEDIFF(LEAST(CAST(? AS DATE), CURDATE()), COALESCE(ult.ultimo_servicio_fecha, cs.fecha_inicio)) >= 2)
                    OR (cs.frecuencia = 'interdiario' AND DATEDIFF(LEAST(CAST(? AS DATE), CURDATE()), COALESCE(ult.ultimo_servicio_fecha, cs.fecha_inicio)) >= 3)
               )
             ORDER BY e.razon_social ASC, s.nombre_comercial ASC";

    $rows = db()->query($sql, [
        $fechaInicio,        // 1. sv.fecha_ejecucion >= ?        (NOT EXISTS)
        $fechaFinExclusiva,  // 2. sv.fecha_ejecucion < ?         (NOT EXISTS)
        $fechaInicio,        // 3. PERIOD_DIFF bimestral/bimensual
        $fechaInicio,        // 4. PERIOD_DIFF trimestral
        $fechaFinExclusiva,  // 5. DATEDIFF quincenal
        $fechaFinExclusiva,  // 6. DATEDIFF semanal
        $fechaFinExclusiva,  // 7. DATEDIFF diario/diaria
        $fechaFinExclusiva   // 8. DATEDIFF interdiario
    ]);
    if (!$rows) return [];

    foreach ($rows as &$row) {
        $row['id_sede'] = intval($row['id_sede']);
        $row['id_empresa'] = intval($row['id_empresa']);
        $row['id_contrato'] = $row['id_contrato'] !== null ? intval($row['id_contrato']) : null;
        $row['tarifa'] = $row['tarifa'] !== null ? floatval($row['tarifa']) : null;
        $row['peso_limite_kg'] = $row['peso_limite_kg'] !== null ? floatval($row['peso_limite_kg']) : null;
    }

    return $rows;
}

function getContratosVencidosRenovacion() {
    $sql = "SELECT
                cs.id_contrato,
                cs.id_sede,
                cs.fecha_inicio,
                cs.fecha_fin,
                cs.frecuencia,
                cs.tarifa,
                cs.tipo_tarifa,
                cs.peso_limite_kg,
                DATEDIFF(CURDATE(), cs.fecha_fin) AS dias_vencido,
                s.nombre_comercial AS sede_nombre,
                s.direccion AS sede_direccion,
                s.distrito AS sede_distrito,
                s.provincia AS sede_provincia,
                e.id_empresa,
                e.razon_social AS empresa_razon_social,
                e.ruc AS empresa_ruc,
                rp.id_proceso AS id_proceso_renovacion
             FROM ContratoServicio cs
             INNER JOIN Sede s ON cs.id_sede = s.id_sede
             INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
             LEFT JOIN (
                SELECT
                    MAX(id_proceso) AS id_proceso,
                    CAST(JSON_UNQUOTE(JSON_EXTRACT(datos_json, '$.renovacion.id_contrato_anterior')) AS UNSIGNED) AS id_contrato_anterior
                FROM ProcesoAlta
                WHERE etapa_actual < 4
                  AND JSON_UNQUOTE(JSON_EXTRACT(datos_json, '$.tipo_proceso')) = 'renovacion_contrato'
                GROUP BY id_contrato_anterior
             ) rp ON rp.id_contrato_anterior = cs.id_contrato
             WHERE cs.activo = 1
               AND s.activo = 1 AND e.activo = 1
               AND cs.fecha_fin IS NOT NULL
               AND cs.fecha_fin < CURDATE()
             ORDER BY cs.fecha_fin ASC, s.nombre_comercial ASC";

    try {
        $rows = db()->query($sql);
    } catch (Exception $e) {
        $rows = db()->query(
            "SELECT
                cs.id_contrato,
                cs.id_sede,
                cs.fecha_inicio,
                cs.fecha_fin,
                cs.frecuencia,
                cs.tarifa,
                cs.tipo_tarifa,
                cs.peso_limite_kg,
                DATEDIFF(CURDATE(), cs.fecha_fin) AS dias_vencido,
                s.nombre_comercial AS sede_nombre,
                s.direccion AS sede_direccion,
                s.distrito AS sede_distrito,
                s.provincia AS sede_provincia,
                e.id_empresa,
                e.razon_social AS empresa_razon_social,
                e.ruc AS empresa_ruc,
                NULL AS id_proceso_renovacion
             FROM ContratoServicio cs
             INNER JOIN Sede s ON cs.id_sede = s.id_sede
             INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
             WHERE cs.activo = 1
               AND s.activo = 1 AND e.activo = 1
               AND cs.fecha_fin IS NOT NULL
               AND cs.fecha_fin < CURDATE()
             ORDER BY cs.fecha_fin ASC, s.nombre_comercial ASC"
        );
    }

    foreach ($rows as &$row) {
        $row['id_contrato'] = intval($row['id_contrato']);
        $row['id_sede'] = intval($row['id_sede']);
        $row['id_empresa'] = intval($row['id_empresa']);
        $row['dias_vencido'] = intval($row['dias_vencido']);
        $row['tarifa'] = floatval($row['tarifa']);
        $row['peso_limite_kg'] = $row['peso_limite_kg'] !== null ? floatval($row['peso_limite_kg']) : null;
        $row['id_proceso_renovacion'] = $row['id_proceso_renovacion'] !== null ? intval($row['id_proceso_renovacion']) : null;
    }

    return $rows ?: [];
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
    
    // Schema correction: Factura table only has: id_factura, id_servicio, numero_factura, doc_escaneado, fecha_creacion
    // We must join with Servicio and ContratoServicio to get details and amounts
    
    $facturas = db()->query(
        "SELECT f.*, 
                s.fecha_ejecucion, 
                s.estado_pago,
                e.razon_social as empresa_razon_social,
                CASE WHEN s.estado_pago = 'pagado' THEN COALESCE(s.monto_cobrado, 0) ELSE COALESCE(s.monto_cobrado, cs.tarifa, 0) END as monto_total
         FROM Factura f
         INNER JOIN Servicio s ON f.id_servicio = s.id_servicio
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
         WHERE MONTH(f.fecha_creacion) = ? AND YEAR(f.fecha_creacion) = ?
         ORDER BY f.fecha_creacion DESC",
        [$mes, $anio]
    );
    
    // Calculate totals based on the same logic
    // Using s.estado_pago for status instead of f.estado which doesn't exist
    $totales = db()->queryOne(
        "SELECT 
            COUNT(*) as total_facturas,
            COALESCE(SUM(CASE WHEN s.estado_pago = 'pagado' THEN COALESCE(s.monto_cobrado, 0) ELSE COALESCE(s.monto_cobrado, cs.tarifa, 0) END), 0) as total_facturado,
            COALESCE(SUM(CASE WHEN s.estado_pago = 'pagado' THEN COALESCE(s.monto_cobrado, 0) ELSE 0 END), 0) as total_cobrado,
            COALESCE(SUM(CASE WHEN COALESCE(s.estado_pago, 'pendiente') = 'pendiente' THEN COALESCE(s.monto_cobrado, cs.tarifa, 0) ELSE 0 END), 0) as total_pendiente
         FROM Factura f
         INNER JOIN Servicio s ON f.id_servicio = s.id_servicio
         LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
         WHERE MONTH(f.fecha_creacion) = ? AND YEAR(f.fecha_creacion) = ?",
        [$mes, $anio]
    );
    
    echo json_encode([
        'success' => true,
        'data' => $facturas,
        'totales' => $totales
    ]);
}

/**
 * Calculates effective billing tariffs for each service dynamically based on frequency
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
    $sedeIds = array_unique(array_map(function($s) { return intval($s['id_sede']); }, $servicesList));
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
