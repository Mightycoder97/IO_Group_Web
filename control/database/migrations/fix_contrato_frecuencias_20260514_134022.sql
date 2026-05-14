-- ContratoServicio frecuencia corrections generated from DATA IOGROUP AG
START TRANSACTION;

UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 497;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 757;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 777;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 900;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 941;
UPDATE `ContratoServicio` SET `frecuencia` = 'quincenal', `fecha_modificacion` = NOW() WHERE `id_contrato` = 993;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 1122;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 1138;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 1290;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 1384;
UPDATE `ContratoServicio` SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW() WHERE `id_contrato` = 1392;

COMMIT;
