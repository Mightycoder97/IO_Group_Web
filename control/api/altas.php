<?php
/**
 * IO Group - Altas API
 * Endpoints to handle the 3-stage New Branch Onboarding Flow
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';
require_once __DIR__ . '/helpers/geo_location.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

switch ($method) {
    case 'GET':
        if ($action === 'obtener') {
            obtener($_GET['id'] ?? null);
        } else {
            listar();
        }
        break;
    case 'POST':
        if ($action === 'guardar_etapa1') {
            guardar_etapa1();
        } elseif ($action === 'iniciar_renovacion') {
            iniciar_renovacion();
        } elseif ($action === 'generar_contrato') {
            generar_contrato();
        } elseif ($action === 'subir_documentos') {
            subir_documentos();
        } else {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Acción no válida']);
        }
        break;
    case 'DELETE':
        eliminar_alta();
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

function listar() {
    canView();

    // Check if table exists, if not return empty to prevent errors before migration
    try {
        // Try query with user columns (requires migration)
        try {
            $sql = "SELECT p.id_proceso, p.etapa_actual, p.doc_generado, p.doc_firmado, p.comprobante_pago, p.fecha_creacion, p.fecha_modificacion, p.datos_json,
                           uc.nombre AS usuario_creador, um.nombre AS usuario_modificador
                    FROM ProcesoAlta p
                    LEFT JOIN Usuario uc ON p.id_usuario_creador = uc.id_usuario
                    LEFT JOIN Usuario um ON p.id_usuario_modificador = um.id_usuario
                    ORDER BY p.fecha_creacion DESC";
            $data = db()->query($sql);
        } catch (Exception $e) {
            // Fallback: migration not applied yet
            $sql = "SELECT id_proceso, etapa_actual, doc_generado, doc_firmado, comprobante_pago, fecha_creacion, fecha_modificacion, datos_json FROM ProcesoAlta ORDER BY fecha_creacion DESC";
            $data = db()->query($sql);
        }

        // Parse JSON for preview details
        foreach ($data as &$row) {
            $parsed = json_decode($row['datos_json'], true);
            $row['empresa_nombre'] = $parsed['empresa']['razon_social'] ?? 'No definida';
            $row['sede_nombre'] = $parsed['sede']['nombre_comercial'] ?? 'No definida';
            $row['cliente_nombre'] = $parsed['cliente']['nombre'] ?? 'No definido';
            unset($row['datos_json']); // Remove full payload from list view
        }

        echo json_encode(['success' => true, 'data' => $data]);
    } catch (Exception $e) {
        // Table probably doesn't exist yet
        echo json_encode(['success' => true, 'data' => [], 'message' => 'Tabla no encontrada o error interno']);
    }
}

function obtener($id) {
    canView();

    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }

    // Try query with user columns (requires migration)
    try {
        $proceso = db()->queryOne(
            "SELECT p.*, uc.nombre AS usuario_creador, um.nombre AS usuario_modificador
             FROM ProcesoAlta p
             LEFT JOIN Usuario uc ON p.id_usuario_creador = uc.id_usuario
             LEFT JOIN Usuario um ON p.id_usuario_modificador = um.id_usuario
             WHERE p.id_proceso = ?", [$id]);
    } catch (Exception $e) {
        // Fallback: migration not applied yet
        $proceso = db()->queryOne("SELECT * FROM ProcesoAlta WHERE id_proceso = ?", [$id]);
    }

    if (!$proceso) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Proceso no encontrado']);
        return;
    }

    $proceso['datos_parsed'] = json_decode($proceso['datos_json'], true);

    // Include firma digital info if exists
    $firma = db()->queryOne("SELECT token, firmado, fecha_firma, firma_imagen FROM FirmaDigital WHERE id_proceso = ?", [$id]);
    if ($firma) {
        $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
        $host = $_SERVER['HTTP_HOST'] ?? 'iogroup.pe';
        $proceso['firma_token'] = $firma['token'];
        $proceso['firma_url'] = "{$protocol}://{$host}/control/public/firma.html?token={$firma['token']}";
        $proceso['firma_firmado'] = (bool)$firma['firmado'];
        $proceso['firma_fecha'] = $firma['fecha_firma'];
        $proceso['firma_imagen'] = $firma['firma_imagen'];
    }

    echo json_encode([
        'success' => true,
        'data' => $proceso
    ]);
}

function iniciar_renovacion() {
    $user = canEdit();

    $data = json_decode(file_get_contents('php://input'), true);
    $id_contrato = $data['id_contrato'] ?? null;

    if (!$id_contrato) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID de contrato requerido']);
        return;
    }

    $contrato = db()->queryOne(
        "SELECT
            cs.id_contrato, cs.fecha_inicio AS contrato_fecha_inicio, cs.fecha_fin AS contrato_fecha_fin,
            cs.frecuencia AS contrato_frecuencia, cs.peso_limite_kg, cs.tarifa_adicional_kg,
            cs.tarifa, cs.tipo_tarifa, cs.observaciones AS contrato_observaciones,
            cs.activo AS contrato_activo,
            s.id_sede, s.nombre_comercial, s.direccion AS sede_direccion, s.distrito AS sede_distrito,
            s.provincia AS sede_provincia, s.departamento AS sede_departamento, s.referencia,
            s.coordenadas_gps, s.contacto_nombre, s.contacto_telefono, s.contacto_telefono_2, s.contacto_email,
            e.id_empresa, e.razon_social, e.rubro, e.ruc, e.direccion_fiscal,
            e.distrito AS empresa_distrito, e.provincia AS empresa_provincia, e.departamento AS empresa_departamento,
            c.id_cliente, c.nombre AS cliente_nombre, c.tipo_documento, c.dni
         FROM ContratoServicio cs
         INNER JOIN Sede s ON cs.id_sede = s.id_sede
         INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
         INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
         WHERE cs.id_contrato = ?",
        [$id_contrato]
    );

    if (!$contrato) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Contrato no encontrado']);
        return;
    }

    if ((int)$contrato['contrato_activo'] !== 1) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Solo se pueden renovar contratos activos vencidos']);
        return;
    }

    $today = date('Y-m-d');
    if (empty($contrato['contrato_fecha_fin']) || $contrato['contrato_fecha_fin'] >= $today) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Este contrato aun no esta vencido']);
        return;
    }

    $pendiente = db()->queryOne(
        "SELECT id_proceso
         FROM ProcesoAlta
         WHERE etapa_actual < 4
           AND JSON_UNQUOTE(JSON_EXTRACT(datos_json, '$.tipo_proceso')) = 'renovacion_contrato'
           AND JSON_UNQUOTE(JSON_EXTRACT(datos_json, '$.renovacion.id_contrato_anterior')) = ?
         ORDER BY fecha_creacion DESC
         LIMIT 1",
        [(string)$id_contrato]
    );

    if ($pendiente) {
        echo json_encode([
            'success' => true,
            'message' => 'Ya existe una renovacion pendiente para este contrato',
            'id_proceso' => $pendiente['id_proceso'],
            'redirect_url' => "/control/public/pages/altas/formulario.html?id={$pendiente['id_proceso']}&modo=renovacion"
        ]);
        return;
    }

    $fecha_fin = date('Y-m-d', strtotime($today . ' +1 year'));
    $store_data = [
        'tipo_proceso' => 'renovacion_contrato',
        'renovacion' => [
            'id_contrato_anterior' => (int)$contrato['id_contrato'],
            'fecha_fin_anterior' => $contrato['contrato_fecha_fin']
        ],
        'cliente' => [
            'id_cliente' => (int)$contrato['id_cliente'],
            'nombre' => $contrato['cliente_nombre'],
            'tipo_documento' => $contrato['tipo_documento'] ?: 'DNI',
            'dni' => $contrato['dni']
        ],
        'empresa' => [
            'id_empresa' => (int)$contrato['id_empresa'],
            'razon_social' => $contrato['razon_social'],
            'rubro' => $contrato['rubro'],
            'ruc' => $contrato['ruc'],
            'direccion_fiscal' => $contrato['direccion_fiscal'],
            'distrito' => $contrato['empresa_distrito'],
            'provincia' => $contrato['empresa_provincia'],
            'departamento' => $contrato['empresa_departamento']
        ],
        'sede' => [
            'id_sede' => (int)$contrato['id_sede'],
            'nombre_comercial' => $contrato['nombre_comercial'],
            'direccion' => $contrato['sede_direccion'],
            'distrito' => $contrato['sede_distrito'],
            'provincia' => $contrato['sede_provincia'],
            'departamento' => $contrato['sede_departamento'],
            'referencia' => $contrato['referencia'],
            'coordenadas_gps' => $contrato['coordenadas_gps'],
            'contacto_nombre' => $contrato['contacto_nombre'],
            'contacto_telefono' => $contrato['contacto_telefono'],
            'contacto_telefono_2' => $contrato['contacto_telefono_2'],
            'contacto_email' => $contrato['contacto_email']
        ],
        'contrato' => [
            'fecha_inicio' => $today,
            'fecha_fin' => $fecha_fin,
            'frecuencia' => $contrato['contrato_frecuencia'],
            'tarifa' => $contrato['tarifa'],
            'tipo_tarifa' => $contrato['tipo_tarifa'] ?: 'por_servicio',
            'peso_limite_kg' => $contrato['peso_limite_kg'],
            'tarifa_adicional_kg' => $contrato['tarifa_adicional_kg'],
            'observaciones' => $contrato['contrato_observaciones']
        ]
    ];

    $store_json = json_encode($store_data, JSON_UNESCAPED_UNICODE);
    $id = db()->insert(
        "INSERT INTO ProcesoAlta (datos_json, etapa_actual, id_usuario_creador, id_usuario_modificador) VALUES (?, 1, ?, ?)",
        [$store_json, $user['id'], $user['id']]
    );

    try {
        db()->insert(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ProcesoAlta', ?, 'INSERT', ?)",
            [$user['id'], $id, json_encode(['etapa' => 1, 'accion' => 'iniciar_renovacion', 'id_contrato_anterior' => $id_contrato])]
        );
    } catch (Exception $e) { /* non-critical */ }

    echo json_encode([
        'success' => true,
        'message' => 'Renovacion iniciada',
        'id_proceso' => $id,
        'redirect_url' => "/control/public/pages/altas/formulario.html?id={$id}&modo=renovacion"
    ]);
}

