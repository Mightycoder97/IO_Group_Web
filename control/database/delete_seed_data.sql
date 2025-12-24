-- ============================================
-- Eliminar datos de seed.sql de la base de datos
-- Ejecutar en phpMyAdmin (en orden)
-- ============================================

USE iogroup_db;

-- Desactivar verificación de foreign keys temporalmente
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Eliminar asignaciones de empleados a servicios
DELETE FROM ServicioEmpleado WHERE id_servicio = 1;

-- 2. Eliminar servicios de ejemplo
DELETE FROM Servicio WHERE codigo_servicio = 'SV-2024-001';

-- 3. Eliminar rutas de ejemplo
DELETE FROM Ruta WHERE codigo_ruta = 'R-2024-001';

-- 4. Eliminar contratos de servicio de ejemplo
DELETE FROM ContratoServicio WHERE codigo_contrato = 'CS-2024-001';

-- 5. Eliminar sede de ejemplo
DELETE FROM Sede WHERE nombre_comercial = 'Clínica San Pablo - Surco';

-- 6. Eliminar empresa de ejemplo
DELETE FROM Empresa WHERE ruc = '20987654321';

-- 7. Eliminar cliente de ejemplo
DELETE FROM Cliente WHERE dni = '10101010';

-- 8. Eliminar contratos laborales de ejemplo
DELETE FROM ContratoLaboral WHERE id_empleado IN (1, 2, 3, 4);

-- 9. Eliminar empleados de ejemplo
DELETE FROM Empleado WHERE dni IN ('12345678', '23456789', '34567890', '45678901');

-- 10. Eliminar vehículos de ejemplo
DELETE FROM Vehiculo WHERE placa IN ('ABC-123', 'DEF-456', 'GHI-789');

-- 11. Eliminar planta de ejemplo
DELETE FROM Planta WHERE ruc = '20123456789';

-- Reactivar verificación de foreign keys
SET FOREIGN_KEY_CHECKS = 1;

-- Verificar que se eliminaron
SELECT 'Registros restantes:' as mensaje;
SELECT 'Plantas:' as tabla, COUNT(*) as cantidad FROM Planta
UNION ALL SELECT 'Vehiculos:', COUNT(*) FROM Vehiculo
UNION ALL SELECT 'Empleados:', COUNT(*) FROM Empleado
UNION ALL SELECT 'Clientes:', COUNT(*) FROM Cliente
UNION ALL SELECT 'Empresas:', COUNT(*) FROM Empresa
UNION ALL SELECT 'Sedes:', COUNT(*) FROM Sede;
