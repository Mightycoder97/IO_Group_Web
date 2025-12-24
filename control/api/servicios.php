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
    
    // Paginación - IMPORTANTE para rendimiento
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(500, max(10, intval($_GET['limit'] ?? 100))); // Entre 10 y 500, default 100
    $offset = ($page - 1) * $limit;
    
    // Consulta optimizada con índices
    $sql = "SELECT s.id_servicio, s.codigo_servicio, s.fecha_programada, s.fecha_ejecucion, 
            s.estado, s.id_sede, s.id_planta,
            se.nombre_comercial as sede_nombre,
            e.razon_social as empresa_razon_social,
            p.nombre_comercial as planta_nombre
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            INNER JOIN Planta p ON s.id_planta = p.id_planta
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
        $sql .= " AND s.fecha_programada >= ?";
        $params[] = $fecha_desde;
    }
    
    if ($fecha_hasta) {
        $sql .= " AND s.fecha_programada <= ?";
        $params[] = $fecha_hasta;
    }
    
    // Obtener total para paginación (consulta optimizada)
    $countSql = str_replace(
        "SELECT s.id_servicio, s.codigo_servicio, s.fecha_programada, s.fecha_ejecucion, 
            s.estado, s.id_sede, s.id_planta,
            se.nombre_comercial as sede_nombre,
            e.razon_social as empresa_razon_social,
            p.nombre_comercial as planta_nombre",
        "SELECT COUNT(*) as total",
        $sql
    );
    $totalResult = db()->queryOne($countSql, $params);
    $total = $totalResult['total'] ?? 0;
    
    $sql .= " ORDER BY s.fecha_programada DESC LIMIT ? OFFSET ?";
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
         INNER JOIN Planta p ON s.id_planta = p.id_planta
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
    $id_planta = $data['id_planta'] ?? null;
    $fecha_programada = $data['fecha_programada'] ?? null;
    
    if (empty($id_sede) || empty($id_planta) || empty($fecha_programada)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Sede, planta y fecha programada son requeridos']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Servicio (id_sede, id_ruta, id_planta, id_contrato, codigo_servicio, fecha_programada, fecha_ejecucion, hora_llegada, hora_salida, estado, observaciones) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $id_sede,
            $data['id_ruta'] ?? null,
            $id_planta,
            $data['id_contrato'] ?? null,
            $data['codigo_servicio'] ?? null,
            $fecha_programada,
            $data['fecha_ejecucion'] ?? null,
            $data['hora_llegada'] ?? null,
            $data['hora_salida'] ?? null,
            $data['estado'] ?? 'programado',
            $data['observaciones'] ?? null
        ]
    );
    
    // Add employees if provided
    if (!empty($data['empleados'])) {
        foreach ($data['empleados'] as $emp) {
            db()->execute(
                "INSERT INTO ServicioEmpleado (id_servicio, id_empleado, rol) VALUES (?, ?, ?)",
                [$id, $emp['id_empleado'], $emp['rol'] ?? 'ayudante']
            );
        }
    }
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Servicio', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Servicio creado exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM Servicio WHERE id_servicio = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Servicio no encontrado']);
        return;
    }
    
    db()->execute(
        "UPDATE Servicio SET 
            id_sede = COALESCE(?, id_sede),
            id_ruta = ?,
            id_planta = COALESCE(?, id_planta),
            id_contrato = ?,
            codigo_servicio = ?,
            fecha_programada = COALESCE(?, fecha_programada),
            fecha_ejecucion = ?,
            hora_llegada = ?,
            hora_salida = ?,
            estado = ?,
            observaciones = ?,
            fecha_modificacion = NOW()
         WHERE id_servicio = ?",
        [
            $data['id_sede'] ?? null,
            $data['id_ruta'] ?? $existing['id_ruta'],
            $data['id_planta'] ?? null,
            $data['id_contrato'] ?? $existing['id_contrato'],
            $data['codigo_servicio'] ?? $existing['codigo_servicio'],
            $data['fecha_programada'] ?? null,
            $data['fecha_ejecucion'] ?? $existing['fecha_ejecucion'],
            $data['hora_llegada'] ?? $existing['hora_llegada'],
            $data['hora_salida'] ?? $existing['hora_salida'],
            $data['estado'] ?? $existing['estado'],
            $data['observaciones'] ?? $existing['observaciones'],
            $id
        ]
    );
    
    // Update employees if provided
    if (isset($data['empleados'])) {
        db()->execute("DELETE FROM ServicioEmpleado WHERE id_servicio = ?", [$id]);
        foreach ($data['empleados'] as $emp) {
            db()->execute(
                "INSERT INTO ServicioEmpleado (id_servicio, id_empleado, rol) VALUES (?, ?, ?)",
                [$id, $emp['id_empleado'], $emp['rol'] ?? 'ayudante']
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
