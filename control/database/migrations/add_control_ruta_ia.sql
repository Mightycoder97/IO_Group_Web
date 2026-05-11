-- Migration: add_control_ruta_ia.sql
-- Description: Adds AI route-control evidence linkage and real collected amount.

ALTER TABLE `Servicio`
  ADD COLUMN IF NOT EXISTS `monto_cobrado` decimal(10,2) DEFAULT NULL AFTER `forma_pago`;

ALTER TABLE `DocumentoIALote`
  ADD COLUMN IF NOT EXISTS `id_ruta` int(11) DEFAULT NULL AFTER `id_usuario`,
  ADD KEY IF NOT EXISTS `idx_doc_ia_lote_ruta` (`id_ruta`);
