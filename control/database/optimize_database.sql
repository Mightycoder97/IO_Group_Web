-- ============================================
-- IO Group - Database Optimization
-- Indices adicionales para mejorar rendimiento
-- ============================================

-- Indices para búsquedas frecuentes
CREATE INDEX IF NOT EXISTS idx_sede_nombre ON Sede(nombre_comercial);
CREATE INDEX IF NOT EXISTS idx_sede_activo ON Sede(activo);
CREATE INDEX IF NOT EXISTS idx_empresa_ruc ON Empresa(ruc);
CREATE INDEX IF NOT EXISTS idx_empresa_razon ON Empresa(razon_social);
CREATE INDEX IF NOT EXISTS idx_cliente_nombre ON Cliente(nombre);

-- Indices para servicios (tabla más grande)
CREATE INDEX IF NOT EXISTS idx_servicio_sede ON Servicio(id_sede);
CREATE INDEX IF NOT EXISTS idx_servicio_planta ON Servicio(id_planta);
CREATE INDEX IF NOT EXISTS idx_servicio_ruta ON Servicio(id_ruta);
CREATE INDEX IF NOT EXISTS idx_servicio_fecha_estado ON Servicio(fecha_programada, estado);

-- Indices para facturas
CREATE INDEX IF NOT EXISTS idx_factura_fecha ON Factura(fecha_emision);
CREATE INDEX IF NOT EXISTS idx_factura_servicio ON Factura(id_servicio);
CREATE INDEX IF NOT EXISTS idx_factura_numero ON Factura(numero_factura);

-- Indices para manifiestos
CREATE INDEX IF NOT EXISTS idx_manifiesto_servicio ON Manifiesto(id_servicio);
CREATE INDEX IF NOT EXISTS idx_manifiesto_numero ON Manifiesto(numero_manifiesto);

-- Indices para contratos
CREATE INDEX IF NOT EXISTS idx_contrato_sede ON ContratoServicio(id_sede);
CREATE INDEX IF NOT EXISTS idx_contrato_fecha ON ContratoServicio(fecha_inicio);

-- Indices compuestos para JOINs frecuentes
CREATE INDEX IF NOT EXISTS idx_sede_empresa_activo ON Sede(id_empresa, activo);
CREATE INDEX IF NOT EXISTS idx_servicio_fecha_sede ON Servicio(fecha_programada, id_sede);

-- Optimizar tablas (reorganizar datos)
OPTIMIZE TABLE Servicio;
OPTIMIZE TABLE Factura;
OPTIMIZE TABLE Manifiesto;
OPTIMIZE TABLE Sede;
OPTIMIZE TABLE Empresa;
OPTIMIZE TABLE Cliente;

-- Actualizar estadísticas
ANALYZE TABLE Servicio;
ANALYZE TABLE Factura;
ANALYZE TABLE Manifiesto;
ANALYZE TABLE Sede;
ANALYZE TABLE Empresa;
ANALYZE TABLE Cliente;
