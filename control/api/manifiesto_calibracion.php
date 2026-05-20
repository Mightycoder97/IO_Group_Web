<?php
/**
 * IO Group - Manifiesto Calibración API
 * Save and load precise coordinate adjustments for the matrix printer.
 */

require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/jwt.php';

$method = $_SERVER['REQUEST_METHOD'];

// Ensure Configuration table exists
try {
    db()->execute("CREATE TABLE IF NOT EXISTS `Configuracion` (
      `clave` varchar(100) NOT NULL,
      `valor` text,
      PRIMARY KEY (`clave`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");
} catch (Exception $e) {
    // Silently ignore if lacking CREATE privileges or table already exists
}

switch ($method) {
    case 'GET':
        canView();
        
        try {
            $config = db()->queryOne("SELECT valor FROM Configuracion WHERE clave = 'manifiesto_posiciones'");
            echo json_encode([
                'success' => true,
                'data' => $config ? json_decode($config['valor'], true) : null
            ]);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => 'Error al cargar posiciones: ' . $e->getMessage()]);
        }
        break;

    case 'POST':
        $user = canEdit();
        
        try {
            $data = json_decode(file_get_contents('php://input'), true);
            if (!is_array($data)) {
                http_response_code(400);
                echo json_encode(['success' => false, 'message' => 'Datos inválidos']);
                return;
            }
            
            $json = json_encode($data);
            
            // Insert or update logic
            $existing = db()->queryOne("SELECT clave FROM Configuracion WHERE clave = 'manifiesto_posiciones'");
            
            if ($existing) {
                db()->execute("UPDATE Configuracion SET valor = ? WHERE clave = 'manifiesto_posiciones'", [$json]);
            } else {
                db()->execute("INSERT INTO Configuracion (clave, valor) VALUES ('manifiesto_posiciones', ?)", [$json]);
            }
            
            // Log the action
            db()->execute(
                "INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos) VALUES (?, 'Configuracion', 'manifiesto_posiciones', 'UPDATE', ?)",
                [$user['id'], $json]
            );
            
            echo json_encode([
                'success' => true,
                'message' => 'Calibración guardada exitosamente en la base de datos'
            ]);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['success' => false, 'message' => 'Error al guardar calibración: ' . $e->getMessage()]);
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}
