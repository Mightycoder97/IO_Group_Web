<?php
/**
 * Strict Google Maps geocoding audit for Sede coordinates.
 *
 * CLI usage:
 *   php api/geocode_sedes_strict.php
 *   php api/geocode_sedes_strict.php --limit=50
 *   php api/geocode_sedes_strict.php --ids=850,1386 --apply
 *
 * Default mode is dry-run: it writes SQL and JSON audit files without updating DB.
 * Coordinates are accepted only when Google result components/formatted address match
 * the expected district, so a sede cannot be auto-updated outside its district.
 */

if (PHP_SAPI !== 'cli') {
    http_response_code(403);
    echo json_encode([
        'success' => false,
        'message' => 'Este proceso debe ejecutarse por CLI para evitar timeouts y consumo accidental de cuota.',
    ]);
    exit;
}

require_once __DIR__ . '/config/database.php';
$mapsConfig = require __DIR__ . '/config/maps.php';

$apiKey = trim($mapsConfig['api_key'] ?? '');
if ($apiKey === '' || stripos($apiKey, 'YOUR_') !== false) {
    fwrite(STDERR, "No GOOGLE_MAPS_API_KEY configured. Set it in .env before running.\n");
    exit(1);
}

$options = getopt('', ['apply', 'limit:', 'ids:', 'delay:', 'output-dir:']);
$apply = array_key_exists('apply', $options);
$limit = max(0, intval($options['limit'] ?? 0));
$delay = max(0, floatval($options['delay'] ?? 0.12));
$ids = parseIds($options['ids'] ?? '');
$outputDir = isset($options['output-dir'])
    ? rtrim($options['output-dir'], "/\\")
    : realpath(__DIR__ . '/../database/migrations');
if (!$outputDir) {
    $outputDir = __DIR__ . '/../database/migrations';
}

$cachePath = $outputDir . '/geocode_sedes_strict_google_cache.json';
$auditPath = $outputDir . '/geocode_sedes_strict_audit.json';
$sqlPath = $outputDir . '/geocode_sedes_strict_updates.sql';
$cache = loadJson($cachePath, []);

$sedes = loadSedes($ids, $limit);
$audit = [];
$updates = [];

echo "Strict Google geocoding audit\n";
echo "Sedes: " . count($sedes) . "\n";
echo "Mode: " . ($apply ? 'APPLY' : 'DRY-RUN') . "\n\n";

foreach ($sedes as $index => $sede) {
    $current = parseCoords($sede['coordenadas_gps'] ?? '');
    $currentStatus = ['status' => 'missing', 'district_match' => false, 'reason' => 'sin coordenadas'];

    if ($current) {
        $reverse = googleReverseGeocode($current['lat'], $current['lng'], $apiKey, $cache);
        $currentStatus = evaluateBestGoogleResult($reverse['payload']['results'] ?? [], $sede, 'reverse_current');
    }

    $needsUpdate = !$current || !$currentStatus['district_match'];
    $accepted = null;
    $candidates = [];

    if ($needsUpdate) {
        foreach (buildAddressCandidates($sede) as $candidate) {
            $payload = googleGeocode($candidate['query'], $apiKey, $cache);
            $best = bestCandidateResult($payload['results'] ?? [], $sede, $candidate['kind']);
            $result = $best['result'];
            $evaluation = $best['evaluation'];
            $option = [
                'kind' => $candidate['kind'],
                'query' => $candidate['query'],
                'google_status' => $payload['status'] ?? 'UNKNOWN',
                'evaluation' => $evaluation,
            ];

            if ($result && $evaluation['accepted']) {
                $location = $result['geometry']['location'];
                $option['lat'] = round(floatval($location['lat']), 6);
                $option['lng'] = round(floatval($location['lng']), 6);
                $option['formatted_address'] = $result['formatted_address'] ?? '';
                if (!$accepted || $evaluation['score'] > $accepted['evaluation']['score']) {
                    $accepted = $option;
                }
            }

            $candidates[] = $option;
            if ($accepted && $accepted['evaluation']['confidence'] === 'high') {
                break;
            }
            usleep((int) ($delay * 1000000));
        }
    }

    $rowAudit = [
        'id_sede' => intval($sede['id_sede']),
        'nombre_comercial' => $sede['nombre_comercial'],
        'direccion' => $sede['direccion'],
        'distrito' => $sede['distrito'],
        'provincia' => $sede['provincia'],
        'coordenadas_actuales' => $sede['coordenadas_gps'],
        'current_status' => $currentStatus,
        'needs_update' => $needsUpdate,
        'accepted' => $accepted,
        'candidates' => $candidates,
    ];

    if ($accepted) {
        $coords = number_format($accepted['lat'], 6, '.', '') . ',' . number_format($accepted['lng'], 6, '.', '');
        $rowAudit['new_coords'] = $coords;
        $updates[] = [
            'id_sede' => intval($sede['id_sede']),
            'coords' => $coords,
        ];
    }

    $audit[] = $rowAudit;
    $label = $needsUpdate ? ($accepted ? 'UPDATE' : 'REVIEW') : 'OK';
    printf(
        "[%04d/%04d] #%s %-42s %s\n",
        $index + 1,
        count($sedes),
        $sede['id_sede'],
        substr($sede['nombre_comercial'], 0, 42),
        $label
    );

    if (($index + 1) % 25 === 0) {
        persistOutputs($cachePath, $cache, $auditPath, $audit, $sqlPath, $updates);
    }
}

