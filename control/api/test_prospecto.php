<?php
// Simulate the POST
$_SERVER['REQUEST_METHOD'] = 'POST';
$_SERVER['REMOTE_ADDR'] = '127.0.0.1';

// We just want to see the error output natively
error_reporting(E_ALL);
ini_set('display_errors', 1);

require 'config/database.php';
// Set up mock payload
$payload = [
    "nombre_contacto" => "Test",
    "razon_social" => "",
    "ruc" => "",
    "telefono" => "123456789",
    "email" => "",
    "direccion" => "",
    "distrito" => "",
    "latitud" => "",
    "longitud" => "",
    "tipo_negocio" => "Otro",
    "vendedor" => "Admin",
    "observaciones" => "",
    "fecha_siguiente_contacto" => "",
    "notas_seguimiento" => ""
];

file_put_contents('php://temp', json_encode($payload));

// Mock file_get_contents for php://input
function mock_create() {
    global $payload;
    $data = $payload;
    // same logic
    $nombre = $data['nombre'] ?? $data['nombre_contacto'] ?? '';
    $telefono = $data['telefono'] ?? '';
    $vendedor = $data['vendedor'] ?? '';
    
    $razonSocial = $data['razonSocial'] ?? $data['razon_social'] ?? null;
    $ruc = $data['ruc'] ?? null;
    $email = $data['email'] ?? null;
    $direccion = $data['direccion'] ?? null;
    $distrito = $data['distrito'] ?? null;
    $latitud = $data['latitud'] ?? null;
    $longitud = $data['longitud'] ?? null;
    $tipoNegocio = $data['tipoNegocio'] ?? $data['tipo_negocio'] ?? 'Otro';
    $observaciones = $data['observaciones'] ?? null;

    try {
        $id = db()->insert(
            "INSERT INTO Prospecto (nombre_contacto, razon_social, ruc, telefono, email, direccion, distrito, latitud, longitud, tipo_negocio, observaciones, vendedor, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'nuevo')",
            [$nombre, $razonSocial, $ruc, $telefono, $email, $direccion, $distrito, $latitud, $longitud, $tipoNegocio, $observaciones, $vendedor]
        );
        echo "Success: $id\n";
    } catch (Exception $e) {
        echo "DB Error: " . $e->getMessage() . "\n";
    }
}
mock_create();
