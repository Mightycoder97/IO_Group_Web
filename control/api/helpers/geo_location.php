<?php
/**
 * Geographic normalization helpers for operational sede routing.
 *
 * Sede.region is an operational routing region. Callao remains departamento
 * CALLAO, but is grouped under region LIMA for route assignment.
 */

function geo_catalog_locations(): array {
    static $locations = null;
    if ($locations !== null) return $locations;

    $rows = [
        'LIMA|LIMA|LIMA|ANCON',
        'LIMA|LIMA|LIMA|ATE',
        'LIMA|LIMA|LIMA|BARRANCO',
        'LIMA|LIMA|LIMA|BRENA',
        'LIMA|LIMA|LIMA|CARABAYLLO',
        'LIMA|LIMA|LIMA|CHACLACAYO',
        'LIMA|LIMA|LIMA|CHORRILLOS',
        'LIMA|LIMA|LIMA|CIENEGUILLA',
        'LIMA|LIMA|LIMA|COMAS',
        'LIMA|LIMA|LIMA|EL AGUSTINO',
        'LIMA|LIMA|LIMA|INDEPENDENCIA',
        'LIMA|LIMA|LIMA|JESUS MARIA',
        'LIMA|LIMA|LIMA|LA MOLINA',
        'LIMA|LIMA|LIMA|LA VICTORIA',
        'LIMA|LIMA|LIMA|LINCE',
        'LIMA|LIMA|LIMA|LOS OLIVOS',
        'LIMA|LIMA|LIMA|LURIGANCHO CHOSICA',
        'LIMA|LIMA|LIMA|LURIN',
        'LIMA|LIMA|LIMA|MAGDALENA DEL MAR',
        'LIMA|LIMA|LIMA|MIRAFLORES',
        'LIMA|LIMA|LIMA|PACHACAMAC',
        'LIMA|LIMA|LIMA|PUCUSANA',
        'LIMA|LIMA|LIMA|PUEBLO LIBRE',
        'LIMA|LIMA|LIMA|PUENTE PIEDRA',
        'LIMA|LIMA|LIMA|PUNTA HERMOSA',
        'LIMA|LIMA|LIMA|PUNTA NEGRA',
        'LIMA|LIMA|LIMA|RIMAC',
        'LIMA|LIMA|LIMA|SAN BARTOLO',
        'LIMA|LIMA|LIMA|SAN BORJA',
        'LIMA|LIMA|LIMA|SAN ISIDRO',
        'LIMA|LIMA|LIMA|SAN JUAN DE LURIGANCHO',
        'LIMA|LIMA|LIMA|SAN JUAN DE MIRAFLORES',
        'LIMA|LIMA|LIMA|SAN LUIS',
        'LIMA|LIMA|LIMA|SAN MARTIN DE PORRES',
        'LIMA|LIMA|LIMA|SAN MIGUEL',
        'LIMA|LIMA|LIMA|SANTA ANITA',
        'LIMA|LIMA|LIMA|SANTA MARIA DEL MAR',
        'LIMA|LIMA|LIMA|SANTA ROSA',
        'LIMA|LIMA|LIMA|SANTIAGO DE SURCO',
        'LIMA|LIMA|LIMA|SURQUILLO',
        'LIMA|LIMA|LIMA|VILLA EL SALVADOR',
        'LIMA|LIMA|LIMA|VILLA MARIA DEL TRIUNFO',
        'LIMA|LIMA|LIMA|CERCADO DE LIMA',
        'LIMA|LIMA|BARRANCA|BARRANCA',
        'LIMA|LIMA|BARRANCA|PARAMONGA',
        'LIMA|LIMA|BARRANCA|PATIVILCA',
        'LIMA|LIMA|BARRANCA|FORTALEZA',
        'LIMA|LIMA|BARRANCA|SUPE PUERTO',
        'LIMA|LIMA|CAJATAMBO|CAJATAMBO',
        'LIMA|LIMA|CAJATAMBO|COPA',
        'LIMA|LIMA|CAJATAMBO|GORGOR',
        'LIMA|LIMA|CAJATAMBO|HUANCAPON',
        'LIMA|LIMA|CAJATAMBO|MANAS',
        'LIMA|LIMA|CANTA|CANTA',
        'LIMA|LIMA|CANTA|ARAHUAY',
        'LIMA|LIMA|CANTA|HUAMANTANGA',
        'LIMA|LIMA|CANTA|HUAROS',
        'LIMA|LIMA|CANTA|LACHAQUI',
        'LIMA|LIMA|CANTA|SAN BUENAVENTURA',
        'LIMA|LIMA|CANTA|SANTA ROSA DE QUIVES',
        'LIMA|LIMA|CANETE|SAN VICENTE DE CANETE',
        'LIMA|LIMA|CANETE|ASIA',
        'LIMA|LIMA|CANETE|CALANGO',
        'LIMA|LIMA|CANETE|CERRO AZUL',
        'LIMA|LIMA|CANETE|COAYLLO',
        'LIMA|LIMA|CANETE|CHILCA',
        'LIMA|LIMA|CANETE|IMPERIAL',
        'LIMA|LIMA|CANETE|LUNAHUANA',
        'LIMA|LIMA|CANETE|MALA',
        'LIMA|LIMA|CANETE|NUEVO IMPERIAL',
        'LIMA|LIMA|CANETE|PACARAN',
        'LIMA|LIMA|CANETE|QUILMANA',
        'LIMA|LIMA|CANETE|SAN ANTONIO',
        'LIMA|LIMA|CANETE|SAN LUIS',
        'LIMA|LIMA|CANETE|SANTA CRUZ DE FLORES',
        'LIMA|LIMA|CANETE|ZUNIGA',
        'LIMA|LIMA|HUARAL|HUARAL',
        'LIMA|LIMA|HUARAL|ATAVILLOS ALTO',
        'LIMA|LIMA|HUARAL|ATAVILLOS BAJO',
        'LIMA|LIMA|HUARAL|AUCALLAMA',
        'LIMA|LIMA|HUARAL|CHANCAY',
        'LIMA|LIMA|HUARAL|IHUARI',
        'LIMA|LIMA|HUARAL|LAMPIAN',
        'LIMA|LIMA|HUARAL|PACARAOS',
        'LIMA|LIMA|HUARAL|SAN MIGUEL DE ACOS',
        'LIMA|LIMA|HUARAL|SANTA CRUZ DE ANDAMARCA',
        'LIMA|LIMA|HUARAL|SUMBILCA',
        'LIMA|LIMA|HUARAL|VEINTISIETE DE NOVIEMBRE',
        'LIMA|LIMA|HUAROCHIRI|MATUCANA',
        'LIMA|LIMA|HUAROCHIRI|ANTIOQUIA',
        'LIMA|LIMA|HUAROCHIRI|CALLAHUANCA',
        'LIMA|LIMA|HUAROCHIRI|CARAMPOMA',
        'LIMA|LIMA|HUAROCHIRI|CHICLA',
        'LIMA|LIMA|HUAROCHIRI|CUENCA',
        'LIMA|LIMA|HUAROCHIRI|HUACHUPAMPA',
        'LIMA|LIMA|HUAROCHIRI|HUANZA',
        'LIMA|LIMA|HUAROCHIRI|HUAROCHIRI',
        'LIMA|LIMA|HUAROCHIRI|LAHUAYTAMBO',
        'LIMA|LIMA|HUAROCHIRI|LANGA',
        'LIMA|LIMA|HUAROCHIRI|LARAOS',
        'LIMA|LIMA|HUAROCHIRI|MARIATANA',
        'LIMA|LIMA|HUAROCHIRI|RICARDO PALMA',
        'LIMA|LIMA|HUAROCHIRI|SAN ANDRES DE TUPICOCHA',
        'LIMA|LIMA|HUAROCHIRI|SAN ANTONIO',
        'LIMA|LIMA|HUAROCHIRI|SAN BARTOLOME',
        'LIMA|LIMA|HUAROCHIRI|SAN DAMIAN',
        'LIMA|LIMA|HUAROCHIRI|SAN JUAN DE IRIS',
        'LIMA|LIMA|HUAROCHIRI|SAN JUAN DE TANTARANCHE',
        'LIMA|LIMA|HUAROCHIRI|SAN LORENZO DE QUINTI',
        'LIMA|LIMA|HUAROCHIRI|SAN MATEO',
        'LIMA|LIMA|HUAROCHIRI|SAN MATEO DE OTAO',
        'LIMA|LIMA|HUAROCHIRI|SAN PEDRO DE CASTA',
        'LIMA|LIMA|HUAROCHIRI|SAN PEDRO DE HUANCAYRE',
        'LIMA|LIMA|HUAROCHIRI|SANGALLAYA',
        'LIMA|LIMA|HUAROCHIRI|SANTA CRUZ DE COCACHACRA',
        'LIMA|LIMA|HUAROCHIRI|SANTA EULALIA',
        'LIMA|LIMA|HUAROCHIRI|SANTIAGO DE ANCHUCAYA',
        'LIMA|LIMA|HUAROCHIRI|SANTIAGO DE TUNA',
        'LIMA|LIMA|HUAROCHIRI|SANTO DOMINGO DE LOS OLLEROS',
        'LIMA|LIMA|HUAROCHIRI|SURCO',
        'LIMA|LIMA|HUAURA|HUACHO',
        'LIMA|LIMA|HUAURA|AMBAR',
        'LIMA|LIMA|HUAURA|CALETA DE CARQUIN',
        'LIMA|LIMA|HUAURA|CHECRAS',
        'LIMA|LIMA|HUAURA|HUALMAY',
        'LIMA|LIMA|HUAURA|HUAURA',
        'LIMA|LIMA|HUAURA|LEONCIO PRADO',
        'LIMA|LIMA|HUAURA|PACCHO',
        'LIMA|LIMA|HUAURA|SANTA LEONOR',
        'LIMA|LIMA|HUAURA|SANTA MARIA',
        'LIMA|LIMA|HUAURA|SAYAN',
        'LIMA|LIMA|HUAURA|VEGUETA',
        'LIMA|LIMA|OYON|OYON',
        'LIMA|LIMA|OYON|ANDAJES',
        'LIMA|LIMA|OYON|CAUJUL',
        'LIMA|LIMA|OYON|COCHAMARCA',
        'LIMA|LIMA|OYON|NAVAN',
        'LIMA|LIMA|OYON|PACHANGARA',
        'LIMA|LIMA|YAUYOS|YAUYOS',
        'LIMA|LIMA|YAUYOS|ALIS',
        'LIMA|LIMA|YAUYOS|AYAUCA',
        'LIMA|LIMA|YAUYOS|AYAVIRI',
        'LIMA|LIMA|YAUYOS|AZANGARO',
        'LIMA|LIMA|YAUYOS|CACRA',
        'LIMA|LIMA|YAUYOS|CARANIA',
        'LIMA|LIMA|YAUYOS|CATAHUASI',
        'LIMA|LIMA|YAUYOS|CHOCOS',
        'LIMA|LIMA|YAUYOS|COCHAS',
        'LIMA|LIMA|YAUYOS|COLONIA',
        'LIMA|LIMA|YAUYOS|HONGOS',
        'LIMA|LIMA|YAUYOS|HUAMPARA',
        'LIMA|LIMA|YAUYOS|HUANCAYA',
        'LIMA|LIMA|YAUYOS|HUANGASCAR',
        'LIMA|LIMA|YAUYOS|HUANTAN',
        'LIMA|LIMA|YAUYOS|HUANEC',
        'LIMA|LIMA|YAUYOS|LARAOS',
        'LIMA|LIMA|YAUYOS|LINCHA',
        'LIMA|LIMA|YAUYOS|MADEAN',
        'LIMA|LIMA|YAUYOS|MIRAFLORES',
        'LIMA|LIMA|YAUYOS|OMAS',
        'LIMA|LIMA|YAUYOS|PUTINZA',
        'LIMA|LIMA|YAUYOS|QUINCHES',
        'LIMA|LIMA|YAUYOS|QUINOCAY',
        'LIMA|LIMA|YAUYOS|SAN JOAQUIN',
        'LIMA|LIMA|YAUYOS|SAN PEDRO DE PILAS',
        'LIMA|LIMA|YAUYOS|TANTA',
        'LIMA|LIMA|YAUYOS|TAURIPAMPA',
        'LIMA|LIMA|YAUYOS|TOMAS',
        'LIMA|LIMA|YAUYOS|TUPE',
        'LIMA|LIMA|YAUYOS|VINAC',
        'LIMA|LIMA|YAUYOS|VITIS',
        'ICA|ICA|ICA|ICA',
        'ICA|ICA|ICA|LA TINGUINA',
        'ICA|ICA|ICA|LOS AQUIJES',
        'ICA|ICA|ICA|OCUCAJE',
        'ICA|ICA|ICA|PACHACUTEC',
        'ICA|ICA|ICA|PARCONA',
        'ICA|ICA|ICA|PUEBLO NUEVO',
        'ICA|ICA|ICA|SALAS',
        'ICA|ICA|ICA|SAN JOSE DE LOS MOLINOS',
        'ICA|ICA|ICA|SAN JUAN BAUTISTA',
        'ICA|ICA|ICA|SANTIAGO',
        'ICA|ICA|ICA|SUBTANJALLA',
        'ICA|ICA|ICA|TATE',
        'ICA|ICA|ICA|YAUCA DEL ROSARIO',
        'ICA|ICA|CHINCHA|CHINCHA ALTA',
        'ICA|ICA|CHINCHA|ALTO LARAN',
        'ICA|ICA|CHINCHA|CHAVIN',
        'ICA|ICA|CHINCHA|CHINCHA BAJA',
        'ICA|ICA|CHINCHA|EL CARMEN',
        'ICA|ICA|CHINCHA|EL RECREO',
        'ICA|ICA|CHINCHA|GROCIO PRADO',
        'ICA|ICA|CHINCHA|PUEBLO NUEVO',
        'ICA|ICA|CHINCHA|SAN JUAN DE YANAC',
        'ICA|ICA|CHINCHA|SAN PEDRO DE HUACARPANA',
        'ICA|ICA|CHINCHA|SUNAMPE',
        'ICA|ICA|CHINCHA|TAMBO DE MORA',
        'ICA|ICA|NAZCA|NAZCA',
        'ICA|ICA|NAZCA|CHANGUILLO',
        'ICA|ICA|NAZCA|EL INGENIO',
        'ICA|ICA|NAZCA|MARCONA',
        'ICA|ICA|NAZCA|VISTA ALEGRE',
        'ICA|ICA|PALPA|PALPA',
        'ICA|ICA|PALPA|LLIPATA',
        'ICA|ICA|PALPA|RIO GRANDE',
        'ICA|ICA|PALPA|SANTA CRUZ',
        'ICA|ICA|PALPA|TIBILLO',
        'ICA|ICA|PISCO|PISCO',
        'ICA|ICA|PISCO|HUANCANO',
        'ICA|ICA|PISCO|HUMAY',
        'ICA|ICA|PISCO|INDEPENDENCIA',
        'ICA|ICA|PISCO|PARACAS',
        'ICA|ICA|PISCO|SAN ANDRES',
        'ICA|ICA|PISCO|SAN CLEMENTE',
        'ICA|ICA|PISCO|TUPAC AMARU INCA',
        'LIMA|CALLAO|CALLAO|CALLAO',
        'LIMA|CALLAO|CALLAO|BELLAVISTA',
        'LIMA|CALLAO|CALLAO|CARMEN DE LA LEGUA REYNOSO',
        'LIMA|CALLAO|CALLAO|LA PERLA',
        'LIMA|CALLAO|CALLAO|LA PUNTA',
        'LIMA|CALLAO|CALLAO|MI PERU',
        'LIMA|CALLAO|CALLAO|VENTANILLA',
    ];

    $locations = [];
    foreach ($rows as $row) {
        [$region, $department, $province, $district] = explode('|', $row);
        $locations[] = [
            'region' => $region,
            'departamento' => $department,
            'provincia' => $province,
            'distrito' => $district,
        ];
    }
    return $locations;
}

