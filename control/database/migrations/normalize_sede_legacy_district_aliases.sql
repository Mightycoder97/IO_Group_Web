-- Safe legacy district aliases before/after GPS audit.
-- Ambiguous combined districts such as ATE LURIGANCHO or PACHACAMAC LURIN are intentionally left for GPS review.

START TRANSACTION;

UPDATE `Sede`
SET `distrito` = 'SANTIAGO DE SURCO', `provincia` = 'LIMA', `departamento` = 'LIMA', `region` = 'LIMA', `fecha_modificacion` = NOW()
WHERE UPPER(TRIM(`distrito`)) = 'SURCO';

UPDATE `Sede`
SET `distrito` = 'MAGDALENA DEL MAR', `provincia` = 'LIMA', `departamento` = 'LIMA', `region` = 'LIMA', `fecha_modificacion` = NOW()
WHERE UPPER(TRIM(`distrito`)) = 'MAGDALENA';

UPDATE `Sede`
SET `distrito` = 'SAN JUAN DE LURIGANCHO', `provincia` = 'LIMA', `departamento` = 'LIMA', `region` = 'LIMA', `fecha_modificacion` = NOW()
WHERE UPPER(TRIM(`distrito`)) IN ('SAN JUAN DE LURIGANCHO 1','SJL');

UPDATE `Sede`
SET `distrito` = 'SAN VICENTE DE CANETE', `provincia` = 'CANETE', `departamento` = 'LIMA', `region` = 'LIMA', `fecha_modificacion` = NOW()
WHERE UPPER(TRIM(`distrito`)) IN ('CANETE','SAN VICENTE');

UPDATE `Sede`
SET `distrito` = 'CHINCHA ALTA', `provincia` = 'CHINCHA', `departamento` = 'ICA', `region` = 'ICA', `fecha_modificacion` = NOW()
WHERE UPPER(TRIM(`distrito`)) = 'CHINCHA';

UPDATE `Sede`
SET `distrito` = 'PISCO', `provincia` = 'PISCO', `departamento` = 'ICA', `region` = 'ICA', `fecha_modificacion` = NOW()
WHERE UPPER(TRIM(`distrito`)) IN ('PISCO ICA','ICA PISCO');

UPDATE `Sede`
SET `distrito` = 'BELLAVISTA', `provincia` = 'CALLAO', `departamento` = 'CALLAO', `region` = 'LIMA', `fecha_modificacion` = NOW()
WHERE UPPER(TRIM(`distrito`)) = 'CALLAO BELLAVISTA';

UPDATE `Sede`
SET `provincia` = 'CALLAO', `departamento` = 'CALLAO', `region` = 'LIMA', `fecha_modificacion` = NOW()
WHERE UPPER(TRIM(`distrito`)) IN ('CALLAO','VENTANILLA','MI PERU');

COMMIT;
