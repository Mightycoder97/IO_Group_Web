<?php
/**
 * IO Group - Servicios API
 * CRUD operations for services (main operational entity)
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$id = $_GET['id'] ?? null;
$action = $_GET['action'] ?? null;

switch ($method) {
    case 'GET':
        if ($action === 'stats') getStats();
        elseif ($id) getOne($id);
        else getAll();
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
    
    $sede = $_GET['sede'] ?? null;
    $estado = $_GET['estado'] ?? null;
    $fecha_desde = $_GET['fecha_desde'] ?? null;
    $fecha_hasta = $_GET['fecha_hasta'] ?? null;
    $cliente = $_GET['cliente'] ?? null;
    $busqueda = $_GET['busqueda'] ?? null;
    
    // Paginación - IMPORTANTE para rendimiento
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(500, max(10, intval($_GET['limit'] ?? 100))); // Entre 10 y 500, default 100
    $offset = ($page - 1) * $limit;
    
    // Consulta con nueva estructura de Servicio
    $sql = "SELECT s.id_servicio, s.id_sede, s.id_ruta, s.id_planta, s.id_contrato,
            s.mes_servicio, s.fecha_ejecucion as fecha_servicio,
            s.estado,
            COALESCE(s.estado_pago, 'pendiente') as estado_pago,
            s.fecha_pago, s.forma_pago, s.residuo, s.observaciones,
            se.nombre_comercial AS sede_nombre,
            se.direccion AS sede_direccion, 
            cs.tarifa as tarifa_servicio, se.contacto_telefono,
            e.razon_social as empresa_razon_social,
            p.nombre_comercial as planta_nombre,
            NULL as numero_contrato,
            m.id_manifiesto, m.numero_manifiesto, m.peso_kg as peso_residuo,
            g.id_guia, g.numero_guia,
            f.id_factura, f.numero_factura
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
            LEFT JOIN Planta p ON s.id_planta = p.id_planta
            LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
            LEFT JOIN Guia g ON s.id_servicio = g.id_servicio
            LEFT JOIN Factura f ON s.id_servicio = f.id_servicio
            WHERE 1=1";
    $params = [];
    
    if ($sede) {
        $sql .= " AND s.id_sede = ?";
        $params[] = $sede;
    }
    
    if ($estado) {
        $sql .= " AND s.estado = ?";
        $params[] = $estado;
    }
    
    if ($fecha_desde) {
        $sql .= " AND s.fecha_ejecucion >= ?";
        $params[] = $fecha_desde;
    }
    
    if ($fecha_hasta) {
        $sql .= " AND s.fecha_ejecucion <= ?";
        $params[] = $fecha_hasta;
    }
    
    if ($cliente) {
        $sql .= " AND e.id_cliente = ?";
        $params[] = $cliente;
    }
    
    if ($busqueda) {
        $sql .= " AND (se.nombre_comercial LIKE ? OR e.razon_social LIKE ? OR e.ruc LIKE ?)";
        $searchTerm = "%" . $busqueda . "%";
        $params[] = $searchTerm;
        $params[] = $searchTerm;
        $params[] = $searchTerm;
    }
    
    // Obtener total para paginación (consulta con prepared statements - SEC-03 fix)
    $countSql = "SELECT COUNT(DISTINCT s.id_servicio) as total FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            WHERE 1=1";
    $countParams = [];
    if ($sede) {
        $countSql .= " AND s.id_sede = ?";
        $countParams[] = intval($sede);
    }
    if ($estado) {
        $countSql .= " AND s.estado = ?";
        $countParams[] = $estado;
    }
    if ($cliente) {
        $countSql .= " AND e.id_cliente = ?";
        $countParams[] = intval($cliente);
    }
    if ($busqueda) {
        $countSql .= " AND (se.nombre_comercial LIKE ? OR e.razon_social LIKE ? OR e.ruc LIKE ?)";
        $searchTermCount = "%" . $busqueda . "%";
        $countParams[] = $searchTermCount;
        $countParams[] = $searchTermCount;
        $countParams[] = $searchTermCount;
    }
    $totalResult = db()->queryOne($countSql, $countParams);
    $total = $totalResult['total'] ?? 0;
    
    $sql .= " ORDER BY s.fecha_ejecucion DESC LIMIT ? OFFSET ?";
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
    
    $servicio = db()->queryOne(
        "SELECT s.*, 
                se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                e.razon_social as empresa_razon_social,
                p.nombre_comercial as planta_nombre,
                r.codigo_ruta, v.placa as vehiculo_placa
         FROM Servicio s
         INNER JOIN Sede se ON s.id_sede = se.id_sede
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         LEFT JOIN Planta p ON s.id_planta = p.id_planta
         LEFT JOIN Ruta r ON s.id_ruta = r.id_ruta
         LEFT JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
         WHERE s.id_servicio = ?",
        [$id]
    );
    
    if (!$servicio) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Servicio no encontrado']);
        return;
    }
    
    // Get employees
    $empleados = db()->query(
        "SELECT e.*, se.rol 
         FROM ServicioEmpleado se
         INNER JOIN Empleado e ON se.id_empleado = e.id_empleado
         WHERE se.id_servicio = ?",
        [$id]
    );
    
    // Get manifest
    $manifiesto = db()->queryOne(
        "SELECT * FROM Manifiesto WHERE id_servicio = ?",
        [$id]
    );
    
    // Get guide
    $guia = db()->queryOne(
        "SELECT * FROM Guia WHERE id_servicio = ?",
        [$id]
    );
    
    // Get invoice
    $factura = db()->queryOne(
        "SELECT * FROM Factura WHERE id_servicio = ?",
        [$id]
    );
    
    $servicio['empleados'] = $empleados;
    $servicio['manifiesto'] = $manifiesto;
    $servicio['guia'] = $guia;
    $servicio['factura'] = $factura;
    
    echo json_encode([
        'success' => true,
        'data' => $servicio
    ]);
}

function getStats() {
    canView();
    
    // Una sola consulta para todas las estadísticas - mucho más eficiente
    $result = db()->queryOne("
        SELECT 
            COUNT(*) as total_servicios,
            SUM(CASE WHEN fecha_programada = CURDATE() THEN 1 ELSE 0 END) as servicios_hoy,
            SUM(CASE WHEN MONTH(fecha_programada) = MONTH(CURDATE()) AND YEAR(fecha_programada) = YEAR(CURDATE()) THEN 1 ELSE 0 END) as servicios_mes,
            SUM(CASE WHEN estado = 'programado' THEN 1 ELSE 0 END) as pendientes,
            SUM(CASE WHEN estado = 'en_curso' THEN 1 ELSE 0 END) as en_curso,
            SUM(CASE WHEN estado = 'completado' THEN 1 ELSE 0 END) as completados
        FROM Servicio
    ");
    
    echo json_encode([
        'success' => true,
        'data' => [
            'total_servicios' => intval($result['total_servicios']),
            'servicios_hoy' => intval($result['servicios_hoy']),
            'servicios_mes' => intval($result['servicios_mes']),
            'pendientes' => intval($result['pendientes']),
            'en_curso' => intval($result['en_curso']),
            'completados' => intval($result['completados'])
        ]
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_sede = $data['id_sede'] ?? null;
    $fecha_ejecucion = $data['fecha_ejecucion'] ?? null;
    
    if (empty($id_sede)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Sede es requerida']);
        return;
    }
        $id_servicio = db()->insert(
            "INSERT INTO Servicio (id_sede, id_ruta, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, fecha_pago, residuo) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [
                $data['id_sede'],
                $data['id_ruta'] ?? null,
                $data['id_planta'] ?? null,
                $data['id_contrato'] ?? null,
                $data['mes_servicio'] ?? null,
                $data['fecha_ejecucion'] ?? null,
                $data['estado'] ?? 'programado',
                $data['estado_pago'] ?? 'pendiente',
                $data['forma_pago'] ?? null,
                $data['fecha_pago'] ?? null,
                $data['residuo'] ?? null
            ]
        ); // Add employees if provided
    if (!empty($data['empleados'])) {
        foreach ($data['empleados'] as $emp) {
            db()->execute(
                "INSERT INTO ServicioEmpleado (id_servicio, id_empleado, rol) VALUES (?, ?, ?)",
                [$id_servicio, $emp['id_empleado'], $emp['rol'] ?? 'ayudante']
            );
        }
    }
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Servicio', ?, 'INSERT', ?)",
        [$user['id'], $id_servicio, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Servicio creado exitosamente',
        'id' => $id_servicio
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
    
    // Extract nested fields specifically added
    $peso_kg = $data['peso_kg'] ?? null;
    $numero_manifiesto = $data['numero_manifiesto'] ?? null;
    $numero_guia = $data['numero_guia'] ?? null;
    $numero_factura = $data['numero_factura'] ?? null;
    
    $existing = db()->queryOne("SELECT * FROM Servicio WHERE id_servicio = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Servicio no encontrado']);
        return;
    }
    
    db()->execute(
        "UPDATE Servicio SET 
            id_sede = ?,
            id_ruta = ?,
            id_planta = ?,
            id_contrato = ?,
            fecha_ejecucion = ?,
            estado = ?,
            estado_pago = ?,
            forma_pago = ?,
            fecha_pago = ?,
            residuo = ?,
            observaciones = ?,
            mes_servicio = ?,
            fecha_modificacion = NOW()
        WHERE id_servicio = ?",
        [
            $data['id_sede'] ?? $existing['id_sede'],
            array_key_exists('id_ruta', $data) ? $data['id_ruta'] : $existing['id_ruta'],
            $data['id_planta'] ?? $existing['id_planta'],
            $data['id_contrato'] ?? $existing['id_contrato'],
            $data['fecha_ejecucion'] ?? $existing['fecha_ejecucion'],
            $data['estado'] ?? $existing['estado'],
            $data['estado_pago'] ?? $existing['estado_pago'],
            $data['forma_pago'] ?? $existing['forma_pago'],
            $data['fecha_pago'] ?? $existing['fecha_pago'],
            $data['residuo'] ?? $existing['residuo'],
            $data['observaciones'] ?? $existing['observaciones'] ?? null,
            $data['mes_servicio'] ?? $existing['mes_servicio'],
            $id
        ]
    );// Update employees if provided
    if (isset($data['empleados'])) {
        db()->execute("DELETE FROM ServicioEmpleado WHERE id_servicio = ?", [$id]);
        foreach ($data['empleados'] as $emp) {
            db()->execute(
                "INSERT INTO ServicioEmpleado (id_servicio, id_empleado, rol) VALUES (?, ?, ?)",
                [$id, $emp['id_empleado'], $emp['rol'] ?? 'ayudante']
            );
        }
    }
    
    // Handle Manifiesto update/insert if weight or manifest number is provided
    if ($peso_kg !== null || $numero_manifiesto !== null) {
        $man_exists = db()->queryOne("SELECT id_manifiesto FROM Manifiesto WHERE id_servicio = ?", [$id]);
        $tipo_residuo = $data['residuo'] ?? $existing['residuo'] ?? 'No especificado';
        
        if ($man_exists) {
            db()->execute(
                "UPDATE Manifiesto SET numero_manifiesto = COALESCE(?, numero_manifiesto), peso_kg = COALESCE(?, peso_kg), tipo_residuo = ? WHERE id_servicio = ?",
                [$numero_manifiesto, $peso_kg, $tipo_residuo, $id]
            );
        } else {
            // Only insert if we have at least weight or manifest (and it isn't empty)
            if ($peso_kg || $numero_manifiesto) {
                db()->execute(
                    "INSERT INTO Manifiesto (id_servicio, numero_manifiesto, peso_kg, tipo_residuo) VALUES (?, ?, ?, ?)",
                    [$id, $numero_manifiesto, $peso_kg ?? 0, $tipo_residuo]
                );
            }
        }
    }

    // Handle Guia update/insert if guide number is provided
    if ($numero_guia !== null && trim($numero_guia) !== '') {
        $guia_exists = db()->queryOne("SELECT id_guia FROM Guia WHERE id_servicio = ?", [$id]);
        
        if ($guia_exists) {
            db()->execute(
                "UPDATE Guia SET numero_guia = ? WHERE id_servicio = ?",
                [$numero_guia, $id]
            );
        } else {
            db()->execute(
                "INSERT INTO Guia (id_servicio, numero_guia, fecha_emision) VALUES (?, ?, COALESCE(?, CURDATE()))",
                [$id, $numero_guia, $data['fecha_ejecucion'] ?? $existing['fecha_ejecucion']]
            );
        }
    }

    // Handle Factura update/insert if invoice number is provided
    if ($numero_factura !== null && trim($numero_factura) !== '') {
        $factura_exists = db()->queryOne("SELECT id_factura FROM Factura WHERE id_servicio = ?", [$id]);
        
        if ($factura_exists) {
            db()->execute(
                "UPDATE Factura SET numero_factura = ? WHERE id_servicio = ?",
                [$numero_factura, $id]
            );
        } else {
            db()->execute(
                "INSERT INTO Factura (id_servicio, numero_factura) VALUES (?, ?)",
                [$id, $numero_factura]
            );
        }
    }

    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Servicio', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Servicio actualizado exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    // Check for related records
    $manifiesto = db()->queryOne("SELECT id_manifiesto FROM Manifiesto WHERE id_servicio = ?", [$id]);
    $guia = db()->queryOne("SELECT id_guia FROM Guia WHERE id_servicio = ?", [$id]);
    $factura = db()->queryOne("SELECT id_factura FROM Factura WHERE id_servicio = ?", [$id]);
    
    if ($manifiesto || $guia || $factura) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'message' => 'No se puede eliminar: el servicio tiene documentos asociados'
        ]);
        return;
    }
    
    // Delete employees first
    db()->execute("DELETE FROM ServicioEmpleado WHERE id_servicio = ?", [$id]);
    db()->execute("DELETE FROM Servicio WHERE id_servicio = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Servicio', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Servicio eliminado exitosamente'
    ]);
}
