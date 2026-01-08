-- Script para detectar servicios duplicados
-- Duplicados: misma sede + mismo mes de servicio

SELECT 
    s.id_sede,
    se.nombre_comercial as sede_nombre,
    e.razon_social as empresa,
    s.mes_servicio,
    COUNT(*) as cantidad,
    GROUP_CONCAT(s.id_servicio ORDER BY s.fecha_programada) as ids_duplicados,
    GROUP_CONCAT(s.fecha_programada ORDER BY s.fecha_programada) as fechas
FROM Servicio s
INNER JOIN Sede se ON s.id_sede = se.id_sede
INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
WHERE s.mes_servicio IS NOT NULL
GROUP BY s.id_sede, s.mes_servicio
HAVING COUNT(*) > 1
ORDER BY cantidad DESC, sede_nombre;

-- Para ver el total de duplicados
SELECT 
    COUNT(*) as total_registros_duplicados,
    SUM(cantidad - 1) as registros_a_eliminar
FROM (
    SELECT COUNT(*) as cantidad
    FROM Servicio
    WHERE mes_servicio IS NOT NULL
    GROUP BY id_sede, mes_servicio
    HAVING COUNT(*) > 1
) as dup;
