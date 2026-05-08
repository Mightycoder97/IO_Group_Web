-- Limpieza GPS: coordenadas fuera de Lima/Ica detectadas en update_sedes_gps_2026_audit.json
-- No se reemplazan por coordenadas aproximadas; se anulan para evitar puntos falsos en el mapa.

START TRANSACTION;

UPDATE `Sede`
SET `coordenadas_gps` = NULL, `fecha_modificacion` = NOW()
WHERE `id_sede` = 419 AND `coordenadas_gps` = '-15.498521,-70.135033';

UPDATE `Sede`
SET `coordenadas_gps` = NULL, `fecha_modificacion` = NOW()
WHERE `id_sede` = 694 AND `coordenadas_gps` = '-6.786005,-79.833969';

UPDATE `Sede`
SET `coordenadas_gps` = NULL, `fecha_modificacion` = NOW()
WHERE `id_sede` = 1016 AND `coordenadas_gps` = '-12.074605,-75.209957';

UPDATE `Sede`
SET `coordenadas_gps` = NULL, `fecha_modificacion` = NOW()
WHERE `id_sede` = 1028 AND `coordenadas_gps` = '-12.741772,-74.385985';

UPDATE `Sede`
SET `coordenadas_gps` = NULL, `fecha_modificacion` = NOW()
WHERE `id_sede` = 1453 AND `coordenadas_gps` = '-16.400438,-71.518147';

COMMIT;
