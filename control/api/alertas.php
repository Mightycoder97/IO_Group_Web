<?php
/**
 * IO Group - Alertas API
 * Expiring documents and alerts
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method !== 'GET') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit;
}

canView();

$dias = $_GET['dias'] ?? 30;

// Get all alerts using the view
$alertas = db()->query(
    "SELECT * FROM vw_DocumentosPorVencer WHERE dias_restantes <= ? ORDER BY dias_restantes ASC",
    [$dias]
);

// Categorize alerts
$vencidos = array_filter($alertas, fn($a) => $a['estado'] === 'VENCIDO');
$criticos = array_filter($alertas, fn($a) => $a['estado'] === 'CRITICO');
$advertencias = array_filter($alertas, fn($a) => $a['estado'] === 'ADVERTENCIA');

echo json_encode([
    'success' => true,
    'data' => [
        'alertas' => array_values($alertas),
        'resumen' => [
            'vencidos' => count($vencidos),
            'criticos' => count($criticos),
            'advertencias' => count($advertencias),
            'total' => count($alertas)
        ]
    ]
]);
