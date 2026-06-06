<?php
/**
 * IO Group - Script Temporal para restaurar el archivo .env en el servidor
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

$dest = __DIR__ . "/.env";

if (file_put_contents($dest, $env_content)) {
    echo "SUCCESS: .env file restored successfully at $dest\n";
    echo "File exists: " . (file_exists($dest) ? "yes" : "no") . "\n";
    echo "Is readable: " . (is_readable($dest) ? "yes" : "no") . "\n";
} else {
    echo "ERROR: Failed to write .env file at $dest\n";
}
