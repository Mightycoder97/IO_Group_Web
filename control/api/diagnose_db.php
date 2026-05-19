<?php
/**
 * IO Group - Database Diagnostic Tool
 * Run this directly to diagnose connection issues:
 *   php diagnose_db.php
 * Or access via browser (returns HTML).
 * SECURITY: Delete this file after use in production.
 */

$isCli = php_sapi_name() === 'cli';

function diag_output($msg, $type = 'info') {
    global $isCli;
    if ($isCli) {
        $colors = ['ok' => "\033[32m", 'error' => "\033[31m", 'warn' => "\033[33m", 'info' => "\033[36m", 'reset' => "\033[0m"];
        echo ($colors[$type] ?? '') . "[$type] $msg" . $colors['reset'] . "\n";
    } else {
        echo "<div style='font-family:monospace;padding:4px 0;color:" .
            ($type === 'ok' ? 'green' : ($type === 'error' ? 'red' : ($type === 'warn' ? 'orange' : 'blue'))) .
            "'><strong>[$type]</strong> " . htmlspecialchars($msg) . "</div>\n";
    }
}

if (!$isCli) {
    header('Content-Type: text/html; charset=UTF-8');
    echo "<!DOCTYPE html><html><head><title>DB Diagnostic - IO Group</title>";
    echo "<style>body{font-family:monospace;max-width:900px;margin:20px auto;padding:20px;background:#1e1e1e;color:#d4d4d4;}";
    echo "h2{color:#4ec9b0;} .ok{color:#6a9955;} .error{color:#f44747;} .warn{color:#ce9178;} .info{color:#569cd6;}</style>";
    echo "</head><body><h2>🔍 IO Group - Database Diagnostic</h2>";
}

diag_output("PHP Version: " . phpversion());
diag_output("Server API: " . php_sapi_name());
diag_output("Current dir: " . __DIR__);
diag_output("DOCUMENT_ROOT: " . ($_SERVER['DOCUMENT_ROOT'] ?? 'N/A (CLI)'));

// Step 1: Check .env file
diag_output("--- Step 1: Looking for .env files ---", 'info');

$envPaths = [
    __DIR__ . '/../../.env',
    __DIR__ . '/../../../control/.env',
    __DIR__ . '/../../../.env',
    ($_SERVER['DOCUMENT_ROOT'] ?? dirname(__DIR__, 3)) . '/control/.env',
    ($_SERVER['DOCUMENT_ROOT'] ?? dirname(__DIR__, 3)) . '/.env',
];

$envFound = false;
foreach ($envPaths as $envFile) {
    $exists = file_exists($envFile);
    $label = $exists ? '✅ FOUND' : '❌ NOT FOUND';
    $type = $exists ? 'ok' : 'warn';
    diag_output("  $label: $envFile", $type);
    if ($exists) {
        $envFound = true;
        $perms = substr(sprintf('%o', fileperms($envFile)), -4);
        $size = filesize($envFile);
        diag_output("    Permissions: $perms, Size: $size bytes", 'info');

        $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        $vars = [];
        foreach ($lines as $line) {
            $line = trim($line);
            if ($line === '' || str_starts_with($line, '#')) continue;
            if (strpos($line, '=') !== false) {
                $key = trim(explode('=', $line, 2)[0]);
                $vars[] = $key;
            }
        }
        diag_output("    Variables found: " . implode(', ', $vars), 'info');
    }
}

if (!$envFound) {
    diag_output("❌ NO .env file found! Create control/.env based on control/.env.example", 'error');
}

// Step 2: Check required constants
diag_output("--- Step 2: Load config and check constants ---", 'info');

try {
    require_once __DIR__ . '/config/config.php';

    $checks = [
        'DB_HOST' => defined('DB_HOST') ? DB_HOST : '(not defined)',
        'DB_PORT' => defined('DB_PORT') ? DB_PORT : '(not defined)',
        'DB_NAME' => defined('DB_NAME') ? (DB_NAME ?: '(empty)') : '(not defined)',
        'DB_USER' => defined('DB_USER') ? (DB_USER ?: '(empty)') : '(not defined)',
        'DB_PASS' => defined('DB_PASS') ? (DB_PASS ? '*** (set)' : '(empty)') : '(not defined)',
        'DB_CHARSET' => defined('DB_CHARSET') ? DB_CHARSET : '(not defined)',
        'JWT_SECRET' => defined('JWT_SECRET') ? (JWT_SECRET ? '*** (set)' : '(empty)') : '(not defined)',
        'ENV_LOADED' => defined('ENV_LOADED') ? (ENV_LOADED ? 'true' : 'false') : '(not defined)',
        'ENV_LOADED_PATH' => defined('ENV_LOADED_PATH') ? (ENV_LOADED_PATH ?: '(none)') : '(not defined)',
    ];

    foreach ($checks as $key => $value) {
        $type = ($value === '(not defined)' || $value === '(empty)' || $value === '(none)' || $value === 'false') ? 'error' : 'ok';
        diag_output("  $key: $value", $type);
    }
} catch (Throwable $e) {
    diag_output("❌ Error loading config: " . $e->getMessage(), 'error');
}

