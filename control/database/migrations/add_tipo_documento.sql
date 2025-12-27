-- ============================================
-- Migración: Agregar campo tipo_documento a Cliente
-- ============================================
-- Ejecutar este script si la tabla Cliente ya existe

ALTER TABLE Cliente 
ADD COLUMN tipo_documento ENUM('DNI', 'Carnet de Extranjeria', 'RUC', 'Otro') DEFAULT 'DNI' 
AFTER nombre;

-- Actualizar registros existentes
UPDATE Cliente SET tipo_documento = 'DNI' WHERE tipo_documento IS NULL;
