<?php
/**
 * Contact Form Handler
 * Sends form data to sebastian3197@gmail.com and confirmation email to the user
 */

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
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
$destinatario = 'sebastian3197@gmail.com';
$remitente_noreply = 'noreply@iogroup.pe';
$nombre_empresa = 'IO Group';

// Get form data
$tipo_cliente = $_POST['tipo_cliente'] ?? '';
$nombre = trim($_POST['nombre'] ?? '');
$email = trim($_POST['email'] ?? '');
$telefono = trim($_POST['telefono'] ?? '');
$servicio = trim($_POST['servicio'] ?? '');

// Additional fields based on client type
$dni = trim($_POST['dni'] ?? '');
$razon_social = trim($_POST['razon_social'] ?? '');
$ruc = trim($_POST['ruc'] ?? '');

// Validation
$errors = [];

if (empty($nombre)) {
    $errors[] = 'El nombre es requerido';
}

if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = 'El correo electrónico no es válido';
}

if (empty($telefono)) {
    $errors[] = 'El teléfono es requerido';
}

if (empty($servicio)) {
    $errors[] = 'El tipo de servicio es requerido';
}

if ($tipo_cliente === 'natural') {
    if (empty($dni) || !preg_match('/^[0-9]{8}$/', $dni)) {
        $errors[] = 'El DNI debe tener 8 dígitos';
    }
} elseif ($tipo_cliente === 'empresa') {
    if (empty($razon_social)) {
        $errors[] = 'La razón social es requerida';
    }
    if (empty($ruc) || !preg_match('/^[0-9]{11}$/', $ruc)) {
        $errors[] = 'El RUC debe tener 11 dígitos';
    }
}

if (!empty($errors)) {
    echo json_encode(['success' => false, 'message' => implode(', ', $errors)]);
    exit();
}

// Prepare email content for administrator
$tipo_cliente_texto = $tipo_cliente === 'natural' ? 'Persona Natural' : 'Empresa';
$fecha = date('d/m/Y H:i:s');

$asunto_admin = "Nueva Solicitud de Servicio - {$tipo_cliente_texto} - " . ($tipo_cliente === 'natural' ? $nombre : $razon_social);

