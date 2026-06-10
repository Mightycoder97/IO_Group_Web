<?php
/**
 * IO Group - Virtual Complaints Book Handler (Libro de Reclamaciones)
 * 
 * POST /api/send-reclamacion.php
 * Content-Type: application/x-www-form-urlencoded or multipart/form-data
 */

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight CORS requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit();
}

// Database configuration & singleton loading
$db_config_file = __DIR__ . '/../control/api/config/database.php';
if (!file_exists($db_config_file)) {
    error_log("Reclamaciones: Database config file not found at: " . $db_config_file);
    echo json_encode(['success' => false, 'message' => 'Error interno de configuración en el servidor']);
    exit();
}
require_once $db_config_file;

// Load SMTP Mailer Helper
$mailer_helper_file = __DIR__ . '/helpers/SmtpMailer.php';
if (!file_exists($mailer_helper_file)) {
    error_log("Reclamaciones: SMTP mailer helper not found at: " . $mailer_helper_file);
    echo json_encode(['success' => false, 'message' => 'Error interno de correo en el servidor']);
    exit();
}
require_once $mailer_helper_file;

// Set default timezone (just in case, though database.php does it)
date_default_timezone_set('America/Lima');

// Gather and sanitize input fields (prevent XSS in DB and Emails)
$tipo_documento = htmlspecialchars(trim($_POST['tipo_documento'] ?? ''), ENT_QUOTES, 'UTF-8');
$numero_documento = htmlspecialchars(trim($_POST['numero_documento'] ?? ''), ENT_QUOTES, 'UTF-8');
$nombres = htmlspecialchars(trim($_POST['nombres'] ?? ''), ENT_QUOTES, 'UTF-8');
$apellidos = htmlspecialchars(trim($_POST['apellidos'] ?? ''), ENT_QUOTES, 'UTF-8');
$direccion = htmlspecialchars(trim($_POST['direccion'] ?? ''), ENT_QUOTES, 'UTF-8');
$telefono = htmlspecialchars(trim($_POST['telefono'] ?? ''), ENT_QUOTES, 'UTF-8');
$email = filter_var(trim($_POST['email'] ?? ''), FILTER_VALIDATE_EMAIL);

// Minor Representative fields
$es_menor = isset($_POST['es_menor']) && ($_POST['es_menor'] == '1' || $_POST['es_menor'] == 'on') ? 1 : 0;
$nombre_representante = htmlspecialchars(trim($_POST['nombre_representante'] ?? ''), ENT_QUOTES, 'UTF-8');
$doc_representante = htmlspecialchars(trim($_POST['doc_representante'] ?? ''), ENT_QUOTES, 'UTF-8');

// Good / Service fields
$tipo_bien = htmlspecialchars(trim($_POST['tipo_bien'] ?? ''), ENT_QUOTES, 'UTF-8'); // 'Producto' o 'Servicio'
$monto_reclamado_raw = trim($_POST['monto_reclamado'] ?? '');
$monto_reclamado = $monto_reclamado_raw !== '' ? floatval($monto_reclamado_raw) : null;
$descripcion_bien = htmlspecialchars(trim($_POST['descripcion_bien'] ?? ''), ENT_QUOTES, 'UTF-8');

// Claim detail fields
$tipo_reclamacion = htmlspecialchars(trim($_POST['tipo_reclamacion'] ?? ''), ENT_QUOTES, 'UTF-8'); // 'Reclamo' o 'Queja'
$detalle_reclamacion = htmlspecialchars(trim($_POST['detalle_reclamacion'] ?? ''), ENT_QUOTES, 'UTF-8');
$pedido_consumidor = htmlspecialchars(trim($_POST['pedido_consumidor'] ?? ''), ENT_QUOTES, 'UTF-8');

$ip_address = $_SERVER['REMOTE_ADDR'] ?? '';
$user_agent = $_SERVER['HTTP_USER_AGENT'] ?? '';

