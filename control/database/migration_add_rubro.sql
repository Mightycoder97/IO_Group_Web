-- ============================================
-- IO Group - Migración: Agregar columna rubro a Empresa
-- ============================================
-- Ejecutar ANTES de import_data.sql
-- ============================================

ALTER TABLE Empresa ADD COLUMN rubro VARCHAR(100) AFTER departamento;

-- Verificar
SELECT 'Columna rubro agregada a Empresa' as resultado;
