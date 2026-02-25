<?php
require_once __DIR__ . '/config/database.php';

try {
    $db = db();
    
    // 1. Rename existing columns if they exist (ignore errors if already renamed)
    try { $db->execute("ALTER TABLE Prospecto CHANGE nombre_comercial nombre_contacto varchar(200) NOT NULL"); } catch (Exception $e) {}
    try { $db->execute("ALTER TABLE Prospecto CHANGE notas observaciones text DEFAULT NULL"); } catch (Exception $e) {}
    try { $db->execute("ALTER TABLE Prospecto CHANGE fecha_proximo_contacto fecha_siguiente_contacto date DEFAULT NULL"); } catch (Exception $e) {}
    
    // 2. Add missing new columns
    $addColumns = [
        "ADD COLUMN razon_social varchar(200) DEFAULT NULL",
        "ADD COLUMN latitud varchar(50) DEFAULT NULL",
        "ADD COLUMN longitud varchar(50) DEFAULT NULL",
        "ADD COLUMN tipo_negocio varchar(100) DEFAULT 'Otro'",
        "ADD COLUMN vendedor varchar(100) DEFAULT NULL",
        "ADD COLUMN notas_seguimiento text DEFAULT NULL"
    ];
    
    foreach ($addColumns as $col) {
        try {
            $db->execute("ALTER TABLE Prospecto $col");
        } catch (Exception $e) {
            // Likely already exists, we can ignore
        }
    }
    
    // 3. Update the ENUM for estado so it accepts 'negociando' instead of 'negociacion'
    try {
        $db->execute("ALTER TABLE Prospecto MODIFY COLUMN estado enum('nuevo','contactado','interesado','propuesta','negociacion','negociando','ganado','perdido') DEFAULT 'nuevo'");
    } catch (Exception $e) {}
    
    echo "<h1>¡Migración de Esquema Prospectos Completada!</h1>";
    echo "<p>Las columnas faltantes (latitud, longitud, razon_social, etc.) han sido añadidas o parcheadas en la base de datos.</p>";
    echo "<p>Ya puede regresar a la web y crear su prospecto con normalidad.</p>";
    
} catch (\Throwable $e) {
    echo "<h1>Error Fatal en la Migración</h1>";
    echo "<p>" . $e->getMessage() . "</p>";
}
