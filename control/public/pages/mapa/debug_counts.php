<?php
// Adjust path to reach control/api/config/database.php
// From control/public/pages/mapa/debug_counts.php -> ../../../api/config/database.php
require_once __DIR__ . '/../../../api/config/database.php';

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html>
<head>
    <title>Debug Sedes Counts</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        table { border-collapse: collapse; width: 100%; max-width: 600px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Sedes Database Counts</h1>
    <table>
        <tr>
            <th>Metric</th>
            <th>Count</th>
        </tr>
        <?php
        try {
            // Total Sedes
            $total = db()->queryOne("SELECT COUNT(*) as c FROM Sede");
            echo "<tr><td>Total Sedes in DB</td><td>" . $total['c'] . "</td></tr>";

            // Active Sedes
            $active = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE activo = 1");
            echo "<tr><td>Active Sedes (activo=1)</td><td>" . $active['c'] . "</td></tr>";

            // Sedes with Coordinates
            $coords = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE coordenadas_gps IS NOT NULL AND coordenadas_gps != ''");
            echo "<tr><td>Sedes with Coordinates</td><td>" . $coords['c'] . "</td></tr>";

            // Active Sedes with Coordinates (Map Query)
            $mapQuery = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE activo = 1 AND coordenadas_gps IS NOT NULL AND coordenadas_gps != ''");
            echo "<tr><td><strong>Map Query Candidates</strong> (Active + Coords)</td><td><strong>" . $mapQuery['c'] . "</strong></td></tr>";
            
            // Inactive with Coordinates
            $inactiveCoords = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE activo = 0 AND coordenadas_gps IS NOT NULL AND coordenadas_gps != ''");
            echo "<tr><td>Inactive Sedes but have Coords</td><td>" . $inactiveCoords['c'] . "</td></tr>";
            
             // Active without Coordinates
            $activeNoCoords = db()->queryOne("SELECT COUNT(*) as c FROM Sede WHERE activo = 1 AND (coordenadas_gps IS NULL OR coordenadas_gps = '')");
            echo "<tr><td>Active Sedes MISSING Coords</td><td>" . $activeNoCoords['c'] . "</td></tr>";

        } catch (Exception $e) {
            echo "<tr><td colspan='2'>Error: " . $e->getMessage() . "</td></tr>";
        }
        ?>
    </table>
    
    <h2>Missing Coordinates (First 50)</h2>
    <ul>
    <?php
    $missing = db()->query("SELECT nombre_comercial, id_sede FROM Sede WHERE activo = 1 AND (coordenadas_gps IS NULL OR coordenadas_gps = '') LIMIT 50");
    foreach ($missing as $s) {
        echo "<li>ID: " . $s['id_sede'] . " - " . htmlspecialchars($s['nombre_comercial']) . "</li>";
    }
    ?>
    </ul>
</body>
</html>
