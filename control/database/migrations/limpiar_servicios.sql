USE `u511863531_IOGroupBD`;
SET FOREIGN_KEY_CHECKS = 0;

-- Limpiar las tablas de documentación dependientes del Servicio
TRUNCATE TABLE `Factura`;
TRUNCATE TABLE `Manifiesto`;
TRUNCATE TABLE `Guia`;

-- Limpiar la tabla principal de Servicios
TRUNCATE TABLE `Servicio`;

SET FOREIGN_KEY_CHECKS = 1;
