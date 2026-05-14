<?php
/**
 * Audit and generate region/district corrections for Sede using GPS.
 *
 * CLI:
 *   php api/audit_sede_geo_region.php
 *   php api/audit_sede_geo_region.php --limit=50
 *   php api/audit_sede_geo_region.php --ids=10,1030 --apply
 *
 * Dry-run writes SQL/JSON/CSV outputs under database/migrations by default.
 */

if (PHP_SAPI !== 'cli') {
    http_response_code(403);
    echo json_encode([
        'success' => false,
        'message' => 'Este proceso debe ejecutarse por CLI.',
    ]);
    exit;
}

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/helpers/geo_location.php';

$options = getopt('', ['apply', 'limit:', 'ids:', 'output-dir:']);
$apply = array_key_exists('apply', $options);
$limit = max(0, intval($options['limit'] ?? 0));
$ids = parseGeoAuditIds($options['ids'] ?? '');
$outputDir = isset($options['output-dir'])
    ? rtrim($options['output-dir'], "/\\")
    : realpath(__DIR__ . '/../database/migrations');
if (!$outputDir) $outputDir = __DIR__ . '/../database/migrations';

$stamp = date('Ymd_His');
$sqlPath = $outputDir . "/fix_sedes_region_distrito_$stamp.sql";
$auditPath = $outputDir . "/fix_sedes_region_distrito_{$stamp}_audit.json";
$reviewPath = $outputDir . "/fix_sedes_region_distrito_{$stamp}_review.csv";
$cachePath = $outputDir . '/fix_sedes_region_distrito_google_cache.json';
$cache = geoAuditLoadJson($cachePath, []);

$mapsConfig = require __DIR__ . '/config/maps.php';
$apiKey = trim($mapsConfig['api_key'] ?? '');
$googleReady = $apiKey !== '' && stripos($apiKey, 'YOUR_') === false && function_exists('curl_init');

$sedes = geoAuditLoadSedes($ids, $limit);
$auditRows = [];
$updates = [];
$reviewRows = [];

echo "Sede geo region audit\n";
echo "Sedes: " . count($sedes) . "\n";
echo "Google reverse: " . ($googleReady ? 'enabled' : 'disabled') . "\n";
echo "Mode: " . ($apply ? 'APPLY' : 'DRY-RUN') . "\n\n";

foreach ($sedes as $index => $sede) {
    $status = 'review';
    $reason = '';
    $location = null;
    $source = 'none';
    $formattedAddress = null;
    $coords = geo_parse_gps($sede['coordenadas_gps'] ?? '');

    if (!$coords) {
        $reason = 'coordenadas invalidas o ausentes';
    } elseif ($googleReady) {
        $payload = geoAuditGoogleReverse($coords['lat'], $coords['lng'], $apiKey, $cache);
        foreach (($payload['results'] ?? []) as $result) {
            $candidate = geo_location_from_google_result($result);
            if ($candidate) {
                $location = $candidate;
                $source = 'google_reverse';
                $formattedAddress = $result['formatted_address'] ?? null;
                break;
            }
        }
        if (!$location) {
            $reason = 'Google no devolvio distrito del catalogo';
        }
    } else {
        $reason = 'Google Maps API/cURL no configurado';
    }

    if (!$location) {
        $fallback = geo_resolve_location($sede['distrito'] ?? null, $sede['provincia'] ?? null, $sede['departamento'] ?? null);
        if ($fallback && empty($fallback['ambiguous'])) {
            $location = $fallback;
            $source = 'catalog_alias';
            $reason = '';
        }
    }

    $changed = false;
    if ($location) {
        $changed = geoAuditChanged($sede, $location);
        $status = $changed ? 'update' : 'ok';
        if ($changed) {
            $updates[] = [
                'id_sede' => intval($sede['id_sede']),
                'before' => geoAuditCurrentLocation($sede),
                'after' => $location,
                'source' => $source,
            ];
        }
    } else {
        $reviewRows[] = geoAuditReviewRow($sede, $reason);
    }

    $auditRows[] = [
        'id_sede' => intval($sede['id_sede']),
        'nombre_comercial' => $sede['nombre_comercial'],
        'coordenadas_gps' => $sede['coordenadas_gps'],
        'status' => $status,
        'reason' => $reason,
        'source' => $source,
        'formatted_address' => $formattedAddress,
        'before' => geoAuditCurrentLocation($sede),
        'after' => $location,
    ];

    printf(
        "[%04d/%04d] #%s %-38s %s\n",
        $index + 1,
        count($sedes),
        $sede['id_sede'],
        substr($sede['nombre_comercial'] ?? '', 0, 38),
        strtoupper($status)
    );

    if (($index + 1) % 25 === 0) {
        geoAuditPersist($cachePath, $cache, $sqlPath, $auditPath, $reviewPath, $auditRows, $updates, $reviewRows);
    }
}

