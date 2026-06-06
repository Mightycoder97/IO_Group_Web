<?php
/**
 * IO Group - Script Temporal v2 para restaurar el archivo .env en el servidor en la ruta segura
 */
$token = $_GET['token'] ?? '';
$secret = 'io_group_migration_2026_secret_9988';

if ($token !== $secret) {
    http_response_code(403);
    exit("Denied");
}

header('Content-Type: text/plain; charset=UTF-8');

$env_content = <<<EOT
# IO Group - Configuracion de Entorno
# Completa los valores y guarda este archivo como .env

# ====== BASE DE DATOS ======
DB_HOST=localhost
DB_PORT=3306
DB_NAME=u511863531_IOGroupBD
DB_USER=u511863531_Sebastian
DB_PASSWORD=Sebas0920%
DB_CHARSET=utf8mb4

# ====== SEGURIDAD (JWT) ======
JWT_SECRET=gKdiG2nKoGpJu0SfNbv1pL2OoYWEp3QbTeoJpMOX0H3AQP/K
JWT_EXPIRE=86400

# ====== CORS ======
CORS_ORIGIN=https://iogroup.pe

# ====== GOOGLE MAPS ======
GOOGLE_MAPS_API_KEY=AIzaSyB2Z_GH9V27sp9mFDLwqk_h_I_g01ysfoU

# ====== SUNAT ======
SUNAT_API_TOKEN=

# ====== ARCHIVOS ======
UPLOAD_PATH=./uploads
EOT;

// Destino 1: Dentro del repositorio (vulnerable a git clean en futuros deploys)
$dest1 = __DIR__ . "/.env";
$success1 = false;
if (file_put_contents($dest1, $env_content)) {
    echo "SUCCESS: .env file created at standard location: $dest1\n";
    $success1 = true;
} else {
    echo "ERROR: Failed to write standard .env\n";
}

// Destino 2: Fuera del repositorio (persistente y seguro contra git clean)
$secure_dir = "/home/u511863531/domains/iogroup.pe/control";
if (!is_dir($secure_dir)) {
    if (mkdir($secure_dir, 0755, true)) {
        echo "SUCCESS: Created secure directory $secure_dir\n";
    } else {
        echo "ERROR: Failed to create secure directory $secure_dir\n";
    }
}

$dest2 = $secure_dir . "/.env";
$success2 = false;
if (is_dir($secure_dir)) {
    if (file_put_contents($dest2, $env_content)) {
        echo "SUCCESS: .env file created at secure persistent location: $dest2\n";
        $success2 = true;
    } else {
        echo "ERROR: Failed to write secure .env\n";
    }
}

echo "\nVerification of persistent path:\n";
echo "File exists: " . (file_exists($dest2) ? "yes" : "no") . "\n";
echo "Is readable: " . (is_readable($dest2) ? "yes" : "no") . "\n";
