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
    if (!$template_path || !file_exists($template_path)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Plantilla de contrato no encontrada en el servidor.']);
        return;
    }
    
    // Ensure uploads directory exists
    $output_dir = __DIR__ . '/../uploads/altas';
    if (!is_dir($output_dir)) {
        mkdir($output_dir, 0755, true);
    }
    $output_dir = realpath($output_dir);
    if (!$output_dir) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'No se pudo crear el directorio de salida.']);
        return;
    }
    
    $output_filename = 'Contrato_' . $id_proceso . '_' . time() . '.docx';
    $output_path = $output_dir . '/' . $output_filename;
    
    // Parse the stored JSON data
    $datos = json_decode($proceso['datos_json'], true);
    if (!$datos) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Datos JSON del proceso son inválidos.']);
        return;
    }
    
    // Build replacement map
    $replacements = [];
    
    // Generic placeholders: [section_key]
    foreach ($datos as $section => $values) {
        if (is_array($values)) {
            foreach ($values as $k => $v) {
                $replacements["[{$section}_{$k}]"] = strval($v ?? '');
            }
        } else {
            $replacements["[{$section}]"] = strval($values ?? '');
        }
    }
    
    // Common template tags
    if (isset($datos['empresa'])) {
        $replacements['<<RAZON_SOCIAL>>'] = strval($datos['empresa']['razon_social'] ?? '');
        $replacements['<<RUC>>'] = strval($datos['empresa']['ruc'] ?? '');
        $replacements['<<DIRECCION>>'] = strval($datos['empresa']['direccion_fiscal'] ?? '');
    }
    
    if (isset($datos['cliente'])) {
        $replacements['<<REPRESENTANTE>>'] = strval($datos['cliente']['nombre'] ?? '');
        $replacements['<<DNI>>'] = strval($datos['cliente']['dni'] ?? '');
    }
    
    if (isset($datos['sede'])) {
        $replacements['<<SEDE_DIRECCION>>'] = strval($datos['sede']['direccion'] ?? '');
        $replacements['<<SEDE_DISTRITO>>'] = strval($datos['sede']['distrito'] ?? '');
    }
    
    // Pricing clause
    if (isset($datos['contrato'])) {
        $tipo_tarifa = $datos['contrato']['tipo_tarifa'] ?? 'por_servicio';
        $tarifa = $datos['contrato']['tarifa'] ?? '0';
        $peso_limite = $datos['contrato']['peso_limite_kg'] ?? '';
        $tarifa_adicional = $datos['contrato']['tarifa_adicional_kg'] ?? '';
        
        $replacements['<<TARIFA>>'] = strval($tarifa);
        $replacements['[contrato_tarifa]'] = strval($tarifa);
        
        if ($tipo_tarifa === 'por_kg') {
            $clausula = "El servicio se establece bajo la modalidad 'Por Kilo Recogido'. El costo base establecido cubrirá un límite de {$peso_limite} Kg. Por cada kilo excedente, se facturará un adicional de S/. {$tarifa_adicional}.";
        } else {
            $clausula = "El servicio se establece bajo la modalidad 'Por Recojo' con una tarifa plana por atención.";
        }
        $replacements['[clausula_exceso_peso]'] = $clausula;
        $replacements['<<CLAUSULA_EXCESO>>'] = $clausula;
    }
    
    // Generate the contract using pure PHP (ZipArchive to manipulate DOCX XML)
    try {
        $result = generar_docx_php($template_path, $output_path, $replacements);
        if (!$result) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => 'Error al generar el documento DOCX.']);
            return;
        }
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error al generar contrato: ' . $e->getMessage()]);
        return;
    }
    
    if (!file_exists($output_path)) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'El archivo de contrato no fue creado.']);
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

/**
 * Generate a DOCX file by replacing placeholders in the template using pure PHP.
 * DOCX files are ZIP archives containing XML. We manipulate the XML directly.
 */
