<?php
/**
 * IO Group - Usuarios API
 * CRUD de usuarios con permisos (solo admin)
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$id = $_GET['id'] ?? null;
$action = $_GET['action'] ?? null;

// Lista de módulos disponibles
$MODULOS = [
    'dashboard', 'clientes', 'empresas', 'sedes', 'contratos',
    'servicios', 'rutas', 'manifiestos', 'guias',
    'empleados', 'vehiculos', 'plantas',
    'facturas', 'prospectos', 'reportes', 'alertas', 'usuarios', 'mapa'
];

switch ($method) {
    case 'GET':
        if ($action === 'modulos') {
            getModulos();
        } else {
            $id ? getOne($id) : getAll();
        }
        break;
    case 'POST':
        create();
        break;
    case 'PUT':
        update($id);
        break;
    case 'DELETE':
        delete($id);
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

/**
 * Get all users (admin only)
 */
function getAll() {
    requireRole(['admin']);
    
    $search = $_GET['search'] ?? '';
    
    $sql = "SELECT id_usuario, username, nombre_completo, rol, email, activo, 
                   ultimo_acceso, fecha_creacion 
            FROM Usuario WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (username LIKE ? OR nombre_completo LIKE ? OR email LIKE ?)";
        $searchTerm = "%$search%";
        $params = [$searchTerm, $searchTerm, $searchTerm];
    }
    
    $sql .= " ORDER BY nombre_completo";
    
    $users = db()->query($sql, $params);
    
    // Get permission counts for each user
    foreach ($users as &$user) {
        $permisos = db()->queryOne(
            "SELECT COUNT(*) as total FROM UsuarioPermiso WHERE id_usuario = ? AND puede_ver = 1",
            [$user['id_usuario']]
        );
        $user['modulos_permitidos'] = $permisos['total'] ?? 0;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $users,
        'total' => count($users)
    ]);
}

/**
 * Get single user with permissions
 */
function getOne($id) {
    requireRole(['admin']);
    
    $user = db()->queryOne(
        "SELECT id_usuario, username, nombre_completo, rol, email, activo, 
                ultimo_acceso, fecha_creacion 
         FROM Usuario WHERE id_usuario = ?",
        [$id]
    );
    
    if (!$user) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Usuario no encontrado']);
        return;
    }
    
    // Get permissions
    $permisos = db()->query(
        "SELECT modulo, puede_ver, puede_editar FROM UsuarioPermiso WHERE id_usuario = ?",
        [$id]
    );
    
    $user['permisos'] = [];
    foreach ($permisos as $p) {
        $user['permisos'][$p['modulo']] = [
            'ver' => (bool)$p['puede_ver'],
            'editar' => (bool)$p['puede_editar']
        ];
    }
    
    echo json_encode([
        'success' => true,
        'data' => $user
    ]);
}

/**
 * Get available modules
 */
function getModulos() {
    global $MODULOS;
    requireRole(['admin']);
    
    $modulosInfo = [
        ['id' => 'dashboard', 'nombre' => 'Dashboard', 'grupo' => 'General'],
        ['id' => 'clientes', 'nombre' => 'Clientes', 'grupo' => 'Clientes'],
        ['id' => 'empresas', 'nombre' => 'Empresas', 'grupo' => 'Clientes'],
        ['id' => 'sedes', 'nombre' => 'Sedes', 'grupo' => 'Clientes'],
        ['id' => 'contratos', 'nombre' => 'Contratos', 'grupo' => 'Clientes'],
        ['id' => 'servicios', 'nombre' => 'Servicios', 'grupo' => 'Operaciones'],
        ['id' => 'rutas', 'nombre' => 'Rutas', 'grupo' => 'Operaciones'],
        ['id' => 'manifiestos', 'nombre' => 'Manifiestos', 'grupo' => 'Operaciones'],
        ['id' => 'guias', 'nombre' => 'Guías', 'grupo' => 'Operaciones'],
        ['id' => 'empleados', 'nombre' => 'Empleados', 'grupo' => 'Recursos'],
        ['id' => 'vehiculos', 'nombre' => 'Vehículos', 'grupo' => 'Recursos'],
        ['id' => 'plantas', 'nombre' => 'Plantas', 'grupo' => 'Recursos'],
        ['id' => 'facturas', 'nombre' => 'Facturas', 'grupo' => 'Finanzas'],
        ['id' => 'prospectos', 'nombre' => 'Prospectos', 'grupo' => 'Ventas'],
        ['id' => 'reportes', 'nombre' => 'Reportes', 'grupo' => 'Herramientas'],
        ['id' => 'alertas', 'nombre' => 'Alertas', 'grupo' => 'Herramientas'],
        ['id' => 'mapa', 'nombre' => 'Mapa', 'grupo' => 'Herramientas'],
        ['id' => 'usuarios', 'nombre' => 'Usuarios', 'grupo' => 'Administración']
    ];
    
    echo json_encode([
        'success' => true,
        'data' => $modulosInfo
    ]);
}

