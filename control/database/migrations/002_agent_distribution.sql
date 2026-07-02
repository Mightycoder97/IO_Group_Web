-- =============================================
-- IO Group CRM - Distribución de Agentes
-- Migration 002
-- =============================================

CREATE TABLE IF NOT EXISTS AgentDistribution (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL COMMENT 'FK a Usuario',
    max_conversaciones INT DEFAULT 10 COMMENT 'Límite de conversaciones activas',
    conversaciones_activas INT DEFAULT 0 COMMENT 'Contador actual',
    activo BOOLEAN DEFAULT TRUE,
    ultimo_asignado TIMESTAMP NULL COMMENT 'Última vez que se le asignó',
    UNIQUE KEY uk_usuario (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
