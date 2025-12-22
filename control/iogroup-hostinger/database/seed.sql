-- ============================================
-- IO Group - Seed Data (MySQL)
-- ============================================

USE iogroup_db;

-- ============================================
-- Usuario Admin (password: Admin123!)
-- ============================================
INSERT INTO Usuario (username, password_hash, nombre_completo, rol, email) VALUES
('admin', '$2a$10$mmf2vyZrF119xLhyLSW5X.sXjSyCorxyPXU8gLGGyNoH/ZlKHQSaLe', 'Administrador del Sistema', 'admin', 'admin@iogroup.pe');

-- ============================================
-- Planta de Tratamiento
-- ============================================
INSERT INTO Planta (razon_social, ruc, nombre_comercial, direccion, distrito, provincia, departamento, tipo_tratamiento, codigo_eps) VALUES
('ECOSERVIS S.A.C.', '20123456789', 'Ecoservis', 'Av. Industrial 1234, Lurín', 'Lurín', 'Lima', 'Lima', 'Incineración', 'EPS-001');

-- ============================================
-- Vehículos
-- ============================================
INSERT INTO Vehiculo (placa, marca, modelo, anio, color, tonelaje_max, tipo, fecha_venc_soat, fecha_venc_revision, fecha_venc_mtc) VALUES
('ABC-123', 'Hyundai', 'HD78', 2020, 'Blanco', 4.5, 'camion', DATE_ADD(CURDATE(), INTERVAL 3 MONTH), DATE_ADD(CURDATE(), INTERVAL 6 MONTH), DATE_ADD(CURDATE(), INTERVAL 12 MONTH)),
('DEF-456', 'Hyundai', 'HD65', 2019, 'Blanco', 3.5, 'camion', DATE_ADD(CURDATE(), INTERVAL 2 MONTH), DATE_ADD(CURDATE(), INTERVAL 4 MONTH), DATE_ADD(CURDATE(), INTERVAL 10 MONTH)),
('GHI-789', 'Toyota', 'Hilux', 2021, 'Gris', 1.0, 'camioneta', DATE_ADD(CURDATE(), INTERVAL 5 MONTH), DATE_ADD(CURDATE(), INTERVAL 8 MONTH), NULL);

-- ============================================
-- Empleados
-- ============================================
INSERT INTO Empleado (dni, nombres, apellidos, telefono, email, licencia_conducir, categoria_licencia, fecha_venc_licencia) VALUES
('12345678', 'Juan Carlos', 'Pérez García', '987654321', 'jperez@iogroup.pe', 'A-12345678', 'A-IIb', DATE_ADD(CURDATE(), INTERVAL 18 MONTH)),
('23456789', 'María Elena', 'López Quispe', '987654322', 'mlopez@iogroup.pe', NULL, NULL, NULL),
('34567890', 'Pedro Luis', 'García Torres', '987654323', 'pgarcia@iogroup.pe', 'B-34567890', 'A-IIb', DATE_ADD(CURDATE(), INTERVAL 6 MONTH)),
('45678901', 'Ana Rosa', 'Martínez Ruiz', '987654324', 'amartinez@iogroup.pe', NULL, NULL, NULL);

-- ============================================
-- Contratos Laborales
-- ============================================
INSERT INTO ContratoLaboral (id_empleado, cargo, fecha_inicio, fecha_fin, sueldo, tipo_contrato) VALUES
(1, 'Conductor', DATE_SUB(CURDATE(), INTERVAL 2 YEAR), DATE_ADD(CURDATE(), INTERVAL 1 YEAR), 2500.00, 'indefinido'),
(2, 'Asistente Operaciones', DATE_SUB(CURDATE(), INTERVAL 1 YEAR), DATE_ADD(CURDATE(), INTERVAL 6 MONTH), 1800.00, 'plazo_fijo'),
(3, 'Conductor', DATE_SUB(CURDATE(), INTERVAL 6 MONTH), DATE_ADD(CURDATE(), INTERVAL 18 MONTH), 2500.00, 'indefinido'),
(4, 'Ayudante', DATE_SUB(CURDATE(), INTERVAL 3 MONTH), DATE_ADD(CURDATE(), INTERVAL 9 MONTH), 1500.00, 'plazo_fijo');

-- ============================================
-- Cliente de ejemplo
-- ============================================
INSERT INTO Cliente (nombre, dni, telefono, email, direccion) VALUES
('Carlos Rodríguez', '10101010', '999888777', 'crodriguez@example.com', 'Av. Principal 100');

-- ============================================
-- Empresa de ejemplo
-- ============================================
INSERT INTO Empresa (id_cliente, razon_social, ruc, direccion_fiscal, distrito, provincia, departamento, telefono, email) VALUES
(1, 'Clínica San Pablo S.A.C.', '20987654321', 'Av. El Polo 789, Santiago de Surco', 'Santiago de Surco', 'Lima', 'Lima', '016123456', 'contacto@clinicasanpablo.pe');

-- ============================================
-- Sede de ejemplo
-- ============================================
INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono) VALUES
(1, 'Clínica San Pablo - Surco', 'Av. El Polo 789', 'Santiago de Surco', 'Lima', 'Lima', 'Dr. Ricardo Flores', '987111222');

-- ============================================
-- Contrato de Servicio
-- ============================================
INSERT INTO ContratoServicio (id_sede, codigo_contrato, fecha_inicio, fecha_fin, frecuencia, tarifa, tipo_tarifa) VALUES
(1, 'CS-2024-001', DATE_SUB(CURDATE(), INTERVAL 3 MONTH), DATE_ADD(CURDATE(), INTERVAL 9 MONTH), 'semanal', 350.00, 'por_servicio');

-- ============================================
-- Ruta de ejemplo
-- ============================================
INSERT INTO Ruta (id_vehiculo, codigo_ruta, fecha, hora_salida, km_inicial, estado) VALUES
(1, 'R-2024-001', CURDATE(), '08:00:00', 45000, 'programada');

-- ============================================
-- Servicio de ejemplo
-- ============================================
INSERT INTO Servicio (id_sede, id_ruta, id_planta, id_contrato, codigo_servicio, fecha_programada, estado) VALUES
(1, 1, 1, 1, 'SV-2024-001', CURDATE(), 'programado');

-- ============================================
-- Asignar empleado al servicio
-- ============================================
INSERT INTO ServicioEmpleado (id_servicio, id_empleado, rol) VALUES
(1, 1, 'conductor'),
(1, 4, 'ayudante');
