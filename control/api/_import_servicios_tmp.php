<?php
/**
 * IO Group — Importador de Servicios Junio 2026
 * BORRAR INMEDIATAMENTE DESPUÉS DE EJECUTAR
 * URL: /control/api/_import_servicios_tmp.php?token=IO2026SVC&mode=dry
 *      /control/api/_import_servicios_tmp.php?token=IO2026SVC&mode=commit
 */
define('SECRET_TOKEN', 'IO2026SVC');
if (($_GET['token'] ?? '') !== SECRET_TOKEN) { http_response_code(403); die('Forbidden'); }

$mode      = strtolower($_GET['mode'] ?? 'dry');
$is_commit = ($mode === 'commit');

// ── Conexión BD ───────────────────────────────────────────────────────────────
$env = [];
foreach (@file(__DIR__ . '/../.env', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) ?: [] as $l) {
    if (!$l || $l[0] === '#' || strpos($l, '=') === false) continue;
    [$k, $v] = explode('=', $l, 2);
    $env[trim($k)] = trim($v);
}
try {
    $pdo = new PDO(
        "mysql:host={$env['DB_HOST']};dbname={$env['DB_NAME']};charset=utf8mb4",
        $env['DB_USER'], $env['DB_PASSWORD'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_TIMEOUT => 120]
    );
} catch (Exception $e) { die('DB Error: ' . $e->getMessage()); }