$mensaje_admin = "
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background: linear-gradient(135deg, #00a651, #005c2e); color: white; padding: 20px; text-align: center; border-radius: 10px 10px 0 0; }
        .content { background: #f9f9f9; padding: 20px; border: 1px solid #ddd; }
        .field { margin-bottom: 15px; }
        .label { font-weight: bold; color: #005c2e; }
        .value { color: #333; }
        .footer { background: #333; color: white; padding: 15px; text-align: center; border-radius: 0 0 10px 10px; font-size: 12px; }
        .badge { display: inline-block; padding: 5px 15px; background: #00a651; color: white; border-radius: 20px; font-size: 14px; }
    </style>
</head>
<body>
    <div class='container'>
        <div class='header'>
            <h1>Nueva Solicitud de Servicio</h1>
            <span class='badge'>{$tipo_cliente_texto}</span>
        </div>
        <div class='content'>
            <p><strong>Fecha de solicitud:</strong> {$fecha}</p>
            <hr>
            
            <h3>Datos del Cliente</h3>
            <div class='field'>
                <span class='label'>Nombre Completo:</span>
                <span class='value'>{$nombre}</span>
            </div>";

if ($tipo_cliente === 'natural') {
    $mensaje_admin .= "
            <div class='field'>
                <span class='label'>DNI:</span>
                <span class='value'>{$dni}</span>
            </div>";
} else {
    $mensaje_admin .= "
            <div class='field'>
                <span class='label'>Razón Social:</span>
                <span class='value'>{$razon_social}</span>
            </div>
            <div class='field'>
                <span class='label'>RUC:</span>
                <span class='value'>{$ruc}</span>
            </div>";
}

$mensaje_admin .= "
            <div class='field'>
                <span class='label'>Teléfono:</span>
                <span class='value'>{$telefono}</span>
            </div>
            <div class='field'>
                <span class='label'>Correo Electrónico:</span>
                <span class='value'><a href='mailto:{$email}'>{$email}</a></span>
            </div>
            
            <hr>
            <h3>Servicio Solicitado</h3>
            <div class='field'>
                <span class='label'>Tipo de Servicio:</span>
                <span class='value' style='color: #00a651; font-weight: bold;'>{$servicio}</span>
            </div>
        </div>
        <div class='footer'>
            <p>Este mensaje fue enviado desde el formulario de contacto de iogroup.pe</p>
        </div>
    </div>
</body>
</html>
";

// Headers for HTML email
$headers_admin = "MIME-Version: 1.0\r\n";
$headers_admin .= "Content-type: text/html; charset=UTF-8\r\n";
$headers_admin .= "From: {$nombre_empresa} <{$remitente_noreply}>\r\n";
$headers_admin .= "Reply-To: {$email}\r\n";
$headers_admin .= "X-Mailer: PHP/" . phpversion();

// Send email to administrator
$enviado_admin = mail($destinatario, $asunto_admin, $mensaje_admin, $headers_admin);

// Prepare confirmation email for user
$asunto_usuario = "Hemos recibido tu solicitud - IO Group";

$mensaje_usuario = "
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .container { max-width: 600px; margin: 0 auto; padding: 20px; }
        .header { background: linear-gradient(135deg, #00a651, #005c2e); color: white; padding: 30px; text-align: center; border-radius: 10px 10px 0 0; }
        .header h1 { margin: 0; font-size: 24px; }
        .content { background: #ffffff; padding: 30px; border: 1px solid #ddd; }
        .greeting { font-size: 18px; color: #005c2e; margin-bottom: 20px; }
        .summary { background: #f5f5f5; padding: 20px; border-radius: 8px; margin: 20px 0; }
        .summary h3 { color: #005c2e; margin-top: 0; }
        .summary p { margin: 5px 0; }
        .cta { text-align: center; margin: 30px 0; }
        .cta a { display: inline-block; padding: 12px 30px; background: #00a651; color: white; text-decoration: none; border-radius: 25px; font-weight: bold; }
        .footer { background: #333; color: white; padding: 20px; text-align: center; border-radius: 0 0 10px 10px; font-size: 12px; }
        .social a { color: #00a651; margin: 0 10px; text-decoration: none; }
    </style>
</head>
<body>
    <div class='container'>
        <div class='header'>
            <h1>¡Gracias por contactarnos!</h1>
        </div>
        <div class='content'>
            <p class='greeting'>Hola <strong>{$nombre}</strong>,</p>
            
            <p>Hemos recibido tu solicitud de servicio correctamente. Nuestro equipo se pondrá en contacto contigo a la brevedad posible.</p>
            
            <div class='summary'>
                <h3>Resumen de tu solicitud</h3>
                <p><strong>Tipo de Cliente:</strong> {$tipo_cliente_texto}</p>";

if ($tipo_cliente === 'natural') {
    $mensaje_usuario .= "<p><strong>DNI:</strong> {$dni}</p>";
} else {
    $mensaje_usuario .= "<p><strong>Razón Social:</strong> {$razon_social}</p>";
    $mensaje_usuario .= "<p><strong>RUC:</strong> {$ruc}</p>";
}

$mensaje_usuario .= "
                <p><strong>Servicio Solicitado:</strong> {$servicio}</p>
                <p><strong>Fecha de Solicitud:</strong> {$fecha}</p>
            </div>
            
            <p><strong>Tiempo de respuesta estimado:</strong> Nos pondremos en contacto contigo en un plazo máximo de 24 horas hábiles.</p>
            
            <p>Si tienes alguna consulta urgente, no dudes en contactarnos directamente:</p>
            <ul>
                <li>📞 Teléfono: +51 997 571 262 / +51 973 224 733</li>
                <li>📧 Email: naenciso@iogroup.pe</li>
                <li>💬 WhatsApp: +51 997 571 262</li>
            </ul>
            
            <div class='cta'>
                <a href='https://wa.me/51997571262'>Contáctanos por WhatsApp</a>
            </div>
        </div>
        <div class='footer'>
            <p><strong>IO Group</strong></p>
            <p>Gestión Integral de Residuos Peligrosos</p>
            <p>Calle Los Halcones 260 - 4to piso, Surquillo, Lima</p>
            <div class='social'>
                <a href='https://www.facebook.com/iogroup.oficial'>Facebook</a> |
                <a href='https://www.instagram.com/iogroup.residuos/'>Instagram</a> |
                <a href='https://iogroup.pe'>Web</a>
            </div>
            <p style='margin-top: 15px; font-size: 11px; color: #999;'>
                Este es un correo automático, por favor no responda directamente a este mensaje.
            </p>
        </div>
    </div>
</body>
</html>
";

// Headers for user confirmation email
$headers_usuario = "MIME-Version: 1.0\r\n";
$headers_usuario .= "Content-type: text/html; charset=UTF-8\r\n";
$headers_usuario .= "From: {$nombre_empresa} <{$remitente_noreply}>\r\n";
$headers_usuario .= "X-Mailer: PHP/" . phpversion();

// Send confirmation email to user
$enviado_usuario = mail($email, $asunto_usuario, $mensaje_usuario, $headers_usuario);

// Response
if ($enviado_admin) {
    $response = [
        'success' => true,
        'message' => '¡Tu solicitud ha sido enviada correctamente! ' . 
                     ($enviado_usuario ? 'Te hemos enviado un correo de confirmación.' : 'Nos pondremos en contacto contigo pronto.')
    ];
} else {
    $response = [
        'success' => false,
        'message' => 'Hubo un error al enviar tu solicitud. Por favor, intenta nuevamente o contáctanos directamente por teléfono.'
    ];
}

echo json_encode($response);
