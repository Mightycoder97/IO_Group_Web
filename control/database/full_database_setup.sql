-- ============================================
-- IO Group - Script Completo de Base de Datos
-- Para importar en base de datos NUEVA/LIMPIA
-- ============================================
-- INSTRUCCIONES:
-- 1. Crear base de datos nueva en phpMyAdmin (ej: iogroup_db)
-- 2. Seleccionar la base de datos
-- 3. Importar este archivo PRIMERO
-- 4. Luego importar import_data.sql
-- 5. Finalmente importar update_coordinates.sql (opcional)
-- ============================================

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8mb4;

-- ============================================
-- LIMPIAR TABLAS EXISTENTES (si las hay)
-- ============================================
DROP TABLE IF EXISTS AuditLog;
DROP TABLE IF EXISTS Factura;
DROP TABLE IF EXISTS Guia;
DROP TABLE IF EXISTS Manifiesto;
DROP TABLE IF EXISTS ServicioEmpleado;
DROP TABLE IF EXISTS Servicio;
DROP TABLE IF EXISTS Ruta;
DROP TABLE IF EXISTS ContratoLaboral;
DROP TABLE IF EXISTS ContratoServicio;
DROP TABLE IF EXISTS Planta;
DROP TABLE IF EXISTS Vehiculo;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Sede;
DROP TABLE IF EXISTS Empresa;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Usuario;

DROP VIEW IF EXISTS vw_ServiciosCompleto;
DROP VIEW IF EXISTS vw_DocumentosPorVencer;

-- ============================================
-- TABLA: Usuario
-- ============================================
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    rol ENUM('admin', 'editor', 'viewer') DEFAULT 'viewer',
    email VARCHAR(100),
    activo TINYINT(1) DEFAULT 1,
    ultimo_acceso DATETIME,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- TABLA: Cliente
-- ============================================
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(15),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(255),
    notas TEXT,
    activo TINYINT(1) DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- TABLA: Empresa (con campo rubro)
-- ============================================
CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    razon_social VARCHAR(200) NOT NULL,
    ruc VARCHAR(11) NOT NULL UNIQUE,
    direccion_fiscal VARCHAR(255),
    distrito VARCHAR(100),
    provincia VARCHAR(100),
    departamento VARCHAR(100),
    rubro VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    activo TINYINT(1) DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- ============================================
-- TABLA: Sede
-- ============================================
CREATE TABLE Sede (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre_comercial VARCHAR(200) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    distrito VARCHAR(100),
    provincia VARCHAR(100),
    departamento VARCHAR(100),
    referencia TEXT,
    coordenadas_gps VARCHAR(50),
    contacto_nombre VARCHAR(100),
    contacto_telefono VARCHAR(20),
    contacto_email VARCHAR(100),
    activo TINYINT(1) DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);

-- ============================================
-- TABLA: ContratoServicio
-- ============================================
CREATE TABLE ContratoServicio (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_sede INT NOT NULL,
    codigo_contrato VARCHAR(50),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    frecuencia ENUM('diario', 'semanal', 'quincenal', 'mensual', 'bimestral', 'trimestral', 'eventual') NOT NULL,
    peso_limite_kg DECIMAL(10,2),
    tarifa DECIMAL(10,2) NOT NULL,
    tipo_tarifa ENUM('por_servicio', 'por_kg', 'mensual_fijo') DEFAULT 'por_servicio',
    doc_escaneado VARCHAR(255),
    observaciones TEXT,
    activo TINYINT(1) DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede)
);

-- ============================================
-- TABLA: Empleado
-- ============================================
CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(8) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(255),
    fecha_nacimiento DATE,
    licencia_conducir VARCHAR(20),
    categoria_licencia VARCHAR(10),
    fecha_venc_licencia DATE,
    activo TINYINT(1) DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- TABLA: ContratoLaboral
