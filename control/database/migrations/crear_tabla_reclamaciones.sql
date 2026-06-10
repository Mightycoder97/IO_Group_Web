-- IO Group - Migración: Crear Tabla Reclamación
-- Autor: Antigravity

CREATE TABLE IF NOT EXISTS `Reclamacion` (
  `id_reclamacion` INT AUTO_INCREMENT PRIMARY KEY,
  `correlativo` VARCHAR(20) NOT NULL UNIQUE,
  `fecha_registro` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `tipo_documento` VARCHAR(20) NOT NULL,
  `numero_documento` VARCHAR(20) NOT NULL,
  `nombres` VARCHAR(150) NOT NULL,
  `apellidos` VARCHAR(150) NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `telefono` VARCHAR(50) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `es_menor` TINYINT(1) DEFAULT 0,
  `nombre_representante` VARCHAR(255) DEFAULT NULL,
  `doc_representante` VARCHAR(20) DEFAULT NULL,
  `tipo_bien` VARCHAR(20) NOT NULL, -- 'Producto' o 'Servicio'
  `monto_reclamado` DECIMAL(10,2) DEFAULT NULL,
  `descripcion_bien` TEXT NOT NULL,
  `tipo_reclamacion` VARCHAR(20) NOT NULL, -- 'Reclamo' o 'Queja'
  `detalle_reclamacion` TEXT NOT NULL,
  `pedido_consumidor` TEXT NOT NULL,
  `estado` VARCHAR(20) DEFAULT 'Pendiente', -- 'Pendiente', 'En Proceso', 'Respondido', 'Archivado'
  `respuesta_proveedor` TEXT DEFAULT NULL,
  `fecha_respuesta` DATETIME DEFAULT NULL,
  `ip_address` VARCHAR(45) DEFAULT NULL,
  `user_agent` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