function guardar_etapa1() {
    $user = canEdit();

    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (!$data || empty($data['empresa']) || empty($data['sede']) || empty($data['contrato'])) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Datos incompletos para Etapa 1']);
        return;
    }

    $id_proceso = $data['id_proceso'] ?? null;

    // Remove id_proceso from the JSON payload before storing
    $store_data = $data;
    unset($store_data['id_proceso']);

    if ($id_proceso) {
        $existing_proceso = db()->queryOne("SELECT datos_json FROM ProcesoAlta WHERE id_proceso = ?", [$id_proceso]);
        $existing_data = $existing_proceso ? json_decode($existing_proceso['datos_json'], true) : null;

        if ($existing_data) {
            foreach (['tipo_proceso', 'renovacion'] as $key) {
                if (!isset($store_data[$key]) && isset($existing_data[$key])) {
                    $store_data[$key] = $existing_data[$key];
                }
            }

            foreach (['cliente' => 'id_cliente', 'empresa' => 'id_empresa', 'sede' => 'id_sede'] as $section => $idKey) {
                if (isset($existing_data[$section][$idKey]) && empty($store_data[$section][$idKey])) {
                    $store_data[$section][$idKey] = $existing_data[$section][$idKey];
                }
            }
        }
    }

    $store_json = json_encode($store_data, JSON_UNESCAPED_UNICODE);

    if ($id_proceso) {
        // Update existing process
        db()->execute(
            "UPDATE ProcesoAlta SET datos_json = ?, id_usuario_modificador = ?, fecha_modificacion = NOW() WHERE id_proceso = ?",
            [$store_json, $user['id'], $id_proceso]
        );
        $id = $id_proceso;

        // AuditLog
        try {
            db()->insert(
                "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ProcesoAlta', ?, 'UPDATE', ?)",
                [$user['id'], $id, json_encode(['etapa' => 1, 'accion' => 'actualizar_datos'])]
            );
        } catch (Exception $e) { /* non-critical */ }
    } else {
        // Insert new process
        $id = db()->insert(
            "INSERT INTO ProcesoAlta (datos_json, etapa_actual, id_usuario_creador, id_usuario_modificador) VALUES (?, 1, ?, ?)",
            [$store_json, $user['id'], $user['id']]
        );

        // AuditLog
        try {
            db()->insert(
                "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ProcesoAlta', ?, 'INSERT', ?)",
                [$user['id'], $id, json_encode(['etapa' => 1, 'accion' => 'crear_proceso'])]
            );
        } catch (Exception $e) { /* non-critical */ }
    }

    echo json_encode([
        'success' => true,
        'message' => 'Datos guardados.',
        'id_proceso' => $id
    ]);
}