geoAuditPersist($cachePath, $cache, $sqlPath, $auditPath, $reviewPath, $auditRows, $updates, $reviewRows);

if ($apply && $updates) {
    db()->beginTransaction();
    try {
        foreach ($updates as $update) {
            db()->execute(
                "UPDATE Sede
                 SET distrito = ?, provincia = ?, departamento = ?, region = ?, fecha_modificacion = NOW()
                 WHERE id_sede = ?",
                [
                    $update['after']['distrito'],
                    $update['after']['provincia'],
                    $update['after']['departamento'],
                    $update['after']['region'],
                    $update['id_sede'],
                ]
            );
        }
        db()->commit();
    } catch (Throwable $error) {
        db()->rollBack();
        throw $error;
    }
}

echo "\nSummary\n";
echo "OK: " . count(array_filter($auditRows, fn($row) => $row['status'] === 'ok')) . "\n";
echo "Updates: " . count($updates) . "\n";
echo "Review: " . count($reviewRows) . "\n";
echo "SQL: $sqlPath\n";
echo "Audit: $auditPath\n";
echo "Review CSV: $reviewPath\n";
echo "Cache: $cachePath\n";

function geoAuditLoadSedes(array $ids, int $limit): array {
    $sql = "SELECT id_sede, nombre_comercial, direccion, distrito, provincia, departamento, region, coordenadas_gps, activo
            FROM Sede
            WHERE coordenadas_gps IS NOT NULL
              AND TRIM(coordenadas_gps) <> ''
              AND coordenadas_gps LIKE '%,%'";
    $params = [];
    if ($ids) {
        $sql .= " AND id_sede IN (" . implode(',', array_fill(0, count($ids), '?')) . ")";
        $params = array_merge($params, $ids);
    }
    $sql .= " ORDER BY id_sede";
    if ($limit > 0) {
        $sql .= " LIMIT ?";
        $params[] = $limit;
    }
    return db()->query($sql, $params);
}

function parseGeoAuditIds(string $value): array {
    if (trim($value) === '') return [];
    return array_values(array_filter(array_map(fn($item) => intval(trim($item)), explode(',', $value))));
}

function geoAuditGoogleReverse(float $lat, float $lng, string $apiKey, array &$cache): array {
    $params = ['latlng' => "$lat,$lng", 'language' => 'es', 'region' => 'pe'];
    ksort($params);
    $key = 'reverse:' . http_build_query($params);
    if (isset($cache[$key])) return $cache[$key];
    $params['key'] = $apiKey;
    $url = 'https://maps.googleapis.com/maps/api/geocode/json?' . http_build_query($params);
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 20,
        CURLOPT_CONNECTTIMEOUT => 8,
    ]);
    $raw = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    $payload = ($raw !== false && $httpCode === 200)
        ? (json_decode($raw, true) ?: ['status' => 'LOCAL_ERROR', 'results' => []])
        : ['status' => 'LOCAL_ERROR', 'results' => []];
    $cache[$key] = $payload;
    return $payload;
}