-- ============================================
CREATE TABLE ContratoLaboral (
    id_contrato_laboral INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    sueldo DECIMAL(10,2),
    tipo_contrato ENUM('indefinido', 'plazo_fijo', 'por_obra', 'practicas') DEFAULT 'indefinido',
    doc_escaneado VARCHAR(255),
    activo TINYINT(1) DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- ============================================
-- TABLA: Vehiculo
-- ============================================
CREATE TABLE Vehiculo (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    anio INT,
    color VARCHAR(30),
    tonelaje_max DECIMAL(6,2),
    tipo ENUM('camion', 'furgoneta', 'camioneta', 'otro') DEFAULT 'camion',
    numero_motor VARCHAR(50),
    numero_chasis VARCHAR(50),
    fecha_venc_soat DATE,
    fecha_venc_revision DATE,
    fecha_venc_mtc DATE,
    activo TINYINT(1) DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- TABLA: Planta
-- ============================================
CREATE TABLE Planta (
    id_planta INT AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(200) NOT NULL,
    ruc VARCHAR(11) NOT NULL UNIQUE,
    nombre_comercial VARCHAR(200),
    direccion VARCHAR(255) NOT NULL,
    distrito VARCHAR(100),
    provincia VARCHAR(100),
    departamento VARCHAR(100),
    tipo_tratamiento VARCHAR(100),
    codigo_eps VARCHAR(50),
    telefono VARCHAR(20),
    contacto_nombre VARCHAR(100),
    contacto_email VARCHAR(100),
    activo TINYINT(1) DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- TABLA: Ruta
-- ============================================
CREATE TABLE Ruta (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,
    id_vehiculo INT NOT NULL,
    codigo_ruta VARCHAR(50),
    fecha DATE NOT NULL,
    hora_salida TIME,
    hora_retorno TIME,
    km_inicial INT,
    km_final INT,
    estado ENUM('programada', 'en_curso', 'completada', 'cancelada') DEFAULT 'programada',
    observaciones TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo)
);

-- ============================================
-- TABLA: Servicio
-- ============================================
CREATE TABLE Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_sede INT NOT NULL,
    id_ruta INT,
    id_planta INT NOT NULL,
    id_contrato INT,
    codigo_servicio VARCHAR(50),
    fecha_programada DATE NOT NULL,
    fecha_ejecucion DATE,
    hora_llegada TIME,
    hora_salida TIME,
    estado ENUM('programado', 'en_curso', 'completado', 'cancelado') DEFAULT 'programado',
    observaciones TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede),
    FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta),
    FOREIGN KEY (id_planta) REFERENCES Planta(id_planta),
    FOREIGN KEY (id_contrato) REFERENCES ContratoServicio(id_contrato)
);

-- ============================================
-- TABLA: ServicioEmpleado (N:M)
-- ============================================
CREATE TABLE ServicioEmpleado (
    id_servicio_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_empleado INT NOT NULL,
    rol ENUM('conductor', 'ayudante', 'supervisor') DEFAULT 'ayudante',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    UNIQUE KEY unique_servicio_empleado (id_servicio, id_empleado)
);

