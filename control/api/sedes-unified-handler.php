<?php
/**
 * IO Group - Unified Sede Creation Handler
 * Handles the creation of Cliente + Empresa + Sede in a single transaction
 * Called from sedes.php when it detects nested data format
 * Updated: 2026-01-30 17:25
 */

require_once __DIR__ . '/config/database.php';

function handleUnifiedCreate($user, $data) {
    // Validate required data
    $cliente = $data['cliente'] ?? [];
    $empresa = $data['empresa'] ?? [];
    $sede = $data['sede'] ?? [];
    
    if (empty($cliente['nombre_completo'])) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Nombre del titular es requerido']);
        return;
    }
    
    if (empty($empresa['razon_social']) || empty($empresa['ruc'])) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Razón social y RUC son requeridos']);
        return;
    }
    
    if (empty($sede['nombre_comercial']) || empty($sede['direccion'])) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Nombre comercial y dirección de sede son requeridos']);
        return;
    }
    
    // Check if RUC already exists - if so, use existing empresa
    $existingEmpresa = db()->queryOne("SELECT id_empresa, id_cliente FROM Empresa WHERE ruc = ?", [$empresa['ruc']]);
    
    try {
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
}
