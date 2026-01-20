-- ========================================
-- Agregar estado de pago a Servicio
-- El pago ahora se gestiona por servicio, no por factura
-- ========================================

-- Agregar campo estado_pago a Servicio
ALTER TABLE Servicio ADD COLUMN estado_pago ENUM('pendiente', 'pagado') DEFAULT 'pendiente';

-- Agregar campo fecha_pago a Servicio
ALTER TABLE Servicio ADD COLUMN fecha_pago DATE DEFAULT NULL;

-- El campo tarifa_servicio ya está en Sede (se hereda al servicio)
