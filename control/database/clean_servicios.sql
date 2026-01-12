-- ============================================
-- Script para limpiar la tabla Servicios
-- ADVERTENCIA: Esto eliminará TODOS los servicios
-- ============================================

-- Primero eliminar registros de tablas relacionadas
-- (debido a las restricciones de clave foránea)

-- Eliminar empleados asignados a servicios
DELETE FROM ServicioEmpleado;

-- Eliminar facturas
DELETE FROM Factura;

-- Eliminar guías
DELETE FROM Guia;

-- Eliminar manifiestos
DELETE FROM Manifiesto;

-- Finalmente eliminar todos los servicios
DELETE FROM Servicio;

-- Resetear el auto_increment (opcional)
ALTER TABLE Servicio AUTO_INCREMENT = 1;
ALTER TABLE ServicioEmpleado AUTO_INCREMENT = 1;
ALTER TABLE Factura AUTO_INCREMENT = 1;
ALTER TABLE Guia AUTO_INCREMENT = 1;
ALTER TABLE Manifiesto AUTO_INCREMENT = 1;

-- Verificar que está vacío
SELECT 'Servicios eliminados:' as mensaje, COUNT(*) as total FROM Servicio;
