<?php
/**
 * IO Group - Calendario de Recojo API
 * Manages district assignments per day for monthly pickup planning
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        $action = $_GET['action'] ?? null;
        if ($action === 'distritos') {
            getDistritos();
        } else {
            getCalendario();
        }
        break;
    case 'POST':
        saveCalendario();
        break;
    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

function getDistritos() {
    canView();
    
    // Get unique districts with sede count - much faster than loading all sedes
    $sql = "SELECT distrito, COUNT(*) as cantidad 
            FROM Sede 
            WHERE distrito IS NOT NULL AND distrito != '' AND activo = 1
            GROUP BY distrito 
            ORDER BY distrito";
    
    $data = db()->query($sql);
    
    echo json_encode([
        'success' => true,
        'data' => $data
    ]);
}

function getCalendario() {
    canView();
    
    $mes = $_GET['mes'] ?? date('n');
    $anio = $_GET['anio'] ?? date('Y');
    
    // Try to get existing calendario
    $calendario = db()->queryOne(
        "SELECT * FROM CalendarioRecojo WHERE mes = ? AND anio = ?",
        [$mes, $anio]
    );
    
    if ($calendario) {
        $dias = json_decode($calendario['dias_json'], true) ?: [];
        echo json_encode([
            'success' => true,
            'data' => [
                'id' => $calendario['id'],
                'mes' => $calendario['mes'],
                'anio' => $calendario['anio'],
                'dias' => $dias
            ]
        ]);
    } else {
        echo json_encode([
            'success' => true,
            'data' => null
        ]);
    }
}

function saveCalendario() {
    $user = canEdit();
    $data = json_decode(file_get_contents('php://input'), true);
    
    $mes = $data['mes'] ?? null;
    $anio = $data['anio'] ?? null;
    $dias = $data['dias'] ?? [];
    
    if (empty($mes) || empty($anio)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Mes y año son requeridos']);
        return;
    }
    
    $diasJson = json_encode($dias);
    
    // Check if exists
    $existing = db()->queryOne(
        "SELECT id FROM CalendarioRecojo WHERE mes = ? AND anio = ?",
        [$mes, $anio]
    );
    
    if ($existing) {
        // Update
        db()->execute(
            "UPDATE CalendarioRecojo SET dias_json = ?, fecha_modificacion = NOW() WHERE id = ?",
            [$diasJson, $existing['id']]
        );
        $id = $existing['id'];
    } else {
        // Insert
        $id = db()->insert(
            "INSERT INTO CalendarioRecojo (mes, anio, dias_json) VALUES (?, ?, ?)",
            [$mes, $anio, $diasJson]
        );
    }
    
    db()->execute(
        "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'CalendarioRecojo', ?, ?, ?)",
        [$user['id'], $id, $existing ? 'UPDATE' : 'INSERT', $diasJson]
    );
    
    echo json_encode([
        'success' => true,
        'message' => 'Calendario guardado exitosamente',
        'id' => $id
    ]);
}