/**
 * Create new user with permissions
 */
function create() {
    global $MODULOS;
    $admin = requireRole(['admin']);
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    $username = trim($data['username'] ?? '');
    $password = $data['password'] ?? '';
    $nombre = trim($data['nombre_completo'] ?? '');
    $email = trim($data['email'] ?? '') ?: null;
    $rol = $data['rol'] ?? 'viewer';
    $permisos = $data['permisos'] ?? [];
    
    // Validate
    if (empty($username) || empty($password) || empty($nombre)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Username, contraseña y nombre son requeridos']);
        return;
    }
    
    if (strlen($password) < 8) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'La contraseña debe tener al menos 8 caracteres']);
        return;
    }
    if (!preg_match('/[A-Z]/', $password)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'La contraseña debe tener al menos 1 mayúscula']);
        return;
    }
    if (!preg_match('/[0-9]/', $password)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'La contraseña debe tener al menos 1 número']);
        return;
    }
    if (!preg_match('/[!@#$%^&*(),.?":{}|<>]/', $password)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'La contraseña debe tener al menos 1 carácter especial']);
        return;
    }
    
    // Check username exists
    $existing = db()->queryOne("SELECT id_usuario FROM Usuario WHERE username = ?", [$username]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'El nombre de usuario ya existe']);
        return;
    }
    
    // Create user
    $passwordHash = password_hash($password, PASSWORD_BCRYPT);
    $id = db()->insert(
        "INSERT INTO Usuario (username, password_hash, nombre_completo, rol, email) VALUES (?, ?, ?, ?, ?)",
        [$username, $passwordHash, $nombre, $rol, $email]
    );
    
    // Add permissions
    if ($rol === 'admin') {
        // Admin gets all permissions
        foreach ($MODULOS as $modulo) {
            db()->insert(
                "INSERT INTO UsuarioPermiso (id_usuario, modulo, puede_ver, puede_editar) VALUES (?, ?, 1, 1)",
                [$id, $modulo]
            );
        }
    } else if (!empty($permisos)) {
        // Custom permissions
        foreach ($permisos as $modulo => $perm) {
            if (in_array($modulo, $MODULOS)) {
                $ver = isset($perm['ver']) ? ($perm['ver'] ? 1 : 0) : 0;
                $editar = isset($perm['editar']) ? ($perm['editar'] ? 1 : 0) : 0;
                if ($ver || $editar) {
                    db()->insert(
                        "INSERT INTO UsuarioPermiso (id_usuario, modulo, puede_ver, puede_editar) VALUES (?, ?, ?, ?)",
                        [$id, $modulo, $ver, $editar]
                    );
                }
            }
        }
    }
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Usuario', ?, 'INSERT', ?)",
        [$admin['id'], $id, json_encode(['username' => $username, 'rol' => $rol])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Usuario creado exitosamente',
        'id' => $id
    ]);
}

