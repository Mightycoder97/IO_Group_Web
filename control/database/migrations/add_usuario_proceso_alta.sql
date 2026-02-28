-- Agregar trazabilidad de usuario al proceso de alta
ALTER TABLE `ProcesoAlta` ADD COLUMN `id_usuario_creador` INT(11) DEFAULT NULL AFTER `etapa_actual`;
ALTER TABLE `ProcesoAlta` ADD COLUMN `id_usuario_modificador` INT(11) DEFAULT NULL AFTER `id_usuario_creador`;