-- ============================================
-- TABLA: Manifiesto
-- ============================================
CREATE TABLE Manifiesto (
    id_manifiesto INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL UNIQUE,
    numero_manifiesto VARCHAR(50),
    tipo_residuo VARCHAR(100) NOT NULL,
    codigo_residuo VARCHAR(20),
    descripcion_residuo TEXT,
    peso_kg DECIMAL(10,2) NOT NULL,
    unidad_medida VARCHAR(20) DEFAULT 'kg',
    cantidad_bultos INT,
    nombre_responsable VARCHAR(100),
    cargo_responsable VARCHAR(100),
    dni_responsable VARCHAR(15),
    doc_escaneado VARCHAR(255),
    observaciones TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- ============================================
-- TABLA: Guia
-- ============================================
CREATE TABLE Guia (
    id_guia INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL UNIQUE,
    serie VARCHAR(10),
    numero_guia VARCHAR(20) NOT NULL,
    fecha_emision DATE NOT NULL,
    punto_partida VARCHAR(255),
    punto_llegada VARCHAR(255),
    doc_escaneado VARCHAR(255),
    observaciones TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- ============================================
-- TABLA: Factura
-- ============================================
CREATE TABLE Factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL UNIQUE,
    serie VARCHAR(10),
    numero_factura VARCHAR(20) NOT NULL,
    fecha_emision DATE NOT NULL,
    monto_subtotal DECIMAL(10,2),
    igv DECIMAL(10,2),
    monto_total DECIMAL(10,2) NOT NULL,
    estado ENUM('emitida', 'pagada', 'anulada', 'vencida') DEFAULT 'emitida',
    fecha_vencimiento DATE,
    fecha_pago DATE,
    metodo_pago VARCHAR(50),
    doc_escaneado VARCHAR(255),
    observaciones TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- ============================================
-- TABLA: AuditLog
-- ============================================
CREATE TABLE AuditLog (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tabla_afectada VARCHAR(50) NOT NULL,
    id_registro INT,
    accion ENUM('INSERT', 'UPDATE', 'DELETE', 'LOGIN', 'LOGOUT') NOT NULL,
    datos_anteriores JSON,
    datos_nuevos JSON,
    ip_address VARCHAR(45),
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- ============================================
-- USUARIO ADMIN (password: Admin123!)
-- ============================================
INSERT INTO Usuario (username, password_hash, nombre_completo, rol, email) VALUES
('admin', '$2a$10$mmf2vyZrF119xLhyLSW5X.sXjSyCorxyPXU8gLGGyNoH/ZlKHQSaLe', 'Administrador del Sistema', 'admin', 'admin@iogroup.pe');

-- ============================================
-- INDICES PRINCIPALES
-- ============================================
CREATE INDEX idx_empresa_cliente ON Empresa(id_cliente);
CREATE INDEX idx_sede_empresa ON Sede(id_empresa);
CREATE INDEX idx_contrato_sede ON ContratoServicio(id_sede);
CREATE INDEX idx_servicio_fecha ON Servicio(fecha_programada);
CREATE INDEX idx_servicio_estado ON Servicio(estado);
CREATE INDEX idx_ruta_fecha ON Ruta(fecha);
CREATE INDEX idx_factura_estado ON Factura(estado);
CREATE INDEX idx_vehiculo_placa ON Vehiculo(placa);
CREATE INDEX idx_empleado_dni ON Empleado(dni);
CREATE INDEX idx_sede_nombre ON Sede(nombre_comercial);
CREATE INDEX idx_sede_activo ON Sede(activo);
CREATE INDEX idx_empresa_ruc ON Empresa(ruc);
CREATE INDEX idx_empresa_razon ON Empresa(razon_social);
CREATE INDEX idx_cliente_nombre ON Cliente(nombre);
CREATE INDEX idx_servicio_sede ON Servicio(id_sede);
CREATE INDEX idx_servicio_planta ON Servicio(id_planta);
CREATE INDEX idx_factura_fecha ON Factura(fecha_emision);
CREATE INDEX idx_manifiesto_numero ON Manifiesto(numero_manifiesto);
CREATE INDEX idx_sede_empresa_activo ON Sede(id_empresa, activo);
CREATE INDEX idx_servicio_fecha_sede ON Servicio(fecha_programada, id_sede);

-- ============================================
-- VISTA: Servicios Completo
-- ============================================
CREATE OR REPLACE VIEW vw_ServiciosCompleto AS
SELECT 
    s.id_servicio,
    s.codigo_servicio,
    s.fecha_programada,
    s.fecha_ejecucion,
    s.estado,
    se.nombre_comercial AS sede_nombre,
    se.direccion AS sede_direccion,
    e.razon_social AS empresa_razon_social,
    e.ruc AS empresa_ruc,
    c.nombre AS cliente_nombre,
    p.nombre_comercial AS planta_nombre,
    r.codigo_ruta,
    v.placa AS vehiculo_placa,
    m.peso_kg,
    m.tipo_residuo,
    f.numero_factura,
    f.monto_total,
    f.estado AS factura_estado
FROM Servicio s
INNER JOIN Sede se ON s.id_sede = se.id_sede
INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
INNER JOIN Planta p ON s.id_planta = p.id_planta
LEFT JOIN Ruta r ON s.id_ruta = r.id_ruta
LEFT JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
LEFT JOIN Factura f ON s.id_servicio = f.id_servicio;

-- ============================================
-- VISTA: Documentos por Vencer
-- ============================================
CREATE OR REPLACE VIEW vw_DocumentosPorVencer AS
SELECT 
    'Vehiculo' AS tipo_documento,
    CONCAT(placa, ' - SOAT') AS documento,
    CONCAT('Vehículo ', placa, ' - ', marca, ' ', modelo) AS descripcion,
    fecha_venc_soat AS fecha_vencimiento,
    DATEDIFF(fecha_venc_soat, CURDATE()) AS dias_restantes,
    CASE 
        WHEN fecha_venc_soat < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_venc_soat, CURDATE()) <= 7 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_venc_soat, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END AS estado
FROM Vehiculo WHERE activo = 1 AND fecha_venc_soat IS NOT NULL

UNION ALL

SELECT 
    'Vehiculo',
    CONCAT(placa, ' - Revisión Técnica'),
    CONCAT('Vehículo ', placa, ' - ', marca, ' ', modelo),
    fecha_venc_revision,
    DATEDIFF(fecha_venc_revision, CURDATE()),
    CASE 
        WHEN fecha_venc_revision < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_venc_revision, CURDATE()) <= 7 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_venc_revision, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END
FROM Vehiculo WHERE activo = 1 AND fecha_venc_revision IS NOT NULL

UNION ALL

SELECT 
    'ContratoServicio',
    CONCAT('Contrato ', IFNULL(codigo_contrato, id_contrato)),
    (SELECT nombre_comercial FROM Sede WHERE id_sede = ContratoServicio.id_sede),
    fecha_fin,
    DATEDIFF(fecha_fin, CURDATE()),
    CASE 
        WHEN fecha_fin < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_fin, CURDATE()) <= 15 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_fin, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END