persistOutputs($cachePath, $cache, $auditPath, $audit, $sqlPath, $updates);

if ($apply && $updates) {
    db()->beginTransaction();
    try {
        foreach ($updates as $update) {
            db()->execute(
                "UPDATE Sede SET coordenadas_gps = ?, fecha_modificacion = NOW() WHERE id_sede = ?",
                [$update['coords'], $update['id_sede']]
            );
        }
        db()->commit();
    } catch (Throwable $error) {
        db()->rollBack();
        throw $error;
    }
}

echo "\nSummary\n";
echo "OK actuales: " . count(array_filter($audit, fn($row) => !$row['needs_update'])) . "\n";
echo "Actualizaciones aceptadas: " . count($updates) . "\n";
echo "Revision manual: " . count(array_filter($audit, fn($row) => $row['needs_update'] && !$row['accepted'])) . "\n";
echo "SQL: $sqlPath\n";
echo "Audit: $auditPath\n";
echo "Cache: $cachePath\n";
if (!$apply) {
    echo "Dry-run completo. Ejecuta con --apply para actualizar la base.\n";
}

function loadSedes(array $ids, int $limit): array {
    $sql = "SELECT s.id_sede, s.nombre_comercial, s.direccion, s.distrito, s.provincia,
                   s.departamento, s.coordenadas_gps, e.razon_social as empresa_razon_social,
                   e.ruc as empresa_ruc
            FROM Sede s
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            WHERE s.activo = 1
              AND s.direccion IS NOT NULL
              AND TRIM(s.direccion) <> ''";
    $params = [];

    if ($ids) {
        $placeholders = implode(',', array_fill(0, count($ids), '?'));
        $sql .= " AND s.id_sede IN ($placeholders)";
        $params = array_merge($params, $ids);
    }

    $sql .= " ORDER BY s.id_sede";
    if ($limit > 0) {
        $sql .= " LIMIT ?";
        $params[] = $limit;
    }

    return db()->query($sql, $params);
}

function parseIds(string $value): array {
    if (trim($value) === '') return [];
    return array_values(array_filter(array_map(
        fn($item) => intval(trim($item)),
        explode(',', $value)
    )));
}

function parseCoords(?string $value): ?array {
    if (!$value || !str_contains($value, ',')) return null;
    [$lat, $lng] = array_map('trim', explode(',', $value, 2));
    if (!is_numeric($lat) || !is_numeric($lng)) return null;
    return ['lat' => floatval($lat), 'lng' => floatval($lng)];
}

function buildAddressCandidates(array $sede): array {
    $baseParts = [
        clean($sede['direccion']),
        clean($sede['distrito']),
        clean($sede['provincia']),
        clean($sede['departamento']),
        'Peru',
    ];
    $address = joinUniqueParts($baseParts);
    $nameAddress = joinUniqueParts([
        clean($sede['nombre_comercial']),
        clean($sede['direccion']),
        clean($sede['distrito']),
        clean($sede['provincia']),
        'Peru',
    ]);
    $companyAddress = joinUniqueParts([
        clean($sede['empresa_razon_social']),
        clean($sede['direccion']),
        clean($sede['distrito']),
        clean($sede['provincia']),
        'Peru',
    ]);

    $items = [
        ['kind' => 'address', 'query' => $address],
        ['kind' => 'name_address', 'query' => $nameAddress],
        ['kind' => 'company_address', 'query' => $companyAddress],
    ];

    $seen = [];
    return array_values(array_filter($items, function ($item) use (&$seen) {
        $key = canonical($item['query']);
        if ($key === '' || isset($seen[$key])) return false;
        $seen[$key] = true;
        return true;
    }));
}

