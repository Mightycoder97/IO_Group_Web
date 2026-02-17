-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-02-2026 a las 02:10:23
-- Versión del servidor: 11.8.3-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u511863531_IOGroupBD`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AuditLog`
--

CREATE TABLE `AuditLog` (
  `id_log` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `tabla_afectada` varchar(50) NOT NULL,
  `id_registro` int(11) DEFAULT NULL,
  `accion` enum('INSERT','UPDATE','DELETE','LOGIN','LOGOUT') NOT NULL,
  `datos_anteriores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_anteriores`)),
  `datos_nuevos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_nuevos`)),
  `ip_address` varchar(45) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `AuditLog`
--

INSERT INTO `AuditLog` (`id_log`, `id_usuario`, `tabla_afectada`, `id_registro`, `accion`, `datos_anteriores`, `datos_nuevos`, `ip_address`, `fecha_hora`) VALUES
(1, 2, 'Sede', 1, '', NULL, '{\"cliente_id\":\"1\",\"empresa_id\":\"1\",\"sede_id\":\"1\"}', NULL, '2026-02-03 20:45:46'),
(2, 2, 'ContratoServicio', 1, 'UPDATE', '{\"id_contrato\":1,\"id_sede\":1,\"codigo_contrato\":null,\"fecha_inicio\":\"2021-08-04\",\"fecha_fin\":null,\"frecuencia\":\"mensual\",\"peso_limite_kg\":\"10.00\",\"tarifa\":\"50.00\",\"tipo_tarifa\":\"por_servicio\",\"doc_escaneado\":null,\"observaciones\":null,\"activo\":1,\"fecha_creacion\":\"2026-02-03 20:45:46\",\"fecha_modificacion\":\"2026-02-03 20:45:46\"}', '{\"id_sede\":\"1\",\"codigo_contrato\":null,\"fecha_inicio\":\"2021-08-04\",\"fecha_fin\":null,\"frecuencia\":\"mensual\",\"peso_limite_kg\":\"10.00\",\"tarifa\":\"50.00\",\"tipo_tarifa\":\"por_servicio\",\"observaciones\":null,\"renovacion_automatica\":\"1\",\"estado\":\"vigente\",\"tipo_residuo\":\"biocontaminado\",\"contenedor_incluido\":\"1\",\"incluye_igv\":\"1\"}', NULL, '2026-02-03 20:46:24'),
(3, 2, 'Sede', 1, 'UPDATE', '{\"id_sede\":1,\"id_empresa\":1,\"nombre_comercial\":\"ALFREDO ORTEGA CLINICA DE DERMATOLOGIA VETERINARIA\",\"direccion\":\"Calle Galicia 144, Santiago de Surco\",\"distrito\":\"Santiago de Surco\",\"provincia\":\"Lima\",\"departamento\":\"Provincia de Lima\",\"referencia\":null,\"coordenadas_gps\":\"-12.122678, -76.993358\",\"contacto_nombre\":\"Karla\",\"contacto_telefono\":\"960388190\",\"contacto_telefono_2\":null,\"contacto_email\":\"aortegaprieto11@gmail.com\",\"tarifa_servicio\":\"0.00\",\"activo\":1,\"fecha_creacion\":\"2026-02-03 20:45:46\",\"fecha_modificacion\":\"2026-02-03 20:45:46\"}', '{\"nombre_comercial\":\"ALFREDO ORTEGA CLINICA DE DERMATOLOGIA VETERINARIA\",\"direccion\":\"Calle Galicia 144, Santiago de Surco\",\"distrito\":\"Santiago de Surco\",\"provincia\":\"Lima\",\"departamento\":\"Provincia de Lima\",\"referencia\":null,\"coordenadas_gps\":\"-12.122678, -76.993358\",\"contacto_nombre\":\"Karla\",\"contacto_telefono\":\"960388190\",\"contacto_email\":\"aortegaprieto11@gmail.com\",\"activo\":true,\"id_empresa\":\"1\"}', NULL, '2026-02-03 20:53:24'),
(4, 2, 'Sede', 1, 'UPDATE', '{\"id_sede\":1,\"id_empresa\":1,\"nombre_comercial\":\"ALFREDO ORTEGA CLINICA DE DERMATOLOGIA VETERINARIA\",\"direccion\":\"Calle Galicia 144, Santiago de Surco\",\"distrito\":\"Santiago de Surco\",\"provincia\":\"Lima\",\"departamento\":\"Provincia de Lima\",\"referencia\":null,\"coordenadas_gps\":\"-12.122678, -76.993358\",\"contacto_nombre\":\"Karla\",\"contacto_telefono\":\"960388190\",\"contacto_telefono_2\":null,\"contacto_email\":\"aortegaprieto11@gmail.com\",\"tarifa_servicio\":\"0.00\",\"activo\":1,\"fecha_creacion\":\"2026-02-03 20:45:46\",\"fecha_modificacion\":\"2026-02-03 20:53:24\"}', '{\"nombre_comercial\":\"ALFREDO ORTEGA CLINICA DE DERMATOLOGIA VETERINARIA\",\"direccion\":\"Calle Galicia 144, Santiago de Surco\",\"distrito\":\"Santiago de Surco\",\"provincia\":\"Lima\",\"departamento\":\"Provincia de Lima\",\"referencia\":null,\"coordenadas_gps\":\"-12.122678, -76.993358\",\"contacto_nombre\":\"Karla\",\"contacto_telefono\":\"960388190\",\"contacto_email\":\"aortegaprieto11@gmail.com\",\"activo\":false,\"id_empresa\":\"1\"}', NULL, '2026-02-03 20:53:30'),
(5, 2, 'ContratoServicio', 1, 'UPDATE', '{\"id_contrato\":1,\"id_sede\":1,\"codigo_contrato\":null,\"fecha_inicio\":\"2021-08-04\",\"fecha_fin\":null,\"frecuencia\":\"mensual\",\"peso_limite_kg\":\"10.00\",\"tarifa\":\"50.00\",\"tipo_tarifa\":\"por_servicio\",\"doc_escaneado\":null,\"observaciones\":null,\"activo\":1,\"fecha_creacion\":\"2026-02-03 20:45:46\",\"fecha_modificacion\":\"2026-02-03 20:46:24\"}', '{\"id_sede\":\"1\",\"codigo_contrato\":null,\"fecha_inicio\":\"2021-08-04\",\"fecha_fin\":\"2022-08-04\",\"frecuencia\":\"mensual\",\"peso_limite_kg\":\"10.00\",\"tarifa\":\"50.00\",\"tipo_tarifa\":\"por_servicio\",\"observaciones\":null,\"renovacion_automatica\":\"1\",\"estado\":\"vigente\",\"tipo_residuo\":\"biocontaminado\",\"contenedor_incluido\":\"1\",\"incluye_igv\":\"1\"}', NULL, '2026-02-03 20:53:49'),
(6, 2, 'Sede', 2, '', NULL, '{\"cliente_id\":\"2\",\"empresa_id\":\"2\",\"sede_id\":\"2\"}', NULL, '2026-02-03 21:15:38'),
(7, 2, 'Sede', 3, '', NULL, '{\"cliente_id\":\"3\",\"empresa_id\":\"3\",\"sede_id\":\"3\"}', NULL, '2026-02-03 21:24:29'),
(8, 2, 'Usuario', NULL, 'LOGIN', NULL, NULL, '2800:200:ea80:114:4040:47b2:c2c:abee', '2026-02-10 15:44:19'),
(9, 2, 'Usuario', NULL, 'LOGIN', NULL, NULL, '2800:200:ea80:114:21ac:a878:fd4f:ef76', '2026-02-10 20:34:54'),
(10, 2, 'Usuario', NULL, 'LOGIN', NULL, NULL, '2800:200:ea80:114:99cf:dd4e:a8af:af7d', '2026-02-12 21:20:03'),
(11, 2, 'Usuario', NULL, 'LOGIN', NULL, NULL, '190.238.29.194', '2026-02-14 01:37:37'),
(12, 2, 'Usuario', NULL, 'LOGIN', NULL, NULL, '2800:200:ea80:114:54cb:2f70:eb5:52ac', '2026-02-16 16:00:36'),
(13, 2, 'Vehiculo', 1, 'INSERT', NULL, '{\"placa\":\"BUL906\"}', NULL, '2026-02-17 01:20:51'),
(14, 2, 'Vehiculo', 2, 'INSERT', NULL, '{\"placa\":\"D1O763\"}', NULL, '2026-02-17 01:22:17'),
(15, 2, 'Vehiculo', 3, 'INSERT', NULL, '{\"placa\":\"F2Z877\"}', NULL, '2026-02-17 01:24:39'),
(16, 2, 'Vehiculo', 2, 'UPDATE', '{\"id_vehiculo\":2,\"placa\":\"D1O763\",\"marca\":\"DONGFENG\",\"modelo\":\"EQ1020TF\",\"anio\":2012,\"color\":\"BLANCO\",\"tonelaje_max\":\"2.00\",\"tipo\":\"camion\",\"numero_motor\":null,\"numero_chasis\":null,\"fecha_venc_soat\":null,\"fecha_venc_revision\":null,\"fecha_venc_mtc\":null,\"activo\":1,\"fecha_creacion\":\"2026-02-17 01:22:17\",\"fecha_modificacion\":\"2026-02-17 01:22:17\"}', '{\"placa\":\"D1O763\",\"marca\":\"DONGFENG\",\"modelo\":\"1\",\"anio\":\"2012\",\"color\":\"BLANCO\",\"tipo\":\"camion\",\"tonelaje_max\":\"2.00\",\"fecha_venc_soat\":null,\"fecha_venc_revision\":null,\"fecha_venc_mtc\":null}', NULL, '2026-02-17 01:25:03'),
(17, 2, 'Vehiculo', 3, 'UPDATE', '{\"id_vehiculo\":3,\"placa\":\"F2Z877\",\"marca\":\"DONGFENG\",\"modelo\":\"EQ1020TF\",\"anio\":2013,\"color\":\"BLANCO\",\"tonelaje_max\":\"2.00\",\"tipo\":\"camion\",\"numero_motor\":null,\"numero_chasis\":null,\"fecha_venc_soat\":null,\"fecha_venc_revision\":null,\"fecha_venc_mtc\":null,\"activo\":1,\"fecha_creacion\":\"2026-02-17 01:24:39\",\"fecha_modificacion\":\"2026-02-17 01:24:39\"}', '{\"placa\":\"F2Z877\",\"marca\":\"DONGFENG\",\"modelo\":\"2\",\"anio\":\"2013\",\"color\":\"BLANCO\",\"tipo\":\"camion\",\"tonelaje_max\":\"2.00\",\"fecha_venc_soat\":null,\"fecha_venc_revision\":null,\"fecha_venc_mtc\":null}', NULL, '2026-02-17 01:25:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CalendarioRecojo`
--

CREATE TABLE `CalendarioRecojo` (
  `id` int(11) NOT NULL,
  `mes` int(11) NOT NULL COMMENT 'Mes (1-12)',
  `anio` int(11) NOT NULL COMMENT 'Año',
  `dias_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JSON con formato {"YYYY-MM-DD": ["distrito1", "distrito2"], ...}' CHECK (json_valid(`dias_json`)),
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Calendario de asignación de distritos por día del mes';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` enum('DNI','Carnet de Extranjeria','RUC','Otro') DEFAULT 'DNI',
  `dni` varchar(15) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Cliente`
--

INSERT INTO `Cliente` (`id_cliente`, `nombre`, `tipo_documento`, `dni`, `activo`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, 'Alfredo Ricardo Ortega Prieto', 'DNI', '42418338', 0, '2026-02-17 02:08:52', '2026-02-17 02:08:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ContratoLaboral`
--

CREATE TABLE `ContratoLaboral` (
  `id_contrato_laboral` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  `tipo_contrato` enum('indefinido','plazo_fijo','por_obra','practicas') DEFAULT 'indefinido',
  `doc_escaneado` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ContratoServicio`
--

CREATE TABLE `ContratoServicio` (
  `id_contrato` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `frecuencia` enum('diario','semanal','quincenal','mensual','bimestral','trimestral','eventual') NOT NULL,
  `peso_limite_kg` decimal(10,2) DEFAULT NULL,
  `tarifa` decimal(10,2) NOT NULL,
  `tipo_tarifa` enum('por_servicio','por_kg','mensual_fijo') DEFAULT 'por_servicio',
  `doc_escaneado` varchar(255) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Egreso`
--

CREATE TABLE `Egreso` (
  `id_egreso` int(11) NOT NULL,
  `categoria` enum('operativo','fijo','nomina','administrativo','extraordinario') NOT NULL,
  `subcategoria` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `id_ruta` int(11) DEFAULT NULL COMMENT 'Ruta asociada para gastos operativos',
  `id_vehiculo` int(11) DEFAULT NULL COMMENT 'Vehículo asociado para gastos de mantenimiento',
  `comprobante` varchar(100) DEFAULT NULL COMMENT 'Número de factura/boleta',
  `observaciones` text DEFAULT NULL,
  `id_usuario` int(11) NOT NULL COMMENT 'Usuario que registró el gasto',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Egreso`
--

INSERT INTO `Egreso` (`id_egreso`, `categoria`, `subcategoria`, `descripcion`, `monto`, `fecha`, `id_ruta`, `id_vehiculo`, `comprobante`, `observaciones`, `id_usuario`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, 'operativo', 'combustible', 'Gasolina', 100.00, '2026-01-29', NULL, NULL, '', '', 2, '2026-01-29 15:17:55', '2026-01-29 15:17:55'),
(2, 'operativo', 'combustible', 'qewq', 0.02, '2026-02-03', NULL, NULL, '', '', 2, '2026-02-03 15:55:51', '2026-02-03 15:55:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EgresoSubcategoria`
--

CREATE TABLE `EgresoSubcategoria` (
  `id_subcategoria` int(11) NOT NULL,
  `categoria` enum('operativo','fijo','nomina','administrativo','extraordinario') NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `EgresoSubcategoria`
--

INSERT INTO `EgresoSubcategoria` (`id_subcategoria`, `categoria`, `nombre`, `descripcion`, `activo`) VALUES
(1, 'operativo', 'combustible', 'Gasolina, petróleo, GLP', 1),
(2, 'operativo', 'estacionamiento', 'Pagos de estacionamiento', 1),
(3, 'operativo', 'peaje', 'Peajes y cobros de vía', 1),
(4, 'operativo', 'reparacion_menor', 'Reparaciones menores en ruta', 1),
(5, 'operativo', 'viaticos', 'Alimentación y bebidas', 1),
(6, 'operativo', 'otros_operativo', 'Otros gastos operativos', 1),
(7, 'fijo', 'alquiler', 'Alquiler de local', 1),
(8, 'fijo', 'agua', 'Servicio de agua', 1),
(9, 'fijo', 'luz', 'Servicio eléctrico', 1),
(10, 'fijo', 'internet', 'Internet y telefonía', 1),
(11, 'fijo', 'cuota_deuda', 'Cuotas de préstamos', 1),
(12, 'fijo', 'seguro_vehicular', 'Seguros de vehículos', 1),
(13, 'fijo', 'otros_fijos', 'Otros gastos fijos', 1),
(14, 'nomina', 'sueldo', 'Sueldos de empleados', 1),
(15, 'nomina', 'gratificacion', 'Gratificaciones', 1),
(16, 'nomina', 'cts', 'Compensación por tiempo de servicios', 1),
(17, 'nomina', 'essalud', 'Aporte a ESSALUD', 1),
(18, 'nomina', 'bonificacion', 'Bonificaciones', 1),
(19, 'nomina', 'otros_nomina', 'Otros gastos de personal', 1),
(20, 'administrativo', 'materiales_oficina', 'Útiles de oficina', 1),
(21, 'administrativo', 'licencias', 'Licencias y permisos', 1),
(22, 'administrativo', 'mantenimiento_equipo', 'Mantenimiento de equipos', 1),
(23, 'administrativo', 'otros_admin', 'Otros gastos administrativos', 1),
(24, 'extraordinario', 'reparacion_mayor', 'Reparaciones mayores', 1),
(25, 'extraordinario', 'multa', 'Multas y penalidades', 1),
(26, 'extraordinario', 'imprevisto', 'Gastos imprevistos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `id_empleado` int(11) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `licencia_conducir` varchar(20) DEFAULT NULL,
  `categoria_licencia` varchar(10) DEFAULT NULL,
  `fecha_venc_licencia` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empresa`
--

CREATE TABLE `Empresa` (
  `id_empresa` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `razon_social` varchar(200) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `direccion_fiscal` varchar(255) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura`
--

CREATE TABLE `Factura` (
  `id_factura` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `numero_factura` varchar(50) NOT NULL,
  `doc_escaneado` varchar(500) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GestionCobranza`
--

CREATE TABLE `GestionCobranza` (
  `id` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `tipo_gestion` enum('whatsapp','llamada','visita') NOT NULL,
  `resultado` enum('contactado','no_contesta','promesa_pago','pagado','rechazado') NOT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_proxima_gestion` date DEFAULT NULL,
  `gestionado_por` int(11) DEFAULT NULL,
  `fecha_gestion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Guia`
--

CREATE TABLE `Guia` (
  `id_guia` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `serie` varchar(10) DEFAULT NULL,
  `numero_guia` varchar(20) NOT NULL,
  `fecha_emision` date DEFAULT NULL,
  `punto_partida` varchar(255) DEFAULT NULL,
  `punto_llegada` varchar(255) DEFAULT NULL,
  `doc_escaneado` varchar(255) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `IngresoNuevoCliente`
--

CREATE TABLE `IngresoNuevoCliente` (
  `id` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `meses_pagados` int(11) NOT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Manifiesto`
--

CREATE TABLE `Manifiesto` (
  `id_manifiesto` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `numero_manifiesto` varchar(50) DEFAULT NULL,
  `tipo_residuo` varchar(100) DEFAULT NULL,
  `codigo_residuo` varchar(20) DEFAULT NULL,
  `descripcion_residuo` text DEFAULT NULL,
  `peso_kg` decimal(10,2) DEFAULT NULL,
  `unidad_medida` varchar(20) DEFAULT 'kg',
  `cantidad_bultos` int(11) DEFAULT NULL,
  `nombre_responsable` varchar(100) DEFAULT NULL,
  `cargo_responsable` varchar(100) DEFAULT NULL,
  `dni_responsable` varchar(15) DEFAULT NULL,
  `doc_escaneado` varchar(255) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `NewsletterSubscriber`
--

CREATE TABLE `NewsletterSubscriber` (
  `id_subscriber` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `codigo_descuento` varchar(50) NOT NULL,
  `descuento_usado` tinyint(1) DEFAULT 0,
  `activo` tinyint(1) DEFAULT 1,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `pagina_origen` varchar(255) DEFAULT NULL,
  `fecha_suscripcion` datetime DEFAULT current_timestamp(),
  `fecha_uso_descuento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Planta`
--

CREATE TABLE `Planta` (
  `id_planta` int(11) NOT NULL,
  `razon_social` varchar(200) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `nombre_comercial` varchar(200) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `tipo_tratamiento` varchar(100) DEFAULT NULL,
  `codigo_eps` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `contacto_nombre` varchar(100) DEFAULT NULL,
  `contacto_email` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Planta`
--

INSERT INTO `Planta` (`id_planta`, `razon_social`, `ruc`, `nombre_comercial`, `direccion`, `distrito`, `provincia`, `departamento`, `tipo_tratamiento`, `codigo_eps`, `telefono`, `contacto_nombre`, `contacto_email`, `activo`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, 'PLANTA PROCESADORA SAC', '20123456789', 'Planta Lima', 'Av. Industrial 123', 'Ate', NULL, 'Lima', 'Incineración', NULL, NULL, NULL, NULL, 1, '2026-01-21 19:10:41', '2026-01-21 19:10:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Prospecto`
--

CREATE TABLE `Prospecto` (
  `id_prospecto` int(11) NOT NULL,
  `nombre_comercial` varchar(200) NOT NULL,
  `tipo_cliente` enum('persona','empresa') DEFAULT 'persona',
  `ruc` varchar(11) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `fuente` varchar(50) DEFAULT NULL,
  `estado` enum('nuevo','contactado','interesado','propuesta','negociacion','ganado','perdido') DEFAULT 'nuevo',
  `valor_potencial` decimal(10,2) DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `id_usuario_asignado` int(11) DEFAULT NULL,
  `fecha_proximo_contacto` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ruta`
--

CREATE TABLE `Ruta` (
  `id_ruta` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `codigo_ruta` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora_salida` time DEFAULT NULL,
  `hora_retorno` time DEFAULT NULL,
  `km_inicial` int(11) DEFAULT NULL,
  `km_final` int(11) DEFAULT NULL,
  `estado` enum('programada','en_curso','completada','cancelada') DEFAULT 'programada',
  `observaciones` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sede`
--

CREATE TABLE `Sede` (
  `id_sede` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `nombre_comercial` varchar(200) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `referencia` text DEFAULT NULL,
  `coordenadas_gps` varchar(50) DEFAULT NULL,
  `contacto_nombre` varchar(100) DEFAULT NULL,
  `contacto_telefono` varchar(20) DEFAULT NULL,
  `contacto_telefono_2` varchar(20) DEFAULT NULL,
  `contacto_email` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Servicio`
--

CREATE TABLE `Servicio` (
  `id_servicio` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `id_planta` int(11) DEFAULT NULL,
  `id_contrato` int(11) DEFAULT NULL,
  `mes_servicio` varchar(50) DEFAULT NULL,
  `fecha_ejecucion` date DEFAULT NULL,
  `estado` enum('programado','en_curso','completado','cancelado') DEFAULT 'completado',
  `estado_pago` enum('pendiente','pagado') DEFAULT 'pendiente',
  `fecha_pago` date DEFAULT NULL,
  `forma_pago` varchar(50) DEFAULT NULL,
  `descripcion_residuo` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ServicioEmpleado`
--

CREATE TABLE `ServicioEmpleado` (
  `id_servicio_empleado` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `rol` enum('conductor','ayudante','supervisor') DEFAULT 'ayudante',
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `rol` enum('admin','editor','viewer','vendedor') DEFAULT 'viewer',
  `email` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `ultimo_acceso` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id_usuario`, `username`, `password_hash`, `nombre_completo`, `rol`, `email`, `activo`, `ultimo_acceso`, `fecha_creacion`, `fecha_modificacion`) VALUES
(2, 'admin', '$2y$10$QLc1Nsgfjl.PzxQthwyr5.r7yeww0JNh00V9gH/LMCShdzqWhLVki', 'Sebastian', 'admin', 'admin@iogroup.pe', 1, '2026-02-16 16:00:36', '2025-12-27 18:07:49', '2026-02-16 16:00:36'),
(3, 'hcruz', '$2y$10$k7sfclqHnv1/MH4fxYwpqOgwz0tLrZ/cu7DDBGU5VPf7QIDeRl.ju', 'Hugo Cruz', 'editor', 'hugocruz2025@gmail.com', 1, '2026-01-27 16:02:51', '2026-01-13 23:05:29', '2026-01-27 16:02:51'),
(4, 'leonardo', '$2y$10$IhTG6YIkoYzW1BbQ5z5kpuAKqb//QiJWq8iEXRHuMIRV5IGTOImd2', 'Leonardo Retamozo', 'viewer', 'sebastian3197@hotmail.com', 0, '2026-01-16 22:39:17', '2026-01-16 15:08:14', '2026-01-21 17:27:29'),
(5, 'jpgarcia', '$2y$10$NDgRXT6zgY/hy02nn.jeVewrbiXzGEGy648D9Xhq..gAzJzd7ms6m', 'Juan Pedro Garcia', 'admin', NULL, 1, '2026-01-29 15:35:20', '2026-01-29 15:22:38', '2026-01-29 15:35:20'),
(6, 'transportes', '$2y$10$.oOiukDgynxEb9EnYTgNIOzsAo9lUtpIy8ky6aO14cv8t7WwJ0azK', 'Elvis', 'editor', NULL, 1, '2026-01-30 17:18:49', '2026-01-30 17:07:14', '2026-01-30 17:18:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UsuarioPermiso`
--

CREATE TABLE `UsuarioPermiso` (
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `modulo` varchar(50) NOT NULL,
  `puede_ver` tinyint(1) DEFAULT 1,
  `puede_editar` tinyint(1) DEFAULT 0,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `UsuarioPermiso`
--

INSERT INTO `UsuarioPermiso` (`id_permiso`, `id_usuario`, `modulo`, `puede_ver`, `puede_editar`, `fecha_creacion`) VALUES
(32, 3, 'prospectos', 1, 1, '2026-01-13 23:05:29'),
(33, 4, 'prospectos', 1, 1, '2026-01-16 15:08:14'),
(34, 2, 'dashboard', 1, 1, '2026-01-29 15:20:43'),
(35, 2, 'clientes', 1, 1, '2026-01-29 15:20:43'),
(36, 2, 'empresas', 1, 1, '2026-01-29 15:20:43'),
(37, 2, 'sedes', 1, 1, '2026-01-29 15:20:43'),
(38, 2, 'contratos', 1, 1, '2026-01-29 15:20:43'),
(39, 2, 'servicios', 1, 1, '2026-01-29 15:20:43'),
(40, 2, 'rutas', 1, 1, '2026-01-29 15:20:43'),
(41, 2, 'manifiestos', 1, 1, '2026-01-29 15:20:43'),
(42, 2, 'guias', 1, 1, '2026-01-29 15:20:43'),
(43, 2, 'empleados', 1, 1, '2026-01-29 15:20:43'),
(44, 2, 'vehiculos', 1, 1, '2026-01-29 15:20:43'),
(45, 2, 'plantas', 1, 1, '2026-01-29 15:20:43'),
(46, 2, 'facturas', 1, 1, '2026-01-29 15:20:43'),
(47, 2, 'prospectos', 1, 1, '2026-01-29 15:20:43'),
(48, 2, 'reportes', 1, 1, '2026-01-29 15:20:43'),
(49, 2, 'alertas', 1, 1, '2026-01-29 15:20:43'),
(50, 2, 'usuarios', 1, 1, '2026-01-29 15:20:43'),
(51, 2, 'mapa', 1, 1, '2026-01-29 15:20:43'),
(52, 5, 'dashboard', 1, 1, '2026-01-29 15:22:38'),
(53, 5, 'clientes', 1, 1, '2026-01-29 15:22:38'),
(54, 5, 'empresas', 1, 1, '2026-01-29 15:22:38'),
(55, 5, 'sedes', 1, 1, '2026-01-29 15:22:38'),
(56, 5, 'contratos', 1, 1, '2026-01-29 15:22:38'),
(57, 5, 'servicios', 1, 1, '2026-01-29 15:22:38'),
(58, 5, 'rutas', 1, 1, '2026-01-29 15:22:38'),
(59, 5, 'manifiestos', 1, 1, '2026-01-29 15:22:38'),
(60, 5, 'guias', 1, 1, '2026-01-29 15:22:38'),
(61, 5, 'empleados', 1, 1, '2026-01-29 15:22:38'),
(62, 5, 'vehiculos', 1, 1, '2026-01-29 15:22:38'),
(63, 5, 'plantas', 1, 1, '2026-01-29 15:22:38'),
(64, 5, 'facturas', 1, 1, '2026-01-29 15:22:38'),
(65, 5, 'prospectos', 1, 1, '2026-01-29 15:22:38'),
(66, 5, 'reportes', 1, 1, '2026-01-29 15:22:38'),
(67, 5, 'alertas', 1, 1, '2026-01-29 15:22:38'),
(68, 5, 'usuarios', 1, 1, '2026-01-29 15:22:38'),
(69, 5, 'mapa', 1, 1, '2026-01-29 15:22:38'),
(70, 6, 'dashboard', 1, 0, '2026-01-30 17:07:14'),
(71, 6, 'sedes', 1, 1, '2026-01-30 17:07:14'),
(72, 6, 'servicios', 1, 1, '2026-01-30 17:07:14'),
(73, 6, 'rutas', 1, 1, '2026-01-30 17:07:14'),
(74, 6, 'manifiestos', 1, 1, '2026-01-30 17:07:14'),
(75, 6, 'guias', 1, 1, '2026-01-30 17:07:14'),
(76, 6, 'empleados', 1, 0, '2026-01-30 17:07:14'),
(77, 6, 'vehiculos', 1, 1, '2026-01-30 17:07:14'),
(78, 6, 'plantas', 1, 1, '2026-01-30 17:07:14'),
(79, 6, 'mapa', 1, 0, '2026-01-30 17:07:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vehiculo`
--

CREATE TABLE `Vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `tonelaje_max` decimal(6,2) DEFAULT NULL,
  `tipo` enum('camion','furgoneta','camioneta','otro') DEFAULT 'camion',
  `numero_motor` varchar(50) DEFAULT NULL,
  `numero_chasis` varchar(50) DEFAULT NULL,
  `fecha_venc_soat` date DEFAULT NULL,
  `fecha_venc_revision` date DEFAULT NULL,
  `fecha_venc_mtc` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Vehiculo`
--

INSERT INTO `Vehiculo` (`id_vehiculo`, `placa`, `marca`, `modelo`, `anio`, `color`, `tonelaje_max`, `tipo`, `numero_motor`, `numero_chasis`, `fecha_venc_soat`, `fecha_venc_revision`, `fecha_venc_mtc`, `activo`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, 'BUL906', 'KYC', 'X5', 2023, 'BLANCO', 2.00, 'camion', NULL, NULL, NULL, NULL, NULL, 1, '2026-02-17 01:20:51', '2026-02-17 01:20:51'),
(2, 'D1O763', 'DONGFENG', '1', 2012, 'BLANCO', 2.00, 'camion', NULL, NULL, NULL, NULL, NULL, 1, '2026-02-17 01:22:17', '2026-02-17 01:25:03'),
(3, 'F2Z877', 'DONGFENG', '2', 2013, 'BLANCO', 2.00, 'camion', NULL, NULL, NULL, NULL, NULL, 1, '2026-02-17 01:24:39', '2026-02-17 01:25:10');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_DocumentosPorVencer`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_DocumentosPorVencer` (
`tipo_documento` varchar(16)
,`documento` varchar(212)
,`descripcion` varchar(201)
,`fecha_vencimiento` date
,`dias_restantes` int(8)
,`estado` varchar(11)
);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `AuditLog`
--
ALTER TABLE `AuditLog`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `CalendarioRecojo`
--
ALTER TABLE `CalendarioRecojo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_mes_anio` (`mes`,`anio`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `ContratoLaboral`
--
ALTER TABLE `ContratoLaboral`
  ADD PRIMARY KEY (`id_contrato_laboral`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `ContratoServicio`
--
ALTER TABLE `ContratoServicio`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `Egreso`
--
ALTER TABLE `Egreso`
  ADD PRIMARY KEY (`id_egreso`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `idx_egreso_fecha` (`fecha`),
  ADD KEY `idx_egreso_categoria` (`categoria`),
  ADD KEY `idx_egreso_subcategoria` (`subcategoria`),
  ADD KEY `idx_egreso_ruta` (`id_ruta`),
  ADD KEY `idx_egreso_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `EgresoSubcategoria`
--
ALTER TABLE `EgresoSubcategoria`
  ADD PRIMARY KEY (`id_subcategoria`),
  ADD UNIQUE KEY `unique_categoria_nombre` (`categoria`,`nombre`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `Empresa`
--
ALTER TABLE `Empresa`
  ADD PRIMARY KEY (`id_empresa`),
  ADD UNIQUE KEY `ruc` (`ruc`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `GestionCobranza`
--
ALTER TABLE `GestionCobranza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gestion_servicio` (`id_servicio`),
  ADD KEY `idx_gestion_sede` (`id_sede`),
  ADD KEY `idx_gestion_fecha` (`fecha_gestion`),
  ADD KEY `idx_gestion_resultado` (`resultado`);

--
-- Indices de la tabla `Guia`
--
ALTER TABLE `Guia`
  ADD PRIMARY KEY (`id_guia`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `IngresoNuevoCliente`
--
ALTER TABLE `IngresoNuevoCliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ingreso_nuevo_sede` (`id_sede`),
  ADD KEY `idx_ingreso_nuevo_fecha` (`fecha_pago`),
  ADD KEY `idx_ingreso_nuevo_contrato` (`id_contrato`);

--
-- Indices de la tabla `Manifiesto`
--
ALTER TABLE `Manifiesto`
  ADD PRIMARY KEY (`id_manifiesto`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `NewsletterSubscriber`
--
ALTER TABLE `NewsletterSubscriber`
  ADD PRIMARY KEY (`id_subscriber`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_newsletter_email` (`email`),
  ADD KEY `idx_newsletter_codigo` (`codigo_descuento`);

--
-- Indices de la tabla `Planta`
--
ALTER TABLE `Planta`
  ADD PRIMARY KEY (`id_planta`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `Prospecto`
--
ALTER TABLE `Prospecto`
  ADD PRIMARY KEY (`id_prospecto`),
  ADD KEY `id_usuario_asignado` (`id_usuario_asignado`);

--
-- Indices de la tabla `Ruta`
--
ALTER TABLE `Ruta`
  ADD PRIMARY KEY (`id_ruta`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `Sede`
--
ALTER TABLE `Sede`
  ADD PRIMARY KEY (`id_sede`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `Servicio`
--
ALTER TABLE `Servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_sede` (`id_sede`),
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `id_planta` (`id_planta`);

--
-- Indices de la tabla `ServicioEmpleado`
--
ALTER TABLE `ServicioEmpleado`
  ADD PRIMARY KEY (`id_servicio_empleado`),
  ADD UNIQUE KEY `unique_servicio_empleado` (`id_servicio`,`id_empleado`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `UsuarioPermiso`
--
ALTER TABLE `UsuarioPermiso`
  ADD PRIMARY KEY (`id_permiso`),
  ADD UNIQUE KEY `unique_usuario_modulo` (`id_usuario`,`modulo`),
  ADD KEY `idx_permiso_usuario` (`id_usuario`);

--
-- Indices de la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `AuditLog`
--
ALTER TABLE `AuditLog`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `CalendarioRecojo`
--
ALTER TABLE `CalendarioRecojo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ContratoLaboral`
--
ALTER TABLE `ContratoLaboral`
  MODIFY `id_contrato_laboral` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ContratoServicio`
--
ALTER TABLE `ContratoServicio`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Egreso`
--
ALTER TABLE `Egreso`
  MODIFY `id_egreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `EgresoSubcategoria`
--
ALTER TABLE `EgresoSubcategoria`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Empresa`
--
ALTER TABLE `Empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Factura`
--
ALTER TABLE `Factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `GestionCobranza`
--
ALTER TABLE `GestionCobranza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Guia`
--
ALTER TABLE `Guia`
  MODIFY `id_guia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `IngresoNuevoCliente`
--
ALTER TABLE `IngresoNuevoCliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Manifiesto`
--
ALTER TABLE `Manifiesto`
  MODIFY `id_manifiesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `NewsletterSubscriber`
--
ALTER TABLE `NewsletterSubscriber`
  MODIFY `id_subscriber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Planta`
--
ALTER TABLE `Planta`
  MODIFY `id_planta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Prospecto`
--
ALTER TABLE `Prospecto`
  MODIFY `id_prospecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Ruta`
--
ALTER TABLE `Ruta`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Sede`
--
ALTER TABLE `Sede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Servicio`
--
ALTER TABLE `Servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ServicioEmpleado`
--
ALTER TABLE `ServicioEmpleado`
  MODIFY `id_servicio_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `UsuarioPermiso`
--
ALTER TABLE `UsuarioPermiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `Vehiculo`
--
ALTER TABLE `Vehiculo`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_DocumentosPorVencer`
--
DROP TABLE IF EXISTS `vw_DocumentosPorVencer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u511863531_Sebastian`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_DocumentosPorVencer`  AS SELECT 'Vehiculo' AS `tipo_documento`, concat(`Vehiculo`.`placa`,' - SOAT') AS `documento`, concat('Vehículo ',`Vehiculo`.`placa`,' - ',`Vehiculo`.`marca`,' ',`Vehiculo`.`modelo`) AS `descripcion`, `Vehiculo`.`fecha_venc_soat` AS `fecha_vencimiento`, to_days(`Vehiculo`.`fecha_venc_soat`) - to_days(curdate()) AS `dias_restantes`, CASE WHEN `Vehiculo`.`fecha_venc_soat` < curdate() THEN 'VENCIDO' WHEN to_days(`Vehiculo`.`fecha_venc_soat`) - to_days(curdate()) <= 7 THEN 'CRITICO' WHEN to_days(`Vehiculo`.`fecha_venc_soat`) - to_days(curdate()) <= 30 THEN 'ADVERTENCIA' ELSE 'OK' END AS `estado` FROM `Vehiculo` WHERE `Vehiculo`.`activo` = 1 AND `Vehiculo`.`fecha_venc_soat` is not nullunion allselect 'Vehiculo' AS `Vehiculo`,concat(`Vehiculo`.`placa`,' - Revisión Técnica') AS `CONCAT(placa, ' - Revisión Técnica')`,concat('Vehículo ',`Vehiculo`.`placa`,' - ',`Vehiculo`.`marca`,' ',`Vehiculo`.`modelo`) AS `CONCAT('Vehículo ', placa, ' - ', marca, ' ', modelo)`,`Vehiculo`.`fecha_venc_revision` AS `fecha_venc_revision`,to_days(`Vehiculo`.`fecha_venc_revision`) - to_days(curdate()) AS `DATEDIFF(fecha_venc_revision, CURDATE())`,case when `Vehiculo`.`fecha_venc_revision` < curdate() then 'VENCIDO' when to_days(`Vehiculo`.`fecha_venc_revision`) - to_days(curdate()) <= 7 then 'CRITICO' when to_days(`Vehiculo`.`fecha_venc_revision`) - to_days(curdate()) <= 30 then 'ADVERTENCIA' else 'OK' end AS `Name_exp_6` from `Vehiculo` where `Vehiculo`.`activo` = 1 and `Vehiculo`.`fecha_venc_revision` is not null union all select 'ContratoServicio' AS `ContratoServicio`,concat('Contrato #',`ContratoServicio`.`id_contrato`) AS `CONCAT('Contrato #', id_contrato)`,(select `Sede`.`nombre_comercial` from `Sede` where `Sede`.`id_sede` = `ContratoServicio`.`id_sede`) AS `Name_exp_3`,`ContratoServicio`.`fecha_fin` AS `fecha_fin`,to_days(`ContratoServicio`.`fecha_fin`) - to_days(curdate()) AS `DATEDIFF(fecha_fin, CURDATE())`,case when `ContratoServicio`.`fecha_fin` < curdate() then 'VENCIDO' when to_days(`ContratoServicio`.`fecha_fin`) - to_days(curdate()) <= 15 then 'CRITICO' when to_days(`ContratoServicio`.`fecha_fin`) - to_days(curdate()) <= 30 then 'ADVERTENCIA' else 'OK' end AS `Name_exp_6` from `ContratoServicio` where `ContratoServicio`.`activo` = 1 and `ContratoServicio`.`fecha_fin` is not null union all select 'Empleado' AS `Empleado`,concat(`Empleado`.`nombres`,' ',`Empleado`.`apellidos`,' - Licencia') AS `CONCAT(nombres, ' ', apellidos, ' - Licencia')`,concat('Licencia ',`Empleado`.`categoria_licencia`,': ',`Empleado`.`licencia_conducir`) AS `CONCAT('Licencia ', categoria_licencia, ': ', licencia_conducir)`,`Empleado`.`fecha_venc_licencia` AS `fecha_venc_licencia`,to_days(`Empleado`.`fecha_venc_licencia`) - to_days(curdate()) AS `DATEDIFF(fecha_venc_licencia, CURDATE())`,case when `Empleado`.`fecha_venc_licencia` < curdate() then 'VENCIDO' when to_days(`Empleado`.`fecha_venc_licencia`) - to_days(curdate()) <= 15 then 'CRITICO' when to_days(`Empleado`.`fecha_venc_licencia`) - to_days(curdate()) <= 30 then 'ADVERTENCIA' else 'OK' end AS `Name_exp_6` from `Empleado` where `Empleado`.`activo` = 1 and `Empleado`.`fecha_venc_licencia` is not null union all select 'ContratoLaboral' AS `ContratoLaboral`,concat('Contrato Laboral #',`ContratoLaboral`.`id_contrato_laboral`) AS `CONCAT('Contrato Laboral #', id_contrato_laboral)`,(select concat(`Empleado`.`nombres`,' ',`Empleado`.`apellidos`) from `Empleado` where `Empleado`.`id_empleado` = `ContratoLaboral`.`id_empleado`) AS `Name_exp_3`,`ContratoLaboral`.`fecha_fin` AS `fecha_fin`,to_days(`ContratoLaboral`.`fecha_fin`) - to_days(curdate()) AS `DATEDIFF(fecha_fin, CURDATE())`,case when `ContratoLaboral`.`fecha_fin` < curdate() then 'VENCIDO' when to_days(`ContratoLaboral`.`fecha_fin`) - to_days(curdate()) <= 15 then 'CRITICO' when to_days(`ContratoLaboral`.`fecha_fin`) - to_days(curdate()) <= 30 then 'ADVERTENCIA' else 'OK' end AS `Name_exp_6` from `ContratoLaboral` where `ContratoLaboral`.`activo` = 1 and `ContratoLaboral`.`fecha_fin` is not null  ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `AuditLog`
--
ALTER TABLE `AuditLog`
  ADD CONSTRAINT `AuditLog_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);

--
-- Filtros para la tabla `ContratoLaboral`
--
ALTER TABLE `ContratoLaboral`
  ADD CONSTRAINT `ContratoLaboral_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `Empleado` (`id_empleado`);

--
-- Filtros para la tabla `ContratoServicio`
--
ALTER TABLE `ContratoServicio`
  ADD CONSTRAINT `ContratoServicio_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `Sede` (`id_sede`);

--
-- Filtros para la tabla `Egreso`
--
ALTER TABLE `Egreso`
  ADD CONSTRAINT `Egreso_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `Ruta` (`id_ruta`) ON DELETE SET NULL,
  ADD CONSTRAINT `Egreso_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `Vehiculo` (`id_vehiculo`) ON DELETE SET NULL,
  ADD CONSTRAINT `Egreso_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);

--
-- Filtros para la tabla `Empresa`
--
ALTER TABLE `Empresa`
  ADD CONSTRAINT `Empresa_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`);

--
-- Filtros para la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `GestionCobranza`
--
ALTER TABLE `GestionCobranza`
  ADD CONSTRAINT `GestionCobranza_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`) ON DELETE CASCADE,
  ADD CONSTRAINT `GestionCobranza_ibfk_2` FOREIGN KEY (`id_sede`) REFERENCES `Sede` (`id_sede`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Guia`
--
ALTER TABLE `Guia`
  ADD CONSTRAINT `Guia_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`);

--
-- Filtros para la tabla `IngresoNuevoCliente`
--
ALTER TABLE `IngresoNuevoCliente`
  ADD CONSTRAINT `IngresoNuevoCliente_ibfk_1` FOREIGN KEY (`id_contrato`) REFERENCES `ContratoServicio` (`id_contrato`) ON DELETE CASCADE,
  ADD CONSTRAINT `IngresoNuevoCliente_ibfk_2` FOREIGN KEY (`id_sede`) REFERENCES `Sede` (`id_sede`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Manifiesto`
--
ALTER TABLE `Manifiesto`
  ADD CONSTRAINT `Manifiesto_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`);

--
-- Filtros para la tabla `Prospecto`
--
ALTER TABLE `Prospecto`
  ADD CONSTRAINT `Prospecto_ibfk_1` FOREIGN KEY (`id_usuario_asignado`) REFERENCES `Usuario` (`id_usuario`);

--
-- Filtros para la tabla `Ruta`
--
ALTER TABLE `Ruta`
  ADD CONSTRAINT `Ruta_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `Vehiculo` (`id_vehiculo`);

--
-- Filtros para la tabla `Sede`
--
ALTER TABLE `Sede`
  ADD CONSTRAINT `Sede_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `Empresa` (`id_empresa`);

--
-- Filtros para la tabla `Servicio`
--
ALTER TABLE `Servicio`
  ADD CONSTRAINT `Servicio_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `Sede` (`id_sede`),
  ADD CONSTRAINT `Servicio_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `Ruta` (`id_ruta`),
  ADD CONSTRAINT `Servicio_ibfk_3` FOREIGN KEY (`id_planta`) REFERENCES `Planta` (`id_planta`);

--
-- Filtros para la tabla `ServicioEmpleado`
--
ALTER TABLE `ServicioEmpleado`
  ADD CONSTRAINT `ServicioEmpleado_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `Servicio` (`id_servicio`),
  ADD CONSTRAINT `ServicioEmpleado_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `Empleado` (`id_empleado`);

--
-- Filtros para la tabla `UsuarioPermiso`
--
ALTER TABLE `UsuarioPermiso`
  ADD CONSTRAINT `UsuarioPermiso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