function generar_docx_php($template_path, $output_path, $replacements) {
    // Copy template to output path first
    if (!copy($template_path, $output_path)) {
        throw new Exception('No se pudo copiar la plantilla.');
    }
    
    $zip = new ZipArchive();
    if ($zip->open($output_path) !== true) {
        throw new Exception('No se pudo abrir el archivo DOCX.');
    }
    
    // The main document content is in word/document.xml
    // Headers and footers can also contain placeholders
    $xml_files = ['word/document.xml'];
    
    // Also check for headers and footers
    for ($i = 0; $i < $zip->numFiles; $i++) {
        $name = $zip->getNameIndex($i);
        if (preg_match('/^word\/(header|footer)\d*\.xml$/', $name)) {
            $xml_files[] = $name;
        }
    }
    
    foreach ($xml_files as $xml_file) {
        $xml_content = $zip->getFromName($xml_file);
        if ($xml_content === false) continue;
        
        // DOCX XML splits text into <w:r> runs, which can break placeholders
        // Strategy: work on the raw XML but handle split runs
        
        // First, try direct replacement on the XML (works when placeholder is in a single run)
        foreach ($replacements as $placeholder => $value) {
            // Escape the value for XML
            $xml_value = htmlspecialchars($value, ENT_XML1 | ENT_QUOTES, 'UTF-8');
            // Escape the placeholder for use in the XML
            $xml_placeholder = htmlspecialchars($placeholder, ENT_XML1 | ENT_QUOTES, 'UTF-8');
            
            $xml_content = str_replace($xml_placeholder, $xml_value, $xml_content);
        }
        
        // Handle split runs: reconstruct text from <w:t> tags within <w:p> paragraphs
        // and replace placeholders that may span multiple runs
        $xml_content = fix_split_placeholders($xml_content, $replacements);
        
        $zip->deleteName($xml_file);
        $zip->addFromString($xml_file, $xml_content);
    }
    
    $zip->close();
    return true;
}

/**
 * Fix placeholders that are split across multiple XML runs within a paragraph.
 * This happens when Word splits text formatting mid-placeholder.
 */
function fix_split_placeholders($xml_content, $replacements) {
    // Extract all paragraph blocks
    $pattern = '/(<w:p\b[^>]*>)(.*?)(<\/w:p>)/s';
    
    $xml_content = preg_replace_callback($pattern, function($matches) use ($replacements) {
        $para_start = $matches[1];
        $para_content = $matches[2];
        $para_end = $matches[3];
        
        // Extract all text from <w:t> tags in this paragraph
        $full_text = '';
        preg_match_all('/<w:t[^>]*>([^<]*)<\/w:t>/s', $para_content, $text_matches);
        if (!empty($text_matches[1])) {
            $full_text = implode('', $text_matches[1]);
        }
        
        // Check if any placeholder exists in the combined text
        $needs_fix = false;
        foreach ($replacements as $placeholder => $value) {
            $decoded_placeholder = html_entity_decode($placeholder, ENT_XML1 | ENT_QUOTES, 'UTF-8');
            if (strpos($full_text, $placeholder) !== false || strpos($full_text, $decoded_placeholder) !== false) {
                $needs_fix = true;
                break;
            }
        }
        
        if (!$needs_fix) {
            return $matches[0]; // Return unchanged
        }
        
        // Apply replacements to the combined text
        $new_text = $full_text;
        foreach ($replacements as $placeholder => $value) {
            $decoded_placeholder = html_entity_decode($placeholder, ENT_XML1 | ENT_QUOTES, 'UTF-8');
            $new_text = str_replace($placeholder, $value, $new_text);
            $new_text = str_replace($decoded_placeholder, $value, $new_text);
        }
        
        // Escape the new text for XML
        $xml_new_text = htmlspecialchars($new_text, ENT_XML1 | ENT_QUOTES, 'UTF-8');
        
        // Replace the content: put all text into the first run's <w:t> and clear the rest
        $first_run_done = false;
        $para_content = preg_replace_callback('/<w:t([^>]*)>[^<]*<\/w:t>/s', function($tm) use (&$first_run_done, $xml_new_text) {
            if (!$first_run_done) {
                $first_run_done = true;
                return '<w:t xml:space="preserve">' . $xml_new_text . '</w:t>';
            }
            return '<w:t' . $tm[1] . '></w:t>';
        }, $para_content);
        
        return $para_start . $para_content . $para_end;
    }, $xml_content);
    
    return $xml_content;
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
