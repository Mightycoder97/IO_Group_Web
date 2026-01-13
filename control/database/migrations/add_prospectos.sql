-- ============================================
-- MIGRACIÓN: Tabla Prospecto
-- Sistema CRM para gestión de prospectos/leads
-- ============================================

CREATE TABLE IF NOT EXISTS Prospecto (
    id_prospecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_contacto VARCHAR(100) NOT NULL,
    razon_social VARCHAR(200),
    ruc VARCHAR(11),
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    direccion VARCHAR(255),
    distrito VARCHAR(100),
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    tipo_negocio ENUM('Odontólogo', 'Veterinario', 'Laboratorio', 'Centro Médico', 
                      'Hospital', 'Farmacia', 'Spa/Estética', 'Tatuajes', 'Industrial', 'Otro') DEFAULT 'Otro',
    observaciones TEXT,
    vendedor VARCHAR(100) NOT NULL,
    estado ENUM('nuevo', 'contactado', 'interesado', 'negociando', 'ganado', 'perdido') DEFAULT 'nuevo',
    fecha_siguiente_contacto DATE,
    notas_seguimiento TEXT,
    id_cliente INT NULL COMMENT 'Vinculación cuando se convierte en cliente',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE SET NULL
);

-- Índices para optimización
CREATE INDEX idx_prospecto_estado ON Prospecto(estado);
CREATE INDEX idx_prospecto_vendedor ON Prospecto(vendedor);
CREATE INDEX idx_prospecto_fecha ON Prospecto(fecha_creacion);
CREATE INDEX idx_prospecto_tipo ON Prospecto(tipo_negocio);
