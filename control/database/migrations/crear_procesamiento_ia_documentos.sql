-- Migration: crear_procesamiento_ia_documentos.sql
-- Date: 2026-05-08
-- Description: Batch processing tables for AI-assisted document extraction and approval.

CREATE TABLE IF NOT EXISTS `DocumentoIALote` (
  `id_lote` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `tipo_lote` enum('mixto','ruta','manifiestos','guias','facturas') DEFAULT 'mixto',
  `estado` enum('pendiente','procesando','completado','error') DEFAULT 'pendiente',
  `total_archivos` int(11) DEFAULT 0,
  `procesados` int(11) DEFAULT 0,
  `aprobados` int(11) DEFAULT 0,
  `rechazados` int(11) DEFAULT 0,
  `id_usuario` int(11) DEFAULT NULL,
  `error_mensaje` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_lote`),
  KEY `idx_doc_ia_lote_estado` (`estado`),
  KEY `idx_doc_ia_lote_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

CREATE TABLE IF NOT EXISTS `DocumentoIAArchivo` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `id_lote` int(11) NOT NULL,
  `nombre_original` varchar(255) NOT NULL,
  `ruta_archivo` varchar(500) NOT NULL,
  `mime_type` varchar(120) DEFAULT NULL,
  `tamano_bytes` int(11) DEFAULT NULL,
  `pagina_inicio` int(11) DEFAULT NULL,
  `pagina_fin` int(11) DEFAULT NULL,
  `tipo_detectado` enum('ruta','manifiesto','guia','factura','desconocido') DEFAULT 'desconocido',
  `estado` enum('pendiente','procesando','extraido','requiere_revision','aprobado','rechazado','error') DEFAULT 'pendiente',
  `confianza` decimal(5,4) DEFAULT NULL,
  `id_servicio_sugerido` int(11) DEFAULT NULL,
  `explicacion_matching` text DEFAULT NULL,
  `datos_extraidos` longtext DEFAULT NULL,
  `candidatos_servicio` longtext DEFAULT NULL,
  `conflictos` longtext DEFAULT NULL,
  `propuesta_servicio` longtext DEFAULT NULL,
  `resultado_aprobacion` longtext DEFAULT NULL,
  `error_mensaje` text DEFAULT NULL,
  `id_usuario_aprobador` int(11) DEFAULT NULL,
  `fecha_aprobacion` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_documento`),
  KEY `idx_doc_ia_archivo_lote` (`id_lote`),
  KEY `idx_doc_ia_archivo_estado` (`estado`),
  KEY `idx_doc_ia_archivo_tipo` (`tipo_detectado`),
  KEY `idx_doc_ia_archivo_servicio` (`id_servicio_sugerido`),
  CONSTRAINT `fk_doc_ia_archivo_lote` FOREIGN KEY (`id_lote`) REFERENCES `DocumentoIALote` (`id_lote`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