function geo_location_index(): array {
    static $index = null;
    if ($index !== null) return $index;

    $byDistrict = [];
    foreach (geo_catalog_locations() as $location) {
        $key = geo_normalize_name($location['distrito']);
        $byDistrict[$key][] = $location;
    }

    $aliases = [
        'SURCO' => ['distrito' => 'SANTIAGO DE SURCO', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'LURIGANCHO' => ['distrito' => 'LURIGANCHO CHOSICA', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'LURIGANCHO CHOSICA' => ['distrito' => 'LURIGANCHO CHOSICA', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'MAGDALENA' => ['distrito' => 'MAGDALENA DEL MAR', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'CERCADO' => ['distrito' => 'CERCADO DE LIMA', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'LIMA CERCADO' => ['distrito' => 'CERCADO DE LIMA', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'ATE VITARTE' => ['distrito' => 'ATE', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'SJL' => ['distrito' => 'SAN JUAN DE LURIGANCHO', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'SAN JUAN DE LURIGANCHO 1' => ['distrito' => 'SAN JUAN DE LURIGANCHO', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'SJM' => ['distrito' => 'SAN JUAN DE MIRAFLORES', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'VES' => ['distrito' => 'VILLA EL SALVADOR', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'VMT' => ['distrito' => 'VILLA MARIA DEL TRIUNFO', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'SMP' => ['distrito' => 'SAN MARTIN DE PORRES', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
        'CANETE' => ['distrito' => 'SAN VICENTE DE CANETE', 'provincia' => 'CANETE', 'departamento' => 'LIMA'],
        'SAN VICENTE' => ['distrito' => 'SAN VICENTE DE CANETE', 'provincia' => 'CANETE', 'departamento' => 'LIMA'],
        'CHINCHA' => ['distrito' => 'CHINCHA ALTA', 'provincia' => 'CHINCHA', 'departamento' => 'ICA'],
        'PISCO ICA' => ['distrito' => 'PISCO', 'provincia' => 'PISCO', 'departamento' => 'ICA'],
        'ICA PISCO' => ['distrito' => 'PISCO', 'provincia' => 'PISCO', 'departamento' => 'ICA'],
        'CALLAO BELLAVISTA' => ['distrito' => 'BELLAVISTA', 'provincia' => 'CALLAO', 'departamento' => 'CALLAO'],
        'CALLAO VENTANILLA' => ['distrito' => 'VENTANILLA', 'provincia' => 'CALLAO', 'departamento' => 'CALLAO'],
        'PUENTE PIEDRA SANTA ROSA' => ['distrito' => 'SANTA ROSA', 'provincia' => 'LIMA', 'departamento' => 'LIMA'],
    ];

    $index = [
        'by_district' => $byDistrict,
        'aliases' => array_combine(
            array_map('geo_normalize_name', array_keys($aliases)),
            array_values($aliases)
        ),
    ];
    return $index;
}

function geo_normalize_name(?string $value): string {
    $value = trim((string) $value);
    if ($value === '') return '';
    $value = strtr($value, [
        "\u{00C1}" => 'A', "\u{00C9}" => 'E', "\u{00CD}" => 'I', "\u{00D3}" => 'O', "\u{00DA}" => 'U',
        "\u{00E1}" => 'A', "\u{00E9}" => 'E', "\u{00ED}" => 'I', "\u{00F3}" => 'O', "\u{00FA}" => 'U',
        "\u{00DC}" => 'U', "\u{00FC}" => 'U', "\u{00D1}" => 'N', "\u{00F1}" => 'N',
    ]);
    if (function_exists('iconv')) {
        $converted = @iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $value);
        if ($converted !== false) $value = $converted;
    }
    $value = strtoupper($value);
    $value = preg_replace('/[^A-Z0-9]+/', ' ', $value);
    return trim(preg_replace('/\s+/', ' ', $value));
}

function geo_resolve_location(?string $district, ?string $province = null, ?string $department = null): ?array {
    $districtKey = geo_normalize_name($district);
    $provinceKey = geo_normalize_name($province);
    $departmentKey = geo_normalize_name($department);
    if ($districtKey === '') return null;

    $index = geo_location_index();
    if (isset($index['aliases'][$districtKey])) {
        $alias = $index['aliases'][$districtKey];
        $districtKey = geo_normalize_name($alias['distrito']);
        $provinceKey = $provinceKey ?: geo_normalize_name($alias['provincia']);
        $departmentKey = $departmentKey ?: geo_normalize_name($alias['departamento']);
    }

    $candidates = $index['by_district'][$districtKey] ?? [];
    if (!$candidates) return null;

    $best = null;
    $bestScore = -1;
    foreach ($candidates as $candidate) {
        $score = 0;
        if ($provinceKey && geo_normalize_name($candidate['provincia']) === $provinceKey) $score += 4;
        if ($departmentKey && geo_normalize_name($candidate['departamento']) === $departmentKey) $score += 3;
        if ($departmentKey === 'CALLAO' && $candidate['departamento'] === 'CALLAO') $score += 6;
        if ($departmentKey === 'ICA' && $candidate['region'] === 'ICA') $score += 2;
        if ($departmentKey === 'LIMA' && $candidate['region'] === 'LIMA') $score += 1;
        if ($score > $bestScore) {
            $bestScore = $score;
            $best = $candidate;
        }
    }

    if (!$best) return null;
    $best['ambiguous'] = count($candidates) > 1 && $bestScore <= 0;
    return $best;
}

function geo_region_from_department(?string $department): ?string {
    $department = geo_normalize_name($department);
    if ($department === 'ICA') return 'ICA';
    if ($department === 'LIMA' || $department === 'CALLAO') return 'LIMA';
    return null;
}

function geo_enrich_sede_payload(array $payload, array $existing = []): array {
    $merged = array_merge($existing, $payload);
    $gps = $merged['coordenadas_gps'] ?? null;
    $resolved = null;
    $meta = ['source' => 'fallback'];

    if (geo_parse_gps($gps)) {
        $fromGps = geo_resolve_from_gps($gps);
        if ($fromGps) {
            $resolved = $fromGps['location'];
            $meta = $fromGps['meta'];
        }
    }

    if (!$resolved) {
        $resolved = geo_resolve_location(
            $merged['distrito'] ?? null,
            $merged['provincia'] ?? null,
            $merged['departamento'] ?? null
        );
    }

    if ($resolved) {
        $payload['distrito'] = $resolved['distrito'];
        $payload['provincia'] = $resolved['provincia'];
        $payload['departamento'] = $resolved['departamento'];
        $payload['region'] = $resolved['region'];
        $payload['_geo_meta'] = $meta;
        return $payload;
    }

    $region = $merged['region'] ?? geo_region_from_department($merged['departamento'] ?? null);
    if ($region) $payload['region'] = $region;
    $payload['_geo_meta'] = ['source' => 'unresolved'];
    return $payload;
}

function geo_parse_gps(?string $value): ?array {
    if (!$value || !str_contains($value, ',')) return null;
    [$lat, $lng] = array_map('trim', explode(',', $value, 2));
    if (!is_numeric($lat) || !is_numeric($lng)) return null;
    $lat = floatval($lat);
    $lng = floatval($lng);
    if ($lat < -20 || $lat > 0 || $lng < -82 || $lng > -68) return null;
    return ['lat' => $lat, 'lng' => $lng];
}

function geo_resolve_from_gps(?string $gps): ?array {
    $coords = geo_parse_gps($gps);
    if (!$coords) return null;

    $mapsConfig = @include __DIR__ . '/../config/maps.php';
    $apiKey = trim($mapsConfig['api_key'] ?? '');
    if ($apiKey === '' || stripos($apiKey, 'YOUR_') !== false) return null;

    $payload = geo_google_reverse_geocode($coords['lat'], $coords['lng'], $apiKey);
    foreach (($payload['results'] ?? []) as $result) {
        $location = geo_location_from_google_result($result);
        if ($location) {
            return [
                'location' => $location,
                'meta' => [
                    'source' => 'google_reverse',
                    'formatted_address' => $result['formatted_address'] ?? '',
                    'location_type' => $result['geometry']['location_type'] ?? null,
                ],
            ];
        }
    }
    return null;
}

function geo_location_from_google_result(array $result): ?array {
    $districtCandidates = [];
    $provinceCandidates = [];
    $departmentCandidates = [];

    foreach (($result['address_components'] ?? []) as $component) {
        $types = $component['types'] ?? [];
        $long = $component['long_name'] ?? '';
        $short = $component['short_name'] ?? '';

        if (array_intersect($types, ['locality', 'administrative_area_level_3', 'sublocality', 'sublocality_level_1'])) {
            $districtCandidates[] = $long;
            $districtCandidates[] = $short;
        }
        if (in_array('administrative_area_level_2', $types, true)) {
            $provinceCandidates[] = $long;
            $provinceCandidates[] = $short;
        }
        if (in_array('administrative_area_level_1', $types, true)) {
            $departmentCandidates[] = $long;
            $departmentCandidates[] = $short;
        }
    }

    $provinceCandidates[] = '';
    $departmentCandidates[] = '';
    foreach (array_unique(array_filter($districtCandidates)) as $district) {
        foreach (array_unique($provinceCandidates) as $province) {
            foreach (array_unique($departmentCandidates) as $department) {
                $normalizedDepartment = geo_clean_google_area($department);
                $normalizedProvince = geo_clean_google_area($province);
                $location = geo_resolve_location($district, $normalizedProvince, $normalizedDepartment);
                if ($location) return $location;
            }
        }
    }

    return null;
}

function geo_clean_google_area(?string $value): string {
    $value = geo_normalize_name($value);
    if (str_contains($value, 'CALLAO')) return 'CALLAO';
    $value = preg_replace('/\b(PROVINCIA DE|REGION DE|DEPARTAMENTO DE)\b/', '', $value);
    $value = preg_replace('/\b(PROVINCIA|REGION|DEPARTAMENTO|PROVINCE)\b/', '', $value);
    $value = trim(preg_replace('/\s+/', ' ', $value));
    if ($value === 'LIMA REGION') return 'LIMA';
    if ($value === 'PROVINCIA CONSTITUCIONAL DEL CALLAO') return 'CALLAO';
    return $value;
}

function geo_google_reverse_geocode(float $lat, float $lng, string $apiKey): array {
    if (!function_exists('curl_init')) {
        return ['status' => 'LOCAL_ERROR', 'error_message' => 'PHP cURL extension is not enabled', 'results' => []];
    }

    $params = [
        'latlng' => $lat . ',' . $lng,
        'language' => 'es',
        'region' => 'pe',
        'key' => $apiKey,
    ];
    $url = 'https://maps.googleapis.com/maps/api/geocode/json?' . http_build_query($params);
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 12,
        CURLOPT_CONNECTTIMEOUT => 5,
    ]);
    $raw = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($raw === false || $httpCode !== 200) {
        return ['status' => 'LOCAL_ERROR', 'error_message' => "HTTP $httpCode", 'results' => []];
    }
    return json_decode($raw, true) ?: ['status' => 'LOCAL_ERROR', 'error_message' => 'Invalid JSON from Google', 'results' => []];
}

function geo_normalize_contract_frequency(?string $value): array {
    $raw = trim((string) $value);
    $key = geo_normalize_name($raw);
    if ($key === '') return ['frecuencia' => null, 'review' => 'sin frecuencia'];

    if (str_contains($key, 'INTERDIARIO') || str_contains($key, 'CADA 72') ||
        str_contains($key, '3 VECES') || str_contains($key, '03 VECES') ||
        str_contains($key, '2 VECES POR SEMANA')) {
        return ['frecuencia' => 'interdiario', 'review' => null];
    }
    if (str_contains($key, 'QUINCENAL') || str_contains($key, '15CENAL')) {
        return ['frecuencia' => 'quincenal', 'review' => null];
    }
    if (str_contains($key, 'BIMENSUAL') || str_contains($key, 'BIMESTRAL')) {
        return ['frecuencia' => 'bimestral', 'review' => null];
    }
    if (str_contains($key, 'SEMANAL')) {
        return ['frecuencia' => 'semanal', 'review' => null];
    }
    if (str_contains($key, 'MENSUAL') && !str_contains($key, 'ORDEN')) {
        return ['frecuencia' => 'mensual', 'review' => null];
    }
    if ($key === 'DIARIO') return ['frecuencia' => 'diario', 'review' => null];
    if ($key === 'TRIMESTRAL') return ['frecuencia' => 'trimestral', 'review' => null];
    if ($key === 'EVENTUAL') return ['frecuencia' => 'eventual', 'review' => null];

    return ['frecuencia' => null, 'review' => 'frecuencia requiere revision: ' . $raw];
}

function geo_contract_frequency_value(?string $value, string $fallback = 'eventual'): string {
    $normalized = geo_normalize_contract_frequency($value);
    return $normalized['frecuencia'] ?: $fallback;
}
