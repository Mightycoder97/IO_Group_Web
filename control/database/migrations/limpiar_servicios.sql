USE `u511863531_IOGroupBD`;
SET FOREIGN_KEY_CHECKS = 0;

-- Limpiar las tablas de documentación dependientes del Servicio
DELETE FROM `Factura`;
ALTER TABLE `Factura` AUTO_INCREMENT = 1;

DELETE FROM `Manifiesto`;
ALTER TABLE `Manifiesto` AUTO_INCREMENT = 1;

DELETE FROM `Guia`;
ALTER TABLE `Guia` AUTO_INCREMENT = 1;

-- Limpiar la tabla principal de Servicios
DELETE FROM `Servicio`;
ALTER TABLE `Servicio` AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;
