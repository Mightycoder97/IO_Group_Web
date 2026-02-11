-- ============================================
-- IO Group - RESET (ORDEN CORRECTO DE DEPENDENCIAS)
-- No requiere SET FOREIGN_KEY_CHECKS = 0
-- ============================================

-- PASO 1: Eliminar tablas hijas primero
DROP TABLE IF EXISTS `AuditLog`;
DROP TABLE IF EXISTS `ServicioEmpleado`;
DROP TABLE IF EXISTS `Manifiesto`;
DROP TABLE IF EXISTS `Guia`;
DROP TABLE IF EXISTS `Factura`;

-- PASO 2: Eliminar tablas intermedias
DROP TABLE IF EXISTS `Servicio`;
DROP TABLE IF EXISTS `Ruta`;
DROP TABLE IF EXISTS `ContratoServicio`;
DROP TABLE IF EXISTS `ContratoLaboral`;

-- PASO 3: Eliminar tablas base
DROP TABLE IF EXISTS `Empleado`;
DROP TABLE IF EXISTS `Vehiculo`;
DROP TABLE IF EXISTS `Planta`;

-- PASO 4: Eliminar Sede -> Empresa -> Cliente (en ese orden)
DROP TABLE IF EXISTS `Prospecto`;
DROP TABLE IF EXISTS `Sede`;
DROP TABLE IF EXISTS `Empresa`;
DROP TABLE IF EXISTS `Cliente`;

-- Eliminar vistas
DROP VIEW IF EXISTS `vw_ServiciosCompleto`;
DROP VIEW IF EXISTS `vw_DocumentosPorVencer`;

-- =============================================
-- AHORA CREAR TABLAS EN ORDEN CORRECTO
-- =============================================