function eliminar_alta() {
    $user = canEdit();

    $id = $_GET['id'] ?? null;
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }

    $proceso = db()->queryOne("SELECT * FROM ProcesoAlta WHERE id_proceso = ?", [$id]);
    if (!$proceso) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Proceso no encontrado']);
        return;
    }

    // Get firma digital info to delete its files
    $firma = null;
    try {
        $firma = db()->queryOne("SELECT firma_imagen FROM FirmaDigital WHERE id_proceso = ?", [$id]);
    } catch (Exception $e) { /* table might not exist in old migrations */ }

    // Delete associated files if they exist
    $upload_base = realpath(__DIR__ . '/../') . '/';
    if (!$upload_base) {
        $upload_base = __DIR__ . '/../';
    }
    $files_to_delete = ['doc_generado', 'doc_firmado', 'comprobante_pago'];
    foreach ($files_to_delete as $field) {
        if (!empty($proceso[$field])) {
            $filepath = $upload_base . $proceso[$field];
            if (file_exists($filepath)) {
                @unlink($filepath);
            }
        }
    }

    // Delete signature image
    if ($firma && !empty($firma['firma_imagen'])) {
        $firma_filepath = $upload_base . $firma['firma_imagen'];
        if (file_exists($firma_filepath)) {
            @unlink($firma_filepath);
        }
    }

    // AuditLog before delete
    try {
        db()->insert(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores) VALUES (?, 'ProcesoAlta', ?, 'DELETE', ?)",
            [$user['id'], $id, json_encode(['etapa_actual' => $proceso['etapa_actual']])]
        );
    } catch (Exception $e) { /* non-critical */ }

    try {
        // Delete related FirmaDigital if exists (in case ON DELETE CASCADE is missing)
        try {
            db()->execute("DELETE FROM FirmaDigital WHERE id_proceso = ?", [$id]);
        } catch (Exception $e) { /* table might not exist or error */ }

        db()->execute("DELETE FROM ProcesoAlta WHERE id_proceso = ?", [$id]);

        echo json_encode([
            'success' => true,
            'message' => 'Proceso de alta eliminado correctamente'
        ]);
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Error al eliminar el proceso: ' . $e->getMessage()
        ]);
    }
}

