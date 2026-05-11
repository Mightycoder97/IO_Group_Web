<?php
/**
 * IO Group - Control de Ruta API
 * Batch update services per route with digital signatures via AuditLog
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';
require_once __DIR__ . '/helpers/ruta_plan.php';
require_once __DIR__ . '/helpers/vertex_gemini.php';

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
    case 'POST':
        if ($action === 'analizar_fotos') analizarFotosRuta($id_ruta);
        else {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'AcciÃ³n no vÃ¡lida']);
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
        $montoCobradoSelect = tableColumnExists('Servicio', 'monto_cobrado') ? 's.monto_cobrado' : 'NULL';
        $servicios = db()->query(
            "SELECT s.id_servicio, s.id_sede, s.estado, s.estado_pago, s.forma_pago,
                    s.fecha_pago, s.residuo, s.observaciones, $montoCobradoSelect as monto_cobrado,
                    m.numero_manifiesto, m.peso_kg, g.numero_guia,
                    se.nombre_comercial as sede_nombre, se.direccion, se.distrito,
                    se.contacto_nombre, se.contacto_telefono,
                    e.ruc as empresa_ruc, e.razon_social as empresa_razon_social,
                    cs.tarifa as tarifa_servicio
             FROM Servicio s
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
             LEFT JOIN Guia g ON s.id_servicio = g.id_servicio
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
            $s['monto_cobrado'] = $s['monto_cobrado'] !== null ? floatval($s['monto_cobrado']) : null;
            $s['peso_kg'] = $s['peso_kg'] !== null ? floatval($s['peso_kg']) : null;
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

function analizarFotosRuta($id_ruta) {
    $requestId = routeIaRequestId();
    try {
        routeIaLog($requestId, 'start', [
            'id_ruta' => $id_ruta,
            'method' => $_SERVER['REQUEST_METHOD'] ?? null,
            'content_length' => $_SERVER['CONTENT_LENGTH'] ?? null
        ]);
        analizarFotosRutaImpl($id_ruta, $requestId);
    } catch (Throwable $e) {
        routeIaLog($requestId, 'fatal', [
            'message' => $e->getMessage(),
            'class' => get_class($e),
            'code' => $e->getCode(),
            'file' => $e->getFile(),
            'line' => $e->getLine()
        ]);
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'request_id' => $requestId,
            'message' => 'Error al analizar hoja de ruta IA: ' . $e->getMessage(),
            'debug_log' => routeIaLogPathForResponse()
        ]);
    }
}

function analizarFotosRutaImpl($id_ruta, $requestId) {
    $user = canEdit();
    $id_ruta = intval($id_ruta ?? 0);

    if ($id_ruta <= 0) {
        routeIaLog($requestId, 'invalid_route_id');
        http_response_code(400);
        echo json_encode(['success' => false, 'request_id' => $requestId, 'message' => 'id_ruta requerido']);
        return;
    }

    routeIaLog($requestId, 'ensure_schema_start');
    ensureRouteIaSchema();
    routeIaLog($requestId, 'ensure_schema_ok');

    routeIaLog($requestId, 'load_route_context_start', ['id_ruta' => $id_ruta]);
    $routeData = getRouteContextForIa($id_ruta);
    if (!$routeData) {
        routeIaLog($requestId, 'route_not_found', ['id_ruta' => $id_ruta]);
        http_response_code(404);
        echo json_encode(['success' => false, 'request_id' => $requestId, 'message' => 'Ruta no encontrada']);
        return;
    }
    routeIaLog($requestId, 'load_route_context_ok', [
        'id_ruta' => $id_ruta,
        'servicios' => count($routeData['servicios'] ?? [])
    ]);

    $files = normalizeRouteIaFiles($_FILES['archivos'] ?? $_FILES['archivo'] ?? null);
    if (empty($files)) {
        routeIaLog($requestId, 'no_files', [
            'files_keys' => array_keys($_FILES ?? [])
        ]);
        http_response_code(400);
        echo json_encode(['success' => false, 'request_id' => $requestId, 'message' => 'Seleccione al menos una foto o PDF de la ruta']);
        return;
    }
    routeIaLog($requestId, 'files_received', [
        'count' => count($files),
        'files' => array_map(fn($f) => [
            'name' => $f['name'] ?? null,
            'type' => $f['type'] ?? null,
            'size' => $f['size'] ?? null,
            'error' => $f['error'] ?? null
        ], $files)
    ]);

    try {
        foreach ($files as $file) {
            validateRouteIaFile($file);
        }
        routeIaLog($requestId, 'files_validated');
    } catch (Exception $e) {
        routeIaLog($requestId, 'file_validation_error', ['message' => $e->getMessage()]);
        http_response_code(400);
        echo json_encode(['success' => false, 'request_id' => $requestId, 'message' => $e->getMessage()]);
        return;
    }

    routeIaLog($requestId, 'create_lote_start');
    $loteId = createRouteIaLote($routeData['ruta'], count($files), $user);
    routeIaLog($requestId, 'create_lote_ok', ['id_lote' => $loteId]);
    $uploadDir = __DIR__ . '/../uploads/control_ruta_ia/ruta_' . $id_ruta . '/lote_' . $loteId . '/';
    if (!is_dir($uploadDir) && !mkdir($uploadDir, 0755, true)) {
        routeIaLog($requestId, 'mkdir_error', ['upload_dir' => $uploadDir]);
        http_response_code(500);
        echo json_encode(['success' => false, 'request_id' => $requestId, 'message' => 'No se pudo preparar la carpeta de evidencia IA', 'debug_log' => routeIaLogPathForResponse()]);
        return;
    }
    routeIaLog($requestId, 'upload_dir_ready', ['upload_dir' => $uploadDir]);

    $allSuggestions = [];
    $allUnmatched = [];
    $errores = [];
    $processed = 0;
    $client = new VertexGeminiClient();
    routeIaLog($requestId, 'vertex_diagnostics', $client->diagnostics());
    $prompt = buildRouteIaPrompt($routeData['ruta'], $routeData['servicios']);
    $schema = buildRouteIaSchema();

    foreach ($files as $file) {
        $documentId = null;
        try {
            routeIaLog($requestId, 'save_upload_start', [
                'name' => $file['name'] ?? null,
                'size' => $file['size'] ?? null
            ]);
            $saved = saveRouteIaUpload($file, $uploadDir, $loteId);
            $documentId = $saved['id_documento'];
            routeIaLog($requestId, 'save_upload_ok', [
                'id_documento' => $documentId,
                'relative_path' => $saved['relative_path'] ?? null,
                'mime_type' => $saved['mime_type'] ?? null
            ]);

            routeIaLog($requestId, 'vertex_extract_start', ['id_documento' => $documentId]);
            $vertexStart = microtime(true);
            $extracted = $client->extractStructuredDocument(
                $saved['absolute_path'],
                $saved['mime_type'],
                $prompt,
                $schema
            );
            routeIaLog($requestId, 'vertex_extract_ok', [
                'id_documento' => $documentId,
                'top_keys' => array_keys($extracted),
                'duration_ms' => intval(round((microtime(true) - $vertexStart) * 1000))
            ]);

            $normalized = normalizeRouteIaExtraction($extracted, $routeData['servicios']);
            routeIaLog($requestId, 'normalize_ok', [
                'id_documento' => $documentId,
                'suggestions' => count($normalized['servicios'] ?? []),
                'sin_match' => count($normalized['sin_match'] ?? []),
                'confianza' => $normalized['confianza'] ?? null
            ]);
            $allSuggestions = mergeRouteIaSuggestions($allSuggestions, $normalized['servicios']);
            $allUnmatched = array_merge($allUnmatched, $normalized['sin_match']);
            $processed++;

            routeIaLog($requestId, 'document_update_start', ['id_documento' => $documentId]);
            routeIaDbExecute(
                $requestId,
                'document_update',
                "UPDATE DocumentoIAArchivo SET tipo_detectado = 'ruta', estado = ?, confianza = ?, datos_extraidos = ?, conflictos = ?, fecha_modificacion = NOW() WHERE id_documento = ?",
                [
                    empty($normalized['sin_match']) ? 'extraido' : 'requiere_revision',
                    $normalized['confianza'],
                    json_encode($normalized['raw'], JSON_UNESCAPED_UNICODE),
                    json_encode($normalized['sin_match'], JSON_UNESCAPED_UNICODE),
                    $documentId
                ]
            );
            routeIaLog($requestId, 'document_update_ok', ['id_documento' => $documentId]);
        } catch (Exception $e) {
            $errores[] = $file['name'] . ': ' . $e->getMessage();
            routeIaLog($requestId, 'file_process_error', [
                'name' => $file['name'] ?? null,
                'id_documento' => $documentId,
                'message' => $e->getMessage(),
                'class' => get_class($e),
                'code' => $e->getCode(),
                'file' => $e->getFile(),
                'line' => $e->getLine()
            ]);
            if ($documentId) {
                try {
                    routeIaDbExecute(
                        $requestId,
                        'document_error_update',
                        "UPDATE DocumentoIAArchivo SET estado = 'error', error_mensaje = ? WHERE id_documento = ?",
                        [$e->getMessage(), $documentId]
                    );
                } catch (Throwable $dbError) {
                    routeIaLog($requestId, 'document_error_update_failed', [
                        'id_documento' => $documentId,
                        'message' => $dbError->getMessage(),
                        'class' => get_class($dbError),
                        'code' => $dbError->getCode()
                    ]);
                }
            }
        }
    }

    routeIaLog($requestId, 'refresh_lote_start', ['id_lote' => $loteId]);
    refreshRouteIaLoteStats($loteId, $requestId);
    routeIaLog($requestId, 'refresh_lote_ok', ['id_lote' => $loteId]);

    if ($processed === 0 && !empty($errores)) {
        routeIaLog($requestId, 'finished_with_no_processed', ['errores' => $errores]);
        http_response_code(500);
        echo json_encode(['success' => false, 'request_id' => $requestId, 'message' => 'No se pudo procesar la hoja de ruta con IA', 'errores' => $errores, 'id_lote' => $loteId, 'debug_log' => routeIaLogPathForResponse()]);
        return;
    }

    routeIaLog($requestId, 'success_response', [
        'id_lote' => $loteId,
        'processed' => $processed,
        'suggestions' => count($allSuggestions),
        'sin_match' => count($allUnmatched),
        'errores' => count($errores)
    ]);
    echo json_encode([
        'success' => true,
        'request_id' => $requestId,
        'id_lote' => $loteId,
        'resumen' => [
            'archivos' => count($files),
            'procesados' => $processed,
            'sugerencias' => count($allSuggestions),
            'sin_match' => count($allUnmatched)
        ],
        'servicios' => array_values($allSuggestions),
        'sin_match' => $allUnmatched,
        'errores' => $errores
    ]);
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
        $supportsMontoCobrado = tableColumnExists('Servicio', 'monto_cobrado');

        foreach ($servicios as $srv) {
            $id_servicio  = intval($srv['id_servicio'] ?? 0);
            $id_sede      = intval($srv['id_sede'] ?? 0);

            $estado       = $srv['estado'] ?? null;
            $estado_pago  = $srv['estado_pago'] ?? 'pendiente';
            $forma_pago   = trim($srv['forma_pago'] ?? '') ?: null;
            $fecha_pago   = ($estado_pago === 'pagado') ? ($srv['fecha_pago'] ?? $today) : null;
            $residuo      = trim($srv['residuo'] ?? '') ?: null;
            $observaciones = trim($srv['observaciones'] ?? ($srv['obs'] ?? '')) ?: null;
            $monto_cobrado = decimalOrNull($srv['monto_cobrado'] ?? null);

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
            if ($supportsMontoCobrado && $monto_cobrado !== null && floatsDifferent($monto_cobrado, $existing['monto_cobrado'] ?? null)) {
                $nuevosDatos['monto_cobrado'] = $monto_cobrado;
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

                if (array_key_exists('monto_cobrado', $nuevosDatos)) {
                    db()->execute(
                        "UPDATE Servicio SET monto_cobrado = ?, fecha_modificacion = NOW() WHERE id_servicio = ?",
                        [$nuevosDatos['monto_cobrado'], $id_servicio]
                    );
                }

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
                    json_encode(['estado' => $existing['estado'], 'estado_pago' => $existing['estado_pago'], 'forma_pago' => $existing['forma_pago'], 'monto_cobrado' => $existing['monto_cobrado'] ?? null]),
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
    $monto_cobrado = decimalOrNull($srv['monto_cobrado'] ?? null);
    $mes_servicio = substr($ruta['fecha'], 0, 7);

    $insertColumns = "id_ruta, id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, fecha_pago, residuo, observaciones";
    $insertPlaceholders = "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?";
    $insertParams = [
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
    ];
    if (tableColumnExists('Servicio', 'monto_cobrado')) {
        $insertColumns .= ", monto_cobrado";
        $insertPlaceholders .= ", ?";
        $insertParams[] = $monto_cobrado;
    }

    $id_servicio = db()->insert(
        "INSERT INTO Servicio ($insertColumns) VALUES ($insertPlaceholders)",
        $insertParams
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
        'observaciones' => $observaciones,
        'monto_cobrado' => $monto_cobrado
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
    $pesoKg = decimalOrNull($srv['peso_kg'] ?? null);

    if ($numeroManifiesto !== '' || $pesoKg !== null) {
        $tipoResiduo = trim($srv['residuo'] ?? '') ?: 'Residuos Solidos';
        $existing = db()->queryOne("SELECT id_manifiesto FROM Manifiesto WHERE id_servicio = ?", [$id_servicio]);

        if ($existing) {
            db()->execute(
                "UPDATE Manifiesto SET numero_manifiesto = COALESCE(NULLIF(?, ''), numero_manifiesto), peso_kg = COALESCE(?, peso_kg), tipo_residuo = ? WHERE id_servicio = ?",
                [$numeroManifiesto, $pesoKg, $tipoResiduo, $id_servicio]
            );
        } else {
            db()->execute(
                "INSERT INTO Manifiesto (id_servicio, numero_manifiesto, peso_kg, tipo_residuo) VALUES (?, ?, ?, ?)",
                [$id_servicio, $numeroManifiesto !== '' ? $numeroManifiesto : null, $pesoKg, $tipoResiduo]
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

function getRouteContextForIa($id_ruta) {
    $ruta = db()->queryOne(
        "SELECT r.*, v.placa as vehiculo_placa,
                CONCAT(ch.nombres, ' ', ch.apellidos) as chofer_nombre
         FROM Ruta r
         INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
         LEFT JOIN Empleado ch ON r.id_chofer = ch.id_empleado
         WHERE r.id_ruta = ?",
        [$id_ruta]
    );
    if (!$ruta) return null;

    $montoCobradoSelect = tableColumnExists('Servicio', 'monto_cobrado') ? 's.monto_cobrado' : 'NULL';
    $servicios = db()->query(
        "SELECT s.id_servicio, s.id_sede, s.estado, s.estado_pago, s.forma_pago,
                s.fecha_pago, s.residuo, s.observaciones, $montoCobradoSelect as monto_cobrado,
                m.numero_manifiesto, m.peso_kg, g.numero_guia,
                se.nombre_comercial as sede_nombre, se.direccion, se.distrito,
                e.ruc as empresa_ruc, e.razon_social as empresa_razon_social,
                cs.tarifa as tarifa_servicio
         FROM Servicio s
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
         LEFT JOIN Guia g ON s.id_servicio = g.id_servicio
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
    }

    foreach ($servicios as $idx => &$servicio) {
        $servicio['orden'] = $idx + 1;
        $servicio['monto_cobrado'] = isset($servicio['monto_cobrado']) && $servicio['monto_cobrado'] !== null ? floatval($servicio['monto_cobrado']) : null;
        $servicio['peso_kg'] = isset($servicio['peso_kg']) && $servicio['peso_kg'] !== null ? floatval($servicio['peso_kg']) : null;
        $servicio['tarifa_servicio'] = isset($servicio['tarifa_servicio']) && $servicio['tarifa_servicio'] !== null ? floatval($servicio['tarifa_servicio']) : null;
    }
    unset($servicio);

    return ['ruta' => $ruta, 'servicios' => $servicios];
}

function routeIaRequestId() {
    try {
        return 'ria_' . date('Ymd_His') . '_' . bin2hex(random_bytes(4));
    } catch (Exception $e) {
        return 'ria_' . date('Ymd_His') . '_' . mt_rand(1000, 9999);
    }
}

function routeIaLog($requestId, $stage, $context = []) {
    $entry = [
        'ts' => date('c'),
        'request_id' => $requestId,
        'stage' => $stage,
        'context' => sanitizeRouteIaLogContext($context)
    ];
    $line = json_encode($entry, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) . PHP_EOL;

    $paths = routeIaLogCandidatePaths();
    $written = false;
    foreach ($paths as $path) {
        $dir = dirname($path);
        if (!is_dir($dir)) {
            @mkdir($dir, 0755, true);
        }
        if (is_dir($dir) && @file_put_contents($path, $line, FILE_APPEND | LOCK_EX) !== false) {
            $written = true;
            break;
        }
    }

    if (!$written) {
        error_log('[control_ruta_ia] ' . trim($line));
    }
}

function routeIaLogCandidatePaths() {
    return [
        __DIR__ . '/../uploads/control_ruta_ia/debug.log',
        __DIR__ . '/../uploads/control_ruta_ia_debug.log',
        sys_get_temp_dir() . '/control_ruta_ia_debug.log'
    ];
}

function routeIaLogPathForResponse() {
    foreach (routeIaLogCandidatePaths() as $path) {
        if (is_writable(dirname($path)) || file_exists($path)) {
            return str_replace('\\', '/', $path);
        }
    }
    return 'PHP error_log';
}

function routeIaDbExecute($requestId, $stage, $sql, $params = []) {
    try {
        routeIaLog($requestId, $stage . '_db_execute_start', ['params_count' => count($params)]);
        $result = db()->execute($sql, $params);
        routeIaLog($requestId, $stage . '_db_execute_ok');
        return $result;
    } catch (Throwable $e) {
        if (!routeIaDbConnectionLost($e)) {
            routeIaLog($requestId, $stage . '_db_execute_error', [
                'message' => $e->getMessage(),
                'class' => get_class($e),
                'code' => $e->getCode()
            ]);
            throw $e;
        }

        routeIaLog($requestId, $stage . '_db_connection_lost', [
            'message' => $e->getMessage(),
            'class' => get_class($e),
            'code' => $e->getCode()
        ]);
        routeIaDbReconnect($requestId, $stage);

        try {
            routeIaLog($requestId, $stage . '_db_retry_start', ['params_count' => count($params)]);
            $result = db()->execute($sql, $params);
            routeIaLog($requestId, $stage . '_db_retry_ok');
            return $result;
        } catch (Throwable $retryError) {
            routeIaLog($requestId, $stage . '_db_retry_error', [
                'message' => $retryError->getMessage(),
                'class' => get_class($retryError),
                'code' => $retryError->getCode()
            ]);
            throw $retryError;
        }
    }
}

function routeIaDbQueryOne($requestId, $stage, $sql, $params = []) {
    try {
        routeIaLog($requestId, $stage . '_db_query_start', ['params_count' => count($params)]);
        $result = db()->queryOne($sql, $params);
        routeIaLog($requestId, $stage . '_db_query_ok');
        return $result;
    } catch (Throwable $e) {
        if (!routeIaDbConnectionLost($e)) {
            routeIaLog($requestId, $stage . '_db_query_error', [
                'message' => $e->getMessage(),
                'class' => get_class($e),
                'code' => $e->getCode()
            ]);
            throw $e;
        }

        routeIaLog($requestId, $stage . '_db_connection_lost', [
            'message' => $e->getMessage(),
            'class' => get_class($e),
            'code' => $e->getCode()
        ]);
        routeIaDbReconnect($requestId, $stage);

        try {
            routeIaLog($requestId, $stage . '_db_retry_start', ['params_count' => count($params)]);
            $result = db()->queryOne($sql, $params);
            routeIaLog($requestId, $stage . '_db_retry_ok');
            return $result;
        } catch (Throwable $retryError) {
            routeIaLog($requestId, $stage . '_db_retry_error', [
                'message' => $retryError->getMessage(),
                'class' => get_class($retryError),
                'code' => $retryError->getCode()
            ]);
            throw $retryError;
        }
    }
}

function routeIaDbReconnect($requestId, $stage) {
    routeIaLog($requestId, $stage . '_db_reconnect_start');
    if (!method_exists(db(), 'reconnect')) {
        routeIaLog($requestId, $stage . '_db_reconnect_unavailable');
        throw new Exception('No hay metodo de reconexion DB disponible');
    }
    db()->reconnect();
    routeIaLog($requestId, $stage . '_db_reconnect_ok');
}

function routeIaDbConnectionLost($e) {
    if (method_exists(db(), 'isConnectionLost')) {
        return db()->isConnectionLost($e);
    }
    $message = strtolower($e->getMessage());
    return strpos($message, 'server has gone away') !== false
        || strpos($message, 'lost connection') !== false
        || strpos($message, 'error while sending query packet') !== false;
}

function sanitizeRouteIaLogContext($value) {
    if (is_array($value)) {
        $clean = [];
        foreach ($value as $key => $item) {
            $keyText = (string)$key;
            if (preg_match('/api[_-]?key|token|secret|password|private[_-]?key|authorization/i', $keyText)) {
                $clean[$key] = '[redacted]';
                continue;
            }
            $clean[$key] = sanitizeRouteIaLogContext($item);
        }
        return $clean;
    }
    if (is_string($value) && strlen($value) > 1000) {
        return substr($value, 0, 1000) . '...[truncated]';
    }
    return $value;
}

function ensureRouteIaSchema() {
    db()->execute(
        "CREATE TABLE IF NOT EXISTS DocumentoIALote (
            id_lote int(11) NOT NULL AUTO_INCREMENT,
            nombre varchar(150) NOT NULL,
            tipo_lote enum('mixto','ruta','manifiestos','guias','facturas') DEFAULT 'mixto',
            estado enum('pendiente','procesando','completado','error') DEFAULT 'pendiente',
            total_archivos int(11) DEFAULT 0,
            procesados int(11) DEFAULT 0,
            aprobados int(11) DEFAULT 0,
            rechazados int(11) DEFAULT 0,
            id_usuario int(11) DEFAULT NULL,
            id_ruta int(11) DEFAULT NULL,
            error_mensaje text DEFAULT NULL,
            fecha_creacion datetime DEFAULT current_timestamp(),
            fecha_modificacion datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
            PRIMARY KEY (id_lote),
            KEY idx_doc_ia_lote_estado (estado),
            KEY idx_doc_ia_lote_usuario (id_usuario),
            KEY idx_doc_ia_lote_ruta (id_ruta)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci"
    );

    db()->execute(
        "CREATE TABLE IF NOT EXISTS DocumentoIAArchivo (
            id_documento int(11) NOT NULL AUTO_INCREMENT,
            id_lote int(11) NOT NULL,
            nombre_original varchar(255) NOT NULL,
            ruta_archivo varchar(500) NOT NULL,
            mime_type varchar(120) DEFAULT NULL,
            tamano_bytes int(11) DEFAULT NULL,
            pagina_inicio int(11) DEFAULT NULL,
            pagina_fin int(11) DEFAULT NULL,
            tipo_detectado enum('ruta','manifiesto','guia','factura','desconocido') DEFAULT 'desconocido',
            estado enum('pendiente','procesando','extraido','requiere_revision','aprobado','rechazado','error') DEFAULT 'pendiente',
            confianza decimal(5,4) DEFAULT NULL,
            id_servicio_sugerido int(11) DEFAULT NULL,
            explicacion_matching text DEFAULT NULL,
            datos_extraidos longtext DEFAULT NULL,
            candidatos_servicio longtext DEFAULT NULL,
            conflictos longtext DEFAULT NULL,
            propuesta_servicio longtext DEFAULT NULL,
            resultado_aprobacion longtext DEFAULT NULL,
            error_mensaje text DEFAULT NULL,
            id_usuario_aprobador int(11) DEFAULT NULL,
            fecha_aprobacion datetime DEFAULT NULL,
            fecha_creacion datetime DEFAULT current_timestamp(),
            fecha_modificacion datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
            PRIMARY KEY (id_documento),
            KEY idx_doc_ia_archivo_lote (id_lote),
            KEY idx_doc_ia_archivo_estado (estado),
            KEY idx_doc_ia_archivo_tipo (tipo_detectado),
            KEY idx_doc_ia_archivo_servicio (id_servicio_sugerido)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci"
    );

    if (!tableColumnExists('DocumentoIALote', 'id_ruta')) {
        db()->execute("ALTER TABLE DocumentoIALote ADD COLUMN id_ruta int(11) DEFAULT NULL AFTER id_usuario");
    }
    if (!tableIndexExists('DocumentoIALote', 'idx_doc_ia_lote_ruta')) {
        db()->execute("ALTER TABLE DocumentoIALote ADD KEY idx_doc_ia_lote_ruta (id_ruta)");
    }
    if (!tableColumnExists('Servicio', 'monto_cobrado')) {
        db()->execute("ALTER TABLE Servicio ADD COLUMN monto_cobrado decimal(10,2) DEFAULT NULL AFTER forma_pago");
    }
}

function buildRouteIaPrompt($ruta, $servicios) {
    $context = array_map(function ($s) {
        return [
            'orden' => intval($s['orden'] ?? 0),
            'id_servicio' => intval($s['id_servicio'] ?? 0),
            'id_sede' => intval($s['id_sede'] ?? 0),
            'ruc' => $s['empresa_ruc'] ?? null,
            'empresa' => $s['empresa_razon_social'] ?? null,
            'sede' => $s['sede_nombre'] ?? null,
            'direccion' => $s['direccion'] ?? null,
            'distrito' => $s['distrito'] ?? null,
            'tarifa' => $s['tarifa_servicio'] ?? null
        ];
    }, $servicios);

    $contextJson = json_encode([
        'ruta' => [
            'id_ruta' => intval($ruta['id_ruta']),
            'codigo_ruta' => $ruta['codigo_ruta'] ?? null,
            'fecha' => $ruta['fecha'] ?? null,
            'vehiculo' => $ruta['vehiculo_placa'] ?? null,
            'chofer' => $ruta['chofer_nombre'] ?? null
        ],
        'puntos_sistema' => $context
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

    return <<<PROMPT
Eres el extractor de control de ruta de IO Group Peru. Lee la foto o PDF de una hoja de ruta con anotaciones manuscritas de transportistas.

Devuelve solo JSON valido segun el esquema. No inventes datos. Si un campo no esta visible, usa null.

Objetivo:
- Empatar cada fila visible con un punto del sistema usando orden, RUC, razon social, sede, direccion o distrito.
- Extraer principalmente peso, metodo de pago y monto realmente cobrado.
- La hoja puede estar girada, doblada, resaltada o tener varias paginas.
- Las anotaciones suelen estar en la columna OBS o al lado derecho de la hoja.

Reglas de lectura de pagos:
- Y, YAPE o YAP = Yape.
- E, EFECT o EFECTIVO = Efectivo.
- T, TR, TRF, TRANS o TRANSF = Transferencia.
- P o PLIN = Plin.
- Si hay monto escrito sin metodo, marca estado_pago como pagado, forma_pago como Otro y baja la confianza.
- Si hay metodo o monto de pago, estado_pago debe ser pagado.
- Si una fila no tiene anotacion clara de pago, deja estado_pago y forma_pago en null.

Reglas de lectura de montos y peso:
- peso_kg es el peso de residuos, normalmente cerca de la columna PESO o anotado como kg.
- monto_cobrado es dinero cobrado al cliente; puede ser distinto a la tarifa impresa.
- No confundas RUC, telefono, tarifa impresa o numero de direccion con monto cobrado.
- Si una anotacion dice algo como "150", "S/150" o "cobro 150" en OBS, eso es monto_cobrado.

Contexto de puntos del sistema:
$contextJson

Incluye la anotacion manuscrita original que justifica cada sugerencia.
PROMPT;
}

function buildRouteIaSchema() {
    $nullableString = ['type' => 'STRING', 'nullable' => true];
    $nullableNumber = ['type' => 'NUMBER', 'nullable' => true];
    $nullableInteger = ['type' => 'INTEGER', 'nullable' => true];

    return [
        'type' => 'OBJECT',
        'properties' => [
            'confianza_extraccion' => ['type' => 'NUMBER'],
            'explicacion_extraccion' => $nullableString,
            'servicios' => [
                'type' => 'ARRAY',
                'items' => [
                    'type' => 'OBJECT',
                    'properties' => [
                        'orden' => $nullableInteger,
                        'id_servicio' => $nullableInteger,
                        'id_sede' => $nullableInteger,
                        'ruc' => $nullableString,
                        'razon_social' => $nullableString,
                        'sede_nombre' => $nullableString,
                        'estado' => $nullableString,
                        'estado_pago' => $nullableString,
                        'forma_pago' => $nullableString,
                        'peso_kg' => $nullableNumber,
                        'monto_cobrado' => $nullableNumber,
                        'numero_manifiesto' => $nullableString,
                        'numero_guia' => $nullableString,
                        'anotacion_original' => $nullableString,
                        'confianza' => ['type' => 'NUMBER', 'nullable' => true]
                    ]
                ]
            ],
            'sin_match' => [
                'type' => 'ARRAY',
                'items' => [
                    'type' => 'OBJECT',
                    'properties' => [
                        'orden' => $nullableInteger,
                        'texto_fila' => $nullableString,
                        'anotacion_original' => $nullableString,
                        'confianza' => ['type' => 'NUMBER', 'nullable' => true],
                        'motivo' => $nullableString
                    ]
                ]
            ]
        ],
        'required' => ['confianza_extraccion']
    ];
}

function normalizeRouteIaExtraction($data, $servicios) {
    $byServicio = [];
    $bySede = [];
    $byOrden = [];
    foreach ($servicios as $servicio) {
        $idServicio = intval($servicio['id_servicio'] ?? 0);
        $idSede = intval($servicio['id_sede'] ?? 0);
        $orden = intval($servicio['orden'] ?? 0);
        if ($idServicio !== 0) $byServicio[$idServicio] = $servicio;
        if ($idSede > 0) $bySede[$idSede] = $servicio;
        if ($orden > 0) $byOrden[$orden] = $servicio;
    }

    $suggestions = [];
    $unmatched = [];
    $rows = is_array($data['servicios'] ?? null) ? $data['servicios'] : [];
    foreach ($rows as $row) {
        if (!is_array($row)) continue;
        $matched = null;
        $idServicio = intval($row['id_servicio'] ?? 0);
        $idSede = intval($row['id_sede'] ?? 0);
        $orden = intval($row['orden'] ?? 0);

        if ($idServicio !== 0 && isset($byServicio[$idServicio])) $matched = $byServicio[$idServicio];
        elseif ($idSede > 0 && isset($bySede[$idSede])) $matched = $bySede[$idSede];
        elseif ($orden > 0 && isset($byOrden[$orden])) $matched = $byOrden[$orden];

        if (!$matched) {
            $unmatched[] = [
                'orden' => $orden ?: null,
                'texto_fila' => trim((string)($row['razon_social'] ?? $row['sede_nombre'] ?? '')) ?: null,
                'anotacion_original' => trim((string)($row['anotacion_original'] ?? '')) ?: null,
                'confianza' => clamp01(floatval($row['confianza'] ?? $data['confianza_extraccion'] ?? 0.35)),
                'motivo' => 'No se pudo empatar con una sede de la ruta seleccionada'
            ];
            continue;
        }

        $formaPago = normalizeRouteIaFormaPago($row['forma_pago'] ?? null);
        $montoCobrado = decimalOrNull($row['monto_cobrado'] ?? null);
        $estadoPago = normalizeRouteIaEstadoPago($row['estado_pago'] ?? null, $formaPago, $montoCobrado);
        $confianzaFila = clamp01(floatval($row['confianza'] ?? $data['confianza_extraccion'] ?? 0.75));
        if ($estadoPago === 'pagado' && !$formaPago) {
            $formaPago = 'Otro';
            if ($montoCobrado !== null) {
                $confianzaFila = min($confianzaFila, 0.65);
            }
        }

        $suggestion = [
            'id_servicio' => intval($matched['id_servicio']),
            'id_sede' => intval($matched['id_sede']),
            'confianza' => $confianzaFila,
            'estado' => normalizeRouteIaEstado($row['estado'] ?? null),
            'estado_pago' => $estadoPago,
            'forma_pago' => $formaPago,
            'peso_kg' => decimalOrNull($row['peso_kg'] ?? null),
            'monto_cobrado' => $montoCobrado,
            'numero_manifiesto' => trim((string)($row['numero_manifiesto'] ?? '')) ?: null,
            'numero_guia' => trim((string)($row['numero_guia'] ?? '')) ?: null,
            'anotacion_original' => trim((string)($row['anotacion_original'] ?? '')) ?: null
        ];

        $hasData = $suggestion['estado_pago'] || $suggestion['forma_pago'] || $suggestion['peso_kg'] !== null
            || $suggestion['monto_cobrado'] !== null || $suggestion['numero_manifiesto'] || $suggestion['numero_guia'];

        if ($hasData) {
            $suggestions[] = $suggestion;
        }
    }

    foreach (($data['sin_match'] ?? []) as $row) {
        if (!is_array($row)) continue;
        $unmatched[] = [
            'orden' => isset($row['orden']) ? intval($row['orden']) : null,
            'texto_fila' => trim((string)($row['texto_fila'] ?? '')) ?: null,
            'anotacion_original' => trim((string)($row['anotacion_original'] ?? '')) ?: null,
            'confianza' => clamp01(floatval($row['confianza'] ?? 0.35)),
            'motivo' => trim((string)($row['motivo'] ?? 'Sin coincidencia')) ?: 'Sin coincidencia'
        ];
    }

    return [
        'confianza' => clamp01(floatval($data['confianza_extraccion'] ?? 0.75)),
        'servicios' => $suggestions,
        'sin_match' => $unmatched,
        'raw' => $data
    ];
}

function mergeRouteIaSuggestions($existing, $incoming) {
    foreach ($incoming as $item) {
        $key = intval($item['id_servicio']);
        if (!isset($existing[$key])) {
            $existing[$key] = $item;
            continue;
        }

        $current = $existing[$key];
        $preferIncoming = floatval($item['confianza'] ?? 0) >= floatval($current['confianza'] ?? 0);
        foreach (['estado', 'estado_pago', 'forma_pago', 'peso_kg', 'monto_cobrado', 'numero_manifiesto', 'numero_guia'] as $field) {
            if (($current[$field] ?? null) === null || ($preferIncoming && ($item[$field] ?? null) !== null)) {
                $current[$field] = $item[$field] ?? $current[$field] ?? null;
            }
        }
        $current['confianza'] = max(floatval($current['confianza'] ?? 0), floatval($item['confianza'] ?? 0));
        if (!empty($item['anotacion_original'])) {
            $current['anotacion_original'] = trim(($current['anotacion_original'] ?? '') . (($current['anotacion_original'] ?? '') ? ' | ' : '') . $item['anotacion_original']);
        }
        $existing[$key] = $current;
    }
    return $existing;
}

function createRouteIaLote($ruta, $totalArchivos, $user) {
    $nombre = 'Control Ruta IA ' . ($ruta['codigo_ruta'] ?? ('Ruta ' . $ruta['id_ruta'])) . ' ' . date('Y-m-d H:i');
    $userId = $user['id'] ?? $user['id_usuario'] ?? null;

    if (tableColumnExists('DocumentoIALote', 'id_ruta')) {
        return intval(db()->insert(
            "INSERT INTO DocumentoIALote (nombre, tipo_lote, estado, total_archivos, id_usuario, id_ruta) VALUES (?, 'ruta', 'procesando', ?, ?, ?)",
            [$nombre, $totalArchivos, $userId, $ruta['id_ruta']]
        ));
    }

    return intval(db()->insert(
        "INSERT INTO DocumentoIALote (nombre, tipo_lote, estado, total_archivos, id_usuario) VALUES (?, 'ruta', 'procesando', ?, ?)",
        [$nombre, $totalArchivos, $userId]
    ));
}

function saveRouteIaUpload($file, $uploadDir, $loteId) {
    $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    $safeBase = preg_replace('/[^a-zA-Z0-9._-]+/', '_', pathinfo($file['name'], PATHINFO_FILENAME));
    $fileName = date('Ymd_His') . '_' . bin2hex(random_bytes(4)) . '_' . substr($safeBase, 0, 80) . '.' . $ext;
    $absolutePath = $uploadDir . $fileName;

    if (!move_uploaded_file($file['tmp_name'], $absolutePath)) {
        throw new Exception('No se pudo guardar el archivo ' . $file['name']);
    }

    $rootPath = realpath(__DIR__ . '/..');
    $storedPath = realpath($absolutePath) ?: $absolutePath;
    $relativePath = str_replace('\\', '/', ltrim(substr($storedPath, strlen($rootPath)), '/\\'));
    $mimeType = detectRouteIaMimeType($absolutePath, $file['type'] ?? null);
    $id = db()->insert(
        "INSERT INTO DocumentoIAArchivo
         (id_lote, nombre_original, ruta_archivo, mime_type, tamano_bytes, tipo_detectado, estado)
         VALUES (?, ?, ?, ?, ?, 'ruta', 'procesando')",
        [$loteId, $file['name'], $relativePath, $mimeType, $file['size']]
    );

    return [
        'id_documento' => intval($id),
        'absolute_path' => $absolutePath,
        'relative_path' => $relativePath,
        'mime_type' => $mimeType
    ];
}

function refreshRouteIaLoteStats($loteId, $requestId = null) {
    $statsSql =
        "SELECT
            COUNT(*) as total,
            SUM(CASE WHEN estado IN ('extraido','requiere_revision','aprobado','rechazado','error') THEN 1 ELSE 0 END) as procesados,
            SUM(CASE WHEN estado = 'aprobado' THEN 1 ELSE 0 END) as aprobados,
            SUM(CASE WHEN estado = 'rechazado' THEN 1 ELSE 0 END) as rechazados,
            SUM(CASE WHEN estado = 'error' THEN 1 ELSE 0 END) as errores
         FROM DocumentoIAArchivo WHERE id_lote = ?";
    $stats = $requestId
        ? routeIaDbQueryOne($requestId, 'refresh_lote_stats', $statsSql, [$loteId])
        : db()->queryOne($statsSql, [$loteId]);

    $total = intval($stats['total'] ?? 0);
    $procesados = intval($stats['procesados'] ?? 0);
    $estado = ($total > 0 && $procesados >= $total) ? (intval($stats['errores'] ?? 0) === $total ? 'error' : 'completado') : 'procesando';

    $updateSql = "UPDATE DocumentoIALote SET total_archivos = ?, procesados = ?, aprobados = ?, rechazados = ?, estado = ? WHERE id_lote = ?";
    $updateParams = [$total, $procesados, intval($stats['aprobados'] ?? 0), intval($stats['rechazados'] ?? 0), $estado, $loteId];
    if ($requestId) {
        routeIaDbExecute($requestId, 'refresh_lote_update', $updateSql, $updateParams);
    } else {
        db()->execute($updateSql, $updateParams);
    }
}

function normalizeRouteIaFiles($files) {
    if (!$files || empty($files['name'])) return [];
    if (is_array($files['name'])) {
        $normalized = [];
        foreach ($files['name'] as $idx => $name) {
            if ($name === '') continue;
            $normalized[] = [
                'name' => $name,
                'type' => $files['type'][$idx] ?? null,
                'tmp_name' => $files['tmp_name'][$idx] ?? null,
                'error' => $files['error'][$idx] ?? UPLOAD_ERR_NO_FILE,
                'size' => $files['size'][$idx] ?? 0
            ];
        }
        return $normalized;
    }
    return [$files];
}

function validateRouteIaFile($file) {
    if (($file['error'] ?? UPLOAD_ERR_NO_FILE) !== UPLOAD_ERR_OK || empty($file['tmp_name'])) {
        throw new Exception('Archivo invalido o incompleto.');
    }
    if (($file['size'] ?? 0) > 30 * 1024 * 1024) {
        throw new Exception('Cada archivo no debe superar 30 MB.');
    }
    $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    $allowed = ['pdf', 'jpg', 'jpeg', 'png', 'webp', 'heic', 'heif'];
    if (!in_array($ext, $allowed, true)) {
        throw new Exception('Formato no permitido: ' . $ext);
    }
}

function detectRouteIaMimeType($filePath, $fallback) {
    if (function_exists('finfo_open') && is_readable($filePath)) {
        $finfo = finfo_open(FILEINFO_MIME_TYPE);
        $mime = $finfo ? finfo_file($finfo, $filePath) : null;
        if ($finfo) finfo_close($finfo);
        if ($mime) return $mime;
    }
    return $fallback ?: 'application/octet-stream';
}

function normalizeRouteIaFormaPago($value) {
    $text = normalizeRouteIaText($value);
    if ($text === '') return null;
    if (preg_match('/\b(y|yap|yape)\b/', $text)) return 'Yape';
    if (preg_match('/\b(p|plin)\b/', $text)) return 'Plin';
    if (preg_match('/\b(e|efect|efectivo)\b/', $text)) return 'Efectivo';
    if (preg_match('/\b(t|tr|trf|trans|transf|transferencia)\b/', $text)) return 'Transferencia';
    if (strpos($text, 'deposit') !== false) return 'Deposito';
    if (strpos($text, 'cheque') !== false) return 'Cheque';
    return ucfirst($text);
}

function normalizeRouteIaEstadoPago($value, $formaPago, $montoCobrado) {
    $text = normalizeRouteIaText($value);
    if ($formaPago || $montoCobrado !== null) return 'pagado';
    if ($text === '') return null;
    if (strpos($text, 'pag') !== false || strpos($text, 'cancel') !== false || strpos($text, 'cobrad') !== false) return 'pagado';
    if (strpos($text, 'pend') !== false || strpos($text, 'debe') !== false) return 'pendiente';
    return null;
}

function normalizeRouteIaEstado($value) {
    $text = normalizeRouteIaText($value);
    if ($text === '') return 'completado';
    if (strpos($text, 'cancel') !== false || strpos($text, 'no atend') !== false) return 'cancelado';
    if (strpos($text, 'curso') !== false) return 'en_curso';
    if (strpos($text, 'program') !== false) return 'programado';
    return 'completado';
}

function normalizeRouteIaText($value) {
    $value = mb_strtolower(trim((string)$value), 'UTF-8');
    if (function_exists('iconv')) {
        $converted = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $value);
        if ($converted !== false) $value = $converted;
    }
    $value = preg_replace('/[^a-z0-9]+/', ' ', $value);
    return trim(preg_replace('/\s+/', ' ', $value));
}

function decimalOrNull($value) {
    if ($value === null || $value === '') return null;
    if (is_numeric($value)) return round(floatval($value), 2);
    $clean = str_replace(',', '.', preg_replace('/[^0-9,.\-]+/', '', (string)$value));
    if ($clean === '' || !is_numeric($clean)) return null;
    return round(floatval($clean), 2);
}

function floatsDifferent($a, $b) {
    if ($a === null && $b === null) return false;
    if ($a === null || $b === null) return true;
    return abs(floatval($a) - floatval($b)) > 0.009;
}

function clamp01($value) {
    if ($value < 0) return 0;
    if ($value > 1) return 1;
    return $value;
}

function tableColumnExists($table, $column) {
    static $cache = [];
    $key = $table . '.' . $column;
    if (array_key_exists($key, $cache)) return $cache[$key];

    try {
        $row = db()->queryOne(
            "SELECT COUNT(*) as cnt
             FROM INFORMATION_SCHEMA.COLUMNS
             WHERE TABLE_SCHEMA = DATABASE()
               AND TABLE_NAME = ?
               AND COLUMN_NAME = ?",
            [$table, $column]
        );
        $cache[$key] = intval($row['cnt'] ?? 0) > 0;
    } catch (Exception $e) {
        $cache[$key] = false;
    }
    return $cache[$key];
}

function tableIndexExists($table, $index) {
    static $cache = [];
    $key = $table . '.' . $index;
    if (array_key_exists($key, $cache)) return $cache[$key];

    try {
        $row = db()->queryOne(
            "SELECT COUNT(*) as cnt
             FROM INFORMATION_SCHEMA.STATISTICS
             WHERE TABLE_SCHEMA = DATABASE()
               AND TABLE_NAME = ?
               AND INDEX_NAME = ?",
            [$table, $index]
        );
        $cache[$key] = intval($row['cnt'] ?? 0) > 0;
    } catch (Exception $e) {
        $cache[$key] = false;
    }
    return $cache[$key];
}
