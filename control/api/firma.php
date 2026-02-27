<?php
/**
 * IO Group - Firma Digital API (PUBLIC - No JWT)
 * Handles digital signature flow via unique token
 * 
 * GET  ?token=xxx           → Returns contract HTML for signing
 * POST                      → Receives signature and saves it
 */

require_once __DIR__ . '/config/database.php';

// Allow CORS for public access
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        obtener_contrato();
        break;
    case 'POST':
        guardar_firma();
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

/**
 * GET: Retrieve contract data for a given token
 */
function obtener_contrato() {
    $token = $_GET['token'] ?? null;
    
    if (!$token || strlen($token) < 32) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Token inválido']);
        return;
    }
    
    $firma = db()->queryOne(
        "SELECT f.*, p.datos_json, p.doc_generado, p.etapa_actual 
         FROM FirmaDigital f 
         INNER JOIN ProcesoAlta p ON f.id_proceso = p.id_proceso 
         WHERE f.token = ?",
        [$token]
    );
    
    if (!$firma) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Enlace no válido o expirado']);
        return;
    }
    
    if ($firma['firmado']) {
        echo json_encode([
            'success' => true,
            'already_signed' => true,
            'fecha_firma' => $firma['fecha_firma'],
            'message' => 'Este contrato ya fue firmado'
        ]);
        return;
    }
    
    // Generate the contract number
    $year = date('Y');
    $numero_contrato = "N°{$year}-" . str_pad($firma['id_proceso'], 6, '0', STR_PAD_LEFT);
    
    // Parse datos_json
    $datos = json_decode($firma['datos_json'], true);
    
    // Generate the HTML contract using the template
    $template_file = __DIR__ . '/templates/contrato_template.php';
    if (file_exists($template_file)) {
        $html = include $template_file;
    } else {
        $html = null;
    }
    
    echo json_encode([
        'success' => true,
        'already_signed' => false,
        'contract_html' => $html,
        'numero_contrato' => $numero_contrato,
        'cliente_nombre' => $datos['cliente']['nombre'] ?? '',
        'empresa_nombre' => $datos['empresa']['razon_social'] ?? ''
    ]);
}

/**
 * POST: Save the digital signature
 */
function guardar_firma() {
    $data = json_decode(file_get_contents('php://input'), true);
    $token = $data['token'] ?? null;
    $firma_base64 = $data['firma'] ?? null;
    
    if (!$token || !$firma_base64) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Token y firma son requeridos']);
        return;
    }
    
    $firma = db()->queryOne(
        "SELECT * FROM FirmaDigital WHERE token = ?",
        [$token]
    );
    
    if (!$firma) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Token no válido']);
        return;
    }
    
    if ($firma['firmado']) {
        http_response_code(409);
        echo json_encode(['success' => false, 'message' => 'Este contrato ya fue firmado']);
        return;
    }
    
    // Decode base64 image and save
    $firmasDir = realpath(__DIR__ . '/../uploads/firmas');
    if (!$firmasDir) {
        $firmasDir = __DIR__ . '/../uploads/firmas';
        mkdir($firmasDir, 0755, true);
    }
    
    // Remove data:image/png;base64, prefix
    $image_data = preg_replace('/^data:image\/\w+;base64,/', '', $firma_base64);
    $image_data = base64_decode($image_data);
    
    if (!$image_data) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Imagen de firma inválida']);
        return;
    }
    
    $filename = 'firma_' . $firma['id_proceso'] . '_' . time() . '.png';
    $filepath = $firmasDir . '/' . $filename;
    file_put_contents($filepath, $image_data);
    
    $firma_url = 'uploads/firmas/' . $filename;
    
    // Get client info
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'] ?? $_SERVER['REMOTE_ADDR'] ?? 'unknown';
    $user_agent = $_SERVER['HTTP_USER_AGENT'] ?? 'unknown';
    
    // Update FirmaDigital record
    db()->execute(
        "UPDATE FirmaDigital SET firmado = 1, firma_imagen = ?, ip_firmante = ?, user_agent = ?, fecha_firma = NOW() WHERE token = ?",
        [$firma_url, $ip, $user_agent, $token]
    );
    
    // Generate signed contract HTML with the signature image stamped in
    $proceso = db()->queryOne("SELECT datos_json FROM ProcesoAlta WHERE id_proceso = ?", [$firma['id_proceso']]);
    $datos = json_decode($proceso['datos_json'], true);
    $year = date('Y');
    $numero_contrato = "N°{$year}-" . str_pad($firma['id_proceso'], 6, '0', STR_PAD_LEFT);
    
    $template_file = __DIR__ . '/templates/contrato_template.php';
    $contract_html = '';
    if (file_exists($template_file)) {
        $contract_html = include $template_file;
    }
    
    if ($contract_html) {
        // Convert signature PNG to base64 for embedding
        $firma_base64_img = 'data:image/png;base64,' . base64_encode($image_data);
        
        // Create the signature image HTML to inject
        $firma_img_html = '<img src="' . $firma_base64_img . '" style="width: 150px; height: auto; display: block; margin: 0 auto 5px auto;" alt="Firma Digital">';
        
        // Add a digital signature badge
        $firma_badge = '<div style="text-align:center; font-size:6pt; color:#388e3c; margin-bottom:2px;"><i>Firmado digitalmente - ' . date('d/m/Y H:i') . '</i></div>';
        
        // Replace all "EL CLIENTE" signature lines with the signature image above them
        $contract_html = str_replace(
            '<div class="signature-line">EL CLIENTE</div>',
            $firma_img_html . $firma_badge . '<div class="signature-line">EL CLIENTE</div>',
            $contract_html
        );
        
        // Save the signed contract HTML
        $signed_dir = realpath(__DIR__ . '/../uploads/altas');
        if (!$signed_dir) {
            $signed_dir = __DIR__ . '/../uploads/altas';
            mkdir($signed_dir, 0755, true);
        }
        $signed_filename = 'ContratoFirmado_' . $firma['id_proceso'] . '_' . time() . '.html';
        file_put_contents($signed_dir . '/' . $signed_filename, $contract_html);
        
        $doc_firmado_url = 'uploads/altas/' . $signed_filename;
    } else {
        $doc_firmado_url = $firma_url; // Fallback to just the signature image
    }
    
    // Update ProcesoAlta with the signed contract and advance to stage 3
    db()->execute(
        "UPDATE ProcesoAlta SET doc_firmado = ?, etapa_actual = GREATEST(etapa_actual, 3) WHERE id_proceso = ?",
        [$doc_firmado_url, $firma['id_proceso']]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Contrato firmado exitosamente',
        'fecha_firma' => date('Y-m-d H:i:s')
    ]);
}
