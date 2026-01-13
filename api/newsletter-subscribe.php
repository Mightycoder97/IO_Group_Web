<?php
/**
 * Newsletter Subscription API
 * Handles newsletter signups with 15% discount code generation
 * 
 * POST /api/newsletter-subscribe.php
 * Body: email (required), nombre (optional), pagina_origen (optional)
 * Response: { success: bool, message: string, discount_code: string }
 */

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit();
}

// Configuration
$config = [
    'admin_email' => 'admin@iogroup.pe',
    'admin_cc' => 'naenciso@iogroup.pe',
    'from_email' => 'noreply@iogroup.pe',
    'from_name' => 'IO Group',
    'discount_prefix' => 'IOGROUP15',
    'discount_percent' => 15
];

// Database connection (using same config as control panel)
$db_config_file = __DIR__ . '/../control/config/database.php';

if (!file_exists($db_config_file)) {
    // Fallback: Try to connect directly if config doesn't exist
    error_log("Newsletter: Database config file not found at: " . $db_config_file);
    echo json_encode(['success' => false, 'message' => 'Error de configuración del servidor']);
    exit();
}

require_once $db_config_file;

// Get form data
$email = trim($_POST['email'] ?? '');
$nombre = trim($_POST['nombre'] ?? '');
$pagina_origen = trim($_POST['pagina_origen'] ?? '/');
$ip_address = $_SERVER['REMOTE_ADDR'] ?? '';
$user_agent = $_SERVER['HTTP_USER_AGENT'] ?? '';

// Validate email
if (empty($email)) {
    echo json_encode(['success' => false, 'message' => 'El correo electrónico es requerido']);
    exit();
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'message' => 'El correo electrónico no es válido']);
    exit();
}

// Sanitize inputs
$email = filter_var($email, FILTER_SANITIZE_EMAIL);
$nombre = htmlspecialchars($nombre, ENT_QUOTES, 'UTF-8');
$pagina_origen = htmlspecialchars($pagina_origen, ENT_QUOTES, 'UTF-8');

try {
    // Check if already subscribed
    $stmt = $pdo->prepare("SELECT id_subscriber, codigo_descuento, activo FROM NewsletterSubscriber WHERE email = ?");
    $stmt->execute([$email]);
    $existing = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($existing) {
        // Already subscribed
        if ($existing['activo']) {
            echo json_encode([
                'success' => true,
                'message' => '¡Ya estás suscrito! Aquí está tu código de descuento.',
                'discount_code' => $existing['codigo_descuento'],
                'already_subscribed' => true
            ]);
        } else {
            // Reactivate subscription
            $stmt = $pdo->prepare("UPDATE NewsletterSubscriber SET activo = 1, fecha_suscripcion = NOW() WHERE id_subscriber = ?");
            $stmt->execute([$existing['id_subscriber']]);
            
            echo json_encode([
                'success' => true,
                'message' => '¡Bienvenido de vuelta! Tu suscripción ha sido reactivada.',
                'discount_code' => $existing['codigo_descuento'],
                'reactivated' => true
            ]);
        }
        exit();
    }

    // Generate unique discount code
    $discount_code = generateDiscountCode($config['discount_prefix']);

    // Insert new subscriber
    $stmt = $pdo->prepare("
        INSERT INTO NewsletterSubscriber 
        (email, nombre, codigo_descuento, ip_address, user_agent, pagina_origen) 
        VALUES (?, ?, ?, ?, ?, ?)
    ");
    $stmt->execute([$email, $nombre, $discount_code, $ip_address, $user_agent, $pagina_origen]);

    // Send confirmation email to subscriber
    sendConfirmationEmail($email, $nombre, $discount_code, $config);

    // Send notification to admin
    sendAdminNotification($email, $nombre, $pagina_origen, $discount_code, $config);

    // Success response
    echo json_encode([
        'success' => true,
        'message' => '¡Gracias por suscribirte! Te hemos enviado tu código de descuento por correo.',
        'discount_code' => $discount_code
    ]);

} catch (PDOException $e) {
    error_log("Newsletter subscription error: " . $e->getMessage());
    
    // Check for duplicate entry (race condition)
    if ($e->getCode() == 23000) {
        echo json_encode([
            'success' => false,
            'message' => 'Este correo ya está registrado. Por favor, usa otro correo o contacta a soporte.'
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Error al procesar tu suscripción. Por favor, intenta nuevamente.'
        ]);
    }
}

/**
 * Generate a unique discount code
 */
function generateDiscountCode($prefix) {
    $random = strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 6));
    return $prefix . '-' . $random;
}

