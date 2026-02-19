<?php
/**
 * IO Group - Control de Ruta API
 * Batch update services per route with digital signatures via AuditLog
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$id_ruta = $_GET['id_ruta'] ?? null;
$action  = $_GET['action'] ?? null;

switch ($method) {
    case 'GET':
        if ($id_ruta) getRouteServices($id_ruta);
        else {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'id_ruta requerido']);
        }
        break;
    case 'PUT':
        if ($action === 'batch_update') batchUpdate();
        else {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'Acción no válida']);
        }
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

/**
 * GET ?id_ruta=X
 * Returns route info + all services with their current state/payment and digital signatures
 */
function getRouteServices($id_ruta) {
    canView();

    try {
        // Get route header
        $ruta = db()->queryOne(
            "SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca, v.modelo as vehiculo_modelo,
                    CONCAT(ch.nombres, ' ', ch.apellidos) as chofer_nombre,
                    CONCAT(ay.nombres, ' ', ay.apellidos) as ayudante_nombre
             FROM Ruta r
             INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
             LEFT JOIN Empleado ch ON r.id_chofer = ch.id_empleado
             LEFT JOIN Empleado ay ON r.id_ayudante = ay.id_empleado
             WHERE r.id_ruta = ?",
            [$id_ruta]
        );

        if (!$ruta) {
            http_response_code(404);
            echo json_encode(['success' => false, 'message' => 'Ruta no encontrada']);
            return;
        }

        // Get services for this route with sede/empresa info and tarifa
        $servicios = db()->query(
            "SELECT s.id_servicio, s.id_sede, s.estado, s.estado_pago, s.forma_pago,
                    s.fecha_pago, s.descripcion_residuo,
                    se.nombre_comercial as sede_nombre, se.direccion, se.distrito,
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
             WHERE s.id_ruta = ?
             ORDER BY s.id_servicio ASC",
            [$id_ruta]
        );

        if (empty($servicios)) {
            $ruta['servicios'] = [];
            echo json_encode(['success' => true, 'data' => $ruta]);
            return;
        }

        // Collect service IDs to fetch signatures from AuditLog
        $ids = array_map(fn($s) => intval($s['id_servicio']), $servicios);
        $placeholders = implode(',', $ids);

        // Fetch digital signatures: last UPDATE per service per action type
        // We distinguish service confirmation vs payment confirmation via datos_nuevos JSON
        $logs = db()->query(
            "SELECT al.id_registro, al.datos_nuevos, al.fecha_hora,
                    u.nombre_completo as usuario_nombre, u.username
             FROM AuditLog al
             LEFT JOIN Usuario u ON al.id_usuario = u.id_usuario
             WHERE al.tabla_afectada = 'Servicio'
               AND al.accion = 'UPDATE'
               AND al.id_registro IN ($placeholders)
             ORDER BY al.fecha_hora ASC"
        );

        // Build signature maps keyed by id_servicio
        $firmaServicio = [];
        $firmaPago    = [];

        foreach ($logs as $log) {
            $sid = intval($log['id_registro']);
            $datos = json_decode($log['datos_nuevos'] ?? '{}', true);
            $usuario = $log['usuario_nombre'] ?? $log['username'] ?? 'Desconocido';
            $ts      = $log['fecha_hora'];

            // If the log entry contains 'estado' key → service confirmation signature
            if (isset($datos['estado']) && $datos['estado'] !== 'programado') {
                $firmaServicio[$sid] = ['usuario' => $usuario, 'fecha_hora' => $ts, 'estado' => $datos['estado']];
            }
            // If the log entry contains 'estado_pago' key → payment confirmation signature
            if (isset($datos['estado_pago'])) {
                $firmaPago[$sid] = ['usuario' => $usuario, 'fecha_hora' => $ts, 'estado_pago' => $datos['estado_pago'], 'forma_pago' => $datos['forma_pago'] ?? null];
            }
        }

        // Attach signatures to each service
        foreach ($servicios as &$s) {
            $sid = intval($s['id_servicio']);
            $s['firma_servicio'] = $firmaServicio[$sid] ?? null;
            $s['firma_pago']     = $firmaPago[$sid] ?? null;
        }
        unset($s);

        $ruta['servicios'] = $servicios;

        echo json_encode(['success' => true, 'data' => $ruta]);

    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
    }
}

/**
 * PUT ?action=batch_update
 * Body: { id_ruta: X, servicios: [ { id_servicio, estado, estado_pago, forma_pago, fecha_pago } ] }
 * Updates each service and writes AuditLog entries as digital signatures.
 */