// Step 3: Check PHP extensions
diag_output("--- Step 3: PHP Extensions ---", 'info');
$required = ['pdo', 'pdo_mysql', 'json', 'mbstring', 'openssl', 'curl', 'fileinfo'];
foreach ($required as $ext) {
    $loaded = extension_loaded($ext);
    diag_output("  $ext: " . ($loaded ? '✅ loaded' : '❌ MISSING'), $loaded ? 'ok' : 'error');
}

// Step 4: Test MySQL connection
diag_output("--- Step 4: Test MySQL Connection ---", 'info');

if (!defined('DB_HOST') || !DB_HOST || !defined('DB_NAME') || !DB_NAME) {
    diag_output("❌ Cannot test: DB_HOST or DB_NAME not configured", 'error');
} else {
    try {
        $dsn = "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
        diag_output("  DSN: mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME, 'info');

        $start = microtime(true);
        $pdo = new PDO($dsn, DB_USER, DB_PASS, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_TIMEOUT => 10
        ]);
        $elapsed = round((microtime(true) - $start) * 1000, 1);

        diag_output("✅ MySQL connection SUCCESSFUL! (${elapsed}ms)", 'ok');

        $version = $pdo->query('SELECT VERSION()')->fetchColumn();
        diag_output("  MySQL Version: $version", 'ok');

        $tables = $pdo->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
        $tableCount = count($tables);
        diag_output("  Tables found: $tableCount", $tableCount > 0 ? 'ok' : 'warn');

        if ($tableCount > 0) {
            diag_output("  Tables: " . implode(', ', array_slice($tables, 0, 15)) . (count($tables) > 15 ? '...' : ''), 'info');
        }

        $hasUserTable = in_array('Usuario', $tables);
        diag_output("  Usuario table: " . ($hasUserTable ? '✅ exists' : '❌ MISSING'), $hasUserTable ? 'ok' : 'error');

        if ($hasUserTable) {
            $userCount = $pdo->query("SELECT COUNT(*) FROM Usuario")->fetchColumn();
            diag_output("  Users in database: $userCount", $userCount > 0 ? 'ok' : 'warn');
        }

    } catch (PDOException $e) {
        $msg = $e->getMessage();
        diag_output("❌ MySQL connection FAILED: $msg", 'error');

        if (strpos($msg, 'Access denied') !== false) {
            diag_output("  ↳ Check DB_USER and DB_PASSWORD in .env", 'warn');
        } elseif (strpos($msg, 'Unknown database') !== false) {
            diag_output("  ↳ Database '" . DB_NAME . "' does not exist. Create it in hPanel.", 'warn');
        } elseif (strpos($msg, 'Connection refused') !== false) {
            diag_output("  ↳ Cannot reach MySQL at " . DB_HOST . ":" . DB_PORT . ". Check firewall/host.", 'warn');
        } elseif (strpos($msg, 'getaddrinfo') !== false || strpos($msg, 'Name or service not known') !== false) {
            diag_output("  ↳ Host '" . DB_HOST . "' could not be resolved. Check DB_HOST.", 'warn');
        }
    }
}

// Summary
diag_output("--- Summary ---", 'info');
if ($envFound && defined('DB_HOST') && DB_HOST && defined('DB_NAME') && DB_NAME) {
    diag_output("Configuration found. Check the connection test above for results.", 'info');
} else {
    diag_output("❌ ACTION REQUIRED: Create control/.env file with database credentials.", 'error');
    diag_output("   1. Copy control/.env.example to control/.env", 'info');
    diag_output("   2. Fill in DB_HOST, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD", 'info');
    diag_output("   3. Re-run this diagnostic", 'info');
}

if (!$isCli) {
    echo "</body></html>";
}