// Basic backend validation
$errors = [];
if (empty($tipo_documento)) $errors[] = "El tipo de documento es requerido.";
if (empty($numero_documento)) $errors[] = "El número de documento es requerido.";
if (empty($nombres)) $errors[] = "El nombre es requerido.";
if (empty($apellidos)) $errors[] = "El apellido es requerido.";
if (empty($direccion)) $errors[] = "La dirección es requerida.";
if (empty($telefono)) $errors[] = "El teléfono es requerido.";
if (!$email) $errors[] = "Un correo electrónico válido es requerido.";
if ($es_menor && (empty($nombre_representante) || empty($doc_representante))) {
    $errors[] = "Los datos del representante legal son requeridos para menores de edad.";
}
if (empty($tipo_bien)) $errors[] = "El tipo de bien es requerido.";
if (empty($descripcion_bien)) $errors[] = "La descripción del bien es requerida.";
if (empty($tipo_reclamacion)) $errors[] = "El tipo de reclamación (Reclamo o Queja) es requerido.";
if (empty($detalle_reclamacion)) $errors[] = "El detalle de la reclamación es requerido.";
if (empty($pedido_consumidor)) $errors[] = "El pedido o solicitud es requerido.";

if (!empty($errors)) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Campos inválidos o incompletos', 'errors' => $errors]);
    exit();
}