function batchUpdate() {
    $user = canEdit();

    try {
        $data = json_decode(file_get_contents('php://input'), true);
        $id_ruta   = $data['id_ruta'] ?? null;
        $servicios = $data['servicios'] ?? [];

        if (!$id_ruta || empty($servicios)) {
            http_response_code(400);
            echo json_encode(['success' => false, 'message' => 'id_ruta y servicios son requeridos']);
            return;
        }

        // Verify route exists
        $ruta = db()->queryOne("SELECT id_ruta FROM Ruta WHERE id_ruta = ?", [$id_ruta]);
        if (!$ruta) {
            http_response_code(404);
            echo json_encode(['success' => false, 'message' => 'Ruta no encontrada']);
            return;
        }

        $updated = 0;
        $today = date('Y-m-d');

        foreach ($servicios as $srv) {
            $id_servicio  = intval($srv['id_servicio'] ?? 0);
            if (!$id_servicio) continue;

            $estado       = $srv['estado'] ?? null;
            $estado_pago  = $srv['estado_pago'] ?? null;
            $forma_pago   = $srv['forma_pago'] ?? null;
            $fecha_pago   = ($estado_pago === 'pagado') ? ($srv['fecha_pago'] ?? $today) : null;

            // Validate estado
            $estadosValidos = ['programado', 'en_curso', 'completado', 'cancelado'];
            if ($estado && !in_array($estado, $estadosValidos)) {
                continue; // Skip invalid
            }
            $estadosPagoValidos = ['pendiente', 'pagado'];
            if ($estado_pago && !in_array($estado_pago, $estadosPagoValidos)) {
                continue;
            }

            // Fetch existing service
            $existing = db()->queryOne(
                "SELECT * FROM Servicio WHERE id_servicio = ? AND id_ruta = ?",
                [$id_servicio, $id_ruta]
            );
            if (!$existing) continue;

            // Build update
            $nuevosDatos = [];

            if ($estado && $estado !== $existing['estado']) {
                $nuevosDatos['estado'] = $estado;
            }
            if ($estado_pago && $estado_pago !== $existing['estado_pago']) {
                $nuevosDatos['estado_pago'] = $estado_pago;
                if ($forma_pago) $nuevosDatos['forma_pago'] = $forma_pago;
                if ($fecha_pago) $nuevosDatos['fecha_pago'] = $fecha_pago;
            } elseif ($forma_pago && $forma_pago !== $existing['forma_pago']) {
                // Update forma_pago even if estado_pago unchanged
                $nuevosDatos['forma_pago'] = $forma_pago;
            }

            if (empty($nuevosDatos)) continue;

            // Execute UPDATE
            db()->execute(
                "UPDATE Servicio SET
                    estado       = COALESCE(?, estado),
                    estado_pago  = COALESCE(?, estado_pago),
                    forma_pago   = COALESCE(?, forma_pago),
                    fecha_pago   = COALESCE(?, fecha_pago),
                    fecha_modificacion = NOW()
                 WHERE id_servicio = ?",
                [
                    $nuevosDatos['estado']      ?? null,
                    $nuevosDatos['estado_pago'] ?? null,
                    $nuevosDatos['forma_pago']  ?? null,
                    $nuevosDatos['fecha_pago']  ?? null,
                    $id_servicio
                ]
            );

            // Write AuditLog signature — full nuevos datos for traceability
            // Include all changed fields so we can identify service vs payment confirmations later
            $auditData = array_merge($nuevosDatos, [
                'id_servicio' => $id_servicio,
                'id_ruta'     => $id_ruta,
                'timestamp'   => date('Y-m-d H:i:s')
            ]);

            db()->execute(
                "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos, ip_address)
                 VALUES (?, 'Servicio', ?, 'UPDATE', ?, ?, ?)",
                [
                    $user['id'],
                    $id_servicio,
                    json_encode(['estado' => $existing['estado'], 'estado_pago' => $existing['estado_pago'], 'forma_pago' => $existing['forma_pago']]),
                    json_encode($auditData),
                    $_SERVER['REMOTE_ADDR'] ?? null
                ]
            );

            $updated++;
        }

        // Check if all services in the route are now verified (not 'programado')
        $pendientes = db()->queryOne(
            "SELECT COUNT(*) as cnt FROM Servicio WHERE id_ruta = ? AND estado = 'programado'",
            [$id_ruta]
        );
        $todosVerificados = ($pendientes['cnt'] == 0);

        // If all verified, mark route as completada
        if ($todosVerificados) {
            db()->execute(
                "UPDATE Ruta SET estado = 'completada', fecha_modificacion = NOW() WHERE id_ruta = ?",
                [$id_ruta]
            );
        }

        echo json_encode([
            'success'          => true,
            'message'          => "$updated servicio(s) actualizado(s) correctamente",
            'todos_verificados' => $todosVerificados
        ]);

    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
    }
}
