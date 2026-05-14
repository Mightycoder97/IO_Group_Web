-- Add operational region to Sede and support interdiario contracts.
-- Apply before deploying API/UI changes that read Sede.region.

ALTER TABLE `Sede`
  ADD COLUMN `region` varchar(20) DEFAULT NULL AFTER `departamento`;

CREATE INDEX `idx_sede_region` ON `Sede` (`region`);

ALTER TABLE `ContratoServicio`
  MODIFY `frecuencia` enum('diario','interdiario','semanal','quincenal','mensual','bimestral','trimestral','eventual') NOT NULL;

UPDATE `Sede`
SET `region` = 'ICA', `fecha_modificacion` = NOW()
WHERE `region` IS NULL
  AND (
    UPPER(TRIM(`departamento`)) = 'ICA'
    OR UPPER(TRIM(`provincia`)) IN ('ICA','CHINCHA','PISCO','NAZCA','PALPA')
  );

UPDATE `Sede`
SET `region` = 'LIMA', `fecha_modificacion` = NOW()
WHERE `region` IS NULL
  AND (
    UPPER(TRIM(`departamento`)) IN ('LIMA','CALLAO')
    OR UPPER(TRIM(`provincia`)) IN ('LIMA','CALLAO','CANETE','HUARAL','HUAROCHIRI','HUAURA','BARRANCA','CANTA','OYON','YAUYOS')
    OR UPPER(TRIM(`distrito`)) IN ('CALLAO','VENTANILLA','BELLAVISTA','MI PERU')
  );

UPDATE `ContratoServicio`
SET `frecuencia` = 'interdiario', `fecha_modificacion` = NOW()
WHERE `frecuencia` <> 'interdiario'
  AND (
    `observaciones` LIKE '%Frecuencia raw: INTERDIARIO%'
    OR `observaciones` LIKE '%Frecuencia raw: CADA 72HRS%'
    OR `observaciones` LIKE '%Frecuencia raw: 3 VECES POR SEMANA%'
    OR `observaciones` LIKE '%Frecuencia raw: 03 VECES POR SEMANA%'
    OR `observaciones` LIKE '%Frecuencia raw: 2 VECES POR SEMANA%'
  );

UPDATE `ContratoServicio`
SET `frecuencia` = 'quincenal', `fecha_modificacion` = NOW()
WHERE `frecuencia` <> 'quincenal'
  AND `observaciones` LIKE '%15CENAL%';