try {
    $pdo = db()->getConnection();
    
    // Begin transaction to guarantee sequential non-race correlative generation
    $pdo->beginTransaction();
    
    // Generate Correlativo (R-YYYY-NNNNN)
    $currentYear = date('Y');
    $prefix = "R-{$currentYear}-%";
    
    // Get last correlative for current year
    $stmt = $pdo->prepare("SELECT correlativo FROM Reclamacion WHERE correlativo LIKE :prefix ORDER BY id_reclamacion DESC LIMIT 1");
    $stmt->execute(['prefix' => $prefix]);
    $lastRecord = $stmt->fetch();
    
    $nextNumber = 1;
    if ($lastRecord) {
        $lastCorrelativo = $lastRecord['correlativo'];
        // Extract sequence number from format R-YYYY-NNNNN
        $parts = explode('-', $lastCorrelativo);
        if (count($parts) === 3) {
            $nextNumber = intval($parts[2]) + 1;
        }
    }
    
    $correlativo = "R-{$currentYear}-" . str_pad($nextNumber, 5, '0', STR_PAD_LEFT);
    
    // Insert into database
    $insertSql = "INSERT INTO Reclamacion (
        correlativo, tipo_documento, numero_documento, nombres, apellidos, 
        direccion, telefono, email, es_menor, nombre_representante, doc_representante, 
        tipo_bien, monto_reclamado, descripcion_bien, tipo_reclamacion, 
        detalle_reclamacion, pedido_consumidor, estado, ip_address, user_agent
    ) VALUES (
        :correlativo, :tipo_documento, :numero_documento, :nombres, :apellidos, 
        :direccion, :telefono, :email, :es_menor, :nombre_representante, :doc_representante, 
        :tipo_bien, :monto_reclamado, :descripcion_bien, :tipo_reclamacion, 
        :detalle_reclamacion, :pedido_consumidor, 'Pendiente', :ip_address, :user_agent
    )";
    
    $insertStmt = $pdo->prepare($insertSql);
    $insertStmt->execute([
        'correlativo' => $correlativo,
        'tipo_documento' => $tipo_documento,
        'numero_documento' => $numero_documento,
        'nombres' => $nombres,
        'apellidos' => $apellidos,
        'direccion' => $direccion,
        'telefono' => $telefono,
        'email' => $email,
        'es_menor' => $es_menor,
        'nombre_representante' => $es_menor ? $nombre_representante : null,
        'doc_representante' => $es_menor ? $doc_representante : null,
        'tipo_bien' => $tipo_bien,
        'monto_reclamado' => $monto_reclamado,
        'descripcion_bien' => $descripcion_bien,
        'tipo_reclamacion' => $tipo_reclamacion,
        'detalle_reclamacion' => $detalle_reclamacion,
        'pedido_consumidor' => $pedido_consumidor,
        'ip_address' => $ip_address,
        'user_agent' => $user_agent
    ]);
    
    $pdo->commit();
    
    // Prepare SMTP Mailer
    $mailer = new SmtpMailer();
    
    // Format variables for templates
    $fecha = date('d/m/Y H:i:s');
    $monto_texto = $monto_reclamado !== null ? 'S/. ' . number_format($monto_reclamado, 2) : 'No especificado';
    $representante_html = $es_menor 
        ? "<tr><td style='padding:8px;font-weight:bold;color:#5C6B1E;'>Representante:</td><td style='padding:8px;'>{$nombre_representante} ({$doc_representante})</td></tr>"
        : "";
        
    // --- 1. Notification Email to Administrators ---
    $subjectAdmin = "🔔 Nueva Reclamación Virtual: {$correlativo} - {$tipo_reclamacion}";
    $bodyAdmin = "
    <!DOCTYPE html>
    <html lang='es'>
    <head>
        <meta charset='UTF-8'>
        <style>
            body { font-family: Arial, sans-serif; color: #333; line-height: 1.5; margin: 0; padding: 0; }
            .wrapper { max-width: 650px; margin: 20px auto; border: 1px solid #ddd; border-radius: 8px; overflow: hidden; }
            .header { background: linear-gradient(135deg, #E8471A, #C4390F); color: white; padding: 25px; text-align: center; }
            .header h1 { margin: 0; font-size: 22px; }
            .badge { display: inline-block; padding: 6px 16px; background-color: #5C6B1E; color: white; border-radius: 20px; font-size: 14px; font-weight: bold; margin-top: 10px; }
            .content { padding: 25px; background-color: #fafafa; }
            .table-data { width: 100%; border-collapse: collapse; margin-top: 15px; margin-bottom: 25px; }
            .table-data td { border-bottom: 1px solid #eee; padding: 10px; font-size: 14px; }
            .section-title { font-size: 16px; font-weight: bold; color: #E8471A; border-bottom: 2px solid #E8471A; padding-bottom: 5px; margin-top: 25px; }
            .text-block { background-color: #fff; border-left: 4px solid #5C6B1E; padding: 12px; font-size: 14px; white-space: pre-wrap; margin-top: 10px; border-radius: 0 4px 4px 0; box-shadow: 0 1px 3px rgba(0,0,0,0.05); }
            .footer { background-color: #1a1a1f; color: #aaa; text-align: center; padding: 15px; font-size: 12px; }
        </style>
    </head>
    <body>
        <div class='wrapper'>
            <div class='header'>
                <h1>Libro de Reclamaciones - Alerta de Registro</h1>
                <span class='badge'>Correlativo: {$correlativo}</span>
            </div>
            <div class='content'>
                <p>Se ha registrado una nueva reclamación virtual en el sitio web de la empresa.</p>
                
                <div class='section-title'>1. Información del Consumidor</div>
                <table class='table-data'>
                    <tr><td style='width:35%;font-weight:bold;color:#5C6B1E;'>Nombres y Apellidos:</td><td>{$nombres} {$apellidos}</td></tr>
                    <tr><td style='font-weight:bold;color:#5C6B1E;'>Documento:</td><td>{$tipo_documento} {$numero_documento}</td></tr>
                    <tr><td style='font-weight:bold;color:#5C6B1E;'>Dirección:</td><td>{$direccion}</td></tr>
                    <tr><td style='font-weight:bold;color:#5C6B1E;'>Teléfono:</td><td>{$telefono}</td></tr>
                    <tr><td style='font-weight:bold;color:#5C6B1E;'>Email:</td><td><a href='mailto:{$email}'>{$email}</a></td></tr>
                    {$representante_html}
                </table>

                <div class='section-title'>2. Detalle del Bien Contratado</div>
                <table class='table-data'>
                    <tr><td style='width:35%;font-weight:bold;color:#5C6B1E;'>Tipo de Bien:</td><td>{$tipo_bien}</td></tr>
                    <tr><td style='font-weight:bold;color:#5C6B1E;'>Monto Reclamado:</td><td><strong>{$monto_texto}</strong></td></tr>
                </table>
                <div style='font-weight:bold;color:#5C6B1E;margin-top:10px;font-size:14px;'>Descripción del Bien:</div>
                <div class='text-block'>{$descripcion_bien}</div>

                <div class='section-title'>3. Detalle de la Reclamación ({$tipo_reclamacion})</div>
                <table class='table-data'>
                    <tr><td style='width:35%;font-weight:bold;color:#5C6B1E;'>Fecha y Hora:</td><td>{$fecha}</td></tr>
                    <tr><td style='font-weight:bold;color:#5C6B1E;'>Tipo de Caso:</td><td><strong style='color:#E8471A;'>{$tipo_reclamacion}</strong></td></tr>
                </table>
                
                <div style='font-weight:bold;color:#5C6B1E;margin-top:15px;font-size:14px;'>Detalle de la Queja/Reclamo:</div>
                <div class='text-block'>{$detalle_reclamacion}</div>

                <div style='font-weight:bold;color:#5C6B1E;margin-top:15px;font-size:14px;'>Pedido / Solicitud del Consumidor:</div>
                <div class='text-block'>{$pedido_consumidor}</div>
            </div>
            <div class='footer'>
                <p>Este es un correo del sistema automático de Libro de Reclamaciones de IO Group.</p>
                <p>IP: {$ip_address} | Navegador: {$user_agent}</p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    // --- 2. Cargo / Confirmation Email to the Client ---
    $subjectClient = "Confirmación de Reclamación {$correlativo} - IO Group";
    $bodyClient = "
    <!DOCTYPE html>
    <html lang='es'>
    <head>
        <meta charset='UTF-8'>
        <style>
            body { font-family: Arial, sans-serif; color: #333; line-height: 1.6; margin: 0; padding: 0; }
            .wrapper { max-width: 600px; margin: 20px auto; border: 1px solid #ddd; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
            .header { background: linear-gradient(135deg, #5C6B1E, #4A5618); color: white; padding: 30px; text-align: center; }
            .header h1 { margin: 0; font-size: 24px; }
            .header h2 { margin: 5px 0 0; font-size: 16px; font-weight: normal; opacity: 0.9; }
            .content { padding: 30px; background-color: #ffffff; }
            .ticket-box { background-color: #f7f9f6; border: 2px dashed #5C6B1E; padding: 20px; border-radius: 8px; text-align: center; margin: 20px 0; }
            .ticket-label { font-size: 12px; color: #666; text-transform: uppercase; letter-spacing: 1px; }
            .ticket-num { font-size: 28px; font-weight: bold; color: #5C6B1E; font-family: monospace; margin: 5px 0; }
            .section-title { font-size: 15px; font-weight: bold; color: #5C6B1E; border-bottom: 1px solid #ddd; padding-bottom: 5px; margin-top: 25px; }
            .table-data { width: 100%; border-collapse: collapse; margin-top: 10px; }
            .table-data td { padding: 8px 0; font-size: 13.5px; border-bottom: 1px solid #f2f2f2; }
            .text-block { background-color: #f9f9f9; padding: 12px; font-size: 13.5px; white-space: pre-wrap; margin-top: 8px; border-radius: 4px; border-left: 3px solid #E8471A; }
            .info-notice { background-color: #fff9f6; border: 1px solid #ffe8dd; padding: 15px; border-radius: 6px; font-size: 13px; color: #c4390f; margin: 25px 0 10px; }
            .footer { background-color: #1a1a1f; color: #aaa; text-align: center; padding: 20px; font-size: 11px; }
            .footer a { color: #5C6B1E; text-decoration: none; }
        </style>
    </head>
    <body>
        <div class='wrapper'>
            <div class='header'>
                <h1>Cargo de Recepción</h1>
                <h2>Libro de Reclamaciones Virtual</h2>
            </div>
            <div class='content'>
                <p>Estimado(a) <strong>{$nombres} {$apellidos}</strong>,</p>
                <p>Confirmamos que hemos recibido satisfactoriamente su registro en nuestro Libro de Reclamaciones Virtual. A continuación, le brindamos los detalles de su constancia:</p>
                
                <div class='ticket-box'>
                    <div class='ticket-label'>Número de Registro (Correlativo)</div>
                    <div class='ticket-num'>{$correlativo}</div>
                    <div style='font-size: 13px; color: #555; margin-top: 5px;'>Fecha de Registro: {$fecha}</div>
                </div>

                <div class='info-notice'>
                    <strong>Información Importante (Ley N° 29571 / INDECOPI):</strong><br>
                    De conformidad con el Código de Protección y Defensa del Consumidor, le informamos que daremos respuesta a su {$tipo_reclamacion} en un plazo máximo de **quince (15) días hábiles**, contados a partir del día siguiente de la presente notificación.
                </div>

                <div class='section-title'>Resumen de su Registro</div>
                <table class='table-data'>
                    <tr><td style='width:35%;font-weight:bold;'>Documento de Identidad:</td><td>{$tipo_documento} {$numero_documento}</td></tr>
                    <tr><td style='font-weight:bold;'>Tipo de Bien:</td><td>{$tipo_bien}</td></tr>
                    <tr><td style='font-weight:bold;'>Monto Reclamado:</td><td>{$monto_texto}</td></tr>
                    <tr><td style='font-weight:bold;'>Tipo de Registro:</td><td style='font-weight:bold;color:#E8471A;'>{$tipo_reclamacion}</td></tr>
                </table>

                <div style='font-weight:bold;margin-top:15px;font-size:13.5px;'>Detalle de su Reclamación:</div>
                <div class='text-block'>{$detalle_reclamacion}</div>

                <div style='font-weight:bold;margin-top:15px;font-size:13.5px;'>Su Pedido / Solicitud:</div>
                <div class='text-block'>{$pedido_consumidor}</div>

                <p style='margin-top:25px;'>Agradecemos su comunicación. Trabajamos continuamente para mejorar la calidad de nuestros servicios y la satisfacción de nuestros clientes.</p>
                
                <p>Atentamente,<br><strong>IO Group S.A.C.</strong></p>
            </div>
            <div class='footer'>
                <p><strong>IO Group</strong> | Gestión Integral de Residuos Sólidos</p>
                <p>Calle Los Halcones 260 - 4to piso, Surquillo, Lima</p>
                <p><a href='https://iogroup.pe'>www.iogroup.pe</a></p>
                <p style='color:#666;font-size:10px;margin-top:15px;'>Este correo electrónico fue generado automáticamente. Por favor no responder a esta dirección.</p>
            </div>
        </div>
    </body>
    </html>
    ";

    // Setup headers (specifically CC to admin@iogroup.pe, primary to naenciso@iogroup.pe)
    // Primary recipient for admin alert is naenciso@iogroup.pe
    // CC is admin@iogroup.pe
    $primaryAdminEmail = 'naenciso@iogroup.pe';
    $headersAdmin = [
        'Cc' => 'admin@iogroup.pe',
        'Reply-To' => $email
    ];

    // Send admin notification
    $enviadoAdmin = $mailer->send($primaryAdminEmail, $subjectAdmin, $bodyAdmin, $headersAdmin);
    
    // Send customer receipt
    $enviadoClient = $mailer->send($email, $subjectClient, $bodyClient);

    error_log("Reclamacion {$correlativo}: Email to naenciso/admin: " . ($enviadoAdmin ? "SUCCESS" : "FAILED"));
    error_log("Reclamacion {$correlativo}: Email to customer: " . ($enviadoClient ? "SUCCESS" : "FAILED"));

    echo json_encode([
        'success' => true,
        'message' => '¡Tu reclamación ha sido registrada exitosamente! Se ha enviado un correo electrónico de confirmación con tu número de correlativo.',
        'correlativo' => $correlativo
    ]);

} catch (PDOException $dbEx) {
    error_log("Database error registering complaint: " . $dbEx->getMessage());
    if ($pdo && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Hubo un problema al guardar tu reclamo en la base de datos. Por favor, intenta de nuevo o comunícate con nosotros.'
    ]);
} catch (Exception $ex) {
    error_log("General error registering complaint: " . $ex->getMessage());
    if (isset($pdo) && $pdo && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Error interno al procesar tu reclamación. Por favor, intente de nuevo.'
    ]);
}
