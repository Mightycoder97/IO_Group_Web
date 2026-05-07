<?php
/**
 * IO Group - Rutas API
 * CRUD operations for transport routes
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';
require_once __DIR__ . '/helpers/ruta_plan.php';

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
    
    $vehiculo = $_GET['vehiculo'] ?? null;
    $estado = $_GET['estado'] ?? null;
    $fecha = $_GET['fecha'] ?? null;
    $mes = $_GET['mes'] ?? null;
    $anio = $_GET['anio'] ?? null;
    $distrito = $_GET['distrito'] ?? null;
    $limit = min(200, max(10, intval($_GET['limit'] ?? 100)));
    
    // Optimized query using LEFT JOIN instead of correlated subqueries
    $sql = "SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca, v.modelo as vehiculo_modelo,
            COUNT(DISTINCT s.id_servicio) as total_servicios,
            COUNT(DISTINCT s.id_sede) as sedes_count,
            SUM(CASE WHEN s.id_servicio IS NOT NULL AND (s.estado_pago IS NULL OR s.estado_pago = 'pendiente') THEN 1 ELSE 0 END) as pendientes_pago,
            CONCAT(ch.nombres, ' ', ch.apellidos) as chofer_nombre,
            CONCAT(ay.nombres, ' ', ay.apellidos) as ayudante_nombre
            FROM Ruta r
            INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
            LEFT JOIN Servicio s ON s.id_ruta = r.id_ruta
            LEFT JOIN Empleado ch ON r.id_chofer = ch.id_empleado
            LEFT JOIN Empleado ay ON r.id_ayudante = ay.id_empleado
            WHERE 1=1";
    $params = [];
    
    if ($vehiculo) {
        $sql .= " AND r.id_vehiculo = ?";
        $params[] = $vehiculo;
    }
    
    if ($estado) {
        $sql .= " AND r.estado = ?";
        $params[] = $estado;
    }
    
    if ($fecha) {
        $sql .= " AND r.fecha = ?";
        $params[] = $fecha;
    }
    
    // Month/Year filter for calendar view
    if ($mes && $anio) {
        $sql .= " AND MONTH(r.fecha) = ? AND YEAR(r.fecha) = ?";
        $params[] = $mes;
        $params[] = $anio;
    }
    
    $sql .= " GROUP BY r.id_ruta ORDER BY r.fecha DESC, r.hora_salida DESC LIMIT ?";
    $params[] = $limit;
    
    $data = db()->query($sql, $params);

    foreach ($data as &$row) {
        if (intval($row['sedes_count'] ?? 0) === 0) {
            $planSedes = getRutaPlanSedes($row['id_ruta']);
            $planCount = count($planSedes);
            if ($planCount > 0) {
                $row['total_servicios'] = $planCount;
                $row['sedes_count'] = $planCount;
                if (intval($row['pendientes_pago'] ?? 0) === 0 && ($row['estado'] ?? '') !== 'completada') {
                    $row['pendientes_pago'] = $planCount;
                }
            }
        }
    }
    unset($row);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    try {
        $ruta = db()->queryOne(
            "SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca,
                    CONCAT(ch.nombres, ' ', ch.apellidos) as chofer_nombre,
                    CONCAT(ay.nombres, ' ', ay.apellidos) as ayudante_nombre
             FROM Ruta r
             INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
             LEFT JOIN Empleado ch ON r.id_chofer = ch.id_empleado
             LEFT JOIN Empleado ay ON r.id_ayudante = ay.id_empleado
             WHERE r.id_ruta = ?",
            [$id]
        );
        
        if (!$ruta) {
            http_response_code(404);
            echo json_encode(['success' => false, 'message' => 'Ruta no encontrada']);
            return;
        }
        
        // Get services for this route
        $servicios = db()->query(
            "SELECT s.*, se.nombre_comercial as sede_nombre, se.distrito, se.direccion,
                    se.contacto_nombre, se.contacto_telefono,
                    e.ruc as empresa_ruc, e.razon_social as empresa_razon_social,
                    cs.tarifa as tarifa_servicio
             FROM Servicio s 
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             LEFT JOIN (
                 SELECT cs1.id_sede, cs1.tarifa
                 FROM ContratoServicio cs1
                 WHERE cs1.activo = 1
                 AND cs1.fecha_inicio = (
                     SELECT MAX(cs2.fecha_inicio) FROM ContratoServicio cs2
                     WHERE cs2.id_sede = cs1.id_sede AND cs2.activo = 1
                 )
             ) cs ON s.id_sede = cs.id_sede
             WHERE s.id_ruta = ? ORDER BY s.id_servicio",
            [$id]
        );
        
        if (empty($servicios)) {
            $servicios = buildRutaPlanServicios(getRutaPlanSedes($id));
        }

        $ruta['servicios'] = $servicios ?: [];
        
        echo json_encode([
            'success' => true,
            'data' => $ruta
        ]);
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Error al obtener ruta: ' . $e->getMessage()
        ]);
    }
}

function create() {
    $user = canEdit();
    
    try {
        $data = json_decode(file_get_contents('php://input'), true);
        
        $id_vehiculo = $data['id_vehiculo'] ?? null;
        $fecha = $data['fecha'] ?? null;
        $sedes = normalizeRutaPlanSedes($data['sedes'] ?? []);
        $data['sedes'] = $sedes;
        $id_chofer = $data['id_chofer'] ?? null;
        $id_ayudante = $data['id_ayudante'] ?? null;
        
        if (empty($id_vehiculo) || empty($fecha)) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Vehículo y fecha son requeridos']);
            return;
        }
        
        // Check if route already exists for this vehicle and date
        $existing = db()->queryOne(
            "SELECT id_ruta FROM Ruta WHERE id_vehiculo = ? AND fecha = ?",
            [$id_vehiculo, $fecha]
        );
        
        if ($existing) {
            // Update existing route header. Planned sedes stay in AuditLog until
            // Control de Ruta materializes them as Servicio rows.
            $id = $existing['id_ruta'];

            db()->execute(
                "UPDATE Ruta SET estado = ?, observaciones = ?, id_chofer = ?, id_ayudante = ?, fecha_modificacion = NOW() WHERE id_ruta = ?",
                [$data['estado'] ?? 'programada', $data['observaciones'] ?? null, $id_chofer, $id_ayudante, $id]
            );
        } else {
            // Auto-generate codigo_ruta: R-YYYYMMDD-VID-COUNTER
            $dateStr = str_replace('-', '', $fecha);
            $countToday = db()->queryOne(
                "SELECT COUNT(*) as cnt FROM Ruta WHERE fecha = ?",
                [$fecha]
            );
            $counter = ($countToday['cnt'] ?? 0) + 1;
            $codigo_ruta = "R-{$dateStr}-{$id_vehiculo}-{$counter}";
            
            // Create new route (simplified - only essential fields)
            $id = db()->insert(
                "INSERT INTO Ruta (id_vehiculo, codigo_ruta, fecha, estado, id_chofer, id_ayudante) VALUES (?, ?, ?, 'programada', ?, ?)",
                [$id_vehiculo, $codigo_ruta, $fecha, $id_chofer, $id_ayudante]
            );
        }
        
        db()->execute(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Ruta', ?, ?, ?)",
            [$user['id'], $id, $existing ? 'UPDATE' : 'INSERT', json_encode($data)]
        );
        
        echo json_encode([
            'success' => true,
            'message' => $existing ? 'Ruta actualizada' : 'Ruta creada exitosamente',
            'id' => $id
        ]);
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Error al crear ruta: ' . $e->getMessage()
        ]);
    }
}

function update($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $data = json_decode(file_get_contents('php://input'), true);
    if (array_key_exists('sedes', $data)) {
        $data['sedes'] = normalizeRutaPlanSedes($data['sedes']);
    }
    
    $existing = db()->queryOne("SELECT * FROM Ruta WHERE id_ruta = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Ruta no encontrada']);
        return;
    }
    
    db()->execute(
        "UPDATE Ruta SET 
            id_vehiculo = COALESCE(?, id_vehiculo),
            codigo_ruta = ?,
            fecha = COALESCE(?, fecha),
            hora_salida = ?,
            hora_retorno = ?,
            km_inicial = ?,
            km_final = ?,
            estado = ?,
            observaciones = ?,
            id_chofer = ?,
            id_ayudante = ?,
            fecha_modificacion = NOW()
         WHERE id_ruta = ?",
        [
            $data['id_vehiculo'] ?? null,
            $data['codigo_ruta'] ?? $existing['codigo_ruta'],
            $data['fecha'] ?? null,
            $data['hora_salida'] ?? $existing['hora_salida'],
            $data['hora_retorno'] ?? $existing['hora_retorno'],
            $data['km_inicial'] ?? $existing['km_inicial'],
            $data['km_final'] ?? $existing['km_final'],
            $data['estado'] ?? $existing['estado'],
            $data['observaciones'] ?? $existing['observaciones'],
            array_key_exists('id_chofer', $data) ? $data['id_chofer'] : $existing['id_chofer'],
            array_key_exists('id_ayudante', $data) ? $data['id_ayudante'] : $existing['id_ayudante'],
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Ruta', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Ruta actualizada exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    // Get all services for this route
    $servicios = db()->query("SELECT id_servicio FROM Servicio WHERE id_ruta = ?", [$id]);
    
    if (!empty($servicios)) {
        $ids = array_map(function($s) { return $s['id_servicio']; }, $servicios);
        $in = str_repeat('?,', count($ids) - 1) . '?';
        
        // Delete related records in Manifiesto, Guia, Factura, ServicioEmpleado
        db()->execute("DELETE FROM Manifiesto WHERE id_servicio IN ($in)", $ids);
        db()->execute("DELETE FROM Guia WHERE id_servicio IN ($in)", $ids);
        db()->execute("DELETE FROM Factura WHERE id_servicio IN ($in)", $ids);
        db()->execute("DELETE FROM ServicioEmpleado WHERE id_servicio IN ($in)", $ids);
        
        // Delete the services themselves
        db()->execute("DELETE FROM Servicio WHERE id_ruta = ?", [$id]);
    }
    
    // Finally delete the route
    db()->execute("DELETE FROM Ruta WHERE id_ruta = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'Ruta', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Ruta eliminada exitosamente'
    ]);
}
