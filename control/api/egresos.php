<?php
/**
 * IO Group - Egresos API
 * Expense tracking and management
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? null;
$id = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        if ($action === 'subcategorias') getSubcategorias();
        elseif ($action === 'stats') getStats();
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

/**
 * Get all expenses with filters
 */
function getAll() {
    canView();
    
    $fecha_desde = $_GET['fecha_desde'] ?? date('Y-m-01');
    $fecha_hasta = $_GET['fecha_hasta'] ?? date('Y-m-t');
    $categoria = $_GET['categoria'] ?? null;
    $subcategoria = $_GET['subcategoria'] ?? null;
    $id_ruta = $_GET['id_ruta'] ?? null;
    $id_vehiculo = $_GET['id_vehiculo'] ?? null;
    
    $page = max(1, intval($_GET['page'] ?? 1));
    $limit = min(500, max(10, intval($_GET['limit'] ?? 100)));
    $offset = ($page - 1) * $limit;
    
    $sql = "SELECT e.*, 
            u.nombre_completo as usuario_nombre,
            r.codigo_ruta, r.fecha as ruta_fecha,
            v.placa as vehiculo_placa
            FROM Egreso e
            INNER JOIN Usuario u ON e.id_usuario = u.id_usuario
            LEFT JOIN Ruta r ON e.id_ruta = r.id_ruta
            LEFT JOIN Vehiculo v ON e.id_vehiculo = v.id_vehiculo
            WHERE e.fecha BETWEEN ? AND ?";
    $params = [$fecha_desde, $fecha_hasta];
    
    if ($categoria) {
        $sql .= " AND e.categoria = ?";
        $params[] = $categoria;
    }
    
    if ($subcategoria) {
        $sql .= " AND e.subcategoria = ?";
        $params[] = $subcategoria;
    }
    
    if ($id_ruta) {
        $sql .= " AND e.id_ruta = ?";
        $params[] = $id_ruta;
    }
    
    if ($id_vehiculo) {
        $sql .= " AND e.id_vehiculo = ?";
        $params[] = $id_vehiculo;
    }
    
    // Count for pagination
    $countSql = str_replace("SELECT e.*, 
            u.nombre_completo as usuario_nombre,
            r.codigo_ruta, r.fecha as ruta_fecha,
            v.placa as vehiculo_placa", "SELECT COUNT(*) as total", $sql);
    $countSql = preg_replace('/LEFT JOIN.*?WHERE/', 'WHERE', $countSql);
    $totalResult = db()->queryOne($countSql, $params);
    $total = $totalResult['total'] ?? 0;
    
    $sql .= " ORDER BY e.fecha DESC, e.id_egreso DESC LIMIT ? OFFSET ?";
    $params[] = $limit;
    $params[] = $offset;
    
    $data = db()->query($sql, $params);
    
    // Get totals by category for the period
    $totales = db()->query("
        SELECT categoria, SUM(monto) as total, COUNT(*) as cantidad
        FROM Egreso
        WHERE fecha BETWEEN ? AND ?
        GROUP BY categoria
    ", [$fecha_desde, $fecha_hasta]);
    
    $totalGeneral = array_reduce($totales, fn($sum, $t) => $sum + floatval($t['total']), 0);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'periodo' => ['desde' => $fecha_desde, 'hasta' => $fecha_hasta],
        'totales_categoria' => $totales,
        'total_general' => $totalGeneral,
        'total' => $total,
        'page' => $page,
        'limit' => $limit,
        'pages' => ceil($total / $limit)
    ]);
}

/**
 * Get single expense by ID
 */
function getOne($id) {
    canView();
    
    $egreso = db()->queryOne(
        "SELECT e.*, 
                u.nombre_completo as usuario_nombre,
                r.codigo_ruta, r.fecha as ruta_fecha,
                v.placa as vehiculo_placa
         FROM Egreso e
         INNER JOIN Usuario u ON e.id_usuario = u.id_usuario
         LEFT JOIN Ruta r ON e.id_ruta = r.id_ruta
         LEFT JOIN Vehiculo v ON e.id_vehiculo = v.id_vehiculo
         WHERE e.id_egreso = ?",
        [$id]
    );
    
    if (!$egreso) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Egreso no encontrado']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $egreso
    ]);
}

/**
 * Get statistics for dashboard
 */
