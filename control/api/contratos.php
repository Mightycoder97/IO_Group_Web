<?php
/**
 * IO Group - Contratos de Servicio API
 * CRUD operations for service contracts
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

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
    
    $sede = $_GET['sede'] ?? null;
    $activo = $_GET['activo'] ?? null;
    
    $sql = "SELECT cs.*, s.nombre_comercial as sede_nombre, e.razon_social as empresa_razon_social
            FROM ContratoServicio cs
            INNER JOIN Sede s ON cs.id_sede = s.id_sede
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            WHERE 1=1";
    $params = [];
    
    if ($sede) {
        $sql .= " AND cs.id_sede = ?";
        $params[] = $sede;
    }
    
    if ($activo !== null) {
        $sql .= " AND cs.activo = ?";
        $params[] = $activo === 'true' ? 1 : 0;
    }
    
    $sql .= " ORDER BY cs.fecha_inicio DESC";
    
    $data = db()->query($sql, $params);
    
    echo json_encode([
        'success' => true,
        'data' => $data,
        'total' => count($data)
    ]);
}

function getOne($id) {
    canView();
    
    $contrato = db()->queryOne(
        "SELECT cs.*, s.nombre_comercial as sede_nombre, e.razon_social as empresa_razon_social
         FROM ContratoServicio cs 
         INNER JOIN Sede s ON cs.id_sede = s.id_sede 
         INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
         WHERE cs.id_contrato = ?",
        [$id]
    );
    
    if (!$contrato) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Contrato no encontrado']);
        return;
    }
    
    echo json_encode([
        'success' => true,
        'data' => $contrato
    ]);
}

function create() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $id_sede = $data['id_sede'] ?? null;
    $fecha_inicio = $data['fecha_inicio'] ?? null;
    $frecuencia = $data['frecuencia'] ?? null;
    $tarifa = $data['tarifa'] ?? null;
    
    if (empty($id_sede) || empty($fecha_inicio) || empty($frecuencia) || empty($tarifa)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Sede, fecha inicio, frecuencia y tarifa son requeridos']);
        return;
    }
    
    $id = db()->insert(
        "INSERT INTO ContratoServicio (id_sede, codigo_contrato, fecha_inicio, fecha_fin, frecuencia, peso_limite_kg, tarifa, tipo_tarifa, observaciones) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $id_sede,
            $data['codigo_contrato'] ?? null,
            $fecha_inicio,
            $data['fecha_fin'] ?? null,
            $frecuencia,
            $data['peso_limite_kg'] ?? null,
            $tarifa,
            $data['tipo_tarifa'] ?? 'por_servicio',
            $data['observaciones'] ?? null
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'ContratoServicio', ?, 'INSERT', ?)",
        [$user['id'], $id, json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Contrato creado exitosamente',
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
    
    $existing = db()->queryOne("SELECT * FROM ContratoServicio WHERE id_contrato = ?", [$id]);
    if (!$existing) {
        http_response_code(404);
        echo json_encode(['success' => false, 'message' => 'Contrato no encontrado']);
        return;
    }
    
    db()->execute(
        "UPDATE ContratoServicio SET 
            id_sede = COALESCE(?, id_sede),
            codigo_contrato = ?,
            fecha_inicio = COALESCE(?, fecha_inicio),
            fecha_fin = ?,
            frecuencia = COALESCE(?, frecuencia),
            peso_limite_kg = ?,
            tarifa = COALESCE(?, tarifa),
            tipo_tarifa = ?,
            observaciones = ?,
            activo = COALESCE(?, activo),
            fecha_modificacion = NOW()
         WHERE id_contrato = ?",
        [
            $data['id_sede'] ?? null,
            $data['codigo_contrato'] ?? $existing['codigo_contrato'],
            $data['fecha_inicio'] ?? null,
            $data['fecha_fin'] ?? $existing['fecha_fin'],
            $data['frecuencia'] ?? null,
            $data['peso_limite_kg'] ?? $existing['peso_limite_kg'],
            $data['tarifa'] ?? null,
            $data['tipo_tarifa'] ?? $existing['tipo_tarifa'],
            $data['observaciones'] ?? $existing['observaciones'],
            isset($data['activo']) ? $data['activo'] : null,
            $id
        ]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos) VALUES (?, 'ContratoServicio', ?, 'UPDATE', ?, ?)",
        [$user['id'], $id, json_encode($existing), json_encode($data)]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Contrato actualizado exitosamente'
    ]);
}

function delete($id) {
    $user = canEdit();
    
    if (!$id) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'ID requerido']);
        return;
    }
    
    db()->execute(
        "UPDATE ContratoServicio SET activo = 0, fecha_modificacion = NOW() WHERE id_contrato = ?",
        [$id]
    );
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion) VALUES (?, 'ContratoServicio', ?, 'DELETE')",
        [$user['id'], $id]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Contrato eliminado exitosamente'
    ]);
}