function generar_contrato() {
    $user = canEdit();

    $data = json_decode(file_get_contents('php://input'), true);
    $id_proceso = $data['id_proceso'] ?? null;

    if (!$id_proceso) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID de proceso requerido']);
        return;
    }

    $proceso = db()->queryOne("SELECT * FROM ProcesoAlta WHERE id_proceso = ?", [$id_proceso]);
    if (!$proceso) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Proceso no encontrado']);
        return;
    }

    // Parse the stored JSON data
    $datos = json_decode($proceso['datos_json'], true);
    if (!$datos) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Datos JSON del proceso son inválidos.']);
        return;
    }

    // Generate contract number: year-padded_id
    $year = date('Y');
    $numero_contrato = "N°{$year}-" . str_pad($id_proceso, 6, '0', STR_PAD_LEFT);

    // Generate HTML from template
    $template_file = __DIR__ . '/templates/contrato_template.php';
    if (!file_exists($template_file)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Plantilla HTML del contrato no encontrada.']);
        return;
    }

    try {
        $html = include $template_file;
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error al generar contrato: ' . $e->getMessage()]);
        return;
    }

    if (empty($html)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'La plantilla no generó contenido.']);
        return;
    }

    // Save a backup HTML copy
    $output_dir = __DIR__ . '/../uploads/altas';
    if (!is_dir($output_dir)) {
        mkdir($output_dir, 0755, true);
    }
    $output_filename = 'Contrato_' . $id_proceso . '_' . time() . '.html';
    $output_path = $output_dir . '/' . $output_filename;
    file_put_contents($output_path, $html);

    $doc_url = 'uploads/altas/' . $output_filename;

    // Update DB
    db()->execute(
        "UPDATE ProcesoAlta SET doc_generado = ?, etapa_actual = GREATEST(etapa_actual, 2), id_usuario_modificador = ? WHERE id_proceso = ?",
        [$doc_url, $user['id'], $id_proceso]
    );

    // AuditLog
    try {
        db()->insert(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ProcesoAlta', ?, 'UPDATE', ?)",
            [$user['id'], $id_proceso, json_encode(['etapa' => 2, 'accion' => 'generar_contrato', 'doc_url' => $doc_url])]
        );
    } catch (Exception $e) { /* non-critical */ }

    // Generate or update FirmaDigital token
    $existing_firma = db()->queryOne("SELECT token FROM FirmaDigital WHERE id_proceso = ?", [$id_proceso]);
    if ($existing_firma) {
        $firma_token = $existing_firma['token'];
        // Reset firma status in case contract was regenerated
        db()->execute("UPDATE FirmaDigital SET firmado = 0, firma_imagen = NULL, fecha_firma = NULL WHERE id_proceso = ?", [$id_proceso]);
    } else {
        $firma_token = bin2hex(random_bytes(32));
        db()->insert(
            "INSERT INTO FirmaDigital (id_proceso, token) VALUES (?, ?)",
            [$id_proceso, $firma_token]
        );
    }

    // Build the signature URL
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    $host = $_SERVER['HTTP_HOST'] ?? 'iogroup.pe';
    $firma_url = "{$protocol}://{$host}/control/public/firma.html?token={$firma_token}";

    echo json_encode([
        'success' => true,
        'message' => 'Contrato generado exitosamente',
        'contract_html' => $html,
        'file_url' => $doc_url,
        'numero_contrato' => $numero_contrato,
        'firma_token' => $firma_token,
        'firma_url' => $firma_url
    ]);
}

