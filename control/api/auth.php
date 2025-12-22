<?php
/**
 * IO Group - Authentication API
 * Handles login, logout, user management
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

// Get request method and action
$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

// Route the request
switch ($action) {
    case 'login':
        if ($method === 'POST') login();
        break;
    case 'logout':
        if ($method === 'POST') logout();
        break;
    case 'me':
        if ($method === 'GET') getCurrentUser();
        break;
    case 'change-password':
        if ($method === 'PUT') changePassword();
        break;
    case 'register':
        if ($method === 'POST') register();
        break;
    case 'setup':
        if ($method === 'POST' || $method === 'GET') setup();
        break;
    default:
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Endpoint no encontrado']);
}

/**
 * POST /api/auth.php?action=login
 */
function login() {
    $data = json_decode(file_get_contents('php://input'), true);
    
    $username = $data['username'] ?? '';
    $password = $data['password'] ?? '';

    if (empty($username) || empty($password)) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'Usuario y contraseña son requeridos'
        ]);
        return;
    }

    // Find user
    $user = db()->queryOne(
        "SELECT id_usuario, username, password_hash, nombre_completo, rol, email, activo 
         FROM Usuario WHERE username = ?",
        [$username]
    );

    if (!$user) {
        http_response_code(401);
        echo json_encode([
            'success' => false,
            'message' => 'Usuario o contraseña incorrectos'
        ]);
        return;
    }

    // Check if active
    if (!$user['activo']) {
        http_response_code(401);
        echo json_encode([
            'success' => false,
            'message' => 'Usuario desactivado'
        ]);
        return;
    }

    // Verify password
    if (!password_verify($password, $user['password_hash'])) {
        http_response_code(401);
        echo json_encode([
            'success' => false,
            'message' => 'Usuario o contraseña incorrectos'
        ]);
        return;
    }

    // Update last access
    db()->execute(
        "UPDATE Usuario SET ultimo_acceso = NOW() WHERE id_usuario = ?",
        [$user['id_usuario']]
    );

    // Generate token
    $token = JWT::generate([
        'id' => $user['id_usuario'],
        'username' => $user['username'],
        'nombre' => $user['nombre_completo'],
        'rol' => $user['rol']
    ]);

    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, accion, ip_address) VALUES (?, 'Usuario', 'LOGIN', ?)",
        [$user['id_usuario'], $_SERVER['REMOTE_ADDR'] ?? '']
    );

    echo json_encode([
        'success' => true,
        'message' => 'Inicio de sesión exitoso',
        'token' => $token,
        'user' => [
            'id' => $user['id_usuario'],
            'username' => $user['username'],
            'nombre' => $user['nombre_completo'],
            'rol' => $user['rol'],
            'email' => $user['email']
        ]
    ]);
}

/**
 * POST /api/auth.php?action=logout
 */
function logout() {
    $user = getAuthUser();
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, accion, ip_address) VALUES (?, 'Usuario', 'LOGOUT', ?)",
        [$user['id'], $_SERVER['REMOTE_ADDR'] ?? '']
    );

    echo json_encode([
        'success' => true,
        'message' => 'Sesión cerrada exitosamente'
    ]);
}

/**
 * GET /api/auth.php?action=me
 */
function getCurrentUser() {
    $user = getAuthUser();
    
    $userData = db()->queryOne(
        "SELECT id_usuario, username, nombre_completo, rol, email, ultimo_acceso FROM Usuario WHERE id_usuario = ?",
        [$user['id']]
    );

    if (!$userData) {
        http_response_code(404);
        echo json_encode([
            'success' => false,
            'message' => 'Usuario no encontrado'
        ]);
        return;
    }

    echo json_encode([
        'success' => true,
        'user' => $userData
    ]);
}

/**
 * PUT /api/auth.php?action=change-password
 */
function changePassword() {
    $user = getAuthUser();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $currentPassword = $data['currentPassword'] ?? '';
    $newPassword = $data['newPassword'] ?? '';

    if (empty($currentPassword) || empty($newPassword)) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'Contraseña actual y nueva son requeridas'
        ]);
        return;
    }

    // Get current password
    $userData = db()->queryOne(
        "SELECT password_hash FROM Usuario WHERE id_usuario = ?",
        [$user['id']]
    );

    // Verify current password
    if (!password_verify($currentPassword, $userData['password_hash'])) {
        http_response_code(401);
        echo json_encode([
            'success' => false,
            'message' => 'Contraseña actual incorrecta'
        ]);
        return;
    }

    // Update password
    $newHash = password_hash($newPassword, PASSWORD_BCRYPT);
    db()->execute(
        "UPDATE Usuario SET password_hash = ?, fecha_modificacion = NOW() WHERE id_usuario = ?",
        [$newHash, $user['id']]
    );

    echo json_encode([
        'success' => true,
        'message' => 'Contraseña actualizada exitosamente'
    ]);
}

/**
 * POST /api/auth.php?action=register
 */
function register() {
    $user = requireRole(['admin']);
    $data = json_decode(file_get_contents('php://input'), true);
    
    $username = $data['username'] ?? '';
    $password = $data['password'] ?? '';
    $nombre_completo = $data['nombre_completo'] ?? '';
    $rol = $data['rol'] ?? 'viewer';
    $email = $data['email'] ?? null;

    if (empty($username) || empty($password) || empty($nombre_completo)) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'Campos requeridos: username, password, nombre_completo'
        ]);
        return;
    }

    // Check if username exists
    $existing = db()->queryOne(
        "SELECT id_usuario FROM Usuario WHERE username = ?",
        [$username]
    );

    if ($existing) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'El nombre de usuario ya existe'
        ]);
        return;
    }

    // Create user
    $passwordHash = password_hash($password, PASSWORD_BCRYPT);
    $id = db()->insert(
        "INSERT INTO Usuario (username, password_hash, nombre_completo, rol, email) VALUES (?, ?, ?, ?, ?)",
        [$username, $passwordHash, $nombre_completo, $rol, $email]
    );

    echo json_encode([
        'success' => true,
        'message' => 'Usuario creado exitosamente',
        'id' => $id
    ]);
}

/**
 * POST/GET /api/auth.php?action=setup
 */
function setup() {
    // Check if admin exists
    $admin = db()->queryOne("SELECT COUNT(*) as count FROM Usuario WHERE rol = 'admin'");
    
    if ($admin['count'] > 0) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'Ya existe un administrador. Use el login normal.'
        ]);
        return;
    }

    // Create default admin
    $passwordHash = password_hash('Admin123!', PASSWORD_BCRYPT);
    db()->insert(
        "INSERT INTO Usuario (username, password_hash, nombre_completo, rol, email) VALUES (?, ?, ?, ?, ?)",
        ['admin', $passwordHash, 'Administrador del Sistema', 'admin', 'admin@iogroup.pe']
    );

    echo json_encode([
        'success' => true,
        'message' => 'Usuario administrador creado',
        'credentials' => [
            'username' => 'admin',
            'password' => 'Admin123!'
        ]
    ]);
}
