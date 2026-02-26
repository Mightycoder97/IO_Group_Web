<?php
/**
 * IO Group - Altas API
 * Endpoints to handle the 3-stage New Branch Onboarding Flow
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

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
        } elseif ($action === 'generar_contrato') {
            generar_contrato();
        } elseif ($action === 'subir_documentos') {
            subir_documentos();
        } else {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Acción no válida']);
        }
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

function listar() {
    canView();
    
    // Check if table exists, if not return empty to prevent errors before migration
    try {
        $sql = "SELECT id_proceso, etapa_actual, doc_generado, doc_firmado, comprobante_pago, fecha_creacion, fecha_modificacion, datos_json FROM ProcesoAlta ORDER BY fecha_creacion DESC";
        $data = db()->query($sql);
        
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
    
    $proceso = db()->queryOne("SELECT * FROM ProcesoAlta WHERE id_proceso = ?", [$id]);
    
    if (!$proceso) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Proceso no encontrado']);
        return;
    }
    
    $proceso['datos_parsed'] = json_decode($proceso['datos_json'], true);
    
    echo json_encode([
        'success' => true,
        'data' => $proceso
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
    
    $id = db()->insert(
        "INSERT INTO ProcesoAlta (datos_json, etapa_actual) VALUES (?, 1)",
        [$json]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Datos guardados. Avanzando a Etapa 2.',
        'id_proceso' => $id
    ]);
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
    
    $template_path = realpath(__DIR__ . '/../modelo_contrato.docx');
    if (!$template_path) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Plantilla de contrato no encontrada.']);
        return;
    }
    
    $output_filename = 'Contrato_' . $id_proceso . '_' . time() . '.docx';
    $output_dir = realpath(__DIR__ . '/../uploads/altas') . '/';
    $output_path = $output_dir . $output_filename;
    
    // Call Python script
    $python_script = realpath(__DIR__ . '/../scripts/generar_contrato_alta.py');
    
    // Safe escaping
    $json_arg = escapeshellarg($proceso['datos_json']);
    $cmd = "python3 " . escapeshellarg($python_script) . " " . escapeshellarg($template_path) . " " . escapeshellarg($output_path) . " " . $json_arg;
    
    $output = shell_exec($cmd . " 2>&1");
    
    if (!$output || strpos($output, '"success": false') !== false || !file_exists($output_path)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error al generar contrato.', 'log' => $output]);
        return;
    }
    
    // Update DB
    $doc_url = 'uploads/altas/' . $output_filename;
    
    db()->execute(
        "UPDATE ProcesoAlta SET doc_generado = ?, etapa_actual = GREATEST(etapa_actual, 2) WHERE id_proceso = ?",
        [$doc_url, $id_proceso]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Contrato generado exitosamente',
        'file_url' => $doc_url
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
            $pdo->prepare("INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, referencia, coordenadas_gps, contacto_nombre, contacto_telefono, contacto_telefono_2, contacto_email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                ->execute([
                    $id_empresa,
                    $datos['sede']['nombre_comercial'],
                    $datos['sede']['direccion'],
                    $datos['sede']['distrito'] ?? null,
                    $datos['sede']['provincia'] ?? null,
                    $datos['sede']['departamento'] ?? null,
                    $datos['sede']['referencia'] ?? null,
                    $datos['sede']['coordenadas_gps'] ?? null,
                    $datos['sede']['contacto_nombre'] ?? null,
                    $datos['sede']['contacto_telefono'] ?? null,
                    $datos['sede']['contacto_telefono_2'] ?? null,
                    $datos['sede']['contacto_email'] ?? null
                ]);
            $id_sede = $pdo->lastInsertId();
            
            // 4. ContratoServicio
            $pdo->prepare("INSERT INTO ContratoServicio (id_sede, fecha_inicio, fecha_fin, frecuencia, peso_limite_kg, tarifa, tipo_tarifa, tarifa_adicional_kg, doc_escaneado, activo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 1)")
                ->execute([
                    $id_sede,
                    $datos['contrato']['fecha_inicio'],
                    $datos['contrato']['fecha_fin'] ?? null,
                    $datos['contrato']['frecuencia'],
                    $datos['contrato']['peso_limite_kg'] ?? null,
                    $datos['contrato']['tarifa'],
                    $datos['contrato']['tipo_tarifa'] ?? 'por_servicio',
                    $datos['contrato']['tarifa_adicional_kg'] ?? null,
                    $finalDocFirmado // Associate signed document with contract
                ]);
            $id_contrato = $pdo->lastInsertId();
            
            // Update process to Completed (stage 4)
            $pdo->prepare("UPDATE ProcesoAlta SET doc_firmado = ?, comprobante_pago = ?, etapa_actual = 4 WHERE id_proceso = ?")
                ->execute([$finalDocFirmado, $finalComprobante, $id_proceso]);
                
            $pdo->commit();
            
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
            "UPDATE ProcesoAlta SET doc_firmado = ?, comprobante_pago = ?, etapa_actual = GREATEST(etapa_actual, 3) WHERE id_proceso = ?",
            [$finalDocFirmado, $finalComprobante, $id_proceso]
        );
        
        echo json_encode([
            'success' => true,
            'message' => 'Documentos subidos exitosamente',
            'doc_firmado' => $finalDocFirmado,
            'comprobante_pago' => $finalComprobante
        ]);
    }
}
