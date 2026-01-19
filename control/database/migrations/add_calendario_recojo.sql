-- Migration: Add CalendarioRecojo table for district planning
-- Date: 2026-01-19

CREATE TABLE IF NOT EXISTS CalendarioRecojo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mes INT NOT NULL COMMENT 'Mes (1-12)',
    anio INT NOT NULL COMMENT 'Año',
    dias_json JSON COMMENT 'JSON con formato {"YYYY-MM-DD": ["distrito1", "distrito2"], ...}',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_mes_anio (mes, anio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci 
  COMMENT='Calendario de asignación de distritos por día del mes';

-- Example data structure in dias_json:
-- {
--   "2026-01-06": ["Miraflores", "San Isidro"],
--   "2026-01-07": ["Surco", "La Molina"],
--   "2026-01-08": ["San Borja"]
-- }