/**
 * Update user and permissions
 */
function update($id) {
    global $MODULOS;
    $admin = requireRole(['admin']);
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $existing = db()->queryOne("SELECT * FROM Usuario WHERE id_usuario = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Usuario no encontrado']);
        return;
    }
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    $nombre = trim($data['nombre_completo'] ?? $existing['nombre_completo']);
    $email = isset($data['email']) ? (trim($data['email']) ?: null) : $existing['email'];
    $rol = $data['rol'] ?? $existing['rol'];
    $activo = isset($data['activo']) ? ($data['activo'] ? 1 : 0) : $existing['activo'];
    $permisos = $data['permisos'] ?? null;
    
    // Update user
    $sql = "UPDATE Usuario SET nombre_completo = ?, email = ?, rol = ?, activo = ?, fecha_modificacion = NOW() WHERE id_usuario = ?";
    $params = [$nombre, $email, $rol, $activo, $id];
    
    // Update password if provided
    if (!empty($data['password'])) {
        if (strlen($data['password']) < 8) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'La contraseña debe tener al menos 8 caracteres']);
            return;
        }
        if (!preg_match('/[A-Z]/', $data['password'])) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'La contraseña debe tener al menos 1 mayúscula']);
            return;
        }
        if (!preg_match('/[0-9]/', $data['password'])) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'La contraseña debe tener al menos 1 número']);
            return;
        }
        if (!preg_match('/[!@#$%^&*(),.?":{}|<>]/', $data['password'])) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'La contraseña debe tener al menos 1 carácter especial']);
            return;
        }
        $sql = "UPDATE Usuario SET nombre_completo = ?, email = ?, rol = ?, activo = ?, password_hash = ?, fecha_modificacion = NOW() WHERE id_usuario = ?";
        $params = [$nombre, $email, $rol, $activo, password_hash($data['password'], PASSWORD_BCRYPT), $id];
    }
    
    db()->execute($sql, $params);
    
    // Update permissions
    if ($permisos !== null) {
        // Delete existing permissions
        db()->execute("DELETE FROM UsuarioPermiso WHERE id_usuario = ?", [$id]);
        
        if ($rol === 'admin') {
            // Admin gets all permissions
            foreach ($MODULOS as $modulo) {
                db()->insert(
                    "INSERT INTO UsuarioPermiso (id_usuario, modulo, puede_ver, puede_editar) VALUES (?, ?, 1, 1)",
                    [$id, $modulo]
                );
            }
        } else {
            // Custom permissions
            foreach ($permisos as $modulo => $perm) {
                if (in_array($modulo, $MODULOS)) {
                    $ver = isset($perm['ver']) ? ($perm['ver'] ? 1 : 0) : 0;
                    $editar = isset($perm['editar']) ? ($perm['editar'] ? 1 : 0) : 0;
                    if ($ver || $editar) {
                        db()->insert(
                            "INSERT INTO UsuarioPermiso (id_usuario, modulo, puede_ver, puede_editar) VALUES (?, ?, ?, ?)",
                            [$id, $modulo, $ver, $editar]
                        );
                    }
                }
            }
        }
    }
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Usuario', ?, 'UPDATE', ?, ?)",
        [$admin['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Usuario actualizado exitosamente'
    ]);
}

/**
 * Delete (deactivate) user
 */
function delete($id) {
    $admin = requireRole(['admin']);
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    // Can't delete yourself
    if ($id == $admin['id']) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'No puedes eliminar tu propio usuario']);
        return;
    }
    
    $existing = db()->queryOne("SELECT * FROM Usuario WHERE id_usuario = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Usuario no encontrado']);
        return;
    }
    
    // Soft delete
    db()->execute("UPDATE Usuario SET activo = 0, fecha_modificacion = NOW() WHERE id_usuario = ?", [$id]);
    
    // Audit log
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Usuario', ?, 'DELETE')",
        [$admin['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Usuario desactivado exitosamente'
    ]);
}
