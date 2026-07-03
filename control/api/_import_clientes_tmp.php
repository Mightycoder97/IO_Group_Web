<?php
/**
 * IO Group — Importador clientes faltantes (Rutas Junio 2026)
 * BORRAR ESTE ARCHIVO INMEDIATAMENTE DESPUÉS DE EJECUTAR
 */
define('SECRET_TOKEN', 'IO2026IMPORT');
if (($_GET['token'] ?? '') !== SECRET_TOKEN) { http_response_code(403); die('Forbidden'); }

$mode      = strtolower($_GET['mode'] ?? 'dry');
$is_commit = ($mode === 'commit');

// ── Conexión ──────────────────────────────────────────────────────────────────
$env = [];
foreach (file(__DIR__ . '/../.env', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $l) {
    if ($l[0] === '#') continue;
    if (strpos($l, '=') !== false) { [$k,$v] = explode('=', $l, 2); $env[trim($k)] = trim($v); }
}
try {
    $pdo = new PDO(
        "mysql:host={$env['DB_HOST']};dbname={$env['DB_NAME']};charset=utf8mb4",
        $env['DB_USER'], $env['DB_PASSWORD'],
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (Exception $e) { die('DB Error: ' . $e->getMessage()); }

// ── Datos: 517 clientes en formato array ─────────────────────────────────────
// Generados por extraction_tools/sync_clientes_rutas_junio2026.py
// Cada entrada: [ruc, razon_social, nombre_comercial, direccion, distrito, contacto_nombre, contacto_tel, tarifa, frecuencia, metodo_pago, visitas]

$clientes = [];
$sql_file = __DIR__ . '/_insert_tmp.sql';

if (!file_exists($sql_file)) {
    die('<pre>ERROR: No se encontró insert_clientes_faltantes.sql en extraction_tools/</pre>');
}

// Parsear bloques del SQL generado por Python
$sql_raw = file_get_contents($sql_file);
$blocks  = preg_split('/(?=-- \[\d{3}\])/', $sql_raw);
$client_blocks = array_values(array_filter($blocks, fn($b) => preg_match('/^-- \[\d{3}\]/', trim($b))));
$total = count($client_blocks);

// ── HTML ──────────────────────────────────────────────────────────────────────
?><!DOCTYPE html><html lang="es"><head><meta charset="UTF-8">
<title>IO Group Import</title>
<style>
body{font-family:monospace;background:#0f172a;color:#e2e8f0;padding:2rem;margin:0}
h1{color:#38bdf8;border-bottom:1px solid #1e3a5f;padding-bottom:.5rem}
.badge{display:inline-block;padding:2px 12px;border-radius:99px;font-size:.8rem;font-weight:700}
.dry{background:#854d0e;color:#fef3c7}.live{background:#14532d;color:#dcfce7}
.log{background:#1e293b;border:1px solid #334155;border-radius:8px;padding:1rem;margin:1rem 0;font-size:.8rem;line-height:1.8;max-height:65vh;overflow-y:auto}
.ok{color:#4ade80}.warn{color:#facc15}.err{color:#f87171}.info{color:#60a5fa}.num{color:#a78bfa;font-weight:700}
a.btn{background:#166534;color:#dcfce7;padding:5px 18px;border-radius:6px;text-decoration:none;font-size:.85rem;margin-left:12px}
.summary{background:#1e293b;border:1px solid #334155;border-radius:8px;padding:1.2rem;margin:1.5rem 0}
.danger{color:#ef4444;font-size:.85rem;border:1px solid #7f1d1d;border-radius:6px;padding:.8rem;margin-top:1rem;background:#1c0a0a}
</style>
</head><body>
<h1>🔄 IO Group — Importación de Clientes Faltantes (Junio 2026)</h1>
<p>
  Modo: <span class="badge <?= $is_commit ? 'live' : 'dry' ?>">
    <?= $is_commit ? '⚡ COMMIT — ESCRITURA REAL' : '🔍 DRY-RUN' ?>
  </span>
  <?php if (!$is_commit): ?>
    <a class="btn" href="?token=<?= SECRET_TOKEN ?>&mode=commit"
       onclick="return confirm('¿Confirmas que quieres insertar los <?= $total ?> clientes en la BD REAL?')">
      ▶ Ejecutar COMMIT real
    </a>
  <?php endif; ?>
</p>
<div class="log">
<?php
ob_implicit_flush(true);

echo "<span class='info'>📋 Bloques de clientes detectados: <span class='num'>{$total}</span></span><br>";
echo "<span class='info'>🗄  BD: <span class='num'>{$env['DB_NAME']}@{$env['DB_HOST']}</span></span><br><br>";

$inserted = $skipped = $errors = 0;

if (!$is_commit) {
    // DRY-RUN
    $c = $pdo->query("SELECT COUNT(*) FROM Cliente")->fetchColumn();
    $e = $pdo->query("SELECT COUNT(*) FROM Empresa")->fetchColumn();
    $s = $pdo->query("SELECT COUNT(*) FROM Sede")->fetchColumn();
    echo "<span class='ok'>✅ Conexión OK</span><br>";
    echo "<span class='info'>   Clientes actuales:  <span class='num'>{$c}</span></span><br>";
    echo "<span class='info'>   Empresas actuales:  <span class='num'>{$e}</span></span><br>";
    echo "<span class='info'>   Sedes actuales:     <span class='num'>{$s}</span></span><br><br>";

    // Verificar cuántos RUCs ya existen de los que se van a insertar
    $ya_existen = 0;
    foreach ($client_blocks as $block) {
        preg_match('/-- \s+RUC: (\d+)/', $block, $m);
        $ruc = $m[1] ?? '';
        if (!$ruc) continue;
        $st = $pdo->prepare("SELECT 1 FROM Empresa WHERE ruc = ? LIMIT 1");
        $st->execute([$ruc]);
        if ($st->fetch()) $ya_existen++;
    }
    $netos = $total - $ya_existen;
    echo "<span class='warn'>   Ya existen en BD:   <span class='num'>{$ya_existen}</span></span><br>";
    echo "<span class='ok'>   Se insertarían:     <span class='num'>{$netos}</span> clientes nuevos</span><br>";
    echo "<span class='info'>   (4 INSERTs cada uno: Cliente + Empresa + Sede + ContratoServicio)</span><br><br>";
    echo "<span class='ok'>✅ Dry-run completado. Usa el botón 'Ejecutar COMMIT real' cuando estés listo.</span><br>";

} else {
    // COMMIT REAL
    echo "<span class='warn'>⚡ Iniciando inserción...</span><br><br>";

    $pdo->exec("SET foreign_key_checks = 0");
    $hoy = date('Y-m-d');

    foreach ($client_blocks as $block) {
        preg_match('/-- \[(\d+)\] (.+)/', $block, $hm);
        preg_match('/-- \s+RUC: (\d+)/', $block, $rm);

        $num  = trim($hm[1] ?? '?');
        $name = trim($hm[2] ?? 'Desconocido');
        $ruc  = trim($rm[1] ?? '');

        if (!$ruc) { $errors++; continue; }

        // Verificar duplicado
        $chk = $pdo->prepare("SELECT 1 FROM Empresa WHERE ruc = ? LIMIT 1");
        $chk->execute([$ruc]);
        if ($chk->fetch()) {
            $skipped++;
            continue; // silencio en duplicados para no llenar el log
        }

        // Extraer sentencias INSERT del bloque
        $lines = explode("\n", $block);
        $inserts = [];
        $buf = '';
        foreach ($lines as $line) {
            $line = rtrim($line);
            if (preg_match('/^--/', $line) || trim($line) === '' || preg_match('/^SET @/', $line) || preg_match('/^(START|COMMIT|SET foreign|SET NAMES)/', $line)) continue;
            $buf .= ' ' . $line;
            if (str_ends_with(trim($line), ';')) {
                $s = trim($buf);
                if (strlen($s) > 15) $inserts[] = $s;
                $buf = '';
            }
        }

        if (count($inserts) < 4) {
            echo "<span class='err'>❌ [{$num}] Bloque incompleto ({$name}): " . count($inserts) . " INSERTs</span><br>";
            $errors++;
            continue;
        }

        try {
            $pdo->beginTransaction();

            // ① Cliente
            $pdo->exec(rtrim($inserts[0], ';'));
            $id_cli = $pdo->lastInsertId();

            // ② Empresa
            $sql_e = preg_replace('/@id_cliente_\d+/', $id_cli, $inserts[1]);
            $pdo->exec(rtrim($sql_e, ';'));
            $id_emp = $pdo->lastInsertId();

            // ③ Sede
            $sql_s = preg_replace('/@id_empresa_\d+/', $id_emp, $inserts[2]);
            $pdo->exec(rtrim($sql_s, ';'));
            $id_sed = $pdo->lastInsertId();

            // ④ ContratoServicio
            $sql_c = preg_replace('/@id_sede_\d+/', $id_sed, $inserts[3]);
            $pdo->exec(rtrim($sql_c, ';'));

            $pdo->commit();
            $inserted++;
            echo "<span class='ok'>✅ [{$num}] {$name}</span><br>";

        } catch (Exception $ex) {
            $pdo->rollBack();
            $errors++;
            echo "<span class='err'>❌ [{$num}] {$name} → " . htmlspecialchars($ex->getMessage()) . "</span><br>";
        }

        if ($inserted % 30 === 0 && $inserted > 0) {
            echo "<span class='info'>   ··· {$inserted} insertados ···</span><br>";
        }
    }

    $pdo->exec("SET foreign_key_checks = 1");

    // Totales finales
    $cf = $pdo->query("SELECT COUNT(*) FROM Cliente")->fetchColumn();
    $ef = $pdo->query("SELECT COUNT(*) FROM Empresa")->fetchColumn();
    $sf = $pdo->query("SELECT COUNT(*) FROM Sede")->fetchColumn();

    echo "<br><span class='info'>══════════════════════════════════</span><br>";
    echo "<span class='ok'>✅ Insertados:            <span class='num'>{$inserted}</span></span><br>";
    echo "<span class='warn'>⚠️  Omitidos (ya existían): <span class='num'>{$skipped}</span></span><br>";
    echo "<span class='err'>❌ Errores:               <span class='num'>{$errors}</span></span><br>";
    echo "<span class='info'>══════════════════════════════════</span><br><br>";
    echo "<span class='info'>📊 Totales finales en BD:</span><br>";
    echo "<span class='info'>   Clientes: <span class='num'>{$cf}</span> | Empresas: <span class='num'>{$ef}</span> | Sedes: <span class='num'>{$sf}</span></span><br>";
}
?>
</div>

<?php if ($inserted > 0 || (!$is_commit && isset($netos))): ?>
<div class="summary">
  <strong>📊 Resumen de cobertura actualizada:</strong><br>
  <?php
  $bd_total = $pdo->query("SELECT COUNT(*) FROM Empresa WHERE activo=1")->fetchColumn();
  echo "<span class='ok'>Sedes activas en BD ahora: <span class='num'>{$bd_total}</span></span><br>";
  $cobertura = $bd_total > 0 ? round((829 / $bd_total) * 100, 1) : 0;
  echo "<span class='ok'>Cobertura operativa junio: <span class='num'>{$cobertura}%</span> (829 visitadas / {$bd_total} activas)</span><br>";
  ?>
</div>
<?php endif; ?>

<div class="danger">
  <strong>⚠️ IMPORTANTE — SEGURIDAD:</strong> Elimina este archivo del servidor inmediatamente.<br>
  Ruta: <code>control/api/_import_clientes_tmp.php</code><br>
  Ejecuta: <code>git rm control/api/_import_clientes_tmp.php && git commit -m "chore: remove temp import script" && git push</code>
</div>

</body></html>