function subir_documentos() {
    $user = canEdit();

    $id_proceso = $_POST['id_proceso'] ?? null;
    if (!$id_proceso) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID de proceso requerido']);
        return;
    }

    $proceso = db()->queryOne("SELECT * FROM ProcesoAlta WHERE id_proceso = ?", [$id_proceso]);
    if (!$proceso) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Proceso no encontrado']);
        return;
    }

    $uploadDir = realpath(__DIR__ . '/../uploads/altas') . '/';
    $docFirmadoPath = null;
    $comprobantePath = null;

    // Handle File Uploads
    if (isset($_FILES['doc_firmado']) && $_FILES['doc_firmado']['error'] === UPLOAD_ERR_OK) {
        $ext = pathinfo($_FILES['doc_firmado']['name'], PATHINFO_EXTENSION);
        $filename = 'Firmado_' . $id_proceso . '_' . time() . '.' . $ext;
        if (move_uploaded_file($_FILES['doc_firmado']['tmp_name'], $uploadDir . $filename)) {
            $docFirmadoPath = 'uploads/altas/' . $filename;
        }
    }

    if (isset($_FILES['comprobante_pago']) && $_FILES['comprobante_pago']['error'] === UPLOAD_ERR_OK) {
        $ext = pathinfo($_FILES['comprobante_pago']['name'], PATHINFO_EXTENSION);
        $filename = 'Pago_' . $id_proceso . '_' . time() . '.' . $ext;
        if (move_uploaded_file($_FILES['comprobante_pago']['tmp_name'], $uploadDir . $filename)) {
            $comprobantePath = 'uploads/altas/' . $filename;
        }
    }

    if (!$docFirmadoPath && !$comprobantePath && $proceso['etapa_actual'] < 3) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Debe subir los documentos correspondientes']);
        return;
    }

    // Keep existing paths if none new were uploaded (if they were updating)
    $finalDocFirmado = $docFirmadoPath ?: $proceso['doc_firmado'];
    $finalComprobante = $comprobantePath ?: $proceso['comprobante_pago'];

    // Determine if we should finalize (inject data into main tables)
    // Client can explicitly send 'finalizar' = true
    $finalizar = isset($_POST['finalizar']) && $_POST['finalizar'] === 'true';
    $datosProceso = json_decode($proceso['datos_json'], true);

    if ($finalizar && (($datosProceso['tipo_proceso'] ?? '') === 'renovacion_contrato')) {
        finalizar_renovacion($user, $id_proceso, $proceso, $datosProceso, $finalDocFirmado, $finalComprobante);
        return;
    }

    if ($finalizar) {
        try {
            $pdo = db()->getConnection();
            $pdo->beginTransaction();

            $datos = json_decode($proceso['datos_json'], true);

            // 1. Cliente
            $id_cliente = null;
            if (!empty($datos['cliente']['id_cliente'])) {
                $id_cliente = $datos['cliente']['id_cliente'];
            } else {
                $pdo->prepare("INSERT INTO Cliente (nombre, tipo_documento, dni) VALUES (?, ?, ?)")
                    ->execute([
                        $datos['cliente']['nombre'] ?? 'Cliente Alta',
                        $datos['cliente']['tipo_documento'] ?? 'DNI',
                        $datos['cliente']['dni'] ?? null
                    ]);
                $id_cliente = $pdo->lastInsertId();
            }

            // 2. Empresa
            $id_empresa = null;
            if (!empty($datos['empresa']['id_empresa'])) {
                $id_empresa = $datos['empresa']['id_empresa'];
            } else {
                $pdo->prepare("INSERT INTO Empresa (id_cliente, razon_social, rubro, ruc, direccion_fiscal, distrito, provincia, departamento) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")
                    ->execute([
                        $id_cliente,
                        $datos['empresa']['razon_social'],
                        $datos['empresa']['rubro'] ?? null,
                        $datos['empresa']['ruc'],
                        $datos['empresa']['direccion_fiscal'] ?? null,
                        $datos['empresa']['distrito'] ?? null,
                        $datos['empresa']['provincia'] ?? null,
                        $datos['empresa']['departamento'] ?? null
                    ]);
                $id_empresa = $pdo->lastInsertId();
            }

            // 3. Sede
            $datos['sede'] = geo_enrich_sede_payload($datos['sede'] ?? []);
            unset($datos['sede']['_geo_meta']);
            $pdo->prepare("INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, region, referencia, coordenadas_gps, contacto_nombre, contacto_telefono, contacto_telefono_2, contacto_email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                ->execute([
                    $id_empresa,
                    $datos['sede']['nombre_comercial'],
                    $datos['sede']['direccion'],
                    $datos['sede']['distrito'] ?? null,
                    $datos['sede']['provincia'] ?? null,
                    $datos['sede']['departamento'] ?? null,
                    $datos['sede']['region'] ?? null,
                    $datos['sede']['referencia'] ?? null,
                    $datos['sede']['coordenadas_gps'] ?? null,
                    $datos['sede']['contacto_nombre'] ?? null,
                    $datos['sede']['contacto_telefono'] ?? null,
                    $datos['sede']['contacto_telefono_2'] ?? null,
                    $datos['sede']['contacto_email'] ?? null
                ]);
            $id_sede = $pdo->lastInsertId();

            // 4. ContratoServicio
            // Note: comprobante_pago is stored in ProcesoAlta, not ContratoServicio
            $pdo->prepare("INSERT INTO ContratoServicio (id_sede, fecha_inicio, fecha_fin, frecuencia, peso_limite_kg, tarifa, tipo_tarifa, tarifa_adicional_kg, doc_escaneado, activo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 1)")
                ->execute([
                    $id_sede,
                    $datos['contrato']['fecha_inicio'],
                    $datos['contrato']['fecha_fin'] ?? null,
                    geo_contract_frequency_value($datos['contrato']['frecuencia'] ?? null),
                    $datos['contrato']['peso_limite_kg'] ?? null,
                    $datos['contrato']['tarifa'],
                    $datos['contrato']['tipo_tarifa'] ?? 'por_servicio',
                    $datos['contrato']['tarifa_adicional_kg'] ?? null,
                    $finalDocFirmado // Signed contract document
                ]);
            $id_contrato = $pdo->lastInsertId();

            // Update process to Completed (stage 4)
            $pdo->prepare("UPDATE ProcesoAlta SET doc_firmado = ?, comprobante_pago = ?, etapa_actual = 4, id_usuario_modificador = ? WHERE id_proceso = ?")
                ->execute([$finalDocFirmado, $finalComprobante, $user['id'], $id_proceso]);

            $pdo->commit();

            // AuditLog (outside transaction, non-critical)
            try {
                db()->insert(
                    "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ProcesoAlta', ?, 'UPDATE', ?)",
                    [$user['id'], $id_proceso, json_encode(['etapa' => 4, 'accion' => 'finalizar_proceso', 'id_sede' => $id_sede, 'id_contrato' => $id_contrato])]
                );
            } catch (Exception $e) { /* non-critical */ }

            echo json_encode([
                'success' => true,
                'message' => 'Proceso completado e inyectado en vista general con éxito.',
                'id_sede' => $id_sede
            ]);

        } catch (Exception $e) {
            $pdo->rollBack();
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => 'Error al finalizar el proceso: ' . $e->getMessage()]);
        }
    } else {
        // Just upload files without finalizing
        db()->execute(
            "UPDATE ProcesoAlta SET doc_firmado = ?, comprobante_pago = ?, etapa_actual = GREATEST(etapa_actual, 3), id_usuario_modificador = ? WHERE id_proceso = ?",
            [$finalDocFirmado, $finalComprobante, $user['id'], $id_proceso]
        );

        // AuditLog
        try {
            db()->insert(
                "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ProcesoAlta', ?, 'UPDATE', ?)",
                [$user['id'], $id_proceso, json_encode(['etapa' => 3, 'accion' => 'subir_documentos'])]
            );
        } catch (Exception $e) { /* non-critical */ }

        echo json_encode([
            'success' => true,
            'message' => 'Documentos subidos exitosamente',
            'doc_firmado' => $finalDocFirmado,
            'comprobante_pago' => $finalComprobante
        ]);
    }
}

