-- =============================================
-- IO Group CRM - Historial de Prospectos + Motivos de Pérdida
-- Migration 003
-- =============================================

-- Historial de cambios de estado
CREATE TABLE IF NOT EXISTS ProspectoHistorial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_prospecto INT NOT NULL,
    estado_anterior VARCHAR(30) NULL,
    estado_nuevo VARCHAR(30) NOT NULL,
    id_usuario INT NULL COMMENT 'Quién realizó el cambio',
    notas TEXT NULL,
    duracion_estado_anterior INT NULL COMMENT 'Segundos en el estado anterior',
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_prospecto (id_prospecto),
    INDEX idx_fecha (fecha_cambio),
    INDEX idx_estados (estado_anterior, estado_nuevo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Motivos de pérdida
CREATE TABLE IF NOT EXISTS MotivoPerdida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Motivos predeterminados
INSERT INTO MotivoPerdida (nombre) VALUES
('Precio muy alto'),
('Eligió competencia'),
('No responde / Sin interés'),
('Presupuesto insuficiente'),
('Timing inadecuado'),
('No necesita el servicio'),
('Mala experiencia de atención'),
('Fuera de zona de cobertura'),
('Otro');

-- Agregar columnas al Prospecto (valor_potencial ya existe en el schema)
ALTER TABLE Prospecto ADD COLUMN IF NOT EXISTS id_motivo_perdida INT NULL;
ALTER TABLE Prospecto ADD COLUMN IF NOT EXISTS notas_perdida TEXT NULL;