function googleGeocode(string $query, string $apiKey, array &$cache): array {
    return googleRequest('geocode', ['address' => $query, 'region' => 'pe', 'language' => 'es'], $apiKey, $cache);
}

function googleReverseGeocode(float $lat, float $lng, string $apiKey, array &$cache): array {
    $payload = googleRequest('reverse', ['latlng' => "$lat,$lng", 'language' => 'es'], $apiKey, $cache);
    return ['payload' => $payload, 'result' => $payload['results'][0] ?? null];
}

function googleRequest(string $kind, array $params, string $apiKey, array &$cache): array {
    if (!function_exists('curl_init')) {
        return [
            'status' => 'LOCAL_ERROR',
            'error_message' => 'PHP cURL extension is not enabled',
            'results' => [],
        ];
    }

    ksort($params);
    $cacheKey = $kind . ':' . http_build_query($params);
    if (isset($cache[$cacheKey])) {
        return $cache[$cacheKey];
    }

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
    $curlError = curl_error($ch);
    curl_close($ch);

    if ($raw === false || $httpCode !== 200) {
        $payload = [
            'status' => 'LOCAL_ERROR',
            'error_message' => $curlError ?: "HTTP $httpCode",
            'results' => [],
        ];
    } else {
        $payload = json_decode($raw, true) ?: [
            'status' => 'LOCAL_ERROR',
            'error_message' => 'Invalid JSON from Google',
            'results' => [],
        ];
    }

    $cache[$cacheKey] = $payload;
    return $payload;
}

function evaluateGoogleResult(?array $result, array $sede, string $kind): array {
    if (!$result) {
        return [
            'accepted' => false,
            'district_match' => false,
            'confidence' => 'missing',
            'score' => 0,
            'reason' => 'sin resultado Google',
        ];
    }

    $districtMatch = resultMatchesDistrict($result, $sede['distrito'] ?? '');
    $countryOk = resultCountryIsPeru($result);
    $locationType = $result['geometry']['location_type'] ?? '';
    $types = $result['types'] ?? [];
    $score = scoreLocation($locationType, $types);

    if ($districtMatch) $score += 30;
    if ($countryOk) $score += 20;
    if (!empty($result['partial_match'])) $score -= 20;
    if ($kind === 'reverse_current') $score += 5;

    $localityOnly = empty(array_intersect($types, ['street_address', 'premise', 'subpremise', 'establishment', 'point_of_interest', 'route']));
    $accepted = $countryOk && $districtMatch && $score >= 70 && !($locationType === 'APPROXIMATE' && $localityOnly);
    $confidence = $score >= 105 ? 'high' : ($score >= 70 ? 'medium' : 'low');

    return [
        'accepted' => $accepted,
        'district_match' => $districtMatch,
        'country_ok' => $countryOk,
        'confidence' => $confidence,
        'score' => $score,
        'location_type' => $locationType,
        'types' => $types,
        'formatted_address' => $result['formatted_address'] ?? '',
        'reason' => $accepted ? 'coordenada aceptada' : 'no cumple distrito/pais/precision',
    ];
}

function evaluateBestGoogleResult(array $results, array $sede, string $kind): array {
    return bestCandidateResult($results, $sede, $kind)['evaluation'];
}

function bestCandidateResult(array $results, array $sede, string $kind): array {
    $bestResult = null;
    $bestEvaluation = null;

    foreach (array_slice($results, 0, 5) as $result) {
        $evaluation = evaluateGoogleResult($result, $sede, $kind);
        if (!$bestEvaluation || $evaluation['score'] > $bestEvaluation['score']) {
            $bestEvaluation = $evaluation;
            $bestResult = $result;
        }
        if ($evaluation['accepted'] && $evaluation['confidence'] === 'high') {
            break;
        }
    }

    return [
        'result' => $bestResult,
        'evaluation' => $bestEvaluation ?: evaluateGoogleResult(null, $sede, $kind),
    ];
}

function scoreLocation(string $locationType, array $types): int {
    $score = match ($locationType) {
        'ROOFTOP' => 65,
        'RANGE_INTERPOLATED' => 52,
        'GEOMETRIC_CENTER' => 38,
        'APPROXIMATE' => 12,
        default => 0,
    };

    if (array_intersect($types, ['street_address', 'premise', 'subpremise'])) {
        $score += 18;
    } elseif (array_intersect($types, ['establishment', 'point_of_interest'])) {
        $score += 12;
    } elseif (in_array('route', $types, true)) {
        $score += 6;
    }

    return $score;
}