function finalizar_renovacion($user, $id_proceso, $proceso, $datos, $finalDocFirmado, $finalComprobante) {
    if ((int)($proceso['etapa_actual'] ?? 0) >= 4) {
        echo json_encode([
            'success' => true,
            'message' => 'La renovacion ya fue completada',
            'id_sede' => $datos['sede']['id_sede'] ?? null
        ]);
        return;
    }

    if (!$finalDocFirmado) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Debe contar con el contrato firmado antes de finalizar la renovacion']);
        return;
    }

    $id_cliente = $datos['cliente']['id_cliente'] ?? null;
    $id_empresa = $datos['empresa']['id_empresa'] ?? null;
    $id_sede = $datos['sede']['id_sede'] ?? null;
    $id_contrato_anterior = $datos['renovacion']['id_contrato_anterior'] ?? null;

    if (!$id_cliente || !$id_empresa || !$id_sede || !$id_contrato_anterior) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'La renovacion no tiene los IDs originales completos']);
        return;
    }

    try {
        $pdo = db()->getConnection();
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("SELECT id_contrato, activo, fecha_fin FROM ContratoServicio WHERE id_contrato = ? FOR UPDATE");
        $stmt->execute([$id_contrato_anterior]);
        $contrato_anterior = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$contrato_anterior) {
            throw new Exception('Contrato anterior no encontrado');
        }

        $today = date('Y-m-d');
        if ((int)$contrato_anterior['activo'] !== 1 || empty($contrato_anterior['fecha_fin']) || $contrato_anterior['fecha_fin'] >= $today) {
            throw new Exception('El contrato anterior ya no esta activo vencido');
        }

        $dni = $datos['cliente']['dni'] ?? null;
        if ($dni) {
            $stmt = $pdo->prepare("SELECT id_cliente FROM Cliente WHERE dni = ? AND id_cliente <> ? LIMIT 1");
            $stmt->execute([$dni, $id_cliente]);
            if ($stmt->fetch()) {
                throw new Exception('Ya existe otro cliente con ese documento');
            }
        }

        $ruc = $datos['empresa']['ruc'] ?? null;
        if ($ruc) {
            $stmt = $pdo->prepare("SELECT id_empresa FROM Empresa WHERE ruc = ? AND id_empresa <> ? LIMIT 1");
            $stmt->execute([$ruc, $id_empresa]);
            if ($stmt->fetch()) {
                throw new Exception('Ya existe otra empresa con ese RUC');
            }
        }

        $pdo->prepare(
            "UPDATE Cliente SET
                nombre = ?,
                tipo_documento = ?,
                dni = ?,
                activo = 1,
                fecha_modificacion = NOW()
             WHERE id_cliente = ?"
        )->execute([
            $datos['cliente']['nombre'] ?? 'Cliente Renovacion',
            $datos['cliente']['tipo_documento'] ?? 'DNI',
            $dni,
            $id_cliente
        ]);

        $pdo->prepare(
            "UPDATE Empresa SET
                id_cliente = ?,
                razon_social = ?,
                rubro = ?,
                ruc = ?,
                direccion_fiscal = ?,
                distrito = ?,
                provincia = ?,
                departamento = ?,
                activo = 1,
                fecha_modificacion = NOW()
             WHERE id_empresa = ?"
        )->execute([
            $id_cliente,
            $datos['empresa']['razon_social'] ?? 'Empresa Renovacion',
            $datos['empresa']['rubro'] ?? null,
            $ruc,
            $datos['empresa']['direccion_fiscal'] ?? null,
            $datos['empresa']['distrito'] ?? null,
            $datos['empresa']['provincia'] ?? null,
            $datos['empresa']['departamento'] ?? null,
            $id_empresa
        ]);

        $datos['sede'] = geo_enrich_sede_payload($datos['sede'] ?? []);
        unset($datos['sede']['_geo_meta']);

        $pdo->prepare(
            "UPDATE Sede SET
                id_empresa = ?,
                nombre_comercial = ?,
                direccion = ?,
                distrito = ?,
                provincia = ?,
                departamento = ?,
                region = ?,
                referencia = ?,
                coordenadas_gps = ?,
                contacto_nombre = ?,
                contacto_telefono = ?,
                contacto_telefono_2 = ?,
                contacto_email = ?,
                activo = 1,
                fecha_modificacion = NOW()
             WHERE id_sede = ?"
        )->execute([
            $id_empresa,
            $datos['sede']['nombre_comercial'] ?? 'Sede Renovacion',
            $datos['sede']['direccion'] ?? '',
            $datos['sede']['distrito'] ?? null,
            $datos['sede']['provincia'] ?? null,
            $datos['sede']['departamento'] ?? null,
            $datos['sede']['region'] ?? null,
            $datos['sede']['referencia'] ?? null,
            $datos['sede']['coordenadas_gps'] ?? null,
            $datos['sede']['contacto_nombre'] ?? null,
            $datos['sede']['contacto_telefono'] ?? null,
            $datos['sede']['contacto_telefono_2'] ?? null,
            $datos['sede']['contacto_email'] ?? null,
            $id_sede
        ]);

        $pdo->prepare("UPDATE ContratoServicio SET activo = 0, fecha_modificacion = NOW() WHERE id_contrato = ?")
            ->execute([$id_contrato_anterior]);

        $pdo->prepare(
            "INSERT INTO ContratoServicio
                (id_sede, fecha_inicio, fecha_fin, frecuencia, peso_limite_kg, tarifa, tipo_tarifa, tarifa_adicional_kg, doc_escaneado, comprobante_pago, observaciones, activo)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)"
        )->execute([
            $id_sede,
            $datos['contrato']['fecha_inicio'],
            $datos['contrato']['fecha_fin'] ?? null,
            geo_contract_frequency_value($datos['contrato']['frecuencia'] ?? null),
            $datos['contrato']['peso_limite_kg'] ?? null,
            $datos['contrato']['tarifa'],
            $datos['contrato']['tipo_tarifa'] ?? 'por_servicio',
            $datos['contrato']['tarifa_adicional_kg'] ?? null,
            $finalDocFirmado,
            $finalComprobante,
            $datos['contrato']['observaciones'] ?? null
        ]);
        $id_contrato_nuevo = $pdo->lastInsertId();

        $pdo->prepare("UPDATE ProcesoAlta SET doc_firmado = ?, comprobante_pago = ?, etapa_actual = 4, id_usuario_modificador = ? WHERE id_proceso = ?")
            ->execute([$finalDocFirmado, $finalComprobante, $user['id'], $id_proceso]);

        $pdo->commit();

        try {
            db()->insert(
                "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'ContratoServicio', ?, 'UPDATE', ?, ?)",
                [
                    $user['id'],
                    $id_contrato_anterior,
                    json_encode(['activo' => 1]),
                    json_encode(['activo' => 0, 'renovado_por' => $id_contrato_nuevo])
                ]
            );
            db()->insert(
                "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ProcesoAlta', ?, 'UPDATE', ?)",
                [
                    $user['id'],
                    $id_proceso,
                    json_encode([
                        'etapa' => 4,
                        'accion' => 'finalizar_renovacion',
                        'id_sede' => $id_sede,
                        'id_contrato_anterior' => $id_contrato_anterior,
                        'id_contrato_nuevo' => $id_contrato_nuevo
                    ])
                ]
            );
        } catch (Exception $e) { /* non-critical */ }

        echo json_encode([
            'success' => true,
            'message' => 'Renovacion completada exitosamente',
            'id_sede' => $id_sede,
            'id_contrato' => $id_contrato_nuevo,
            'id_contrato_anterior' => $id_contrato_anterior
        ]);
    } catch (Exception $e) {
        if (isset($pdo) && $pdo->inTransaction()) {
            $pdo->rollBack();
        }
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error al finalizar la renovacion: ' . $e->getMessage()]);
    }
}
