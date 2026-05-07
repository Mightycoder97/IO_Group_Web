<?php
/**
 * IO Group - Control de Ruta API
 * Batch update services per route with digital signatures via AuditLog
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';
require_once __DIR__ . '/helpers/ruta_plan.php';

$method = $_SERVER['REQUEST_METHOD'];
$id_ruta = $_GET['id_ruta'] ?? null;
$action  = $_GET['action'] ?? null;

switch ($method) {
    case 'GET':
        if ($id_ruta) getRouteServices($id_ruta);
        else {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'id_ruta requerido']);
        }
        break;
    case 'PUT':
        if ($action === 'batch_update') batchUpdate();
        else {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Acción no válida']);
        }
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

/**
 * GET ?id_ruta=X
 * Returns route info + all services with their current state/payment and digital signatures
 */
function getRouteServices($id_ruta) {
    canView();

    try {
        // Get route header
        $ruta = db()->queryOne(
            "SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca, v.modelo as vehiculo_modelo,
                    CONCAT(ch.nombres, ' ', ch.apellidos) as chofer_nombre,
                    CONCAT(ay.nombres, ' ', ay.apellidos) as ayudante_nombre
             FROM Ruta r
             INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
             LEFT JOIN Empleado ch ON r.id_chofer = ch.id_empleado
             LEFT JOIN Empleado ay ON r.id_ayudante = ay.id_empleado
             WHERE r.id_ruta = ?",
            [$id_ruta]
        );

        if (!$ruta) {
            http_response_code(404);
            echo json_encode(['success' => false, 'message' => 'Ruta no encontrada']);
            return;
        }

        // Get services for this route with sede/empresa info and tarifa
        $servicios = db()->query(
            "SELECT s.id_servicio, s.id_sede, s.estado, s.estado_pago, s.forma_pago,
                    s.fecha_pago, s.residuo, s.observaciones,
                    se.nombre_comercial as sede_nombre, se.direccion, se.distrito,
                    se.contacto_nombre, se.contacto_telefono,
                    e.ruc as empresa_ruc, e.razon_social as empresa_razon_social,
                    cs.tarifa as tarifa_servicio
             FROM Servicio s
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             LEFT JOIN (
                 SELECT cs1.id_sede, cs1.tarifa
                 FROM ContratoServicio cs1
                 WHERE cs1.activo = 1
                 AND cs1.fecha_inicio = (
                     SELECT MAX(cs2.fecha_inicio) FROM ContratoServicio cs2
                     WHERE cs2.id_sede = cs1.id_sede AND cs2.activo = 1
                 )
             ) cs ON s.id_sede = cs.id_sede
             WHERE s.id_ruta = ?
             ORDER BY s.id_servicio ASC",
            [$id_ruta]
        );

        if (empty($servicios)) {
            $servicios = buildRutaPlanServicios(getRutaPlanSedes($id_ruta));
            $ruta['servicios'] = $servicios;
            $ruta['pendientes_pago'] = count($servicios);
            echo json_encode(['success' => true, 'data' => $ruta]);
            return;
        }

        // Collect service IDs to fetch signatures from AuditLog
        $ids = array_map(fn($s) => intval($s['id_servicio']), $servicios);
        $placeholders = implode(',', $ids);

        // Fetch digital signatures: last UPDATE per service per action type
        // We distinguish service confirmation vs payment confirmation via datos_nuevos JSON
        $logs = db()->query(
            "SELECT al.id_registro, al.datos_nuevos, al.fecha_hora,
                    u.nombre_completo as usuario_nombre, u.username
             FROM AuditLog al
             LEFT JOIN Usuario u ON al.id_usuario = u.id_usuario
             WHERE al.tabla_afectada = 'Servicio'
               AND al.accion = 'UPDATE'
               AND al.id_registro IN ($placeholders)
             ORDER BY al.fecha_hora ASC"
        );

        // Build signature maps keyed by id_servicio
        $firmaServicio = [];
        $firmaPago    = [];

        foreach ($logs as $log) {
            $sid = intval($log['id_registro']);
            $datos = json_decode($log['datos_nuevos'] ?? '{}', true);
            $usuario = $log['usuario_nombre'] ?? $log['username'] ?? 'Desconocido';
            $ts      = $log['fecha_hora'];

            // If the log entry contains 'estado' key → service confirmation signature
            if (isset($datos['estado']) && $datos['estado'] !== 'programado') {
                $firmaServicio[$sid] = ['usuario' => $usuario, 'fecha_hora' => $ts, 'estado' => $datos['estado']];
            }
            // If the log entry contains 'estado_pago' key → payment confirmation signature
            if (isset($datos['estado_pago'])) {
                $firmaPago[$sid] = ['usuario' => $usuario, 'fecha_hora' => $ts, 'estado_pago' => $datos['estado_pago'], 'forma_pago' => $datos['forma_pago'] ?? null];
            }
        }

        // Attach signatures to each service
        foreach ($servicios as &$s) {
            $sid = intval($s['id_servicio']);
            $s['firma_servicio'] = $firmaServicio[$sid] ?? null;
            $s['firma_pago']     = $firmaPago[$sid] ?? null;
        }
        unset($s);

        $ruta['servicios'] = $servicios;

        // Count services with pending payment for badge rendering
        $pendientesPago = db()->queryOne(
            "SELECT COUNT(*) as cnt FROM Servicio WHERE id_ruta = ? AND (estado_pago IS NULL OR estado_pago = 'pendiente')",
            [$id_ruta]
        );
        $ruta['pendientes_pago'] = intval($pendientesPago['cnt'] ?? 0);

        echo json_encode(['success' => true, 'data' => $ruta]);

    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
    }
}