/**
 * Send confirmation email to subscriber
 */
function sendConfirmationEmail($email, $nombre, $discount_code, $config) {
    $nombre_display = !empty($nombre) ? $nombre : 'Estimado/a cliente';
    
    $subject = "🎁 Tu código de 15% de descuento - IO Group";
    
    $message = "
    <!DOCTYPE html>
    <html lang='es'>
    <head>
        <meta charset='UTF-8'>
        <style>
            body { font-family: 'Segoe UI', Arial, sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 0; background: #f5f5f5; }
            .container { max-width: 600px; margin: 0 auto; background: #ffffff; }
            .header { background: linear-gradient(135deg, #EA4517 0%, #B70207 100%); color: white; padding: 40px 30px; text-align: center; }
            .header h1 { margin: 0; font-size: 28px; }
            .content { padding: 40px 30px; }
            .greeting { font-size: 18px; color: #1A1A2E; margin-bottom: 20px; }
            .discount-box { background: linear-gradient(135deg, rgba(234, 69, 23, 0.1) 0%, rgba(183, 2, 7, 0.1) 100%); border: 2px dashed #EA4517; border-radius: 12px; padding: 30px; text-align: center; margin: 30px 0; }
            .discount-label { font-size: 14px; color: #6c757d; margin-bottom: 10px; }
            .discount-code { font-size: 32px; font-weight: 800; color: #EA4517; font-family: 'Courier New', monospace; letter-spacing: 3px; }
            .discount-value { font-size: 48px; font-weight: 800; color: #EA4517; margin: 20px 0 10px; }
            .discount-text { font-size: 16px; color: #666; }
            .cta { text-align: center; margin: 30px 0; }
            .cta a { display: inline-block; padding: 15px 40px; background: linear-gradient(135deg, #EA4517 0%, #B70207 100%); color: white; text-decoration: none; border-radius: 8px; font-weight: 700; font-size: 16px; }
            .info { background: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0; }
            .info h4 { color: #1A1A2E; margin-top: 0; }
            .info ul { margin: 0; padding-left: 20px; }
            .info li { margin: 8px 0; color: #666; }
            .footer { background: #1A1A2E; color: rgba(255,255,255,0.8); padding: 30px; text-align: center; font-size: 14px; }
            .footer a { color: #EA4517; text-decoration: none; }
            .social { margin: 15px 0; }
            .social a { display: inline-block; margin: 0 10px; color: rgba(255,255,255,0.8); text-decoration: none; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h1>🎁 ¡Tu Descuento Exclusivo!</h1>
            </div>
            <div class='content'>
                <p class='greeting'>Hola <strong>{$nombre_display}</strong>,</p>
                
                <p>¡Gracias por suscribirte al newsletter de IO Group! Como agradecimiento, aquí tienes tu código de descuento exclusivo:</p>
                
                <div class='discount-box'>
                    <div class='discount-value'>15% OFF</div>
                    <div class='discount-text'>en tu primer servicio</div>
                    <div style='margin-top: 20px;'>
                        <div class='discount-label'>TU CÓDIGO DE DESCUENTO:</div>
                        <div class='discount-code'>{$discount_code}</div>
                    </div>
                </div>
                
                <div class='info'>
                    <h4>¿Cómo usar tu descuento?</h4>
                    <ul>
                        <li>Menciona este código al solicitar tu cotización</li>
                        <li>Válido para nuevos clientes en su primer servicio</li>
                        <li>No acumulable con otras promociones</li>
                        <li>Sin fecha de vencimiento</li>
                    </ul>
                </div>
                
                <div class='cta'>
                    <a href='https://iogroup.pe/contacto'>Solicitar Cotización Ahora</a>
                </div>
                
                <p>Como suscriptor, también recibirás:</p>
                <ul>
                    <li>📰 Noticias del sector de gestión ambiental</li>
                    <li>💡 Consejos para el manejo de residuos peligrosos</li>
                    <li>🎉 Ofertas y promociones exclusivas</li>
                </ul>
            </div>
            <div class='footer'>
                <p><strong>IO Group</strong><br>
                Gestión Integral de Residuos Peligrosos</p>
                <p>📍 Calle Los Halcones 260 - 4to piso, Surquillo, Lima<br>
                📞 +51 997 571 262 | +51 973 224 733</p>
                <div class='social'>
                    <a href='https://www.facebook.com/iogroup.oficial'>Facebook</a> |
                    <a href='https://www.instagram.com/iogroup.residuos/'>Instagram</a> |
                    <a href='https://iogroup.pe'>Web</a>
                </div>
                <p style='font-size: 12px; color: rgba(255,255,255,0.5); margin-top: 20px;'>
                    Recibiste este correo porque te suscribiste al newsletter de IO Group.<br>
                    <a href='#' style='color: rgba(255,255,255,0.5);'>Cancelar suscripción</a>
                </p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    $headers = "MIME-Version: 1.0\r\n";
    $headers .= "Content-type: text/html; charset=UTF-8\r\n";
    $headers .= "From: {$config['from_name']} <{$config['from_email']}>\r\n";
    $headers .= "Reply-To: naenciso@iogroup.pe\r\n";
    $headers .= "X-Mailer: PHP/" . phpversion();
    
    $sent = mail($email, $subject, $message, $headers);
    
    if (!$sent) {
        error_log("Failed to send newsletter confirmation email to: " . $email);
    }
    
    return $sent;
}

/**
 * Send notification to admin
 */
function sendAdminNotification($email, $nombre, $pagina_origen, $discount_code, $config) {
    $fecha = date('d/m/Y H:i:s');
    
    $subject = "📧 Nueva suscripción al Newsletter - " . $email;
    
    $message = "
    <!DOCTYPE html>
    <html lang='es'>
    <head>
        <meta charset='UTF-8'>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
            .container { max-width: 600px; margin: 0 auto; padding: 20px; }
            .header { background: linear-gradient(135deg, #EA4517 0%, #B70207 100%); color: white; padding: 20px; text-align: center; border-radius: 10px 10px 0 0; }
            .content { background: #f9f9f9; padding: 20px; border: 1px solid #ddd; }
            .field { margin-bottom: 15px; }
            .label { font-weight: bold; color: #EA4517; }
            .footer { background: #333; color: white; padding: 15px; text-align: center; border-radius: 0 0 10px 10px; font-size: 12px; }
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header'>
                <h2>📧 Nueva Suscripción al Newsletter</h2>
            </div>
            <div class='content'>
                <p><strong>Fecha:</strong> {$fecha}</p>
                <hr>
                <div class='field'>
                    <span class='label'>Email:</span> {$email}
                </div>
                <div class='field'>
                    <span class='label'>Nombre:</span> " . ($nombre ?: 'No proporcionado') . "
                </div>
                <div class='field'>
                    <span class='label'>Código asignado:</span> {$discount_code}
                </div>
                <div class='field'>
                    <span class='label'>Página de origen:</span> {$pagina_origen}
                </div>
            </div>
            <div class='footer'>
                <p>Este es un correo automático del sistema de Newsletter de IO Group</p>
            </div>
        </div>
    </body>
    </html>
    ";
    
    $headers = "MIME-Version: 1.0\r\n";
    $headers .= "Content-type: text/html; charset=UTF-8\r\n";
    $headers .= "From: {$config['from_name']} <{$config['from_email']}>\r\n";
    $headers .= "Cc: {$config['admin_cc']}\r\n";
    $headers .= "X-Mailer: PHP/" . phpversion();
    
    mail($config['admin_email'], $subject, $message, $headers);
}