FROM ContratoServicio WHERE activo = 1 AND fecha_fin IS NOT NULL

UNION ALL

SELECT 
    'Empleado',
    CONCAT(nombres, ' ', apellidos, ' - Licencia'),
    CONCAT('Licencia ', categoria_licencia, ': ', licencia_conducir),
    fecha_venc_licencia,
    DATEDIFF(fecha_venc_licencia, CURDATE()),
    CASE 
        WHEN fecha_venc_licencia < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_venc_licencia, CURDATE()) <= 15 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_venc_licencia, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END
FROM Empleado WHERE activo = 1 AND fecha_venc_licencia IS NOT NULL

UNION ALL

SELECT 
    'ContratoLaboral',
    CONCAT('Contrato Laboral #', id_contrato_laboral),
    (SELECT CONCAT(nombres, ' ', apellidos) FROM Empleado WHERE id_empleado = ContratoLaboral.id_empleado),
    fecha_fin,
    DATEDIFF(fecha_fin, CURDATE()),
    CASE 
        WHEN fecha_fin < CURDATE() THEN 'VENCIDO'
        WHEN DATEDIFF(fecha_fin, CURDATE()) <= 15 THEN 'CRITICO'
        WHEN DATEDIFF(fecha_fin, CURDATE()) <= 30 THEN 'ADVERTENCIA'
        ELSE 'OK'
    END
FROM ContratoLaboral WHERE activo = 1 AND fecha_fin IS NOT NULL;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- COMPLETADO
-- ============================================
SELECT '✅ Estructura de base de datos creada exitosamente' AS Resultado;
SELECT '📝 Ahora importa: import_data.sql para datos de clientes' AS Siguiente_Paso;
SELECT '🗺️ Opcional: update_coordinates.sql para coordenadas GPS' AS Opcional;