/**
 * PUT ?action=batch_update
 * Body: { id_ruta: X, servicios: [ { id_servicio, estado, estado_pago, forma_pago, fecha_pago } ] }
 * Updates each service and writes AuditLog entries as digital signatures.
 * 
 * Route state logic:
 *  - ALL services estado != 'programado' AND ALL estado_pago = 'pagado' → 'completada'
 *  - ALL services estado != 'programado' BUT some estado_pago = 'pendiente' → 'procesada'
 *  - Otherwise → unchanged
 */
function batchUpdate() {
    $user = canEdit();
    $txStarted = false;

    try {
        $data = json_decode(file_get_contents('php://input'), true);
        $id_ruta   = $data['id_ruta'] ?? null;
        $servicios = $data['servicios'] ?? [];

        if (!$id_ruta || empty($servicios)) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'id_ruta y servicios son requeridos']);
            return;
        }

        // Verify route exists
        $ruta = db()->queryOne("SELECT * FROM Ruta WHERE id_ruta = ?", [$id_ruta]);
        if (!$ruta) {
            http_response_code(404);
            echo json_encode(['success' => false, 'message' => 'Ruta no encontrada']);
            return;
        }

        $estadosValidos = ['en_curso', 'completado', 'cancelado'];
        $estadosPagoValidos = ['pendiente', 'pagado'];

        foreach ($servicios as $srv) {
            $estado = $srv['estado'] ?? null;
            $estado_pago = $srv['estado_pago'] ?? 'pendiente';
            $forma_pago = trim($srv['forma_pago'] ?? '');
            $id_servicio = intval($srv['id_servicio'] ?? 0);
            $id_sede = intval($srv['id_sede'] ?? 0);

            if ($id_servicio <= 0 && !$id_sede) {
                http_response_code(400);
                echo json_encode(['success' => false, 'message' => 'Cada servicio debe tener una sede asignada']);
                return;
            }
            if (!$estado || !in_array($estado, $estadosValidos)) {
                http_response_code(400);
                echo json_encode(['success' => false, 'message' => 'Todas las sedes deben tener el estado del servicio confirmado']);
                return;
            }
            if (!$estado_pago || !in_array($estado_pago, $estadosPagoValidos)) {
                http_response_code(400);
                echo json_encode(['success' => false, 'message' => 'Estado de pago no valido']);
                return;
            }
            if ($estado_pago === 'pagado' && $forma_pago === '') {
                http_response_code(400);
                echo json_encode(['success' => false, 'message' => 'Los pagos marcados como pagados requieren metodo de pago']);
                return;
            }
        }

        db()->beginTransaction();
        $txStarted = true;

        $ruta = db()->queryOne("SELECT * FROM Ruta WHERE id_ruta = ? FOR UPDATE", [$id_ruta]);
        $updated = 0;
        $created = 0;
        $today = date('Y-m-d');

        foreach ($servicios as $srv) {
            $id_servicio  = intval($srv['id_servicio'] ?? 0);
            $id_sede      = intval($srv['id_sede'] ?? 0);

            $estado       = $srv['estado'] ?? null;
            $estado_pago  = $srv['estado_pago'] ?? 'pendiente';
            $forma_pago   = trim($srv['forma_pago'] ?? '') ?: null;
            $fecha_pago   = ($estado_pago === 'pagado') ? ($srv['fecha_pago'] ?? $today) : null;
            $residuo      = trim($srv['residuo'] ?? '') ?: null;
            $observaciones = trim($srv['observaciones'] ?? ($srv['obs'] ?? '')) ?: null;

            // Fetch existing service
            $existing = null;
            if ($id_servicio > 0) {
                $existing = db()->queryOne(
                    "SELECT * FROM Servicio WHERE id_servicio = ? AND id_ruta = ?",
                    [$id_servicio, $id_ruta]
                );
            }
            if (!$existing && $id_sede > 0) {
                $existing = db()->queryOne(
                    "SELECT * FROM Servicio WHERE id_ruta = ? AND id_sede = ?",
                    [$id_ruta, $id_sede]
                );
            }

            if (!$existing) {
                createServicioFromControl($ruta, $srv, $user, $today);
                $created++;
                $updated++;
                continue;
            }

            $id_servicio = intval($existing['id_servicio']);

            // Build update
            $nuevosDatos = [];

            if ($estado && $estado !== $existing['estado']) {
                $nuevosDatos['estado'] = $estado;
            }
            if ($estado_pago && $estado_pago !== ($existing['estado_pago'] ?? 'pendiente')) {
                $nuevosDatos['estado_pago'] = $estado_pago;
                if ($forma_pago) $nuevosDatos['forma_pago'] = $forma_pago;
                if ($fecha_pago) $nuevosDatos['fecha_pago'] = $fecha_pago;
            } elseif ($forma_pago && $forma_pago !== $existing['forma_pago']) {
                // Update forma_pago even if estado_pago unchanged
                $nuevosDatos['forma_pago'] = $forma_pago;
            }
            if ($residuo !== null && $residuo !== $existing['residuo']) {
                $nuevosDatos['residuo'] = $residuo;
            }
            if ($observaciones !== null && $observaciones !== ($existing['observaciones'] ?? null)) {
                $nuevosDatos['observaciones'] = $observaciones;
            }

            if (!empty($nuevosDatos)) {

                // Execute UPDATE
                db()->execute(
                    "UPDATE Servicio SET
                        estado       = COALESCE(?, estado),
                        estado_pago  = COALESCE(?, estado_pago),
                        forma_pago   = COALESCE(?, forma_pago),
                        fecha_pago   = COALESCE(?, fecha_pago),
                        residuo      = COALESCE(?, residuo),
                        observaciones = COALESCE(?, observaciones),
                        fecha_modificacion = NOW()
                     WHERE id_servicio = ?",
                    [
                        $nuevosDatos['estado']        ?? null,
                        $nuevosDatos['estado_pago']   ?? null,
                        $nuevosDatos['forma_pago']    ?? null,
                        $nuevosDatos['fecha_pago']    ?? null,
                        $nuevosDatos['residuo']       ?? null,
                        $nuevosDatos['observaciones'] ?? null,
                        $id_servicio
                    ]
                );

            // Write AuditLog signature — full nuevos datos for traceability
            $auditData = array_merge($nuevosDatos, [
                'id_servicio' => $id_servicio,
                'id_ruta'     => $id_ruta,
                'timestamp'   => date('Y-m-d H:i:s')
            ]);

            db()->execute(
                "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos, ip_address)
                 VALUES (?, 'Servicio', ?, 'UPDATE', ?, ?, ?)",
                [
                    $user['id'],
                    $id_servicio,
                    json_encode(['estado' => $existing['estado'], 'estado_pago' => $existing['estado_pago'], 'forma_pago' => $existing['forma_pago']]),
                    json_encode($auditData),
                    $_SERVER['REMOTE_ADDR'] ?? null
                ]
            );

                $updated++;
            }

            saveServicioDocsFromControl($id_servicio, $srv);
        }

        $totalServicios = db()->queryOne(
            "SELECT COUNT(*) as cnt FROM Servicio WHERE id_ruta = ?",
            [$id_ruta]
        );

        // Check service states for route status determination
        $pendientesEstado = db()->queryOne(
            "SELECT COUNT(*) as cnt FROM Servicio WHERE id_ruta = ? AND estado = 'programado'",
            [$id_ruta]
        );
        $todosEstadoOk = (intval($totalServicios['cnt'] ?? 0) > 0 && intval($pendientesEstado['cnt'] ?? 0) === 0);

        $pendientesPago = db()->queryOne(
            "SELECT COUNT(*) as cnt FROM Servicio WHERE id_ruta = ? AND (estado_pago IS NULL OR estado_pago = 'pendiente')",
            [$id_ruta]
        );
        $todosPagados = (intval($pendientesPago['cnt'] ?? 0) === 0);
        $pendienteLiquidacion = ($todosEstadoOk && !$todosPagados);

        // Determine new route state
        if ($todosEstadoOk && $todosPagados) {
            // All services verified AND all paid → completada
            db()->execute(
                "UPDATE Ruta SET estado = 'completada', fecha_modificacion = NOW() WHERE id_ruta = ?",
                [$id_ruta]
            );
        } elseif ($todosEstadoOk && !$todosPagados) {
            // All services verified BUT some pending payment → procesada
            db()->execute(
                "UPDATE Ruta SET estado = 'procesada', fecha_modificacion = NOW() WHERE id_ruta = ?",
                [$id_ruta]
            );
        }

        db()->commit();
        $txStarted = false;

        $message = $created > 0
            ? "$created servicio(s) creado(s) y $updated cambio(s) guardado(s) correctamente"
            : "$updated servicio(s) actualizado(s) correctamente";

        echo json_encode([
            'success'               => true,
            'message'               => $message,
            'todos_verificados'     => $todosEstadoOk,
            'pendiente_liquidacion' => $pendienteLiquidacion,
            'pendientes_pago'       => intval($pendientesPago['cnt'] ?? 0)
        ]);

    } catch (Exception $e) {
        if ($txStarted) {
            db()->rollBack();
        }
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
    }
}