function resultMatchesDistrict(array $result, ?string $district): bool {
    $aliases = districtAliases($district);
    if (!$aliases) return false;

    $haystack = [canonical($result['formatted_address'] ?? '')];
    foreach (($result['address_components'] ?? []) as $component) {
        $haystack[] = canonical($component['long_name'] ?? '');
        $haystack[] = canonical($component['short_name'] ?? '');
    }

    foreach ($aliases as $alias) {
        foreach ($haystack as $value) {
            if ($alias !== '' && str_contains($value, $alias)) {
                return true;
            }
        }
    }
    return false;
}

function resultCountryIsPeru(array $result): bool {
    foreach (($result['address_components'] ?? []) as $component) {
        if (in_array('country', $component['types'] ?? [], true)) {
            return ($component['short_name'] ?? '') === 'PE';
        }
    }
    return str_contains(canonical($result['formatted_address'] ?? ''), 'PERU');
}

function districtAliases(?string $district): array {
    $canonical = canonical($district);
    if ($canonical === '') return [];
    $aliases = [
        'SURCO' => ['SURCO', 'SANTIAGO DE SURCO'],
        'SANTIAGO DE SURCO' => ['SURCO', 'SANTIAGO DE SURCO'],
        'SJM' => ['SAN JUAN DE MIRAFLORES'],
        'SAN JUAN DE MIRAFLORES' => ['SAN JUAN DE MIRAFLORES', 'SJM'],
        'SJL' => ['SAN JUAN DE LURIGANCHO'],
        'SAN JUAN DE LURIGANCHO' => ['SAN JUAN DE LURIGANCHO', 'SJL'],
        'VMT' => ['VILLA MARIA DEL TRIUNFO'],
        'VILLA MARIA DEL TRIUNFO' => ['VILLA MARIA DEL TRIUNFO', 'VMT'],
        'VES' => ['VILLA EL SALVADOR'],
        'VILLA EL SALVADOR' => ['VILLA EL SALVADOR', 'VES'],
        'ATE VITARTE' => ['ATE', 'ATE VITARTE'],
        'ATE' => ['ATE', 'ATE VITARTE'],
        'LA VICTORIA' => ['LA VICTORIA', 'GAMARRA'],
        'GAMARRA' => ['LA VICTORIA', 'GAMARRA'],
    ];
    return array_values(array_unique($aliases[$canonical] ?? [$canonical]));
}

function clean(?string $value): string {
    return trim(preg_replace('/\s+/', ' ', $value ?? ''));
}

function joinUniqueParts(array $parts): string {
    $clean = [];
    $seen = [];
    foreach ($parts as $part) {
        $part = clean($part);
        $key = canonical($part);
        if ($part === '' || isset($seen[$key])) continue;
        $seen[$key] = true;
        $clean[] = $part;
    }
    return implode(', ', $clean);
}

function canonical(?string $value): string {
    $value = strtoupper(clean($value));
    $from = ['Á', 'É', 'Í', 'Ó', 'Ú', 'Ü', 'Ñ'];
    $to = ['A', 'E', 'I', 'O', 'U', 'U', 'N'];
    $value = str_replace($from, $to, $value);
    return preg_replace('/[^A-Z0-9 ]+/', ' ', $value);
}

function loadJson(string $path, mixed $default): mixed {
    if (!file_exists($path)) return $default;
    $payload = json_decode(file_get_contents($path), true);
    return $payload === null ? $default : $payload;
}

function persistOutputs(string $cachePath, array $cache, string $auditPath, array $audit, string $sqlPath, array $updates): void {
    if (!is_dir(dirname($cachePath))) {
        mkdir(dirname($cachePath), 0775, true);
    }
    file_put_contents($cachePath, json_encode($cache, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
    file_put_contents($auditPath, json_encode([
        'generated_at' => date('c'),
        'summary' => [
            'total' => count($audit),
            'ok_current' => count(array_filter($audit, fn($row) => !$row['needs_update'])),
            'updates' => count($updates),
            'manual_review' => count(array_filter($audit, fn($row) => $row['needs_update'] && !$row['accepted'])),
        ],
        'rows' => $audit,
    ], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));

    $lines = [
        '-- Strict Google geocoding updates',
        '-- Review geocode_sedes_strict_audit.json before applying manually.',
        'START TRANSACTION;',
        '',
    ];
    foreach ($updates as $update) {
        $coords = str_replace("'", "''", $update['coords']);
        $lines[] = "UPDATE `Sede` SET `coordenadas_gps` = '$coords', `fecha_modificacion` = NOW() WHERE `id_sede` = {$update['id_sede']};";
    }
    $lines[] = '';
    $lines[] = 'COMMIT;';
    $lines[] = '';
    file_put_contents($sqlPath, implode("\n", $lines));
}
