<?php
/**
 * IO Group - Database Configuration
 * MySQL PDO connection for Hostinger deployment
 */

// Database credentials - Hostinger
define('DB_HOST', 'localhost');
define('DB_PORT', '3306');
define('DB_NAME', 'u511863531_iogDB');
define('DB_USER', 'u511863531_admin');
define('DB_PASS', 'admin');  // <-- INGRESA TU CONTRASEÑA AQUÍ
define('DB_CHARSET', 'utf8mb4');

// JWT Configuration
define('JWT_SECRET', 'iogroup_jwt_secret_key_change_in_production_2024');
define('JWT_EXPIRE', 86400); // 24 hours in seconds

// Timezone
date_default_timezone_set('America/Lima');

// Error reporting (disable in production)
error_reporting(E_ALL);
ini_set('display_errors', 0);

// CORS Headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json; charset=UTF-8');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}
