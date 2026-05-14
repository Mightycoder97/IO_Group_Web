<?php
/**
 * IO Group - Sedes API
 * CRUD operations for locations/branches
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';
require_once __DIR__ . '/helpers/geo_location.php';

$method = $_SERVER['REQUEST_METHOD'];
$id = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        $id ? getOne($id) : getAll();
        break;
    case 'POST':
        create();
        break;
    case 'PUT':
        update($id);
        break;
    case 'DELETE':
        delete($id);
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

function getAll() {
    canView();
    
    $search = $_GET['search'] ?? '';
    $empresa = $_GET['empresa'] ?? null;
    $activo = $_GET['activo'] ?? null;
    $mapa = $_GET['mapa'] ?? null;
    
    // Paginación
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(5000, max(10, intval($_GET['limit'] ?? 100)));
    $offset = ($page - 1) * $limit;
    
    // Si es para el mapa, devolvemos solo campos esenciales + frecuencia del contrato activo más reciente
    if ($mapa === 'meta') {
        getMapMeta();
        return;
    }

    if ($mapa) {
        getMapSedes();
        return;
    }
    
    // Consulta optimizada - solo campos necesarios
    $sql = "SELECT s.id_sede, s.nombre_comercial, s.direccion, s.distrito, s.provincia, s.departamento, s.region, s.activo,
            s.contacto_nombre, s.contacto_telefono, s.contacto_telefono_2, s.coordenadas_gps,
            e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
            cs.tarifa as tarifa_servicio, cs.frecuencia
            FROM Sede s
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            LEFT JOIN (
                SELECT cs1.id_sede, cs1.tarifa, cs1.frecuencia
                FROM ContratoServicio cs1
                WHERE cs1.activo = 1
                AND cs1.fecha_inicio = (
                    SELECT MAX(cs2.fecha_inicio) FROM ContratoServicio cs2
                    WHERE cs2.id_sede = cs1.id_sede AND cs2.activo = 1
                )
            ) cs ON s.id_sede = cs.id_sede
            WHERE 1=1";
    $params = [];
    
    if ($search) {
        $sql .= " AND (s.nombre_comercial LIKE ? OR s.direccion LIKE ? OR e.razon_social LIKE ? OR e.ruc LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm, $searchTerm]);
    }
    
    if ($empresa) {
        $sql .= " AND s.id_empresa = ?";
        $params[] = $empresa;
    }
    
    if ($activo !== null) {
        $sql .= " AND s.activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    // Count total
    $countSql = "SELECT COUNT(*) as total FROM Sede s INNER JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE 1=1";
    $countParams = [];
    if ($search) {
        $countSql .= " AND (s.nombre_comercial LIKE ? OR s.direccion LIKE ? OR e.razon_social LIKE ? OR e.ruc LIKE ?)";
        $countParams = array_merge($countParams, [$searchTerm, $searchTerm, $searchTerm, $searchTerm]);
    }
    if ($empresa) { $countSql .= " AND s.id_empresa = ?"; $countParams[] = $empresa; }
    if ($activo !== null) { $countSql .= " AND s.activo = ?"; $countParams[] = $activo === 'true' ? 1 : 0; }
    $totalResult = db()->queryOne($countSql, $countParams);
    $total = $totalResult['total'] ?? 0;
    
    $sql .= " ORDER BY s.nombre_comercial LIMIT ? OFFSET ?";
    $params[] = $limit;
    $params[] = $offset;
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => $total,
        'page' => $page,
        'limit' => $limit,
        'pages' => ceil($total / $limit)
    ]);
}

function getMapSedes() {
    $latExpr = mapLatExpression();
    $lngExpr = mapLngExpression();
    $validWhere = mapValidCoordinateWhere($latExpr, $lngExpr);
    $params = [];
    $search = trim($_GET['search'] ?? '');
    $limit = min(900, max(50, intval($_GET['limit'] ?? 550)));

    if ($search !== '') {
        $limit = min($limit, 30);
    }

    $sql = "SELECT s.id_sede, s.nombre_comercial, s.direccion, s.distrito, s.provincia, s.departamento, s.region,
            s.coordenadas_gps, s.activo,
            e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
            cs.frecuencia
            FROM Sede s
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            " . mapContractJoinSql() . "
            WHERE $validWhere";

    if ($search !== '') {
        $sql .= " AND (s.nombre_comercial LIKE ? OR s.direccion LIKE ? OR e.razon_social LIKE ? OR e.ruc LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm, $searchTerm]);
    } else {
        $bounds = readMapBounds();
        if ($bounds) {
            $sql .= " AND $latExpr BETWEEN ? AND ? AND $lngExpr BETWEEN ? AND ?";
            $params = array_merge($params, [$bounds['south'], $bounds['north'], $bounds['west'], $bounds['east']]);
        }
    }

    $sql .= " ORDER BY s.activo DESC, s.nombre_comercial LIMIT ?";
    $params[] = $limit;

    $data = db()->query($sql, $params);

    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data),
        'limit' => $limit,
        'limit_hit' => count($data) >= $limit,
    ]);
}

function getMapMeta() {
    $latExpr = mapLatExpression();
    $lngExpr = mapLngExpression();
    $validWhere = mapValidCoordinateWhere($latExpr, $lngExpr);

    $summary = db()->queryOne(
        "SELECT COUNT(*) as total,
                SUM(CASE WHEN s.activo <> 0 THEN 1 ELSE 0 END) as active
         FROM Sede s
         WHERE $validWhere"
    );

    $districtRows = db()->query(
        "SELECT COALESCE(NULLIF(TRIM(s.region), ''), 'Sin region') as region,
                COALESCE(NULLIF(TRIM(s.distrito), ''), 'Sin distrito') as distrito,
                COUNT(*) as total
         FROM Sede s
         WHERE $validWhere
         GROUP BY COALESCE(NULLIF(TRIM(s.region), ''), 'Sin region'),
                  COALESCE(NULLIF(TRIM(s.distrito), ''), 'Sin distrito')
         ORDER BY region, distrito"
    );

    echo json_encode([
        'success' => true,
        'data' => [
            'total' => intval($summary['total'] ?? 0),
            'active' => intval($summary['active'] ?? 0),
            'invalid_coordinates' => getInvalidMapCoordinateCount(),
            'bounds' => mapAllowedBounds(),
            'districts' => $districtRows,
        ],
    ]);
}

function mapLatExpression() {
    return "CAST(TRIM(SUBSTRING_INDEX(s.coordenadas_gps, ',', 1)) AS DECIMAL(10,6))";
}

function mapLngExpression() {
    return "CAST(TRIM(SUBSTRING_INDEX(s.coordenadas_gps, ',', -1)) AS DECIMAL(10,6))";
}

function mapAllowedBounds() {
    return [
        'lima' => ['south' => -13.45, 'north' => -10.15, 'west' => -78.15, 'east' => -75.25],
        'ica' => ['south' => -15.55, 'north' => -12.75, 'west' => -76.55, 'east' => -74.45],
    ];
}

function mapValidCoordinateWhere($latExpr, $lngExpr) {
    $bounds = mapAllowedBounds();
    $lima = $bounds['lima'];
    $ica = $bounds['ica'];

    return "s.coordenadas_gps IS NOT NULL
            AND TRIM(s.coordenadas_gps) != ''
            AND s.coordenadas_gps LIKE '%,%'
            AND (
                ($latExpr BETWEEN {$lima['south']} AND {$lima['north']}
                    AND $lngExpr BETWEEN {$lima['west']} AND {$lima['east']})
                OR
                ($latExpr BETWEEN {$ica['south']} AND {$ica['north']}
                    AND $lngExpr BETWEEN {$ica['west']} AND {$ica['east']})
            )";
}

function mapPresentCoordinateWhere() {
    return "s.coordenadas_gps IS NOT NULL
            AND TRIM(s.coordenadas_gps) != ''
            AND s.coordenadas_gps LIKE '%,%'";
}

function getInvalidMapCoordinateCount() {
    $latExpr = mapLatExpression();
    $lngExpr = mapLngExpression();
    $presentWhere = mapPresentCoordinateWhere();
    $validWhere = mapValidCoordinateWhere($latExpr, $lngExpr);
    $row = db()->queryOne(
        "SELECT COUNT(*) as total
         FROM Sede s
         WHERE $presentWhere AND NOT ($validWhere)"
    );

    return intval($row['total'] ?? 0);
}

function readMapBounds() {
    $north = readFloatParam('north');
    $south = readFloatParam('south');
    $east = readFloatParam('east');
    $west = readFloatParam('west');

    if ($north === null || $south === null || $east === null || $west === null) {
        return null;
    }

    if ($north < $south) {
        [$north, $south] = [$south, $north];
    }
    if ($east < $west) {
        [$east, $west] = [$west, $east];
    }

    return [
        'north' => min(0, max(-20, $north)),
        'south' => min(0, max(-20, $south)),
        'east' => min(-68, max(-82, $east)),
        'west' => min(-68, max(-82, $west)),
    ];
}

function readFloatParam($key) {
    if (!isset($_GET[$key]) || $_GET[$key] === '') {
        return null;
    }

    return is_numeric($_GET[$key]) ? floatval($_GET[$key]) : null;
}

function mapContractJoinSql() {
    return "LEFT JOIN (
                SELECT cs1.id_sede, cs1.frecuencia
                FROM ContratoServicio cs1
                INNER JOIN (
                    SELECT id_sede, MAX(id_contrato) AS id_contrato
                    FROM ContratoServicio
                    WHERE activo = 1
                    GROUP BY id_sede
                ) latest ON latest.id_contrato = cs1.id_contrato
            ) cs ON s.id_sede = cs.id_sede";
}

function getOne($id) {
    canView();
    
    $sede = db()->queryOne(
        "SELECT s.*, e.razon_social as empresa_razon_social, e.ruc as empresa_ruc
         FROM Sede s 
         INNER JOIN Empresa e ON s.id_empresa = e.id_empresa 
         WHERE s.id_sede = ?",
        [$id]
    );
    
    if (!$sede) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Sede no encontrada']);
        return;
    }
    
    // Get contracts
    $contratos = db()->query(
        "SELECT * FROM ContratoServicio WHERE id_sede = ? ORDER BY fecha_inicio DESC",
        [$id]
    );
    
    $sede['contratos'] = $contratos;
    
    echo json_encode([
        'success' => true,
        'data' => $sede
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Check if this is a unified request (nested format with cliente/empresa/sede)
    if (isset($data['cliente']) || isset($data['empresa']) || isset($data['sede'])) {
        // Redirect to sedes-unified handler
        require_once __DIR__ . '/sedes-unified-handler.php';
        handleUnifiedCreate($user, $data);
        return;
    }
    
    $id_empresa = $data['id_empresa'] ?? null;
    $nombre_comercial = $data['nombre_comercial'] ?? '';
    $direccion = $data['direccion'] ?? '';
    
    if (empty($id_empresa) || empty($nombre_comercial) || empty($direccion)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Empresa, nombre comercial y dirección son requeridos']);
        return;
    }
    
    $data = geo_enrich_sede_payload($data);
    unset($data['_geo_meta']);

    $id = db()->insert(
        "INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, region, referencia, coordenadas_gps, contacto_nombre, contacto_telefono, contacto_telefono_2, contacto_email, activo)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $id_empresa,
            $nombre_comercial,
            $direccion,
            $data['distrito'] ?? null,
            $data['provincia'] ?? null,
            $data['departamento'] ?? null,
            $data['region'] ?? null,
            $data['referencia'] ?? null,
            $data['coordenadas_gps'] ?? null,
            $data['contacto_nombre'] ?? null,
            $data['contacto_telefono'] ?? null,
            $data['contacto_telefono_2'] ?? null,
            $data['contacto_email'] ?? null,
            isset($data['activo']) ? ($data['activo'] ? 1 : 0) : 1
        ]
    );

    // Create contract if data is provided
    $contrato = $data['contrato'] ?? [];
    if (!empty($contrato['fecha_inicio']) && !empty($contrato['frecuencia']) && isset($contrato['tarifa'])) {
        db()->insert(
            "INSERT INTO ContratoServicio (id_sede, fecha_inicio, fecha_fin, frecuencia, peso_limite_kg, tarifa, tipo_tarifa, activo) 
             VALUES (?, ?, ?, ?, ?, ?, ?, 1)",
            [
                $id,
                $contrato['fecha_inicio'],
                $contrato['fecha_fin'] ?? null,
                geo_contract_frequency_value($contrato['frecuencia'] ?? null),
                $contrato['peso_limite_kg'] ?? null,
                $contrato['tarifa'],
                $contrato['tipo_tarifa'] ?? 'por_servicio'
            ]
        );
    }
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Sede', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode(['nombre_comercial' => $nombre_comercial])]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Sede creada exitosamente',
        'id' => $id
    ]);
}

function update($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    $existing = db()->queryOne("SELECT * FROM Sede WHERE id_sede = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Sede no encontrada']);
        return;
    }
    
    $data = geo_enrich_sede_payload($data, $existing);
    unset($data['_geo_meta']);

    db()->execute(
        "UPDATE Sede SET 
            id_empresa = COALESCE(?, id_empresa),
            nombre_comercial = COALESCE(?, nombre_comercial),
            direccion = COALESCE(?, direccion),
            distrito = ?,
            provincia = ?,
            departamento = ?,
            region = ?,
            referencia = ?,
            coordenadas_gps = ?,
            contacto_nombre = ?,
            contacto_telefono = ?,
            contacto_telefono_2 = ?,
            contacto_email = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_sede = ?",
        [
            !empty($data['id_empresa']) ? $data['id_empresa'] : null,
            !empty($data['nombre_comercial']) ? $data['nombre_comercial'] : null,
            !empty($data['direccion']) ? $data['direccion'] : null,
            $data['distrito'] ?? $existing['distrito'],
            $data['provincia'] ?? $existing['provincia'],
            $data['departamento'] ?? $existing['departamento'],
            $data['region'] ?? ($existing['region'] ?? null),
            $data['referencia'] ?? $existing['referencia'],
            $data['coordenadas_gps'] ?? $existing['coordenadas_gps'],
            $data['contacto_nombre'] ?? $existing['contacto_nombre'],
            $data['contacto_telefono'] ?? $existing['contacto_telefono'],
            $data['contacto_telefono_2'] ?? $existing['contacto_telefono_2'],
            $data['contacto_email'] ?? $existing['contacto_email'],
            isset($data['activo']) ? ($data['activo'] ? 1 : 0) : null,
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Sede', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing, JSON_INVALID_UTF8_SUBSTITUTE), json_encode($data, JSON_INVALID_UTF8_SUBSTITUTE)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Sede actualizada exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    // Cascade soft delete: Deactivate associated contracts
    db()->execute(
        "UPDATE ContratoServicio SET activo = 0, fecha_modificacion = NOW() WHERE id_sede = ?",
        [$id]
    );
    
    db()->execute(
        "UPDATE Sede SET activo = 0, fecha_modificacion = NOW() WHERE id_sede = ?",
        [$id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Sede', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Sede eliminada exitosamente'
    ]);
}
