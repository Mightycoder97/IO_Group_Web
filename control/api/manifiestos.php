<?php
/**
 * IO Group - Manifiestos API
 * CRUD operations for waste manifests
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';
require_once __DIR__ . '/helpers/ruta_plan.php';

$method = $_SERVER['REQUEST_METHOD'];
$id = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        if (isset($_GET['ruta_full'])) {
            getFullByRuta($_GET['ruta_full']);
        } else {
            $id ? getOne($id) : getAll();
        }
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
    
    $servicio = $_GET['servicio'] ?? null;
    $sede = $_GET['sede'] ?? null;
    $search = $_GET['search'] ?? '';
    
    // Paginación
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(200, max(10, intval($_GET['limit'] ?? 50)));
    $offset = ($page - 1) * $limit;
    
    // Consulta optimizada - solo campos necesarios
    $sql = "SELECT m.id_manifiesto, m.numero_manifiesto, m.tipo_residuo, m.peso_kg,
            m.fecha_creacion, s.mes_servicio, s.fecha_ejecucion as fecha_servicio, s.id_servicio,
            se.nombre_comercial as sede_nombre, se.id_sede
            FROM Manifiesto m
            INNER JOIN Servicio s ON m.id_servicio = s.id_servicio
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            WHERE 1=1";
    $params = [];
    
    if ($servicio) {
        $sql .= " AND m.id_servicio = ?";
        $params[] = $servicio;
    }
    
    if ($sede) {
        $sql .= " AND se.id_sede = ?";
        $params[] = $sede;
    }
    
    if ($search) {
        $sql .= " AND (m.numero_manifiesto LIKE ? OR m.tipo_residuo LIKE ? OR se.nombre_comercial LIKE ?)";
        $searchTerm = "%$search%";
        $params = array_merge($params, [$searchTerm, $searchTerm, $searchTerm]);
    }
    
    // Count total
    $countSql = preg_replace('/SELECT .* FROM/', 'SELECT COUNT(*) as total FROM', $sql, 1);
    $totalResult = db()->queryOne($countSql, $params);
    $total = $totalResult['total'] ?? 0;
    
    $sql .= " ORDER BY m.fecha_creacion DESC LIMIT ? OFFSET ?";
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

function getOne($id) {
    canView();
    
    $manifiesto = db()->queryOne(
        "SELECT m.*, s.mes_servicio, s.fecha_ejecucion as fecha_servicio, 
                se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                se.distrito as sede_distrito, se.provincia as sede_provincia, se.departamento as sede_departamento,
                e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
                c.nombre as cliente_nombre, c.dni as cliente_dni,
                v.placa as vehiculo_placa,
                p.nombre_comercial as planta_nombre,
                ch.nombres as chofer_nombres, ch.apellidos as chofer_apellidos, ch.dni as chofer_dni
         FROM Manifiesto m 
         INNER JOIN Servicio s ON m.id_servicio = s.id_servicio 
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
         LEFT JOIN Ruta r ON s.id_ruta = r.id_ruta
         LEFT JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
         LEFT JOIN Planta p ON s.id_planta = p.id_planta
         LEFT JOIN Empleado ch ON r.id_chofer = ch.id_empleado
         WHERE m.id_manifiesto = ?",
        [$id]
    );
    
    if (!$manifiesto) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Manifiesto no encontrado']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $manifiesto
    ]);
}

function getFullByRuta($id_ruta) {
    canView();
    $manifiestos = db()->query(
        "SELECT m.*, s.mes_servicio, s.fecha_ejecucion as fecha_servicio, s.id_servicio,
                se.id_sede, se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                se.distrito as sede_distrito, se.provincia as sede_provincia, se.departamento as sede_departamento,
                e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
                c.nombre as cliente_nombre, c.dni as cliente_dni,
                v.placa as vehiculo_placa,
                p.nombre_comercial as planta_nombre,
                ch.nombres as chofer_nombres, ch.apellidos as chofer_apellidos, ch.dni as chofer_dni
         FROM Servicio s
         LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio 
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
         LEFT JOIN Ruta r ON s.id_ruta = r.id_ruta
         LEFT JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
         LEFT JOIN Planta p ON s.id_planta = p.id_planta
         LEFT JOIN Empleado ch ON r.id_chofer = ch.id_empleado
         WHERE s.id_ruta = ?
         ORDER BY s.id_servicio ASC",
        [$id_ruta]
    );

    if (empty($manifiestos)) {
        $planSedes = getRutaPlanSedes($id_ruta);
        if (!empty($planSedes)) {
            $ids = array_map(function($item) { return intval($item['id_sede']); }, $planSedes);
            $placeholders = implode(',', array_fill(0, count($ids), '?'));
            
            // Get Route context
            $ruta = db()->queryOne(
                "SELECT r.fecha, v.placa as vehiculo_placa, 
                        ch.nombres as chofer_nombres, ch.apellidos as chofer_apellidos, ch.dni as chofer_dni 
                 FROM Ruta r 
                 LEFT JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo 
                 LEFT JOIN Empleado ch ON r.id_chofer = ch.id_empleado 
                 WHERE r.id_ruta = ?",
                [$id_ruta]
            );
            
            $rows = db()->query(
                "SELECT se.id_sede, se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                        se.distrito as sede_distrito, se.provincia as sede_provincia, se.departamento as sede_departamento,
                        e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
                        c.nombre as cliente_nombre, c.dni as cliente_dni
                 FROM Sede se
                 INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
                 INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
                 WHERE se.id_sede IN ($placeholders)",
                $ids
            );
            
            $bySede = [];
            foreach ($rows as $row) {
                $bySede[intval($row['id_sede'])] = $row;
            }
            
            foreach ($planSedes as $item) {
                $id_sede = intval($item['id_sede']);
                if (isset($bySede[$id_sede])) {
                    $m = $bySede[$id_sede];
                    if ($ruta) {
                        $m['vehiculo_placa'] = $ruta['vehiculo_placa'];
                        $m['chofer_nombres'] = $ruta['chofer_nombres'];
                        $m['chofer_apellidos'] = $ruta['chofer_apellidos'];
                        $m['chofer_dni'] = $ruta['chofer_dni'];
                        $m['fecha_servicio'] = $ruta['fecha'];
                    }
                    $m['tipo_residuo'] = $item['residuo'] ?? null;
                    $manifiestos[] = $m;
                }
            }
        }
    }
    
    echo json_encode([
        'success' => true,
        'data' => $manifiestos
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_servicio = $data['id_servicio'] ?? null;
    $tipo_residuo = $data['tipo_residuo'] ?? '';
    $peso_kg = $data['peso_kg'] ?? null;
    
    if (empty($id_servicio) || empty($tipo_residuo) || empty($peso_kg)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Servicio, tipo de residuo y peso son requeridos']);
        return;
    }
    
    // Check if service already has manifest
    $existing = db()->queryOne("SELECT id_manifiesto FROM Manifiesto WHERE id_servicio = ?", [$id_servicio]);
    if ($existing) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'El servicio ya tiene un manifiesto']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, codigo_residuo, descripcion_residuo, peso_kg, unidad_medida, cantidad_bultos, nombre_responsable, cargo_responsable, dni_responsable, observaciones) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $id_servicio,
            $data['numero_manifiesto'] ?? null,
            $tipo_residuo,
            $data['codigo_residuo'] ?? null,
            $data['descripcion_residuo'] ?? null,
            $peso_kg,
            $data['unidad_medida'] ?? 'kg',
            $data['cantidad_bultos'] ?? null,
            $data['nombre_responsable'] ?? null,
            $data['cargo_responsable'] ?? null,
            $data['dni_responsable'] ?? null,
            $data['observaciones'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Manifiesto', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Manifiesto creado exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Manifiesto WHERE id_manifiesto = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Manifiesto no encontrado']);
        return;
    }
    
    db()->execute(
        "UPDATE Manifiesto SET 
            numero_manifiesto = ?,
            tipo_residuo = COALESCE(?, tipo_residuo),
            codigo_residuo = ?,
            descripcion_residuo = ?,
            peso_kg = COALESCE(?, peso_kg),
            unidad_medida = ?,
            cantidad_bultos = ?,
            nombre_responsable = ?,
            cargo_responsable = ?,
            dni_responsable = ?,
            observaciones = ?,
            fecha_modificacion = NOW()
         WHERE id_manifiesto = ?",
        [
            $data['numero_manifiesto'] ?? $existing['numero_manifiesto'],
            $data['tipo_residuo'] ?? null,
            $data['codigo_residuo'] ?? $existing['codigo_residuo'],
            $data['descripcion_residuo'] ?? $existing['descripcion_residuo'],
            $data['peso_kg'] ?? null,
            $data['unidad_medida'] ?? $existing['unidad_medida'],
            $data['cantidad_bultos'] ?? $existing['cantidad_bultos'],
            $data['nombre_responsable'] ?? $existing['nombre_responsable'],
            $data['cargo_responsable'] ?? $existing['cargo_responsable'],
            $data['dni_responsable'] ?? $existing['dni_responsable'],
            $data['observaciones'] ?? $existing['observaciones'],
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Manifiesto', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Manifiesto actualizado exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    db()->execute("DELETE FROM Manifiesto WHERE id_manifiesto = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Manifiesto', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Manifiesto eliminado exitosamente'
    ]);
}
