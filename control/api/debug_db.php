<?php
require_once __DIR__ . '/config/database.php';

header('Content-Type: application/json');

try {
    $counts = [
        'Servicio' => db()->queryOne("SELECT COUNT(*) as c FROM Servicio")['c'],
        'Ruta' => db()->queryOne("SELECT COUNT(*) as c FROM Ruta")['c'],
        'Factura' => db()->queryOne("SELECT COUNT(*) as c FROM Factura")['c'],
        'Cliente' => db()->queryOne("SELECT COUNT(*) as c FROM Cliente")['c'],
        'ContratoServicio' => db()->queryOne("SELECT COUNT(*) as c FROM ContratoServicio")['c']
    ];

    $sampleServicio = db()->query("SELECT * FROM Servicio ORDER BY fecha_ejecucion DESC LIMIT 5");
    $sampleRuta = db()->query("SELECT * FROM Ruta ORDER BY fecha DESC LIMIT 5");
    $sampleFactura = db()->query("SELECT * FROM Factura ORDER BY fecha_creacion DESC LIMIT 5");

    echo json_encode([
        'counts' => $counts,
        'samples' => [
            'Servicio' => $sampleServicio,
            'Ruta' => $sampleRuta,
            'Factura' => $sampleFactura
        ]
    ], JSON_PRETTY_PRINT);

} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