function geoAuditChanged(array $sede, array $location): bool {
    foreach (['distrito', 'provincia', 'departamento', 'region'] as $field) {
        if (geo_normalize_name($sede[$field] ?? '') !== geo_normalize_name($location[$field] ?? '')) {
            return true;
        }
    }
    return false;
}

function geoAuditCurrentLocation(array $sede): array {
    return [
        'distrito' => $sede['distrito'] ?? null,
        'provincia' => $sede['provincia'] ?? null,
        'departamento' => $sede['departamento'] ?? null,
        'region' => $sede['region'] ?? null,
    ];
}

function geoAuditReviewRow(array $sede, string $reason): array {
    return [
        'id_sede' => intval($sede['id_sede']),
        'nombre_comercial' => $sede['nombre_comercial'],
        'direccion' => $sede['direccion'],
        'distrito' => $sede['distrito'],
        'provincia' => $sede['provincia'],
        'departamento' => $sede['departamento'],
        'region' => $sede['region'],
        'coordenadas_gps' => $sede['coordenadas_gps'],
        'reason' => $reason,
    ];
}

function geoAuditPersist(string $cachePath, array $cache, string $sqlPath, string $auditPath, string $reviewPath, array $auditRows, array $updates, array $reviewRows): void {
    if (!is_dir(dirname($sqlPath))) mkdir(dirname($sqlPath), 0775, true);
    file_put_contents($cachePath, json_encode($cache, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    file_put_contents($auditPath, json_encode([
        'generated_at' => date('c'),
        'summary' => [
            'total' => count($auditRows),
            'ok' => count(array_filter($auditRows, fn($row) => $row['status'] === 'ok')),
            'updates' => count($updates),
            'review' => count($reviewRows),
        ],
        'rows' => $auditRows,
    ], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    file_put_contents($sqlPath, geoAuditSql($updates));
    file_put_contents($reviewPath, geoAuditCsv($reviewRows));
}

function geoAuditSql(array $updates): string {
    $lines = [
        '-- Sede district/province/department/region corrections generated from GPS audit',
        '-- Review the JSON audit and CSV review file before applying.',
        'START TRANSACTION;',
        '',
    ];
    foreach ($updates as $update) {
        $after = $update['after'];
        $lines[] = sprintf(
            "UPDATE `Sede` SET `distrito` = '%s', `provincia` = '%s', `departamento` = '%s', `region` = '%s', `fecha_modificacion` = NOW() WHERE `id_sede` = %d;",
            geoAuditSqlValue($after['distrito']),
            geoAuditSqlValue($after['provincia']),
            geoAuditSqlValue($after['departamento']),
            geoAuditSqlValue($after['region']),
            $update['id_sede']
        );
    }
    $lines[] = '';
    $lines[] = 'COMMIT;';
    $lines[] = '';
    return implode("\n", $lines);
}

function geoAuditSqlValue(?string $value): string {
    return str_replace("'", "''", (string) $value);
}

function geoAuditCsv(array $rows): string {
    $handle = fopen('php://temp', 'r+');
    fputcsv($handle, ['id_sede','nombre_comercial','direccion','distrito','provincia','departamento','region','coordenadas_gps','reason']);
    foreach ($rows as $row) {
        fputcsv($handle, [
            $row['id_sede'],
            $row['nombre_comercial'],
            $row['direccion'],
            $row['distrito'],
            $row['provincia'],
            $row['departamento'],
            $row['region'],
            $row['coordenadas_gps'],
            $row['reason'],
        ]);
    }
    rewind($handle);
    return stream_get_contents($handle);
}

function geoAuditLoadJson(string $path, mixed $default): mixed {
    if (!file_exists($path)) return $default;
    $payload = json_decode(file_get_contents($path), true);
    return $payload === null ? $default : $payload;
}
