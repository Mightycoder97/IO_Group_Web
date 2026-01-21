-- Recrear vista vw_DocumentosPorVencer

CREATE OR REPLACE VIEW vw_DocumentosPorVencer AS
SELECT 
    'Vehiculo' AS tipo_documento,
    CONCAT(placa, ' - SOAT') AS documento,
    CONCAT('Vehículo ', placa, ' - ', marca, ' ', modelo) AS descripcion,
    fecha_venc_soat AS fecha_vencimiento,
    DATEDIFF(fecha_venc_soat, CURDATE()) AS dias_restantes,
    CASE 
        WHEN fecha_venc_soat < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_venc_soat, CURDATE()) <= 7 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_venc_soat, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END AS estado
FROM Vehiculo WHERE activo = 1 AND fecha_venc_soat IS NOT NULL

UNION ALL

SELECT 
    'Vehiculo',
    CONCAT(placa, ' - Revisión Técnica'),
    CONCAT('Vehículo ', placa, ' - ', marca, ' ', modelo),
    fecha_venc_revision,
    DATEDIFF(fecha_venc_revision, CURDATE()),
    CASE 
        WHEN fecha_venc_revision < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_venc_revision, CURDATE()) <= 7 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_venc_revision, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END
FROM Vehiculo WHERE activo = 1 AND fecha_venc_revision IS NOT NULL

UNION ALL

SELECT 
    'ContratoServicio',
    CONCAT('Contrato ', IFNULL(codigo_contrato, id_contrato)),
    (SELECT nombre_comercial FROM Sede WHERE id_sede = ContratoServicio.id_sede),
    fecha_fin,
    DATEDIFF(fecha_fin, CURDATE()),
    CASE 
        WHEN fecha_fin < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_fin, CURDATE()) <= 15 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_fin, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END
FROM ContratoServicio WHERE activo = 1 AND fecha_fin IS NOT NULL

UNION ALL

SELECT 
    'Empleado',
    CONCAT(nombres, ' ', apellidos, ' - Licencia'),
    CONCAT('Licencia ', categoria_licencia, ': ', licencia_conducir),
    fecha_venc_licencia,
    DATEDIFF(fecha_venc_licencia, CURDATE()),
    CASE 
        WHEN fecha_venc_licencia < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_venc_licencia, CURDATE()) <= 15 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_venc_licencia, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END
FROM Empleado WHERE activo = 1 AND fecha_venc_licencia IS NOT NULL

UNION ALL

SELECT 
    'ContratoLaboral',
    CONCAT('Contrato Laboral #', id_contrato_laboral),
    (SELECT CONCAT(nombres, ' ', apellidos) FROM Empleado WHERE id_empleado = ContratoLaboral.id_empleado),
    fecha_fin,
    DATEDIFF(fecha_fin, CURDATE()),
    CASE 
        WHEN fecha_fin < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_fin, CURDATE()) <= 15 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_fin, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END
FROM ContratoLaboral WHERE activo = 1 AND fecha_fin IS NOT NULL;