function createServicioFromControl($ruta, $srv, $user, $today) {
    $id_sede = intval($srv['id_sede'] ?? 0);
    if ($id_sede <= 0) {
        throw new Exception('Sede requerida para crear servicio');
    }

    $planta = db()->queryOne("SELECT id_planta FROM Planta LIMIT 1");
    $id_planta = $planta ? $planta['id_planta'] : null;

    $contrato = db()->queryOne(
        "SELECT id_contrato FROM ContratoServicio WHERE id_sede = ? AND activo = 1 ORDER BY fecha_inicio DESC LIMIT 1",
        [$id_sede]
    );
    $id_contrato = $contrato ? $contrato['id_contrato'] : null;

    $estado = $srv['estado'];
    $estado_pago = $srv['estado_pago'] ?? 'pendiente';
    $forma_pago = trim($srv['forma_pago'] ?? '') ?: null;
    $fecha_pago = ($estado_pago === 'pagado') ? ($srv['fecha_pago'] ?? $today) : null;
    $residuo = trim($srv['residuo'] ?? '') ?: null;
    $observaciones = trim($srv['observaciones'] ?? ($srv['obs'] ?? '')) ?: null;
    $mes_servicio = substr($ruta['fecha'], 0, 7);

    $id_servicio = db()->insert(
        "INSERT INTO Servicio
            (id_ruta, id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, fecha_pago, residuo, observaciones)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $ruta['id_ruta'],
            $id_sede,
            $id_planta,
            $id_contrato,
            $mes_servicio,
            $ruta['fecha'],
            $estado,
            $estado_pago,
            $forma_pago,
            $fecha_pago,
            $residuo,
            $observaciones
        ]
    );

    $serviceData = [
        'id_servicio' => $id_servicio,
        'id_ruta' => $ruta['id_ruta'],
        'id_sede' => $id_sede,
        'id_planta' => $id_planta,
        'id_contrato' => $id_contrato,
        'mes_servicio' => $mes_servicio,
        'fecha_ejecucion' => $ruta['fecha'],
        'estado' => $estado,
        'estado_pago' => $estado_pago,
        'forma_pago' => $forma_pago,
        'fecha_pago' => $fecha_pago,
        'residuo' => $residuo,
        'observaciones' => $observaciones
    ];

    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos, ip_address)
         VALUES (?, 'Servicio', ?, 'INSERT', ?, ?)",
        [$user['id'], $id_servicio, json_encode($serviceData), $_SERVER['REMOTE_ADDR'] ?? null]
    );

    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos, ip_address)
         VALUES (?, 'Servicio', ?, 'UPDATE', ?, ?, ?)",
        [
            $user['id'],
            $id_servicio,
            json_encode(['estado' => 'programado', 'estado_pago' => 'pendiente', 'forma_pago' => null]),
            json_encode(array_merge($serviceData, ['timestamp' => date('Y-m-d H:i:s')])),
            $_SERVER['REMOTE_ADDR'] ?? null
        ]
    );

    saveServicioDocsFromControl($id_servicio, $srv);

    return $id_servicio;
}

