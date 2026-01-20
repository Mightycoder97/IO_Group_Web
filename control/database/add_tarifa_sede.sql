-- ========================================
-- Agregar tarifa_servicio a Sede
-- El monto que cobra por cada recojo
-- ========================================

-- Agregar campo tarifa_servicio a Sede
ALTER TABLE Sede ADD COLUMN tarifa_servicio DECIMAL(10,2) DEFAULT NULL;

-- Agregar campo numero_operacion a Factura (para auto-generación)
ALTER TABLE Factura ADD COLUMN numero_operacion VARCHAR(20) DEFAULT NULL;
