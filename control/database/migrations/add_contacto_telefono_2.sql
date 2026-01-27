-- ============================================
-- Migración: Agregar segundo teléfono de contacto a Sede
-- Fecha: 2026-01-27
-- ============================================

ALTER TABLE Sede ADD COLUMN contacto_telefono_2 VARCHAR(20) AFTER contacto_telefono;

-- Verificar que se agregó correctamente
SELECT 'Columna contacto_telefono_2 agregada a tabla Sede' AS Resultado;
