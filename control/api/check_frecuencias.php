<?php
/**
 * Script temporal para verificar frecuencias de sedes
 */

require_once __DIR__ . '/config/database.php';

// Verificar cuántas sedes tienen contrato activo con frecuencia
$sql = "
SELECT 
    (SELECT COUNT(*) FROM Sede WHERE activo = 1 AND coordenadas_gps IS NOT NULL AND coordenadas_gps != '') as total_sedes_en_mapa,
    (SELECT COUNT(DISTINCT s.id_sede) 
     FROM Sede s 
     INNER JOIN ContratoServicio cs ON s.id_sede = cs.id_sede 
     WHERE s.activo = 1 AND cs.activo = 1 
     AND s.coordenadas_gps IS NOT NULL AND s.coordenadas_gps != '') as sedes_con_contrato_activo
";

$result = db()->queryOne($sql);

echo "=== RESUMEN DE FRECUENCIAS EN MAPA ===\n";
echo "Total sedes en mapa: " . $result['total_sedes_en_mapa'] . "\n";
echo "Sedes con contrato activo: " . $result['sedes_con_contrato_activo'] . "\n";
echo "Sedes sin contrato: " . ($result['total_sedes_en_mapa'] - $result['sedes_con_contrato_activo']) . "\n\n";

// Mostrar distribución de frecuencias
$frecuencias = db()->query("
SELECT 
    COALESCE(
        (SELECT cs.frecuencia FROM ContratoServicio cs 
         WHERE cs.id_sede = s.id_sede AND cs.activo = 1 
         ORDER BY cs.fecha_inicio DESC LIMIT 1), 
        'SIN_CONTRATO'
    ) as frecuencia,
    COUNT(*) as cantidad
FROM Sede s
WHERE s.activo = 1 AND s.coordenadas_gps IS NOT NULL AND s.coordenadas_gps != ''
GROUP BY frecuencia
ORDER BY cantidad DESC
");

echo "=== DISTRIBUCIÓN DE FRECUENCIAS ===\n";
foreach ($frecuencias as $f) {
    echo sprintf("%-15s: %d sedes\n", $f['frecuencia'], $f['cantidad']);
}

// Mostrar algunas sedes sin frecuencia
echo "\n=== PRIMERAS 10 SEDES SIN CONTRATO ===\n";
$sinContrato = db()->query("
SELECT s.id_sede, s.nombre_comercial, s.distrito, e.razon_social
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
WHERE s.activo = 1 
AND s.coordenadas_gps IS NOT NULL AND s.coordenadas_gps != ''
AND s.id_sede NOT IN (SELECT id_sede FROM ContratoServicio WHERE activo = 1)
LIMIT 10
");

foreach ($sinContrato as $s) {
    echo "- [{$s['id_sede']}] {$s['nombre_comercial']} ({$s['distrito']}) - {$s['razon_social']}\n";
}

// Mostrar algunas sedes CON frecuencia
echo "\n=== PRIMERAS 10 SEDES CON CONTRATO ACTIVO ===\n";
$conContrato = db()->query("
SELECT s.id_sede, s.nombre_comercial, s.distrito, cs.frecuencia
FROM Sede s
INNER JOIN ContratoServicio cs ON s.id_sede = cs.id_sede
WHERE s.activo = 1 
AND s.coordenadas_gps IS NOT NULL AND s.coordenadas_gps != ''
AND cs.activo = 1
ORDER BY cs.fecha_inicio DESC
LIMIT 10
");

foreach ($conContrato as $s) {
    echo "- [{$s['id_sede']}] {$s['nombre_comercial']} ({$s['distrito']}) - Frecuencia: {$s['frecuencia']}\n";
}
