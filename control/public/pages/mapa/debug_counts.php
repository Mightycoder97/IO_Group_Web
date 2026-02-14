<?php
require_once __DIR__ . '/../../../api/config/database.php';

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html>
<head>
    <title>Debug Sedes Data Quality</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        table { border-collapse: collapse; width: 100%; max-width: 800px; margin-bottom: 20px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .red { color: red; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Sedes Data Quality Check</h1>
    <a href="javascript:location.reload()">Reload</a>
    
    <h2>1. General Counts</h2>
    <table>
        <tr><th>Metric</th><th>Count</th></tr>
        <?php
        try {
            $total = db()->queryOne("SELECT COUNT(*) as c FROM Sede");
            $active = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE activo = 1");
            $coords = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE activo = 1 AND coordenadas_gps IS NOT NULL AND coordenadas_gps != ''");
            $join = db()->queryOne("SELECT COUNT(*) as c FROM Sede s INNER JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE s.activo = 1 AND s.coordenadas_gps IS NOT NULL AND s.coordenadas_gps != ''");
            
            echo "<tr><td>Total Sedes</td><td>" . $total['c'] . "</td></tr>";
            echo "<tr><td>Active Sedes</td><td>" . $active['c'] . "</td></tr>";
            echo "<tr><td>Active + Has Coords</td><td>" . $coords['c'] . "</td></tr>";
            echo "<tr><td><strong>Map Query (Active + Coords + Valid Empresa)</strong></td><td><strong>" . $join['c'] . "</strong></td></tr>";
        } catch (Exception $e) {
            echo "<tr><td colspan='2'>Error: " . $e->getMessage() . "</td></tr>";
        }
        ?>
    </table>

    <h2>2. Frequency Distribution (Frontend Filter Check)</h2>
    <p>The map frontend <strong>hides</strong> any sede with a frequency other than: <em>Diario, Interdiario, Semanal, Quincenal</em>.</p>
    <table>
        <tr>
            <th>Frecuencia (Database Value)</th>
            <th>Count</th>
            <th>Status on Map</th>
        </tr>
        <?php
        $freqs = db()->query("
            SELECT cs.frecuencia, COUNT(*) as c
            FROM Sede s
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            LEFT JOIN (
                SELECT id_sede, frecuencia
                FROM ContratoServicio cs1
                WHERE activo = 1 AND NOT EXISTS (
                    SELECT 1 FROM ContratoServicio cs2 
                    WHERE cs2.id_sede = cs1.id_sede AND cs2.activo = 1 AND cs2.fecha_inicio > cs1.fecha_inicio
                )
                GROUP BY id_sede
            ) cs ON s.id_sede = cs.id_sede
            WHERE s.activo = 1 AND s.coordenadas_gps IS NOT NULL AND s.coordenadas_gps != ''
            GROUP BY cs.frecuencia
            ORDER BY c DESC
        ");
        
        $allowed = ['diario', 'interdiario', 'semanal', 'quincenal'];
        
        foreach($freqs as $row) {
            $f_db = $row['frecuencia'];
            $f_norm = trim(strtolower($f_db ?? ''));
            $count = $row['c'];
            
            $status = "VISIBLE";
            $class = "green";
            
            if (empty($f_norm)) {
                $f_display = "<em>NULL/Empty (Sin Contrato)</em>";
                // Frontend logic: if (!s.frecuencia) return true; -> VISIBLE
                $status = "VISIBLE (No filter applied)";
            } else {
                $f_display = htmlspecialchars($f_db);
                if (!in_array($f_norm, $allowed)) {
                    $status = "HIDDEN by Filter";
                    $class = "red";
                }
            }
            
            echo "<tr>";
            echo "<td>$f_display</td>";
            echo "<td>$count</td>";
            echo "<td class='$class'>$status</td>";
            echo "</tr>";
        }
        ?>
    </table>
    
    <h2>3. Invalid Coordinate Formats</h2>
    <p>Coordinates must be "lat,lng" (comma separated numbers).</p>
    <table>
        <tr><th>Sede</th><th>Bad Coord Value</th></tr>
        <?php
        $bad = db()->query("SELECT nombre_comercial, coordenadas_gps FROM Sede WHERE activo = 1 AND coordenadas_gps IS NOT NULL AND coordenadas_gps != '' AND coordenadas_gps NOT LIKE '%,%' LIMIT 20");
        if (count($bad) === 0) {
            echo "<tr><td colspan='2'>No invalid formats found (all contain a comma)</td></tr>";
        } else {
            foreach ($bad as $b) {
                echo "<tr><td>" . htmlspecialchars($b['nombre_comercial']) . "</td><td class='red'>" . htmlspecialchars($b['coordenadas_gps']) . "</td></tr>";
            }
        }
        ?>
    </table>
</body>
</html>