function getStats() {
    canView();
    
    $fecha_desde = $_GET['fecha_desde'] ?? date('Y-m-01');
    $fecha_hasta = $_GET['fecha_hasta'] ?? date('Y-m-t');
    
    // Total by category
    $porCategoria = db()->query("
        SELECT categoria, 
               SUM(monto) as total, 
               COUNT(*) as cantidad
        FROM Egreso
        WHERE fecha BETWEEN ? AND ?
        GROUP BY categoria
        ORDER BY total DESC
    ", [$fecha_desde, $fecha_hasta]);
    
    // Total by subcategory (top 10)
    $porSubcategoria = db()->query("
        SELECT categoria, subcategoria, 
               SUM(monto) as total, 
               COUNT(*) as cantidad
        FROM Egreso
        WHERE fecha BETWEEN ? AND ?
        GROUP BY categoria, subcategoria
        ORDER BY total DESC
        LIMIT 10
    ", [$fecha_desde, $fecha_hasta]);
    
    // Daily expenses
    $porDia = db()->query("
        SELECT fecha, SUM(monto) as total
        FROM Egreso
        WHERE fecha BETWEEN ? AND ?
        GROUP BY fecha
        ORDER BY fecha
    ", [$fecha_desde, $fecha_hasta]);
    
    // Compare with previous period
    $diasPeriodo = (strtotime($fecha_hasta) - strtotime($fecha_desde)) / 86400;
    $fecha_desde_prev = date('Y-m-d', strtotime($fecha_desde) - ($diasPeriodo * 86400) - 86400);
    $fecha_hasta_prev = date('Y-m-d', strtotime($fecha_desde) - 86400);
    
    $totalActual = db()->queryOne("
        SELECT SUM(monto) as total FROM Egreso WHERE fecha BETWEEN ? AND ?
    ", [$fecha_desde, $fecha_hasta]);
    
    $totalAnterior = db()->queryOne("
        SELECT SUM(monto) as total FROM Egreso WHERE fecha BETWEEN ? AND ?
    ", [$fecha_desde_prev, $fecha_hasta_prev]);
    
    $totalActualVal = floatval($totalActual['total'] ?? 0);
    $totalAnteriorVal = floatval($totalAnterior['total'] ?? 0);
    $variacion = $totalAnteriorVal > 0 
        ? (($totalActualVal - $totalAnteriorVal) / $totalAnteriorVal) * 100 
        : 0;
    
    echo json_encode([
        'success' => true,
        'periodo' => ['desde' => $fecha_desde, 'hasta' => $fecha_hasta],
        'resumen' => [
            'total' => $totalActualVal,
            'total_anterior' => $totalAnteriorVal,
            'variacion_porcentaje' => round($variacion, 1)
        ],
        'por_categoria' => $porCategoria,
        'por_subcategoria' => $porSubcategoria,
        'por_dia' => $porDia
    ]);
}

/**
 * Get subcategories catalog
 */
function getSubcategorias() {
    canView();
    
    $categoria = $_GET['categoria'] ?? null;
    
    $sql = "SELECT * FROM EgresoSubcategoria WHERE activo = 1";
    $params = [];
    
    if ($categoria) {
        $sql .= " AND categoria = ?";
        $params[] = $categoria;
    }
    
    $sql .= " ORDER BY categoria, nombre";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data
    ]);
}

/**
 * Create new expense
 */
function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $categoria = $data['categoria'] ?? null;
    $subcategoria = $data['subcategoria'] ?? null;
    $descripcion = $data['descripcion'] ?? null;
    $monto = $data['monto'] ?? null;
    $fecha = $data['fecha'] ?? date('Y-m-d');
    
    if (!$categoria || !$subcategoria || !$descripcion || !$monto) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Categoría, subcategoría, descripción y monto son requeridos']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO Egreso (categoria, subcategoria, descripcion, monto, fecha, id_ruta, id_vehiculo, comprobante, observaciones, id_usuario)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $categoria,
            $subcategoria,
            $descripcion,
            $monto,
            $fecha,
            $data['id_ruta'] ?? null,
            $data['id_vehiculo'] ?? null,
            $data['comprobante'] ?? null,
            $data['observaciones'] ?? null,
            $user['id']
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Egreso', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Egreso registrado exitosamente',
        'id' => $id
    ]);
}

/**
 * Update expense
 */
function update($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    $existing = db()->queryOne("SELECT * FROM Egreso WHERE id_egreso = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Egreso no encontrado']);
        return;
    }
    
    db()->execute(
        "UPDATE Egreso SET 
            categoria = COALESCE(?, categoria),
            subcategoria = COALESCE(?, subcategoria),
            descripcion = COALESCE(?, descripcion),
            monto = COALESCE(?, monto),
            fecha = COALESCE(?, fecha),
            id_ruta = ?,
            id_vehiculo = ?,
            comprobante = ?,
            observaciones = ?,
            fecha_modificacion = NOW()
         WHERE id_egreso = ?",
        [
            $data['categoria'] ?? null,
            $data['subcategoria'] ?? null,
            $data['descripcion'] ?? null,
            $data['monto'] ?? null,
            $data['fecha'] ?? null,
            $data['id_ruta'] ?? $existing['id_ruta'],
            $data['id_vehiculo'] ?? $existing['id_vehiculo'],
            $data['comprobante'] ?? $existing['comprobante'],
            $data['observaciones'] ?? $existing['observaciones'],
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'Egreso', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Egreso actualizado exitosamente'
    ]);
}

/**
 * Delete expense
 */
function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    $existing = db()->queryOne("SELECT * FROM Egreso WHERE id_egreso = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Egreso no encontrado']);
        return;
    }
    
    db()->execute("DELETE FROM Egreso WHERE id_egreso = ?", [$id]);
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores) VALUES (?, 'Egreso', ?, 'DELETE', ?)",
        [$user['id'], $id, json_encode($existing)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Egreso eliminado exitosamente'
    ]);
}