// ── HTML ──────────────────────────────────────────────────────────────────────
?><!DOCTYPE html><html lang="es"><head><meta charset="UTF-8">
<title>IO Group — Import Servicios Junio 2026</title>
<style>
body{font-family:monospace;background:#0f172a;color:#e2e8f0;padding:2rem;margin:0}
h1{color:#38bdf8;border-bottom:1px solid #1e3a5f;padding-bottom:.5rem;font-size:1.3rem}
.badge{display:inline-block;padding:2px 12px;border-radius:99px;font-size:.8rem;font-weight:700}
.dry{background:#854d0e;color:#fef3c7}.live{background:#14532d;color:#dcfce7}
.log{background:#1e293b;border:1px solid #334155;border-radius:8px;padding:1rem;
     margin:1rem 0;font-size:.78rem;line-height:1.7;max-height:70vh;overflow-y:auto}
.ok{color:#4ade80}.warn{color:#facc15}.err{color:#f87171}
.info{color:#60a5fa}.num{color:#a78bfa;font-weight:700}
a.btn{background:#166534;color:#dcfce7;padding:5px 18px;border-radius:6px;
      text-decoration:none;font-size:.85rem;margin-left:12px}
.summary{background:#1e293b;border:1px solid #334155;border-radius:8px;padding:1.2rem;margin:1.5rem 0}
.danger{color:#ef4444;font-size:.82rem;border:1px solid #7f1d1d;border-radius:6px;
        padding:.8rem;margin-top:1rem;background:#1c0a0a}
</style></head><body>
<h1>🔄 IO Group — Importación de Servicios Junio 2026</h1>
<p>
  Modo: <span class="badge <?= $is_commit ? 'live' : 'dry' ?>">
    <?= $is_commit ? '⚡ COMMIT — ESCRITURA REAL' : '🔍 DRY-RUN' ?>
  </span>
  <?php if (!$is_commit): ?>
    <a class="btn" href="?token=<?= SECRET_TOKEN ?>&mode=commit"
       onclick="return confirm('¿Confirmas insertar los servicios de Junio 2026 en la BD?')">
      ▶ Ejecutar COMMIT
    </a>
  <?php endif; ?>
</p>
<div class="log">
<?php
ob_implicit_flush(true);
set_time_limit(300);   // 5 minutos

$sql_file = __DIR__ . '/_servicios_tmp.sql';
if (!file_exists($sql_file)) {
    echo "<span class='err'>❌ No se encontró _servicios_tmp.sql</span>";
    exit;
}

// Contar servicios esperados
$sql_raw = file_get_contents($sql_file);
$total_expected = substr_count($sql_raw, 'INSERT IGNORE INTO Servicio');

echo "<span class='info'>📋 Servicios en el SQL: <span class='num'>{$total_expected}</span></span><br>";

// Estado actual BD
$sv_antes = $pdo->query("SELECT COUNT(*) FROM Servicio WHERE mes_servicio = 'Junio 2026'")->fetchColumn();
$sv_total = $pdo->query("SELECT COUNT(*) FROM Servicio")->fetchColumn();
echo "<span class='info'>🗄  Servicios junio ya en BD:  <span class='num'>{$sv_antes}</span></span><br>";
echo "<span class='info'>🗄  Servicios totales en BD:   <span class='num'>{$sv_total}</span></span><br>";
echo "<span class='info'>🗄  BD: <span class='num'>{$env['DB_NAME']}@{$env['DB_HOST']}</span></span><br><br>";

if (!$is_commit) {
    // DRY-RUN: solo muestra estadísticas
    $sedes_con_serv = $pdo->query(
        "SELECT COUNT(DISTINCT id_sede) FROM Servicio
         WHERE mes_servicio='Junio 2026'"
    )->fetchColumn();
    $sedes_activas = $pdo->query(
        "SELECT COUNT(*) FROM Sede s
         INNER JOIN Empresa e ON s.id_empresa=e.id_empresa
         WHERE s.activo=1 AND e.activo=1
         AND s.fecha_creacion < '2026-07-01'"
    )->fetchColumn();
    $pct = $sedes_activas > 0 ? round($sedes_con_serv/$sedes_activas*100, 1) : 0;

    echo "<span class='ok'>✅ Conexión OK</span><br><br>";
    echo "<span class='info'>📊 Estado actual cobertura junio:</span><br>";
    echo "<span class='info'>   Sedes con servicio en junio: <span class='num'>{$sedes_con_serv}</span></span><br>";
    echo "<span class='info'>   Sedes activas (pre-julio):   <span class='num'>{$sedes_activas}</span></span><br>";
    echo "<span class='info'>   Cobertura actual:            <span class='num'>{$pct}%</span></span><br><br>";
    echo "<span class='warn'>   Servicios a importar:        <span class='num'>{$total_expected}</span></span><br>";
    echo "<span class='warn'>   Nuevos únicos estimados:     <span class='num'>" . ($total_expected - $sv_antes) . "</span></span><br><br>";
    echo "<span class='ok'>✅ Dry-run OK. Haz clic en 'Ejecutar COMMIT' cuando estés listo.</span><br>";

} else {
    // COMMIT REAL: ejecutar sentencias una a una
    echo "<span class='warn'>⚡ Ejecutando inserción de servicios...</span><br><br>";

    // Parsear y ejecutar cada INSERT...SELECT bloque
    // Cada bloque va desde "INSERT IGNORE INTO Servicio" hasta "LIMIT 1;"
    preg_match_all(
        '/INSERT IGNORE INTO Servicio[\s\S]+?LIMIT 1;/m',
        $sql_raw,
        $matches
    );
    $bloques = $matches[0];
    $total   = count($bloques);

    echo "<span class='info'>   Bloques detectados: <span class='num'>{$total}</span></span><br><br>";

    $pdo->exec("SET foreign_key_checks = 0");

    $inserted = 0;
    $skipped  = 0;
    $errors   = 0;
    $last_day = '';

    foreach ($bloques as $idx => $bloque) {
        // Extraer fecha del bloque para agrupación en log
        if (preg_match("/'(2026-06-\d{2})'/", $bloque, $fm)) {
            $day = $fm[1];
            if ($day !== $last_day) {
                echo "<span class='info'>── {$day} ──────────────────</span><br>";
                $last_day = $day;
                flush();
            }
        }

        try {
            $stmt = $pdo->prepare($bloque);
            $stmt->execute();
            $rows = $stmt->rowCount();
            if ($rows > 0) {
                $inserted++;
            } else {
                $skipped++;  // ya existía (NOT EXISTS lo bloqueó)
            }
        } catch (Exception $ex) {
            $errors++;
            echo "<span class='err'>❌ Error [{$idx}]: " . htmlspecialchars(substr($ex->getMessage(), 0, 120)) . "</span><br>";
        }

        if (($inserted + $skipped) % 100 === 0 && ($inserted + $skipped) > 0) {
            echo "<span class='info'>   ··· {$inserted} insertados, {$skipped} ya existían ···</span><br>";
            flush();
        }
    }

    $pdo->exec("SET foreign_key_checks = 1");

    // Estadísticas finales
    $sv_despues = $pdo->query("SELECT COUNT(*) FROM Servicio WHERE mes_servicio='Junio 2026'")->fetchColumn();
    $sedes_con  = $pdo->query("SELECT COUNT(DISTINCT id_sede) FROM Servicio WHERE mes_servicio='Junio 2026'")->fetchColumn();
    $sedes_act  = $pdo->query(
        "SELECT COUNT(*) FROM Sede s INNER JOIN Empresa e ON s.id_empresa=e.id_empresa
         WHERE s.activo=1 AND e.activo=1 AND s.fecha_creacion < '2026-07-01'"
    )->fetchColumn();
    $pct_nuevo = $sedes_act > 0 ? round($sedes_con/$sedes_act*100,1) : 0;

    echo "<br><span class='info'>══════════════════════════════════════</span><br>";
    echo "<span class='ok'>✅ Insertados:          <span class='num'>{$inserted}</span></span><br>";
    echo "<span class='warn'>⚠️  Ya existían:        <span class='num'>{$skipped}</span></span><br>";
    echo "<span class='err'>❌ Errores:             <span class='num'>{$errors}</span></span><br>";
    echo "<span class='info'>══════════════════════════════════════</span><br><br>";
    echo "<span class='info'>📊 Cobertura Junio 2026 ACTUALIZADA:</span><br>";
    echo "<span class='ok'>   Servicios en BD:    <span class='num'>{$sv_despues}</span></span><br>";
    echo "<span class='ok'>   Sedes atendidas:    <span class='num'>{$sedes_con}</span></span><br>";
    echo "<span class='ok'>   Sedes activas base: <span class='num'>{$sedes_act}</span></span><br>";
    echo "<span class='ok'>   ✨ COBERTURA JUNIO: <span class='num'>{$pct_nuevo}%</span></span><br>";
    flush();
}
?>
</div>
<div class="danger">
  <strong>⚠️ SEGURIDAD:</strong> Borra este archivo y _servicios_tmp.sql del servidor inmediatamente.<br>
  <code>git rm control/api/_import_servicios_tmp.php control/api/_servicios_tmp.sql && git commit -m "chore: remove temp" && git push</code>
</div>
</body></html>
