-- ============================================
-- Migration: Add Egreso table for expense tracking
-- IO Group Control Panel
-- ============================================

-- ============================================
-- TABLA: Egreso
-- ============================================
CREATE TABLE IF NOT EXISTS Egreso (
    id_egreso INT AUTO_INCREMENT PRIMARY KEY,
    categoria ENUM('operativo', 'fijo', 'nomina', 'administrativo', 'extraordinario') NOT NULL,
    subcategoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    id_ruta INT NULL COMMENT 'Ruta asociada para gastos operativos',
    id_vehiculo INT NULL COMMENT 'Vehículo asociado para gastos de mantenimiento',
    comprobante VARCHAR(100) NULL COMMENT 'Número de factura/boleta',
    observaciones TEXT NULL,
    id_usuario INT NOT NULL COMMENT 'Usuario que registró el gasto',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta) ON DELETE SET NULL,
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo) ON DELETE SET NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- ============================================
-- INDICES
-- ============================================
CREATE INDEX idx_egreso_fecha ON Egreso(fecha);
CREATE INDEX idx_egreso_categoria ON Egreso(categoria);
CREATE INDEX idx_egreso_subcategoria ON Egreso(subcategoria);
CREATE INDEX idx_egreso_ruta ON Egreso(id_ruta);
CREATE INDEX idx_egreso_vehiculo ON Egreso(id_vehiculo);

-- ============================================
-- TABLA: EgresoSubcategoria (Catálogo)
-- ============================================
CREATE TABLE IF NOT EXISTS EgresoSubcategoria (
    id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
    categoria ENUM('operativo', 'fijo', 'nomina', 'administrativo', 'extraordinario') NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NULL,
    activo TINYINT(1) DEFAULT 1,
    UNIQUE KEY unique_categoria_nombre (categoria, nombre)
);

-- ============================================
-- Seed subcategorías predefinidas
-- ============================================
INSERT INTO EgresoSubcategoria (categoria, nombre, descripcion) VALUES
-- Operativo (gastos durante rutas)
('operativo', 'combustible', 'Gasolina, petróleo, GLP'),
('operativo', 'estacionamiento', 'Pagos de estacionamiento'),
('operativo', 'peaje', 'Peajes y cobros de vía'),
('operativo', 'reparacion_menor', 'Reparaciones menores en ruta'),
('operativo', 'viaticos', 'Alimentación y bebidas'),
('operativo', 'otros_operativo', 'Otros gastos operativos'),

-- Fijo (gastos recurrentes)
('fijo', 'alquiler', 'Alquiler de local'),
('fijo', 'agua', 'Servicio de agua'),
('fijo', 'luz', 'Servicio eléctrico'),
('fijo', 'internet', 'Internet y telefonía'),
('fijo', 'cuota_deuda', 'Cuotas de préstamos'),
('fijo', 'seguro_vehicular', 'Seguros de vehículos'),
('fijo', 'otros_fijos', 'Otros gastos fijos'),

-- Nómina (personal)
('nomina', 'sueldo', 'Sueldos de empleados'),
('nomina', 'gratificacion', 'Gratificaciones'),
('nomina', 'cts', 'Compensación por tiempo de servicios'),
('nomina', 'essalud', 'Aporte a ESSALUD'),
('nomina', 'bonificacion', 'Bonificaciones'),
('nomina', 'otros_nomina', 'Otros gastos de personal'),

-- Administrativo
('administrativo', 'materiales_oficina', 'Útiles de oficina'),
('administrativo', 'licencias', 'Licencias y permisos'),
('administrativo', 'mantenimiento_equipo', 'Mantenimiento de equipos'),
('administrativo', 'otros_admin', 'Otros gastos administrativos'),

-- Extraordinario
('extraordinario', 'reparacion_mayor', 'Reparaciones mayores'),
('extraordinario', 'multa', 'Multas y penalidades'),
('extraordinario', 'imprevisto', 'Gastos imprevistos');
