<?php
/**
 * IO Group - Database Configuration
 * MySQL PDO connection for Hostinger deployment
 */

// Load .env file — try multiple paths for compatibility
$envPaths = [
    __DIR__ . '/../../.env',           // control/.env (from config/ dir)
    __DIR__ . '/../../../control/.env', // fallback absolute
    __DIR__ . '/../../../.env',         // public_html/.env or repo root .env
    dirname($_SERVER['DOCUMENT_ROOT'] ?? '') . '/control/.env',
    ($_SERVER['DOCUMENT_ROOT'] ?? '') . '/control/.env',
    ($_SERVER['DOCUMENT_ROOT'] ?? '') . '/.env',
];
$envLoaded = false;
$loadedEnvFiles = [];
foreach ($envPaths as $envFile) {
    if (file_exists($envFile)) {
        $resolvedEnvFile = realpath($envFile) ?: $envFile;
        if (in_array($resolvedEnvFile, $loadedEnvFiles, true)) {
            continue;
        }
        $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach ($lines as $line) {
            $line = trim($line);
            if ($line === '' || str_starts_with($line, '#')) continue;
            if (str_starts_with($line, 'export ')) {
                $line = trim(substr($line, 7));
            }
            if (strpos($line, '=') === false) continue;
            list($key, $value) = explode('=', $line, 2);
            $key = trim($key);
            $value = trim($value);
            if (
                strlen($value) >= 2 &&
                (($value[0] === '"' && substr($value, -1) === '"') || ($value[0] === "'" && substr($value, -1) === "'"))
            ) {
                $value = substr($value, 1, -1);
            }
            if (!getenv($key)) {
                putenv("$key=$value");
                $_ENV[$key] = $value;
            }
        }
        $envLoaded = true;
        $loadedEnvFiles[] = $resolvedEnvFile;
    }
}

if (!defined('ENV_LOADED')) define('ENV_LOADED', $envLoaded);
if (!defined('ENV_LOADED_PATH')) define('ENV_LOADED_PATH', implode('; ', $loadedEnvFiles));

// Database credentials from environment
define('DB_HOST', getenv('DB_HOST') ?: 'localhost');
define('DB_PORT', getenv('DB_PORT') ?: '3306');
define('DB_NAME', getenv('DB_NAME') ?: '');
define('DB_USER', getenv('DB_USER') ?: '');
define('DB_PASS', getenv('DB_PASSWORD') ?: '');
define('DB_CHARSET', getenv('DB_CHARSET') ?: 'utf8mb4');

// JWT Configuration from environment
define('JWT_SECRET', getenv('JWT_SECRET') ?: '');
define('JWT_EXPIRE', intval(getenv('JWT_EXPIRE') ?: 86400));

// Timezone
date_default_timezone_set('America/Lima');

// Error reporting (disable in production)
error_reporting(E_ALL);
ini_set('display_errors', 0);

// CORS Headers - restricted to allowed origin
$allowedOrigin = getenv('CORS_ORIGIN') ?: 'https://iogroup.pe';
$requestOrigin = $_SERVER['HTTP_ORIGIN'] ?? '';
if ($requestOrigin === $allowedOrigin || $allowedOrigin === '*') {
    header('Access-Control-Allow-Origin: ' . $allowedOrigin);
} else {
    header('Access-Control-Allow-Origin: ' . $allowedOrigin);
}
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json; charset=UTF-8');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