function saveServicioDocsFromControl($id_servicio, $srv) {
    $numeroManifiesto = trim($srv['numero_manifiesto'] ?? '');
    $numeroGuia = trim($srv['numero_guia'] ?? '');

    if ($numeroManifiesto !== '') {
        $pesoKg = isset($srv['peso_kg']) && $srv['peso_kg'] !== '' ? $srv['peso_kg'] : 0;
        $tipoResiduo = trim($srv['residuo'] ?? '') ?: 'Residuos Solidos';
        $existing = db()->queryOne("SELECT id_manifiesto FROM Manifiesto WHERE id_servicio = ?", [$id_servicio]);

        if ($existing) {
            db()->execute(
                "UPDATE Manifiesto SET numero_manifiesto = ?, peso_kg = COALESCE(?, peso_kg), tipo_residuo = ? WHERE id_servicio = ?",
                [$numeroManifiesto, $pesoKg, $tipoResiduo, $id_servicio]
            );
        } else {
            db()->execute(
                "INSERT INTO Manifiesto (id_servicio, numero_manifiesto, peso_kg, tipo_residuo) VALUES (?, ?, ?, ?)",
                [$id_servicio, $numeroManifiesto, $pesoKg, $tipoResiduo]
            );
        }
    }

    if ($numeroGuia !== '') {
        $existing = db()->queryOne("SELECT id_guia FROM Guia WHERE id_servicio = ?", [$id_servicio]);

        if ($existing) {
            db()->execute(
                "UPDATE Guia SET numero_guia = ? WHERE id_servicio = ?",
                [$numeroGuia, $id_servicio]
            );
        } else {
            db()->execute(
                "INSERT INTO Guia (id_servicio, numero_guia, fecha_emision) VALUES (?, ?, CURDATE())",
                [$id_servicio, $numeroGuia]
            );
        }
    }
}
