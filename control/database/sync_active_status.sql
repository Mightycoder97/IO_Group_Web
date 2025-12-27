-- ============================================
-- IO Group - Sincronizar Estado Activo
-- Fecha: 2025-12-25
-- ============================================
-- Este script propaga el estado activo de las sedes
-- hacia arriba: Sede -> Empresa -> Cliente
-- Si una sede está activa, su empresa y cliente también lo estarán
-- ============================================

-- PASO 1: Activar Empresas que tengan al menos una Sede activa
UPDATE Empresa e
SET e.activo = 1
WHERE EXISTS (
    SELECT 1 FROM Sede s 
    WHERE s.id_empresa = e.id_empresa 
    AND s.activo = 1
);

SELECT 'Empresas activadas por tener sedes activas:' as mensaje, ROW_COUNT() as cantidad;

-- PASO 2: Activar Clientes que tengan al menos una Empresa activa
UPDATE Cliente c
SET c.activo = 1
WHERE EXISTS (
    SELECT 1 FROM Empresa e 
    WHERE e.id_cliente = c.id_cliente 
    AND e.activo = 1
);

SELECT 'Clientes activados por tener empresas activas:' as mensaje, ROW_COUNT() as cantidad;

-- PASO 3: Activar Sedes si su Empresa está activa
-- (esto es opcional, si quieres que la activación sea bidireccional)
-- UPDATE Sede s
-- SET s.activo = 1
-- WHERE EXISTS (
--     SELECT 1 FROM Empresa e 
--     WHERE e.id_empresa = s.id_empresa 
--     AND e.activo = 1
-- );

-- ============================================
-- RESUMEN FINAL
-- ============================================
SELECT 'RESUMEN DE ESTADOS ACTIVOS:' as titulo;

SELECT 'Clientes' as entidad, 
       SUM(CASE WHEN activo = 1 THEN 1 ELSE 0 END) as activos,
       SUM(CASE WHEN activo = 0 THEN 1 ELSE 0 END) as inactivos
FROM Cliente;

SELECT 'Empresas' as entidad,
       SUM(CASE WHEN activo = 1 THEN 1 ELSE 0 END) as activos,
       SUM(CASE WHEN activo = 0 THEN 1 ELSE 0 END) as inactivos
FROM Empresa;

SELECT 'Sedes' as entidad,
       SUM(CASE WHEN activo = 1 THEN 1 ELSE 0 END) as activos,
       SUM(CASE WHEN activo = 0 THEN 1 ELSE 0 END) as inactivos
FROM Sede;
