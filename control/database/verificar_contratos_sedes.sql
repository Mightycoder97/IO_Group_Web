-- ============================================
-- Verificación de Sedes sin Contratos
-- Ejecutar en phpMyAdmin
-- ============================================

-- 1. Resumen general
SELECT 
    (SELECT COUNT(*) FROM Sede WHERE activo = 1) as total_sedes_activas,
    (SELECT COUNT(DISTINCT id_sede) FROM ContratoServicio WHERE activo = 1) as sedes_con_contrato_activo,
    (SELECT COUNT(*) FROM Sede WHERE activo = 1) - 
    (SELECT COUNT(DISTINCT cs.id_sede) FROM ContratoServicio cs 
     INNER JOIN Sede s ON cs.id_sede = s.id_sede 
     WHERE cs.activo = 1 AND s.activo = 1) as sedes_sin_contrato;

-- 2. Lista detallada de sedes SIN contrato activo
SELECT 
    s.id_sede,
    s.nombre_comercial,
    s.direccion,
    s.distrito,
    e.razon_social as empresa,
    c.nombre as cliente
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
WHERE s.activo = 1
AND s.id_sede NOT IN (
    SELECT DISTINCT id_sede 
    FROM ContratoServicio 
    WHERE activo = 1
)
ORDER BY e.razon_social, s.nombre_comercial;

-- 3. Lista de sedes CON contrato activo (para verificar)
SELECT 
    s.id_sede,
    s.nombre_comercial,
    s.direccion,
    e.razon_social as empresa,
    cs.codigo_contrato,
    cs.frecuencia,
    cs.tarifa,
    cs.fecha_inicio,
    cs.fecha_fin
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
INNER JOIN ContratoServicio cs ON s.id_sede = cs.id_sede
WHERE s.activo = 1 AND cs.activo = 1
ORDER BY e.razon_social, s.nombre_comercial;

-- 4. Verificar contratos vencidos
SELECT 
    s.nombre_comercial,
    e.razon_social as empresa,
    cs.codigo_contrato,
    cs.fecha_fin,
    DATEDIFF(cs.fecha_fin, CURDATE()) as dias_para_vencer
FROM ContratoServicio cs
INNER JOIN Sede s ON cs.id_sede = s.id_sede
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
WHERE cs.activo = 1 
AND cs.fecha_fin IS NOT NULL
AND cs.fecha_fin < CURDATE()
ORDER BY cs.fecha_fin;
