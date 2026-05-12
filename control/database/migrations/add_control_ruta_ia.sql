-- Migration: add_control_ruta_ia.sql
-- Description: Adds AI route-control evidence linkage and real collected amount.

ALTER TABLE `Servicio`
  ADD COLUMN IF NOT EXISTS `monto_cobrado` decimal(10,2) DEFAULT NULL AFTER `forma_pago`;

ALTER TABLE `DocumentoIALote`
  ADD COLUMN IF NOT EXISTS `id_ruta` int(11) DEFAULT NULL AFTER `id_usuario`,
  ADD KEY IF NOT EXISTS `idx_doc_ia_lote_ruta` (`id_ruta`);

CREATE TABLE IF NOT EXISTS `RutaIAFeedback` (
  `id_feedback` int(11) NOT NULL AUTO_INCREMENT,
  `id_lote` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_sede` int(11) DEFAULT NULL,
  `resultado` enum('correcto','incorrecto') NOT NULL,
  `confianza` decimal(5,4) DEFAULT NULL,
  `campos_sugeridos` longtext DEFAULT NULL,
  `campos_finales` longtext DEFAULT NULL,
  `campos_modificados` longtext DEFAULT NULL,
  `anotacion_original` text DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_feedback`),
  UNIQUE KEY `uq_ruta_ia_feedback_lote_servicio` (`id_lote`, `id_servicio`),
  KEY `idx_ruta_ia_feedback_ruta` (`id_ruta`),
  KEY `idx_ruta_ia_feedback_resultado` (`resultado`),
  KEY `idx_ruta_ia_feedback_servicio` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
