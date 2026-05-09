<?php
/**
 * IO Group - Procesamiento IA de documentos
 * Batch upload, Vertex extraction, matching, approval and audit.
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';
require_once __DIR__ . '/helpers/vertex_gemini.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

try {
    if ($method === 'GET') {
        if ($action === 'lotes') listLotes();
        elseif (!empty($_GET['id_documento'])) getDocumento(intval($_GET['id_documento']));
        else listDocumentos();
        exit;
    }

    if ($method === 'POST') {
        if ($action === 'create_lote') createLote();
        elseif ($action === 'upload') uploadArchivos();
        elseif ($action === 'process_next') processNext();
        elseif ($action === 'process_document') processDocument(intval($_GET['id_documento'] ?? 0));
        elseif ($action === 'approve') approveDocument(intval($_GET['id_documento'] ?? 0));
        elseif ($action === 'reject') rejectDocument(intval($_GET['id_documento'] ?? 0));
        else createLote();
        exit;
    }

    if ($method === 'DELETE') {
        deleteLote(intval($_GET['id_lote'] ?? 0));
        exit;
    }

    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Metodo no permitido']);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}

function listLotes() {
    canView();
    $limit = min(100, max(10, intval($_GET['limit'] ?? 50)));
    $data = db()->query(
        "SELECT l.*, u.nombre_completo as usuario_nombre
         FROM DocumentoIALote l
         LEFT JOIN Usuario u ON l.id_usuario = u.id_usuario
         ORDER BY l.fecha_creacion DESC
         LIMIT ?",
        [$limit]
    );
    echo json_encode(['success' => true, 'data' => $data]);
}

function listDocumentos() {
    canView();
    $id_lote = intval($_GET['id_lote'] ?? 0);
    $estado = $_GET['estado'] ?? null;

    $sql = "SELECT d.*, l.nombre as lote_nombre
            FROM DocumentoIAArchivo d
            INNER JOIN DocumentoIALote l ON d.id_lote = l.id_lote
            WHERE 1=1";
    $params = [];

    if ($id_lote > 0) {
        $sql .= " AND d.id_lote = ?";
        $params[] = $id_lote;
    }
    if ($estado) {
        $sql .= " AND d.estado = ?";
        $params[] = $estado;
    }

    $sql .= " ORDER BY d.fecha_creacion DESC, d.id_documento DESC";
    $data = db()->query($sql, $params);
    $data = array_map('hydrateDocumentoJson', $data);

    echo json_encode(['success' => true, 'data' => $data]);
}

function getDocumento($id) {
    canView();
    $doc = db()->queryOne(
        "SELECT d.*, l.nombre as lote_nombre
         FROM DocumentoIAArchivo d
         INNER JOIN DocumentoIALote l ON d.id_lote = l.id_lote
         WHERE d.id_documento = ?",
        [$id]
    );
    if (!$doc) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Documento no encontrado']);
        return;
    }

    echo json_encode(['success' => true, 'data' => hydrateDocumentoJson($doc)]);
}

function createLote() {
    $user = canEdit();
    $data = readJsonBody();
    $nombre = trim($data['nombre'] ?? '');
    $tipo = $data['tipo_lote'] ?? 'mixto';
    $tipos = ['mixto', 'ruta', 'manifiestos', 'guias', 'facturas'];

    if ($nombre === '') {
        $nombre = 'Lote IA ' . date('Y-m-d H:i');
    }
    if (!in_array($tipo, $tipos, true)) {
        $tipo = 'mixto';
    }

    $id = db()->insert(
        "INSERT INTO DocumentoIALote (nombre, tipo_lote, id_usuario) VALUES (?, ?, ?)",
        [$nombre, $tipo, $user['id'] ?? $user['id_usuario'] ?? null]
    );

    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos)
         VALUES (?, 'DocumentoIALote', ?, 'INSERT', ?)",
        [$user['id'] ?? null, $id, json_encode(['nombre' => $nombre, 'tipo_lote' => $tipo])]
    );

    echo json_encode(['success' => true, 'message' => 'Lote creado', 'id_lote' => $id]);
}

function uploadArchivos() {
    $user = canEdit();
    $id_lote = intval($_GET['id_lote'] ?? $_POST['id_lote'] ?? 0);
    if ($id_lote <= 0) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'id_lote requerido']);
        return;
    }

    $lote = db()->queryOne("SELECT * FROM DocumentoIALote WHERE id_lote = ?", [$id_lote]);
    if (!$lote) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Lote no encontrado']);
        return;
    }

    $files = normalizeUploadFiles($_FILES['archivos'] ?? $_FILES['archivo'] ?? null);
    if (empty($files)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Seleccione al menos un archivo']);
        return;
    }

    $uploadDir = __DIR__ . '/../uploads/procesamiento_ia/lote_' . $id_lote . '/';
    if (!is_dir($uploadDir) && !mkdir($uploadDir, 0755, true)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'No se pudo preparar la carpeta de carga']);
        return;
    }

    $created = [];
    foreach ($files as $file) {
        validateInputFile($file);
        $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
        $safeBase = preg_replace('/[^a-zA-Z0-9._-]+/', '_', pathinfo($file['name'], PATHINFO_FILENAME));
        $fileName = date('Ymd_His') . '_' . bin2hex(random_bytes(4)) . '_' . substr($safeBase, 0, 80) . '.' . $ext;
        $filePath = $uploadDir . $fileName;

        if (!move_uploaded_file($file['tmp_name'], $filePath)) {
            throw new Exception('No se pudo guardar el archivo ' . $file['name']);
        }

        $relativePath = 'uploads/procesamiento_ia/lote_' . $id_lote . '/' . $fileName;
        $id = db()->insert(
            "INSERT INTO DocumentoIAArchivo
             (id_lote, nombre_original, ruta_archivo, mime_type, tamano_bytes, tipo_detectado, estado)
             VALUES (?, ?, ?, ?, ?, 'desconocido', 'pendiente')",
            [$id_lote, $file['name'], $relativePath, detectMimeType($filePath, $file['type'] ?? null), $file['size']]
        );

        $created[] = ['id_documento' => $id, 'nombre_original' => $file['name'], 'ruta_archivo' => $relativePath];
    }

    refreshLoteStats($id_lote);
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos)
         VALUES (?, 'DocumentoIALote', ?, 'UPDATE', ?)",
        [$user['id'] ?? null, $id_lote, json_encode(['archivos_subidos' => count($created)])]
    );

    echo json_encode(['success' => true, 'message' => count($created) . ' archivo(s) subido(s)', 'data' => $created]);
}

function processNext() {
    canEdit();
    $id_lote = intval($_GET['id_lote'] ?? 0);
    $params = [];
    $sql = "SELECT id_documento FROM DocumentoIAArchivo WHERE estado = 'pendiente'";
    if ($id_lote > 0) {
        $sql .= " AND id_lote = ?";
        $params[] = $id_lote;
    }
    $sql .= " ORDER BY id_documento ASC LIMIT 1";
    $next = db()->queryOne($sql, $params);

    if (!$next) {
        echo json_encode(['success' => true, 'message' => 'No hay documentos pendientes', 'data' => null]);
        return;
    }

    processDocument(intval($next['id_documento']));
}

function processDocument($id_documento) {
    $user = canEdit();
    if ($id_documento <= 0) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'id_documento requerido']);
        return;
    }

    $doc = db()->queryOne("SELECT * FROM DocumentoIAArchivo WHERE id_documento = ?", [$id_documento]);
    if (!$doc) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Documento no encontrado']);
        return;
    }

    $absolutePath = __DIR__ . '/../' . $doc['ruta_archivo'];
    db()->execute("UPDATE DocumentoIAArchivo SET estado = 'procesando', error_mensaje = NULL WHERE id_documento = ?", [$id_documento]);
    db()->execute("UPDATE DocumentoIALote SET estado = 'procesando' WHERE id_lote = ?", [$doc['id_lote']]);

    try {
        $client = new VertexGeminiClient();
        $extracted = $client->extractStructuredDocument(
            $absolutePath,
            $doc['mime_type'] ?: detectMimeType($absolutePath, null),
            buildExtractionPrompt(),
            buildExtractionSchema()
        );

        $extracted = normalizeExtraction($extracted);
        $intelligence = buildDocumentIntelligence($extracted);
        $augmented = $intelligence['datos_extraidos'];
        $estado = $intelligence['estado'];

        db()->execute(
            "UPDATE DocumentoIAArchivo SET
                tipo_detectado = ?,
                estado = ?,
                confianza = ?,
                id_servicio_sugerido = ?,
                explicacion_matching = ?,
                datos_extraidos = ?,
                candidatos_servicio = ?,
                conflictos = ?,
                propuesta_servicio = ?,
                error_mensaje = NULL
             WHERE id_documento = ?",
            [
                $intelligence['tipo_detectado'],
                $estado,
                $intelligence['confianza'],
                $intelligence['id_servicio_sugerido'],
                $intelligence['explicacion_matching'],
                json_encode($augmented, JSON_UNESCAPED_UNICODE),
                json_encode($intelligence['candidatos_servicio'], JSON_UNESCAPED_UNICODE),
                json_encode($intelligence['conflictos'], JSON_UNESCAPED_UNICODE),
                json_encode($intelligence['propuesta_servicio'], JSON_UNESCAPED_UNICODE),
                $id_documento
            ]
        );

        refreshLoteStats($doc['id_lote']);
        db()->execute(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos)
             VALUES (?, 'DocumentoIAArchivo', ?, 'UPDATE', ?)",
            [$user['id'] ?? null, $id_documento, json_encode(['estado' => $estado, 'tipo_detectado' => $intelligence['tipo_detectado']])]
        );

        echo json_encode(['success' => true, 'message' => 'Documento procesado', 'data' => hydrateDocumentoJson(db()->queryOne("SELECT * FROM DocumentoIAArchivo WHERE id_documento = ?", [$id_documento]))]);
    } catch (Exception $e) {
        db()->execute(
            "UPDATE DocumentoIAArchivo SET estado = 'error', error_mensaje = ? WHERE id_documento = ?",
            [$e->getMessage(), $id_documento]
        );
        refreshLoteStats($doc['id_lote']);
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function approveDocument($id_documento) {
    $user = canEdit();
    if ($id_documento <= 0) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'id_documento requerido']);
        return;
    }

    $payload = readJsonBody();
    $doc = db()->queryOne("SELECT * FROM DocumentoIAArchivo WHERE id_documento = ?", [$id_documento]);
    if (!$doc) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Documento no encontrado']);
        return;
    }
    if (in_array($doc['estado'], ['aprobado', 'rechazado'], true)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'El documento ya fue cerrado']);
        return;
    }

    $datos = $payload['datos_extraidos'] ?? jsonDecodeSafe($doc['datos_extraidos']);
    $tipo = normalizeDocType($payload['tipo_detectado'] ?? $doc['tipo_detectado'] ?? ($datos['tipo_documento'] ?? 'desconocido'));
    $selectedServiceId = intval($payload['id_servicio'] ?? $doc['id_servicio_sugerido'] ?? 0);

    $txStarted = false;
    try {
        db()->beginTransaction();
        $txStarted = true;

        if ($tipo === 'ruta') {
            $result = applyRouteSheetApproval($doc, $datos, $payload, $user);
        } else {
            $result = applySingleDocumentApproval($doc, $datos, $tipo, $selectedServiceId, $payload, $user);
        }

        db()->execute(
            "UPDATE DocumentoIAArchivo SET
                estado = 'aprobado',
                tipo_detectado = ?,
                datos_extraidos = ?,
                resultado_aprobacion = ?,
                id_usuario_aprobador = ?,
                fecha_aprobacion = NOW()
             WHERE id_documento = ?",
            [
                $tipo,
                json_encode($datos, JSON_UNESCAPED_UNICODE),
                json_encode($result, JSON_UNESCAPED_UNICODE),
                $user['id'] ?? null,
                $id_documento
            ]
        );

        db()->execute(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos)
             VALUES (?, 'DocumentoIAArchivo', ?, 'UPDATE', ?)",
            [$user['id'] ?? null, $id_documento, json_encode(['estado' => 'aprobado', 'resultado' => $result], JSON_UNESCAPED_UNICODE)]
        );

        refreshLoteStats($doc['id_lote']);
        db()->commit();
        $txStarted = false;

        echo json_encode(['success' => true, 'message' => 'Documento aprobado y aplicado', 'data' => $result]);
    } catch (Exception $e) {
        if ($txStarted) db()->rollBack();
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
}

function rejectDocument($id_documento) {
    $user = canEdit();
    $data = readJsonBody();
    if ($id_documento <= 0) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'id_documento requerido']);
        return;
    }

    $doc = db()->queryOne("SELECT * FROM DocumentoIAArchivo WHERE id_documento = ?", [$id_documento]);
    if (!$doc) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Documento no encontrado']);
        return;
    }

    db()->execute(
        "UPDATE DocumentoIAArchivo SET estado = 'rechazado', error_mensaje = ?, id_usuario_aprobador = ?, fecha_aprobacion = NOW() WHERE id_documento = ?",
        [$data['motivo'] ?? 'Rechazado por usuario', $user['id'] ?? null, $id_documento]
    );
    refreshLoteStats($doc['id_lote']);

    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos)
         VALUES (?, 'DocumentoIAArchivo', ?, 'UPDATE', ?)",
        [$user['id'] ?? null, $id_documento, json_encode(['estado' => 'rechazado', 'motivo' => $data['motivo'] ?? null])]
    );

    echo json_encode(['success' => true, 'message' => 'Documento rechazado']);
}

function deleteLote($id_lote) {
    $user = canEdit();
    if ($id_lote <= 0) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'id_lote requerido']);
        return;
    }
    db()->execute("DELETE FROM DocumentoIALote WHERE id_lote = ?", [$id_lote]);
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion)
         VALUES (?, 'DocumentoIALote', ?, 'DELETE')",
        [$user['id'] ?? null, $id_lote]
    );
    echo json_encode(['success' => true, 'message' => 'Lote eliminado']);
}

function buildDocumentIntelligence($datos) {
    $tipo = normalizeDocType($datos['tipo_documento'] ?? 'desconocido');
    $confExtraccion = clamp01(floatval($datos['confianza_extraccion'] ?? $datos['confianza'] ?? 0.75));
    $conflictos = [];
    $propuesta = null;
    $candidatos = [];
    $idServicio = null;
    $explicacion = null;

    if ($tipo === 'ruta') {
        $rows = $datos['filas_ruta'] ?? [];
        $scores = [];
        foreach ($rows as $i => $row) {
            $rowData = array_merge($datos, is_array($row) ? $row : []);
            $rowData['fecha_documento'] = $rowData['fecha_documento'] ?? $datos['fecha_documento'] ?? $datos['fecha_ruta'] ?? null;
            $rowMatch = findServiceCandidatesForData($rowData, 'ruta');
            $scores[] = $rowMatch['best_score'];
            $rows[$i]['matching'] = $rowMatch;
            if ($rowMatch['best_score'] < 0.60) {
                $conflictos[] = ['fila' => $i + 1, 'tipo' => 'sin_coincidencia_fuerte', 'mensaje' => 'La fila no tiene un servicio candidato confiable.'];
            }
        }
        $datos['filas_ruta'] = $rows;
        $confidence = count($scores) ? min($scores) : $confExtraccion;
        return [
            'tipo_detectado' => $tipo,
            'estado' => 'requiere_revision',
            'confianza' => clamp01(min($confExtraccion, $confidence ?: $confExtraccion)),
            'id_servicio_sugerido' => null,
            'explicacion_matching' => 'Hoja de ruta con ' . count($rows) . ' fila(s) extraidas; cada fila debe revisarse antes de aprobar.',
            'datos_extraidos' => $datos,
            'candidatos_servicio' => [],
            'conflictos' => $conflictos,
            'propuesta_servicio' => null
        ];
    }

    $match = findServiceCandidatesForData($datos, $tipo);
    $candidatos = $match['candidatos'];
    $idServicio = $match['id_servicio_sugerido'];
    $explicacion = $match['explicacion'];
    $conflictos = findConflicts($tipo, $datos, $match['best_candidate']);
    $propuesta = $idServicio ? null : buildServiceProposal($datos);
    $score = $match['best_score'];
    $confidence = clamp01(min(max($score, 0.0), $confExtraccion));

    $estado = ($score >= 0.85 && empty($conflictos)) ? 'extraido' : 'requiere_revision';

    return [
        'tipo_detectado' => $tipo,
        'estado' => $estado,
        'confianza' => $confidence,
        'id_servicio_sugerido' => $idServicio,
        'explicacion_matching' => $explicacion,
        'datos_extraidos' => $datos,
        'candidatos_servicio' => $candidatos,
        'conflictos' => $conflictos,
        'propuesta_servicio' => $propuesta
    ];
}

function findServiceCandidatesForData($datos, $tipo) {
    $fecha = firstNonEmpty($datos, ['fecha_servicio', 'fecha_documento', 'fecha_emision', 'fecha_ruta', 'fecha']);
    $ruc = onlyDigits(firstNonEmpty($datos, ['ruc', 'cliente_ruc', 'ruc_cliente']));
    $razon = firstNonEmpty($datos, ['razon_social', 'cliente_nombre', 'empresa']);
    $direccion = firstNonEmpty($datos, ['direccion', 'direccion_sede', 'punto_llegada', 'sede_direccion']);
    $residuo = normalizeResiduo(firstNonEmpty($datos, ['tipo_residuo', 'tipo_servicio', 'residuo']));

    $sql = "SELECT s.id_servicio, s.id_sede, s.id_ruta, s.fecha_ejecucion, s.mes_servicio, s.estado, s.estado_pago,
                   s.forma_pago, s.residuo, s.observaciones,
                   se.nombre_comercial as sede_nombre, se.direccion as sede_direccion, se.distrito,
                   e.ruc, e.razon_social,
                   m.id_manifiesto, m.numero_manifiesto,
                   g.id_guia, g.numero_guia,
                   f.id_factura, f.numero_factura
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
            LEFT JOIN Guia g ON s.id_servicio = g.id_servicio
            LEFT JOIN Factura f ON s.id_servicio = f.id_servicio
            WHERE 1=1";
    $params = [];

    if ($ruc !== '') {
        $sql .= " AND e.ruc = ?";
        $params[] = $ruc;
    } elseif ($razon) {
        $sql .= " AND e.razon_social LIKE ?";
        $params[] = '%' . $razon . '%';
    }

    if (isValidDate($fecha)) {
        $sql .= " AND s.fecha_ejecucion BETWEEN DATE_SUB(?, INTERVAL 10 DAY) AND DATE_ADD(?, INTERVAL 10 DAY)";
        $params[] = $fecha;
        $params[] = $fecha;
        $sql .= " ORDER BY ABS(DATEDIFF(s.fecha_ejecucion, ?)) ASC, s.id_servicio DESC";
        $params[] = $fecha;
    } else {
        $sql .= " ORDER BY s.fecha_ejecucion DESC, s.id_servicio DESC";
    }
    $sql .= " LIMIT 60";

    $rows = db()->query($sql, $params);
    $scored = [];
    foreach ($rows as $row) {
        $score = 0.0;
        $reasons = [];

        if ($ruc !== '' && $row['ruc'] === $ruc) {
            $score += 0.25;
            $reasons[] = 'RUC exacto';
        }
        if (isValidDate($fecha) && $row['fecha_ejecucion']) {
            $days = abs((strtotime($row['fecha_ejecucion']) - strtotime($fecha)) / 86400);
            if ($days == 0) {
                $score += 0.35;
                $reasons[] = 'fecha exacta';
            } elseif ($days <= 3) {
                $score += 0.24;
                $reasons[] = 'fecha cercana';
            } elseif ($days <= 10) {
                $score += 0.12;
                $reasons[] = 'fecha dentro del margen';
            }
        }

        $addressScore = similarityScore($direccion, $row['sede_direccion']);
        if ($addressScore >= 0.70) {
            $score += 0.22;
            $reasons[] = 'direccion/sede compatible';
        } elseif ($addressScore >= 0.45) {
            $score += 0.12;
            $reasons[] = 'direccion parecida';
        }

        $nameScore = max(similarityScore($razon, $row['razon_social']), similarityScore($razon, $row['sede_nombre']));
        if ($nameScore >= 0.60) {
            $score += 0.08;
            $reasons[] = 'nombre compatible';
        }

        if ($residuo && normalizeResiduo($row['residuo']) === $residuo) {
            $score += 0.15;
            $reasons[] = 'tipo de residuo/servicio coincide';
        } elseif ($residuo && $row['residuo']) {
            $score += 0.04;
            $reasons[] = 'servicio con tipo registrado distinto';
        }

        $numero = extractNumeroForType($tipo, $datos);
        if ($numero !== '' && documentNumberMatchesExisting($tipo, $numero, $row)) {
            $score += 0.20;
            $reasons[] = 'numero de documento ya coincide';
        } elseif ($numero !== '' && documentSlotIsEmpty($tipo, $row)) {
            $score += 0.05;
            $reasons[] = 'servicio disponible para este documento';
        }

        $score = clamp01($score);
        $scored[] = [
            'id_servicio' => intval($row['id_servicio']),
            'id_sede' => intval($row['id_sede']),
            'id_ruta' => $row['id_ruta'] ? intval($row['id_ruta']) : null,
            'fecha_servicio' => $row['fecha_ejecucion'],
            'sede_nombre' => $row['sede_nombre'],
            'sede_direccion' => $row['sede_direccion'],
            'empresa_ruc' => $row['ruc'],
            'empresa_razon_social' => $row['razon_social'],
            'residuo' => $row['residuo'],
            'score' => $score,
            'razones' => $reasons,
            'documentos_actuales' => [
                'manifiesto' => $row['numero_manifiesto'] ?? null,
                'guia' => $row['numero_guia'] ?? null,
                'factura' => $row['numero_factura'] ?? null
            ],
            '_raw' => $row
        ];
    }

    usort($scored, fn($a, $b) => $b['score'] <=> $a['score']);
    $best = $scored[0] ?? null;
    $public = array_map(function ($c) {
        unset($c['_raw']);
        return $c;
    }, array_slice($scored, 0, 8));

    return [
        'id_servicio_sugerido' => ($best && $best['score'] >= 0.60) ? $best['id_servicio'] : null,
        'best_score' => $best['score'] ?? 0.0,
        'best_candidate' => $best,
        'candidatos' => $public,
        'explicacion' => $best
            ? 'Mejor candidato: servicio #' . $best['id_servicio'] . ' por ' . implode(', ', $best['razones'])
            : 'No se encontraron servicios candidatos con los datos extraidos.'
    ];
}

function findConflicts($tipo, $datos, $candidate) {
    if (!$candidate || empty($candidate['_raw'])) return [];
    $row = $candidate['_raw'];
    $numero = extractNumeroForType($tipo, $datos);
    $conflicts = [];

    $map = [
        'manifiesto' => 'numero_manifiesto',
        'guia' => 'numero_guia',
        'factura' => 'numero_factura'
    ];
    $field = $map[$tipo] ?? null;
    if ($field && !empty($row[$field]) && $numero !== '' && normalizeDocNumber($row[$field]) !== normalizeDocNumber($numero)) {
        $conflicts[] = [
            'tipo' => 'documento_existente',
            'campo' => $field,
            'actual' => $row[$field],
            'extraido' => $numero,
            'mensaje' => 'El servicio sugerido ya tiene otro numero registrado.'
        ];
    }

    return $conflicts;
}

function buildServiceProposal($datos) {
    $ruc = onlyDigits(firstNonEmpty($datos, ['ruc', 'cliente_ruc', 'ruc_cliente']));
    $direccion = firstNonEmpty($datos, ['direccion', 'direccion_sede', 'punto_llegada', 'sede_direccion']);
    $fecha = firstNonEmpty($datos, ['fecha_servicio', 'fecha_documento', 'fecha_emision', 'fecha']);
    if ($ruc === '' && !$direccion) return null;

    $sql = "SELECT se.id_sede, se.nombre_comercial, se.direccion, e.ruc, e.razon_social,
                   cs.id_contrato, cs.tarifa, cs.frecuencia
            FROM Sede se
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            LEFT JOIN ContratoServicio cs ON cs.id_sede = se.id_sede AND cs.activo = 1
            WHERE 1=1";
    $params = [];
    if ($ruc !== '') {
        $sql .= " AND e.ruc = ?";
        $params[] = $ruc;
    }
    $sql .= " ORDER BY se.activo DESC, cs.fecha_inicio DESC LIMIT 40";
    $sedes = db()->query($sql, $params);

    $best = null;
    foreach ($sedes as $sede) {
        $score = similarityScore($direccion, $sede['direccion']);
        if (!$best || $score > $best['score']) {
            $best = array_merge($sede, ['score' => $score]);
        }
    }

    if (!$best || ($ruc === '' && $best['score'] < 0.45)) return null;
    return [
        'id_sede' => intval($best['id_sede']),
        'sede_nombre' => $best['nombre_comercial'],
        'direccion' => $best['direccion'],
        'empresa_ruc' => $best['ruc'],
        'empresa_razon_social' => $best['razon_social'],
        'id_contrato' => $best['id_contrato'] ? intval($best['id_contrato']) : null,
        'fecha_ejecucion' => isValidDate($fecha) ? $fecha : null,
        'residuo' => normalizeResiduo(firstNonEmpty($datos, ['tipo_residuo', 'tipo_servicio', 'residuo'])),
        'score' => $best['score'],
        'mensaje' => 'Propuesta para crear/materializar un servicio si se aprueba manualmente.'
    ];
}

function applySingleDocumentApproval($doc, $datos, $tipo, $id_servicio, $payload, $user) {
    if ($id_servicio <= 0 && !empty($payload['crear_servicio'])) {
        $proposal = $payload['propuesta_servicio'] ?? jsonDecodeSafe($doc['propuesta_servicio']);
        $id_servicio = createServiceFromProposal($proposal, $datos, $user);
    }
    if ($id_servicio <= 0) {
        throw new Exception('Seleccione un servicio antes de aprobar.');
    }

    $servicio = db()->queryOne("SELECT * FROM Servicio WHERE id_servicio = ?", [$id_servicio]);
    if (!$servicio) {
        throw new Exception('Servicio seleccionado no existe.');
    }

    $result = ['id_servicio' => $id_servicio, 'tipo' => $tipo, 'documento_id' => null];
    if ($tipo === 'manifiesto') {
        $result['documento_id'] = upsertManifiesto($id_servicio, $datos, $doc['ruta_archivo']);
    } elseif ($tipo === 'guia') {
        $result['documento_id'] = upsertGuia($id_servicio, $datos, $doc['ruta_archivo']);
    } elseif ($tipo === 'factura') {
        $result['documento_id'] = upsertFactura($id_servicio, $datos, $doc['ruta_archivo']);
    } else {
        throw new Exception('Tipo de documento no soportado para aprobacion: ' . $tipo);
    }

    return $result;
}

function applyRouteSheetApproval($doc, $datos, $payload, $user) {
    $rows = $payload['filas_ruta'] ?? $datos['filas_ruta'] ?? [];
    if (empty($rows) || !is_array($rows)) {
        throw new Exception('La hoja de ruta no tiene filas para aplicar.');
    }

    $applied = [];
    foreach ($rows as $idx => $row) {
        if (!is_array($row)) continue;
        if (($row['aplicar'] ?? true) === false) continue;

        $matching = $row['matching'] ?? [];
        $id_servicio = intval($row['id_servicio'] ?? $matching['id_servicio_sugerido'] ?? 0);
        if ($id_servicio <= 0 && !empty($row['crear_servicio'])) {
            $id_servicio = createServiceFromProposal($row['propuesta_servicio'] ?? buildServiceProposal(array_merge($datos, $row)), array_merge($datos, $row), $user);
        }
        if ($id_servicio <= 0) {
            throw new Exception('Fila ' . ($idx + 1) . ' no tiene servicio seleccionado.');
        }

        $estado = normalizeEstadoServicio($row['estado'] ?? $row['estado_servicio'] ?? 'completado');
        $estadoPago = normalizeEstadoPago($row['estado_pago'] ?? null);
        $formaPago = normalizeFormaPago($row['forma_pago'] ?? $row['metodo_pago'] ?? null);
        $fechaPago = ($estadoPago === 'pagado') ? (firstNonEmpty($row, ['fecha_pago']) ?: date('Y-m-d')) : null;
        $residuo = normalizeResiduo(firstNonEmpty($row, ['tipo_residuo', 'tipo_servicio', 'residuo']));
        $observaciones = trim($row['observaciones'] ?? '');

        db()->execute(
            "UPDATE Servicio SET
                estado = COALESCE(?, estado),
                estado_pago = COALESCE(?, estado_pago),
                forma_pago = COALESCE(?, forma_pago),
                fecha_pago = COALESCE(?, fecha_pago),
                residuo = COALESCE(?, residuo),
                observaciones = COALESCE(?, observaciones),
                fecha_modificacion = NOW()
             WHERE id_servicio = ?",
            [$estado, $estadoPago, $formaPago, $fechaPago, $residuo, $observaciones ?: null, $id_servicio]
        );

        $rowDoc = array_merge($datos, $row);
        if (extractNumeroForType('manifiesto', $rowDoc) !== '' || isset($rowDoc['peso_kg'])) {
            upsertManifiesto($id_servicio, $rowDoc, null);
        }
        if (extractNumeroForType('guia', $rowDoc) !== '') {
            upsertGuia($id_servicio, $rowDoc, null);
        }
        if (extractNumeroForType('factura', $rowDoc) !== '') {
            upsertFactura($id_servicio, $rowDoc, null);
        }

        $applied[] = ['fila' => $idx + 1, 'id_servicio' => $id_servicio, 'estado' => $estado, 'estado_pago' => $estadoPago];
    }

    return ['tipo' => 'ruta', 'filas_aplicadas' => $applied];
}

function createServiceFromProposal($proposal, $datos, $user) {
    if (!is_array($proposal) || empty($proposal['id_sede'])) {
        throw new Exception('No hay propuesta de servicio suficiente para crear el servicio.');
    }
    $id_sede = intval($proposal['id_sede']);
    $fecha = $proposal['fecha_ejecucion'] ?? firstNonEmpty($datos, ['fecha_servicio', 'fecha_documento', 'fecha_ruta', 'fecha']);
    $mes = isValidDate($fecha) ? substr($fecha, 0, 7) : null;
    $planta = db()->queryOne("SELECT id_planta FROM Planta LIMIT 1");
    $contrato = db()->queryOne("SELECT id_contrato FROM ContratoServicio WHERE id_sede = ? AND activo = 1 ORDER BY fecha_inicio DESC LIMIT 1", [$id_sede]);

    $id = db()->insert(
        "INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, residuo, observaciones)
         VALUES (?, ?, ?, ?, ?, 'completado', 'pendiente', ?, ?)",
        [
            $id_sede,
            $planta['id_planta'] ?? null,
            $contrato['id_contrato'] ?? null,
            $mes,
            isValidDate($fecha) ? $fecha : null,
            normalizeResiduo(firstNonEmpty($datos, ['tipo_residuo', 'tipo_servicio', 'residuo'])),
            'Creado desde procesamiento IA'
        ]
    );
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos)
         VALUES (?, 'Servicio', ?, 'INSERT', ?)",
        [$user['id'] ?? null, $id, json_encode(['origen' => 'procesamiento_ia', 'propuesta' => $proposal], JSON_UNESCAPED_UNICODE)]
    );
    return intval($id);
}

function upsertManifiesto($id_servicio, $datos, $docPath) {
    $numero = extractNumeroForType('manifiesto', $datos);
    $peso = decimalOrNull(firstNonEmpty($datos, ['peso_kg', 'peso']));
    $tipoResiduo = firstNonEmpty($datos, ['tipo_residuo', 'tipo_servicio', 'residuo']) ?: 'Residuos Solidos';
    $existing = db()->queryOne("SELECT id_manifiesto FROM Manifiesto WHERE id_servicio = ?", [$id_servicio]);
    if ($existing) {
        db()->execute(
            "UPDATE Manifiesto SET numero_manifiesto = COALESCE(?, numero_manifiesto), peso_kg = COALESCE(?, peso_kg), tipo_residuo = COALESCE(?, tipo_residuo), doc_escaneado = COALESCE(?, doc_escaneado), fecha_modificacion = NOW() WHERE id_servicio = ?",
            [$numero ?: null, $peso, $tipoResiduo, $docPath, $id_servicio]
        );
        return intval($existing['id_manifiesto']);
    }
    return intval(db()->insert(
        "INSERT INTO Manifiesto (id_servicio, numero_manifiesto, peso_kg, tipo_residuo, doc_escaneado) VALUES (?, ?, ?, ?, ?)",
        [$id_servicio, $numero ?: null, $peso, $tipoResiduo, $docPath]
    ));
}

function upsertGuia($id_servicio, $datos, $docPath) {
    $numero = extractNumeroForType('guia', $datos);
    if ($numero === '') throw new Exception('La guia requiere numero para aprobar.');
    $fecha = firstNonEmpty($datos, ['fecha_emision', 'fecha_documento', 'fecha_servicio', 'fecha']);
    $existing = db()->queryOne("SELECT id_guia FROM Guia WHERE id_servicio = ?", [$id_servicio]);
    if ($existing) {
        db()->execute(
            "UPDATE Guia SET numero_guia = COALESCE(?, numero_guia), fecha_emision = COALESCE(?, fecha_emision), punto_partida = COALESCE(?, punto_partida), punto_llegada = COALESCE(?, punto_llegada), doc_escaneado = COALESCE(?, doc_escaneado), fecha_modificacion = NOW() WHERE id_servicio = ?",
            [$numero, isValidDate($fecha) ? $fecha : null, $datos['punto_partida'] ?? null, $datos['punto_llegada'] ?? $datos['direccion'] ?? null, $docPath, $id_servicio]
        );
        return intval($existing['id_guia']);
    }
    return intval(db()->insert(
        "INSERT INTO Guia (id_servicio, numero_guia, fecha_emision, punto_partida, punto_llegada, doc_escaneado) VALUES (?, ?, COALESCE(?, CURDATE()), ?, ?, ?)",
        [$id_servicio, $numero, isValidDate($fecha) ? $fecha : null, $datos['punto_partida'] ?? null, $datos['punto_llegada'] ?? $datos['direccion'] ?? null, $docPath]
    ));
}

function upsertFactura($id_servicio, $datos, $docPath) {
    $numero = extractNumeroForType('factura', $datos);
    if ($numero === '') throw new Exception('La factura requiere numero para aprobar.');
    $existing = db()->queryOne("SELECT id_factura FROM Factura WHERE id_servicio = ?", [$id_servicio]);
    if ($existing) {
        db()->execute(
            "UPDATE Factura SET numero_factura = COALESCE(?, numero_factura), doc_escaneado = COALESCE(?, doc_escaneado) WHERE id_servicio = ?",
            [$numero, $docPath, $id_servicio]
        );
        return intval($existing['id_factura']);
    }
    return intval(db()->insert(
        "INSERT INTO Factura (id_servicio, numero_factura, doc_escaneado) VALUES (?, ?, ?)",
        [$id_servicio, $numero, $docPath]
    ));
}

function buildExtractionPrompt() {
    return <<<PROMPT
Eres el extractor documental de IO Group Peru. Lee el archivo adjunto, que puede ser una foto o PDF escaneado de uno de estos modelos: hoja de ruta, manifiesto, guia de transporte o factura.

Devuelve solo JSON valido conforme al esquema. No inventes datos. Si un campo no esta visible, usa null.

Debes ser especialmente cuidadoso con:
- RUC, razon social, direccion y nombre de sede.
- Fechas de emision o servicio.
- Numeros de manifiesto, guia y factura.
- Tipo de servicio/residuo: BIOCONTAMINADO, ESPECIAL, ANIMAL CONTAMINADO, MERMA Y/O DESMEDRO.
- En hojas de ruta, cada fila puede tener su propia sede, estado, pago, metodo, peso, manifiesto, guia, factura y observaciones.

Si hay varias sedes con el mismo RUC, extrae direccion y tipo de residuo/servicio para que el sistema pueda diferenciarlas.
Incluye una explicacion corta de lectura y una confianza entre 0 y 1.
PROMPT;
}

function buildExtractionSchema() {
    $nullableString = ['type' => 'STRING', 'nullable' => true];
    return [
        'type' => 'OBJECT',
        'properties' => [
            'tipo_documento' => ['type' => 'STRING', 'enum' => ['ruta', 'manifiesto', 'guia', 'factura', 'desconocido']],
            'confianza_extraccion' => ['type' => 'NUMBER'],
            'explicacion_extraccion' => $nullableString,
            'numero_documento' => $nullableString,
            'numero_manifiesto' => $nullableString,
            'numero_guia' => $nullableString,
            'numero_factura' => $nullableString,
            'fecha_documento' => $nullableString,
            'fecha_servicio' => $nullableString,
            'fecha_emision' => $nullableString,
            'ruc' => $nullableString,
            'razon_social' => $nullableString,
            'sede_nombre' => $nullableString,
            'direccion' => $nullableString,
            'punto_partida' => $nullableString,
            'punto_llegada' => $nullableString,
            'tipo_residuo' => $nullableString,
            'tipo_servicio' => $nullableString,
            'peso_kg' => ['type' => 'NUMBER', 'nullable' => true],
            'importe_total' => ['type' => 'NUMBER', 'nullable' => true],
            'estado_servicio' => $nullableString,
            'estado_pago' => $nullableString,
            'forma_pago' => $nullableString,
            'observaciones' => $nullableString,
            'filas_ruta' => [
                'type' => 'ARRAY',
                'items' => [
                    'type' => 'OBJECT',
                    'properties' => [
                        'orden' => ['type' => 'INTEGER', 'nullable' => true],
                        'ruc' => $nullableString,
                        'razon_social' => $nullableString,
                        'sede_nombre' => $nullableString,
                        'direccion' => $nullableString,
                        'fecha_servicio' => $nullableString,
                        'tipo_residuo' => $nullableString,
                        'tipo_servicio' => $nullableString,
                        'peso_kg' => ['type' => 'NUMBER', 'nullable' => true],
                        'estado_servicio' => $nullableString,
                        'estado_pago' => $nullableString,
                        'forma_pago' => $nullableString,
                        'numero_manifiesto' => $nullableString,
                        'numero_guia' => $nullableString,
                        'numero_factura' => $nullableString,
                        'observaciones' => $nullableString
                    ]
                ]
            ]
        ],
        'required' => ['tipo_documento', 'confianza_extraccion']
    ];
}

function normalizeExtraction($data) {
    $data['tipo_documento'] = normalizeDocType($data['tipo_documento'] ?? 'desconocido');
    $data['confianza_extraccion'] = clamp01(floatval($data['confianza_extraccion'] ?? 0.75));
    foreach (['fecha_documento', 'fecha_servicio', 'fecha_emision'] as $field) {
        if (!empty($data[$field])) $data[$field] = normalizeDateValue($data[$field]);
    }
    if (!empty($data['ruc'])) $data['ruc'] = onlyDigits($data['ruc']);
    if (!empty($data['filas_ruta']) && is_array($data['filas_ruta'])) {
        foreach ($data['filas_ruta'] as &$row) {
            if (!empty($row['fecha_servicio'])) $row['fecha_servicio'] = normalizeDateValue($row['fecha_servicio']);
            if (!empty($row['ruc'])) $row['ruc'] = onlyDigits($row['ruc']);
        }
        unset($row);
    }
    return $data;
}

function hydrateDocumentoJson($row) {
    foreach (['datos_extraidos', 'candidatos_servicio', 'conflictos', 'propuesta_servicio', 'resultado_aprobacion'] as $field) {
        $row[$field] = jsonDecodeSafe($row[$field] ?? null);
    }
    return $row;
}

function refreshLoteStats($id_lote) {
    $stats = db()->queryOne(
        "SELECT
            COUNT(*) as total,
            SUM(CASE WHEN estado IN ('extraido','requiere_revision','aprobado','rechazado','error') THEN 1 ELSE 0 END) as procesados,
            SUM(CASE WHEN estado = 'aprobado' THEN 1 ELSE 0 END) as aprobados,
            SUM(CASE WHEN estado = 'rechazado' THEN 1 ELSE 0 END) as rechazados,
            SUM(CASE WHEN estado IN ('pendiente','procesando') THEN 1 ELSE 0 END) as pendientes,
            SUM(CASE WHEN estado = 'error' THEN 1 ELSE 0 END) as errores
         FROM DocumentoIAArchivo WHERE id_lote = ?",
        [$id_lote]
    );
    $total = intval($stats['total'] ?? 0);
    $pendientes = intval($stats['pendientes'] ?? 0);
    $errores = intval($stats['errores'] ?? 0);
    $estado = ($total > 0 && $pendientes === 0) ? ($errores === $total ? 'error' : 'completado') : 'pendiente';
    if ($pendientes > 0 && intval($stats['procesados'] ?? 0) > 0) $estado = 'procesando';

    db()->execute(
        "UPDATE DocumentoIALote SET total_archivos = ?, procesados = ?, aprobados = ?, rechazados = ?, estado = ? WHERE id_lote = ?",
        [$total, intval($stats['procesados'] ?? 0), intval($stats['aprobados'] ?? 0), intval($stats['rechazados'] ?? 0), $estado, $id_lote]
    );
}

function normalizeUploadFiles($input) {
    if (!$input) return [];
    if (is_array($input['name'])) {
        $files = [];
        foreach ($input['name'] as $i => $name) {
            if (($input['error'][$i] ?? UPLOAD_ERR_NO_FILE) === UPLOAD_ERR_NO_FILE) continue;
            $files[] = [
                'name' => $name,
                'type' => $input['type'][$i] ?? '',
                'tmp_name' => $input['tmp_name'][$i] ?? '',
                'error' => $input['error'][$i] ?? UPLOAD_ERR_NO_FILE,
                'size' => $input['size'][$i] ?? 0
            ];
        }
        return $files;
    }
    return [$input];
}

function validateInputFile($file) {
    if (($file['error'] ?? UPLOAD_ERR_NO_FILE) !== UPLOAD_ERR_OK) {
        throw new Exception('Archivo invalido o incompleto.');
    }
    if (($file['size'] ?? 0) > 25 * 1024 * 1024) {
        throw new Exception('Cada archivo no debe superar 25 MB.');
    }
    $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    $allowed = ['pdf', 'jpg', 'jpeg', 'png', 'webp', 'heic', 'heif'];
    if (!in_array($ext, $allowed, true)) {
        throw new Exception('Formato no permitido: ' . $ext);
    }
}

function detectMimeType($filePath, $fallback) {
    if (function_exists('finfo_open') && is_readable($filePath)) {
        $finfo = finfo_open(FILEINFO_MIME_TYPE);
        $mime = $finfo ? finfo_file($finfo, $filePath) : null;
        if ($finfo) finfo_close($finfo);
        if ($mime) return $mime;
    }
    return $fallback ?: 'application/octet-stream';
}

function readJsonBody() {
    $raw = file_get_contents('php://input');
    if (!$raw) return [];
    $data = json_decode($raw, true);
    return is_array($data) ? $data : [];
}

function jsonDecodeSafe($value) {
    if (!$value) return null;
    if (is_array($value)) return $value;
    $data = json_decode($value, true);
    return is_array($data) ? $data : null;
}

function normalizeDocType($value) {
    $value = normalizeText($value);
    if (strpos($value, 'ruta') !== false) return 'ruta';
    if (strpos($value, 'manifiesto') !== false || strpos($value, 'manifest') !== false) return 'manifiesto';
    if (strpos($value, 'guia') !== false || strpos($value, 'remision') !== false || strpos($value, 'transporte') !== false) return 'guia';
    if (strpos($value, 'factura') !== false || strpos($value, 'invoice') !== false) return 'factura';
    return 'desconocido';
}

function normalizeResiduo($value) {
    $text = normalizeText($value);
    if ($text === '') return null;
    if (strpos($text, 'especial') !== false) return 'ESPECIAL';
    if (strpos($text, 'animal') !== false) return 'ANIMAL CONTAMINADO';
    if (strpos($text, 'merma') !== false || strpos($text, 'desmedro') !== false) return 'MERMA Y/O DESMEDRO';
    if (strpos($text, 'bio') !== false || strpos($text, 'contamin') !== false || strpos($text, 'normal') !== false) return 'BIOCONTAMINADO';
    return null;
}

function normalizeEstadoServicio($value) {
    $text = normalizeText($value);
    if (strpos($text, 'cancel') !== false || strpos($text, 'no atend') !== false) return 'cancelado';
    if (strpos($text, 'curso') !== false) return 'en_curso';
    if (strpos($text, 'program') !== false) return 'programado';
    return 'completado';
}

function normalizeEstadoPago($value) {
    $text = normalizeText($value);
    if ($text === '') return null;
    if (strpos($text, 'pag') !== false || strpos($text, 'cancel') !== false) return 'pagado';
    return 'pendiente';
}

function normalizeFormaPago($value) {
    $value = trim((string)$value);
    return $value === '' ? null : $value;
}

function extractNumeroForType($tipo, $datos) {
    $keys = [
        'manifiesto' => ['numero_manifiesto', 'manifiesto', 'numero_documento'],
        'guia' => ['numero_guia', 'guia', 'numero_documento'],
        'factura' => ['numero_factura', 'factura', 'numero_documento']
    ];
    return trim((string) firstNonEmpty($datos, $keys[$tipo] ?? ['numero_documento']));
}

function documentNumberMatchesExisting($tipo, $numero, $row) {
    $map = ['manifiesto' => 'numero_manifiesto', 'guia' => 'numero_guia', 'factura' => 'numero_factura'];
    $field = $map[$tipo] ?? null;
    return $field && !empty($row[$field]) && normalizeDocNumber($row[$field]) === normalizeDocNumber($numero);
}

function documentSlotIsEmpty($tipo, $row) {
    $map = ['manifiesto' => 'numero_manifiesto', 'guia' => 'numero_guia', 'factura' => 'numero_factura'];
    $field = $map[$tipo] ?? null;
    return $field && empty($row[$field]);
}

function normalizeDocNumber($value) {
    return preg_replace('/[^0-9a-z]/', '', normalizeText($value));
}

function similarityScore($a, $b) {
    $a = normalizeText($a);
    $b = normalizeText($b);
    if ($a === '' || $b === '') return 0.0;
    if ($a === $b) return 1.0;
    if (strpos($a, $b) !== false || strpos($b, $a) !== false) return 0.85;
    $ta = array_values(array_filter(explode(' ', $a), fn($t) => strlen($t) > 2));
    $tb = array_values(array_filter(explode(' ', $b), fn($t) => strlen($t) > 2));
    if (empty($ta) || empty($tb)) return 0.0;
    $inter = array_intersect($ta, $tb);
    return count($inter) / max(count(array_unique(array_merge($ta, $tb))), 1);
}

function normalizeText($value) {
    $value = mb_strtolower(trim((string)$value), 'UTF-8');
    if (function_exists('iconv')) {
        $converted = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $value);
        if ($converted !== false) $value = $converted;
    }
    $value = preg_replace('/[^a-z0-9]+/', ' ', $value);
    return trim(preg_replace('/\s+/', ' ', $value));
}

function firstNonEmpty($data, $keys) {
    foreach ($keys as $key) {
        if (is_array($data) && isset($data[$key]) && trim((string)$data[$key]) !== '') return $data[$key];
    }
    return null;
}

function onlyDigits($value) {
    return preg_replace('/\D+/', '', (string)$value);
}

function decimalOrNull($value) {
    if ($value === null || $value === '') return null;
    $value = str_replace(',', '.', preg_replace('/[^0-9,.-]/', '', (string)$value));
    return is_numeric($value) ? $value : null;
}

function clamp01($value) {
    return max(0.0, min(1.0, floatval($value)));
}

function isValidDate($value) {
    if (!$value) return false;
    $d = DateTime::createFromFormat('Y-m-d', (string)$value);
    return $d && $d->format('Y-m-d') === $value;
}

function normalizeDateValue($value) {
    $value = trim((string)$value);
    if ($value === '') return null;
    if (preg_match('/^\d{4}-\d{2}-\d{2}$/', $value)) return $value;
    if (preg_match('/^(\d{1,2})[\/.-](\d{1,2})[\/.-](\d{2,4})$/', $value, $m)) {
        $year = strlen($m[3]) === 2 ? '20' . $m[3] : $m[3];
        return sprintf('%04d-%02d-%02d', intval($year), intval($m[2]), intval($m[1]));
    }
    $ts = strtotime($value);
    return $ts ? date('Y-m-d', $ts) : null;
}
