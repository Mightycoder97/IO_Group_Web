CREATE TABLE IF NOT EXISTS `ProcesoAlta` (
  `id_proceso` int(11) NOT NULL AUTO_INCREMENT,
  `datos_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`datos_json`)),
  `etapa_actual` int(11) DEFAULT 1,
  `doc_generado` varchar(255) DEFAULT NULL,
  `doc_firmado` varchar(255) DEFAULT NULL,
  `comprobante_pago` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_proceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