CREATE TABLE `Cliente` (
    `id_cliente` INT AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `tipo_documento` ENUM('DNI', 'Carnet de Extranjeria', 'RUC', 'Otro') DEFAULT 'DNI',
    `dni` VARCHAR(15),
<<<<<<< HEAD
    `telefono` VARCHAR(20),
    `email` VARCHAR(100),
    `direccion` VARCHAR(255),
    `notas` TEXT,
=======
>>>>>>> 96add6b (update)
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Empresa` (
    `id_empresa` INT AUTO_INCREMENT PRIMARY KEY,
    `id_cliente` INT NOT NULL,
    `razon_social` VARCHAR(200) NOT NULL,
    `ruc` VARCHAR(11) NOT NULL UNIQUE,
    `direccion_fiscal` VARCHAR(255),
    `distrito` VARCHAR(100),
    `provincia` VARCHAR(100),
    `departamento` VARCHAR(100),
    `telefono` VARCHAR(20),
    `email` VARCHAR(100),
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Sede` (
    `id_sede` INT AUTO_INCREMENT PRIMARY KEY,
    `id_empresa` INT NOT NULL,
    `nombre_comercial` VARCHAR(200) NOT NULL,
    `direccion` VARCHAR(255) NOT NULL,
    `distrito` VARCHAR(100),
    `provincia` VARCHAR(100),
    `departamento` VARCHAR(100),
    `referencia` TEXT,
    `coordenadas_gps` VARCHAR(50),
    `contacto_nombre` VARCHAR(100),
    `contacto_telefono` VARCHAR(20),
    `contacto_email` VARCHAR(100),
    `tarifa_servicio` DECIMAL(10,2) DEFAULT 0,
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_empresa`) REFERENCES `Empresa`(`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Empleado` (
    `id_empleado` INT AUTO_INCREMENT PRIMARY KEY,
    `dni` VARCHAR(8) NOT NULL UNIQUE,
    `nombres` VARCHAR(100) NOT NULL,
    `apellidos` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(20),
    `email` VARCHAR(100),
    `direccion` VARCHAR(255),
    `fecha_nacimiento` DATE,
    `licencia_conducir` VARCHAR(20),
    `categoria_licencia` VARCHAR(10),
    `fecha_venc_licencia` DATE,
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Vehiculo` (
    `id_vehiculo` INT AUTO_INCREMENT PRIMARY KEY,
    `placa` VARCHAR(10) NOT NULL UNIQUE,
    `marca` VARCHAR(50),
    `modelo` VARCHAR(50),
    `anio` INT,
    `color` VARCHAR(30),
    `tonelaje_max` DECIMAL(6,2),
    `tipo` ENUM('camion', 'furgoneta', 'camioneta', 'otro') DEFAULT 'camion',
    `numero_motor` VARCHAR(50),
    `numero_chasis` VARCHAR(50),
    `fecha_venc_soat` DATE,
    `fecha_venc_revision` DATE,
    `fecha_venc_mtc` DATE,
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Planta` (
    `id_planta` INT AUTO_INCREMENT PRIMARY KEY,
    `razon_social` VARCHAR(200) NOT NULL,
    `ruc` VARCHAR(11) NOT NULL UNIQUE,
    `nombre_comercial` VARCHAR(200),
    `direccion` VARCHAR(255) NOT NULL,
    `distrito` VARCHAR(100),
    `provincia` VARCHAR(100),
    `departamento` VARCHAR(100),
    `tipo_tratamiento` VARCHAR(100),
    `codigo_eps` VARCHAR(50),
    `telefono` VARCHAR(20),
    `contacto_nombre` VARCHAR(100),
    `contacto_email` VARCHAR(100),
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Ruta` (
    `id_ruta` INT AUTO_INCREMENT PRIMARY KEY,
    `id_vehiculo` INT NOT NULL,
    `codigo_ruta` VARCHAR(50),
    `fecha` DATE NOT NULL,
    `hora_salida` TIME,
    `hora_retorno` TIME,
    `km_inicial` INT,
    `km_final` INT,
    `estado` ENUM('programada', 'en_curso', 'completada', 'cancelada') DEFAULT 'programada',
    `observaciones` TEXT,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_vehiculo`) REFERENCES `Vehiculo`(`id_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ContratoServicio` (
    `id_contrato` INT AUTO_INCREMENT PRIMARY KEY,
    `id_sede` INT NOT NULL,
    `codigo_contrato` VARCHAR(50),
    `fecha_inicio` DATE NOT NULL,
    `fecha_fin` DATE,
    `frecuencia` ENUM('diario', 'semanal', 'quincenal', 'mensual', 'bimestral', 'trimestral', 'eventual') NOT NULL,
    `peso_limite_kg` DECIMAL(10,2),
    `tarifa` DECIMAL(10,2) NOT NULL,
    `tipo_tarifa` ENUM('por_servicio', 'por_kg', 'mensual_fijo') DEFAULT 'por_servicio',
    `doc_escaneado` VARCHAR(255),
    `observaciones` TEXT,
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_sede`) REFERENCES `Sede`(`id_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ContratoLaboral` (
    `id_contrato_laboral` INT AUTO_INCREMENT PRIMARY KEY,
    `id_empleado` INT NOT NULL,
    `cargo` VARCHAR(100) NOT NULL,
    `fecha_inicio` DATE NOT NULL,
    `fecha_fin` DATE,
    `sueldo` DECIMAL(10,2),
    `tipo_contrato` ENUM('indefinido', 'plazo_fijo', 'por_obra', 'practicas') DEFAULT 'indefinido',
    `doc_escaneado` VARCHAR(255),
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_empleado`) REFERENCES `Empleado`(`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Servicio` (
    `id_servicio` INT AUTO_INCREMENT PRIMARY KEY,
    `id_sede` INT NOT NULL,
    `id_ruta` INT,
    `id_planta` INT,
    `id_contrato` INT,
    `mes_servicio` VARCHAR(50),
    `fecha_ejecucion` DATE,
    `estado` ENUM('programado', 'en_curso', 'completado', 'cancelado') DEFAULT 'completado',
    `observaciones` TEXT,
    `estado_pago` ENUM('pendiente', 'pagado') DEFAULT 'pendiente',
    `fecha_pago` DATE,
    `forma_pago` VARCHAR(50),
    `descripcion_residuo` VARCHAR(255),
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_sede`) REFERENCES `Sede`(`id_sede`),
    FOREIGN KEY (`id_ruta`) REFERENCES `Ruta`(`id_ruta`),
    FOREIGN KEY (`id_planta`) REFERENCES `Planta`(`id_planta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `ServicioEmpleado` (
    `id_servicio_empleado` INT AUTO_INCREMENT PRIMARY KEY,
    `id_servicio` INT NOT NULL,
    `id_empleado` INT NOT NULL,
    `rol` ENUM('conductor', 'ayudante', 'supervisor') DEFAULT 'ayudante',
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_servicio`) REFERENCES `Servicio`(`id_servicio`),
    FOREIGN KEY (`id_empleado`) REFERENCES `Empleado`(`id_empleado`),
    UNIQUE KEY `unique_servicio_empleado` (`id_servicio`, `id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Manifiesto` (
    `id_manifiesto` INT AUTO_INCREMENT PRIMARY KEY,
    `id_servicio` INT NOT NULL,
    `numero_manifiesto` VARCHAR(50),
    `tipo_residuo` VARCHAR(100),
    `codigo_residuo` VARCHAR(20),
    `descripcion_residuo` TEXT,
    `peso_kg` DECIMAL(10,2),
    `unidad_medida` VARCHAR(20) DEFAULT 'kg',
    `cantidad_bultos` INT,
    `nombre_responsable` VARCHAR(100),
    `cargo_responsable` VARCHAR(100),
    `dni_responsable` VARCHAR(15),
    `doc_escaneado` VARCHAR(255),
    `observaciones` TEXT,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_servicio`) REFERENCES `Servicio`(`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Guia` (
    `id_guia` INT AUTO_INCREMENT PRIMARY KEY,
    `id_servicio` INT NOT NULL,
    `serie` VARCHAR(10),
    `numero_guia` VARCHAR(20) NOT NULL,
    `fecha_emision` DATE,
    `punto_partida` VARCHAR(255),
    `punto_llegada` VARCHAR(255),
    `doc_escaneado` VARCHAR(255),
    `observaciones` TEXT,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_servicio`) REFERENCES `Servicio`(`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Factura` (
    `id_factura` INT AUTO_INCREMENT PRIMARY KEY,
    `id_servicio` INT NOT NULL,
    `numero_factura` VARCHAR(50) NOT NULL,
    `doc_escaneado` VARCHAR(500),
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_servicio`) REFERENCES `Servicio`(`id_servicio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `AuditLog` (
    `id_log` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT,
    `tabla_afectada` VARCHAR(50) NOT NULL,
    `id_registro` INT,
    `accion` ENUM('INSERT', 'UPDATE', 'DELETE', 'LOGIN', 'LOGOUT') NOT NULL,
    `datos_anteriores` JSON,
    `datos_nuevos` JSON,
    `ip_address` VARCHAR(45),
    `fecha_hora` DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_usuario`) REFERENCES `Usuario`(`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Prospecto` (
    `id_prospecto` INT AUTO_INCREMENT PRIMARY KEY,
    `nombre_comercial` VARCHAR(200) NOT NULL,
    `tipo_cliente` ENUM('persona', 'empresa') DEFAULT 'persona',
    `ruc` VARCHAR(11),
    `dni` VARCHAR(15),
    `telefono` VARCHAR(20),
    `email` VARCHAR(100),
    `direccion` VARCHAR(255),
    `distrito` VARCHAR(100),
    `fuente` VARCHAR(50),
    `estado` ENUM('nuevo', 'contactado', 'interesado', 'propuesta', 'negociacion', 'ganado', 'perdido') DEFAULT 'nuevo',
    `valor_potencial` DECIMAL(10,2),
    `notas` TEXT,
    `id_usuario_asignado` INT,
    `fecha_proximo_contacto` DATE,
    `activo` TINYINT(1) DEFAULT 1,
    `fecha_creacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`id_usuario_asignado`) REFERENCES `Usuario`(`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Planta por defecto
INSERT INTO `Planta` (`razon_social`, `ruc`, `nombre_comercial`, `direccion`, `distrito`, `departamento`, `tipo_tratamiento`)
VALUES ('PLANTA PROCESADORA SAC', '20123456789', 'Planta Lima', 'Av. Industrial 123', 'Ate', 'Lima', 'Incineración');

SELECT 'RESET COMPLETADO - Ahora importa datos_excel_insert.sql' AS resultado;
