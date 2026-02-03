<?php
/**
 * IO Group - Unified Sede Creation API
 * Creates Cliente + Empresa + Sede in a single transaction
 * Updated: 2026-01-30 17:25
 */

// Enable error reporting for debugging
ini_set('display_errors', 0);
error_reporting(E_ALL);

header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

// Handle preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
    exit;
}

try {
    $user = canEdit();
    $rawData = file_get_contents('php://input');
    $data = json_decode($rawData, true);

    // Validate required data
    $cliente = $data['cliente'] ?? [];
    $empresa = $data['empresa'] ?? [];
    $sede = $data['sede'] ?? [];

    if (empty($cliente['nombre_completo'])) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Nombre del titular es requerido']);
        exit;
    }

    if (empty($empresa['razon_social']) || empty($empresa['ruc'])) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Razón social y RUC son requeridos']);
        exit;
    }

    if (empty($sede['nombre_comercial']) || empty($sede['direccion'])) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Nombre comercial y dirección de sede son requeridos']);
        exit;
    }

    // Check if RUC already exists - if so, use existing empresa
    $existingEmpresa = db()->queryOne("SELECT id_empresa, id_cliente FROM Empresa WHERE ruc = ?", [$empresa['ruc']]);

    // Start transaction
    $pdo = db()->getConnection();
    $pdo->beginTransaction();
    
    if ($existingEmpresa) {
        // Use existing empresa
        $empresaId = $existingEmpresa['id_empresa'];
        $clienteId = $existingEmpresa['id_cliente'];
    } else {
        // 1. Create Cliente
        // Schema: nombre, tipo_documento, dni, telefono, email, direccion, notas, activo
        $clienteId = db()->insert(
            "INSERT INTO Cliente (nombre, dni, telefono, email) VALUES (?, ?, ?, ?)",
            [
                $cliente['nombre_completo'],
                $cliente['documento'] ?? null,
                $cliente['telefono'] ?? null,
                $cliente['email'] ?? null
            ]
        );
        
        // 2. Create Empresa
        // Schema: id_cliente, razon_social, ruc, direccion_fiscal, distrito, provincia, departamento, telefono, email, activo
        $empresaId = db()->insert(
            "INSERT INTO Empresa (id_cliente, razon_social, ruc, direccion_fiscal) VALUES (?, ?, ?, ?)",
            [
                $clienteId,
                $empresa['razon_social'],
                $empresa['ruc'],
                $empresa['direccion_fiscal'] ?? null
            ]
        );
    }
    
    // 3. Create Sede
    // Schema: id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, referencia, coordenadas_gps, contacto_nombre, contacto_telefono, contacto_email, activo
    $sedeId = db()->insert(
        "INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, referencia, coordenadas_gps, contacto_nombre, contacto_telefono, contacto_email, activo) 
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)",
        [
            $empresaId,
            $sede['nombre_comercial'],
            $sede['direccion'],
            $sede['distrito'] ?? null,
            $sede['provincia'] ?? null,
            $sede['departamento'] ?? null,
            $sede['referencia'] ?? null,
            $sede['coordenadas_gps'] ?? null,
            $sede['contacto_nombre'] ?? null,
            $sede['contacto_telefono'] ?? null,
            $sede['contacto_email'] ?? null
        ]
    );
    
    // 4. Create ContratoServicio
    $contrato = $data['contrato'] ?? [];
    if (!empty($contrato['fecha_inicio']) && !empty($contrato['frecuencia']) && isset($contrato['tarifa'])) {
        db()->insert(
            "INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, peso_limite_kg, tarifa, tipo_tarifa, activo) 
             VALUES (?, ?, ?, ?, ?, ?, 1)",
            [
                $sedeId,
                $contrato['fecha_inicio'],
                $contrato['frecuencia'],
                $contrato['peso_limite_kg'] ?? null,
                $contrato['tarifa'],
                $contrato['tipo_tarifa'] ?? 'por_servicio'
            ]
        );
    }

    // Commit transaction
    $pdo->commit();
    
    // Audit log (outside transaction, non-critical)
    try {
        db()->execute(
            "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Sede', ?, 'UNIFIED_INSERT', ?)",
            [$user['id'], $sedeId, json_encode(['cliente_id' => $clienteId, 'empresa_id' => $empresaId, 'sede_id' => $sedeId])]
        );
    } catch (Exception $e) {
        // Audit log failure is non-critical
        error_log("Audit log failed: " . $e->getMessage());
    }
    
    echo json_encode([
        'success' => true,
        'message' => 'Cliente, empresa y sede creados exitosamente',
        'cliente_id' => $clienteId,
        'empresa_id' => $empresaId,
        'sede_id' => $sedeId
    ]);
    
} catch (PDOException $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Error de base de datos: ' . $e->getMessage()]);
} catch (Exception $e) {
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
}
