-- ==========================================================
-- IO Group - Clientes faltantes en BD (Rutas Junio 2026)
-- Generado: 2026-07-03
-- Total registros: 517
-- ==========================================================
-- INSTRUCCIONES:
--   1. Revisar el Excel clientes_sin_bd_junio2026.xlsx
--   2. Ejecutar en phpMyAdmin > BD u511863531_IOGroupBD > SQL
--   3. Verificar resultado antes de confirmar COMMIT
-- ==========================================================

SET NAMES utf8mb4;
SET foreign_key_checks = 0;
START TRANSACTION;

-- [001] PETMAX S.A.C.
--       RUC: 20610289321  |  Visitas junio: 31
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PETMAX S.A.C.', 'RUC', '20610289321', 1);
SET @id_cliente_1 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_1, 'PETMAX S.A.C.', '20610289321', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_1 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_1, 'GROOMERS', 'AV. ANTONIO MIROQUEZADA 410 - MAGDALENA', 'MAGDALENA', 'LIMA', 'LIMA', '902 243 512 - programacion', NULL, 1);
SET @id_sede_1 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_1, '2026-07-03', 'semanal', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 31. ', 1);

-- ──────────────────────────────────────────────────────

-- [002] DETECTA CENTRO ONCOLOGICO S.A.C
--       RUC: 20515468499  |  Visitas junio: 26
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DETECTA CENTRO ONCOLOGICO S.A.C', 'RUC', '20515468499', 1);
SET @id_cliente_2 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_2, 'DETECTA CENTRO ONCOLOGICO S.A.C', '20515468499', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_2 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_2, 'CLINICA DETECTA', 'Av. Angamos Este Mz. F-12 Lote 72, San Borja,', 'SAN BORJA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_2 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_2, '2026-07-03', 'mensual', 25.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 26. ', 1);

-- ──────────────────────────────────────────────────────

-- [003] MEDICINA EXTERNA S.A.
--       RUC: 20100339936  |  Visitas junio: 25
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MEDICINA EXTERNA S.A.', 'RUC', '20100339936', 1);
SET @id_cliente_3 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_3, 'MEDICINA EXTERNA S.A.', '20100339936', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_3 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_3, 'MEDICINA EXTERNA S.A.', 'AV. ANGAMOS ESTE 1803 – SURQUILLO  6TO. PISO', 'SURQUILLO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_3 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_3, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 25. ', 1);

-- ──────────────────────────────────────────────────────

-- [004] DERMATOLÓGICA PERÚ
--       RUC: 20601483701  |  Visitas junio: 12
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DERMATOLÓGICA PERÚ', 'RUC', '20601483701', 1);
SET @id_cliente_4 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_4, 'DERMATOLÓGICA PERÚ', '20601483701', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_4 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_4, 'UNIDERMA', 'Av. Cuba 863 - Jesús María', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, '934209124', 1);
SET @id_sede_4 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_4, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 12. ', 1);

-- ──────────────────────────────────────────────────────

-- [005] GAMARRA HEALTHCARE CENTER SAC
--       RUC: 20600994302  |  Visitas junio: 12
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GAMARRA HEALTHCARE CENTER SAC', 'RUC', '20600994302', 1);
SET @id_cliente_5 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_5, 'GAMARRA HEALTHCARE CENTER SAC', '20600994302', 'LA VICTORIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_5 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_5, 'GAMARRA HEALTHCARE CENTER SAC', 'JR. HUANUCO 1800 LA VICTORIA', 'LA VICTORIA', 'LIMA', 'LIMA', NULL, '942610554', 1);
SET @id_sede_5 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_5, '2026-07-03', 'mensual', 1250.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 12. ', 1);

-- ──────────────────────────────────────────────────────

-- [006] QUALAB S.A.C
--       RUC: 20603175558  |  Visitas junio: 9
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('QUALAB S.A.C', 'RUC', '20603175558', 1);
SET @id_cliente_6 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_6, 'QUALAB S.A.C', '20603175558', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_6 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_6, 'QUALAB', 'Av. Carlos Izaguirre N° 1106', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_6 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_6, '2026-07-03', 'semanal', 120.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 9. ', 1);

-- ──────────────────────────────────────────────────────

-- [007] CLINICA SANTA BEATRIZ
--       RUC: 20566148006  |  Visitas junio: 8
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA SANTA BEATRIZ', 'RUC', '20566148006', 1);
SET @id_cliente_7 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_7, 'CLINICA SANTA BEATRIZ', '20566148006', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_7 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_7, 'CLINICA SANTA BEATRIZ', 'JR. RAMON DAGNINO NRO. 227', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_7 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_7, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 8. ', 1);

-- ──────────────────────────────────────────────────────

-- [008] Desarrollo Educativo S.A
--       RUC: 20603817185  |  Visitas junio: 7
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Desarrollo Educativo S.A', 'RUC', '20603817185', 1);
SET @id_cliente_8 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_8, 'Desarrollo Educativo S.A', '20603817185', 'San Juan de Lurigancho', 'LIMA', 'LIMA', 1);
SET @id_empresa_8 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_8, 'CERTUS', 'Av. Pirámide del Sol N°810,', 'San Juan de Lurigancho', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_8 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_8, '2026-07-03', 'mensual', 30.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 7. ', 1);

-- ──────────────────────────────────────────────────────

-- [009] W & H INVESTMENT S.A.C
--       RUC: 20552711603  |  Visitas junio: 7
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('W & H INVESTMENT S.A.C', 'RUC', '20552711603', 1);
SET @id_cliente_9 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_9, 'W & H INVESTMENT S.A.C', '20552711603', 'SANTIAGO DE SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_9 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_9, 'WORK & HEALTH CENTRO CLINICO', 'AV. PROLONGACION PRIMAVERA NRO. 1160', 'SANTIAGO DE SURCO', 'LIMA', 'LIMA', 'JOSE HERNANDEZ', NULL, 1);
SET @id_sede_9 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_9, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 7. ', 1);

-- ──────────────────────────────────────────────────────

-- [010] EMPRESA MUNICIPAL DE CHORRILLOS S.A
--       RUC: 20556621188  |  Visitas junio: 6
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('EMPRESA MUNICIPAL DE CHORRILLOS S.A', 'RUC', '20556621188', 1);
SET @id_cliente_10 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_10, 'EMPRESA MUNICIPAL DE CHORRILLOS S.A', '20556621188', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_10 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_10, 'CHORRISALUD', 'AV. DEFENSORES DEL MORRO 2007', 'CHORRILLOS', 'LIMA', 'LIMA', NULL, '960194636', 1);
SET @id_sede_10 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_10, '2026-07-03', 'mensual', 400.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 6. ', 1);

-- ──────────────────────────────────────────────────────

-- [011] Glow Inversiones SAC
--       RUC: 20600575733  |  Visitas junio: 6
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Glow Inversiones SAC', 'RUC', '20600575733', 1);
SET @id_cliente_11 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_11, 'Glow Inversiones SAC', '20600575733', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_11 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_11, 'Sonrise', 'Avenida Ariosto Matellini 374, Chorrillos', 'CHORRILLOS', 'LIMA', 'LIMA', NULL, '968401330', 1);
SET @id_sede_11 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_11, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 6. ', 1);

-- ──────────────────────────────────────────────────────

-- [012] SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRADA
--       RUC: 20518132947  |  Visitas junio: 6
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRADA', 'RUC', '20518132947', 1);
SET @id_cliente_12 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_12, 'SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRADA', '20518132947', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_12 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_12, 'SERVICIOS MEDICOS EL TREBOL', 'CALLE 2 DE MAYO N° 534 OFICINA 701 MIRAFLORES', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_12 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_12, '2026-07-03', 'quincenal', 300.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 6. ', 1);

-- ──────────────────────────────────────────────────────

-- [013] SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726,2728,
--       RUC: 20612164984  |  Visitas junio: 4
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726,2728,2728-A,2730,2738,2740 AREA 1,379.26 M2.', 'RUC', '20612164984', 1);
SET @id_cliente_13 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_13, 'SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726,2728,2728-A,2730,2738,2740 AREA 1,379.26 M2.', '20612164984', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_13 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_13, 'QUALIS', 'Av Brasil 2730 - Pueblo Libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 'Sergio Borda', NULL, 1);
SET @id_sede_13 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_13, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 4. ', 1);

-- ──────────────────────────────────────────────────────

-- [014] GRUPO MEDICO RS S.A.C.
--       RUC: 20608577093  |  Visitas junio: 4
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO MEDICO RS S.A.C.', 'RUC', '20608577093', 1);
SET @id_cliente_14 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_14, 'GRUPO MEDICO RS S.A.C.', '20608577093', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_14 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_14, 'DRA SEGOVIA AESTHETIC & WELLNESS', 'Av. Ricardo Palma 341, OFICINA 301, MIRAFLORES', 'MIRAFLORES', 'LIMA', 'LIMA', 'LADY SEGOVIA', '927047149', 1);
SET @id_sede_14 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_14, '2026-07-03', 'semanal', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 4. ', 1);

-- ──────────────────────────────────────────────────────

-- [015] 4G integral sac
--       RUC: 20601016274  |  Visitas junio: 4
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('4G integral sac', 'RUC', '20601016274', 1);
SET @id_cliente_15 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_15, '4G integral sac', '20601016274', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_15 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_15, 'Laboratorio clinico 4G', 'Av ignacio merino 1695', 'LINCE', 'LIMA', 'LIMA', NULL, '958985152', 1);
SET @id_sede_15 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_15, '2026-07-03', 'semanal', 450.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 4. ', 1);

-- ──────────────────────────────────────────────────────

-- [016] CLIICA OQUENDO SAC
--       RUC: 20610727507  |  Visitas junio: 4
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLIICA OQUENDO SAC', 'RUC', '20610727507', 1);
SET @id_cliente_16 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_16, 'CLIICA OQUENDO SAC', '20610727507', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_16 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_16, 'CLIICA OQUENDO SAC', 'MZ L LT 29 LOS SAIRES DE OQUENDO', 'CALLAO', 'LIMA', 'LIMA', 'CELINDA', '999304721', 1);
SET @id_sede_16 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_16, '2026-07-03', 'semanal', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 4. ', 1);

-- ──────────────────────────────────────────────────────

-- [017] W&M CORPORACION SALUD S.A.C
--       RUC: 20613941577  |  Visitas junio: 4
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('W&M CORPORACION SALUD S.A.C', 'RUC', '20613941577', 1);
SET @id_cliente_17 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_17, 'W&M CORPORACION SALUD S.A.C', '20613941577', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_17 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_17, 'Clínica Oncologica Peruana', 'Jr Eduardo Ordóñez 215 San Borja', 'SAN BORJA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_17 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_17, '2026-07-03', 'mensual', 100.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 4. ', 1);

-- ──────────────────────────────────────────────────────

-- [018] ACVET PERU E.I.R.L
--       RUC: 20605441077  |  Visitas junio: 4
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ACVET PERU E.I.R.L', 'RUC', '20605441077', 1);
SET @id_cliente_18 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_18, 'ACVET PERU E.I.R.L', '20605441077', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_18 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_18, 'ACVET', ', MZ A LT 13 CA. ASOCIACION RESIDENCIAL – SMP', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_18 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_18, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 4. ', 1);

-- ──────────────────────────────────────────────────────

-- [019] FRANQUICIAS DE INNOVACION DENTAL SAC
--       RUC: 20613275810  |  Visitas junio: 3
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('FRANQUICIAS DE INNOVACION DENTAL SAC', 'RUC', '20613275810', 1);
SET @id_cliente_19 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_19, 'FRANQUICIAS DE INNOVACION DENTAL SAC', '20613275810', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_19 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_19, 'SONRISA SEGURA SAN JUAN DE LURIGANCHO', 'AV. GRAN CHIMU 323-325 NRO. 323 DPTO. 201 URB ZARATE LIMA -LIMA', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'FELICITA JANET CONCHA CHUMBIYAURI', NULL, 1);
SET @id_sede_19 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_19, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 3. ', 1);

-- ──────────────────────────────────────────────────────

-- [020] REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA
--       RUC: 20384463470  |  Visitas junio: 3
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA', 'RUC', '20384463470', 1);
SET @id_cliente_20 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_20, 'REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA', '20384463470', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_20 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_20, 'CLINICA DENTAL NUEVA SONRISA', 'AV. VARGAS MACHUCA 685. ZONA E- SAN JUAN DE MIRAFLORES', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 'ROXANA PAIVA', NULL, 1);
SET @id_sede_20 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_20, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 3. ', 1);

-- ──────────────────────────────────────────────────────

-- [021] CENTRO QUIRURGICO VETERINARIO E.I.R.L.
--       RUC: 20607826146  |  Visitas junio: 3
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO QUIRURGICO VETERINARIO E.I.R.L.', 'RUC', '20607826146', 1);
SET @id_cliente_21 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_21, 'CENTRO QUIRURGICO VETERINARIO E.I.R.L.', '20607826146', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_21 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_21, 'Cequivet', 'Calle Mercaderes 114 surco', 'SURCO', 'LIMA', 'LIMA', 'JAZMIN', NULL, 1);
SET @id_sede_21 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_21, '2026-07-03', 'quincenal', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 3. ', 1);

-- ──────────────────────────────────────────────────────

-- [022] CORPORACIÓN VETERINARIA SAN PÍO S.A.C.
--       RUC: 20606054832  |  Visitas junio: 3
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACIÓN VETERINARIA SAN PÍO S.A.C.', 'RUC', '20606054832', 1);
SET @id_cliente_22 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_22, 'CORPORACIÓN VETERINARIA SAN PÍO S.A.C.', '20606054832', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_22 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_22, 'Veterinaria Animalince', 'Av. José Gálvez 2200 Lince', 'LINCE', 'LIMA', 'LIMA', 'CESAR BERROSPI', '936657577', 1);
SET @id_sede_22 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_22, '2026-07-03', 'quincenal', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 3. ', 1);

-- ──────────────────────────────────────────────────────

-- [023] LIMA DEL MAR ESPECIALISTAS MEDICOS S.A.C.
--       RUC: 20603274084  |  Visitas junio: 3
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LIMA DEL MAR ESPECIALISTAS MEDICOS S.A.C.', 'RUC', '20603274084', 1);
SET @id_cliente_23 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_23, 'LIMA DEL MAR ESPECIALISTAS MEDICOS S.A.C.', '20603274084', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_23 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_23, 'LIMA DEL MAR', 'AV FAUSTINO SANCHEZ CARRION 615 –JESUS MARIA OF 408-506', 'JESUS MARIA', 'LIMA', 'LIMA', 'LEYDI ARIAS', NULL, 1);
SET @id_sede_23 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_23, '2026-07-03', 'quincenal', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 3. ', 1);

-- ──────────────────────────────────────────────────────

-- [024] CIRUGIA PLASTICA PACHECO SAC
--       RUC: 20614448874  |  Visitas junio: 3
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CIRUGIA PLASTICA PACHECO SAC', 'RUC', '20614448874', 1);
SET @id_cliente_24 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_24, 'CIRUGIA PLASTICA PACHECO SAC', '20614448874', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_24 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_24, 'CIRUGIA PLASTICA PACHECO', 'AV FAUSTINO SANCHEZ CARRION 615 OFICINA 1110 JESUS MARIA', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, '903009778', 1);
SET @id_sede_24 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_24, '2026-07-03', 'quincenal', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 3. ', 1);

-- ──────────────────────────────────────────────────────

-- [025] FLORES CARBAJAL LENIN WALTER
--       RUC: 10459123500  |  Visitas junio: 3
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('FLORES CARBAJAL LENIN WALTER', 'RUC', '10459123500', 1);
SET @id_cliente_25 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_25, 'FLORES CARBAJAL LENIN WALTER', '10459123500', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_25 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_25, 'dental Paradise - estación naranjal', 'AV. NARANJAL MZ.B LT 1-2° PISO AAHH 19 DE MAYO', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, '989005627', 1);
SET @id_sede_25 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_25, '2026-07-03', 'mensual', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 3. ', 1);

-- ──────────────────────────────────────────────────────

-- [026] CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD
--       RUC: 10459111820  |  Visitas junio: 3
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD', 'RUC', '10459111820', 1);
SET @id_cliente_26 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_26, 'CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD', '10459111820', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_26 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_26, '9 AM A 6 PM', '80', 'EFECTIVO', 'LIMA', 'LIMA', 'AV. ARENALES 910 ICA', NULL, 1);
SET @id_sede_26 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_26, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 3. ', 1);

-- ──────────────────────────────────────────────────────

-- [027] Arvet Sacs
--       RUC: 20613649213  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Arvet Sacs', 'RUC', '20613649213', 1);
SET @id_cliente_27 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_27, 'Arvet Sacs', '20613649213', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_27 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_27, 'Clìnica Veterinaria Esperanza', 'calle 5 MZ. A lote 30 urbanización Campoy SJL', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'ROBERT VILLEGAS', '929310993', 1);
SET @id_sede_27 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_27, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [028] MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A.C
--       RUC: 20608420933  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A.C', 'RUC', '20608420933', 1);
SET @id_cliente_28 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_28, 'MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A.C', '20608420933', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_28 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_28, 'CLÍNICA VETERINARIA MASKOTOPIA', 'AV. LAS FLORES DE PRIMAVERA 1701', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_28 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_28, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [029] Clínica Integral Odonto Free EIRL
--       RUC: 20610423257  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica Integral Odonto Free EIRL', 'RUC', '20610423257', 1);
SET @id_cliente_29 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_29, 'Clínica Integral Odonto Free EIRL', '20610423257', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_29 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_29, 'Odontofree', 'calle 16 S/N AA. HH Juan Pablo II 1ra Etapa San Juan de Lurigancho', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'DRA MARIA MERCHOL', NULL, 1);
SET @id_sede_29 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_29, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [030] Jhonny Marcelo Astete Torrejón
--       RUC: 10211338640  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Jhonny Marcelo Astete Torrejón', 'RUC', '10211338640', 1);
SET @id_cliente_30 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_30, 'Jhonny Marcelo Astete Torrejón', '10211338640', 'ATE', 'LIMA', 'LIMA', 1);
SET @id_empresa_30 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_30, 'Jhonny Marcelo Astete Torrejón', 'Av. Los Rosales 470 Urbanizacion Valdiviezo Ate', 'ATE', 'LIMA', 'LIMA', NULL, '991281478', 1);
SET @id_sede_30 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_30, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [031] INSTITUTO DE EDUCACION SUPERIOR RICARDO PALMA SAC
--       RUC: 20338856955  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INSTITUTO DE EDUCACION SUPERIOR RICARDO PALMA SAC', 'RUC', '20338856955', 1);
SET @id_cliente_31 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_31, 'INSTITUTO DE EDUCACION SUPERIOR RICARDO PALMA SAC', '20338856955', 'ATE', 'LIMA', 'LIMA', 1);
SET @id_empresa_31 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_31, 'INSTITUTO RICARDO PALMA', 'AV. NICOLAS AYLLON N°6376', 'ATE', 'LIMA', 'LIMA', NULL, '987638203', 1);
SET @id_sede_31 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_31, '2026-07-03', 'mensual', 180.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [032] My Dentiss SAC
--       RUC: 20562730771  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('My Dentiss SAC', 'RUC', '20562730771', 1);
SET @id_cliente_32 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_32, 'My Dentiss SAC', '20562730771', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_32 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_32, 'Ceodent', 'Avenida los constructores 1230 int 3 La Molina', 'LA MOLINA', 'LIMA', 'LIMA', 'ROCIO', '999987030', 1);
SET @id_sede_32 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_32, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [033] Grupo veterinario las viñas sac
--       RUC: 20549914951  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Grupo veterinario las viñas sac', 'RUC', '20549914951', 1);
SET @id_cliente_33 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_33, 'Grupo veterinario las viñas sac', '20549914951', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_33 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_33, 'Animal Hospital Fresnos', 'AV. LOS CONDORES 486 LOCAL 1', 'LA MOLINA', 'LIMA', 'LIMA', NULL, '940433801', 1);
SET @id_sede_33 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_33, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [034] Clínica Veterinaria Ámbar EIRL
--       RUC: 20602702805  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica Veterinaria Ámbar EIRL', 'RUC', '20602702805', 1);
SET @id_cliente_34 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_34, 'Clínica Veterinaria Ámbar EIRL', '20602702805', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_34 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_34, 'Clínica veterinaria Ámbar', 'Av. Micaela Bastidas MZ.C , LT.12 , ST.1 , GP.21 - Villa el Salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '992429961', 1);
SET @id_sede_34 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_34, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [035] Karina Esthefania Espinal Melgarejo
--       RUC: 10712395619  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Karina Esthefania Espinal Melgarejo', 'RUC', '10712395619', 1);
SET @id_cliente_35 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_35, 'Karina Esthefania Espinal Melgarejo', '10712395619', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_35 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_35, 'Sanivet', 'SECTOR 1 GRUPO 12 MZ F LT 1', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '912159252', 1);
SET @id_sede_35 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_35, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [036] CLINICA FELINA JACOBITA S.A.C.
--       RUC: 20609688913  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA FELINA JACOBITA S.A.C.', 'RUC', '20609688913', 1);
SET @id_cliente_36 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_36, 'CLINICA FELINA JACOBITA S.A.C.', '20609688913', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_36 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_36, 'CLINICA FELINA JACOBITA', 'Sector 6 grupo 8-A manzana O lote 17 Av pastor Sevilla ruta C Villa El Salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'JUAN PABLO MEDINA', '947207460', 1);
SET @id_sede_36 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_36, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [037] King vet S.A.C
--       RUC: 20609560844  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('King vet S.A.C', 'RUC', '20609560844', 1);
SET @id_cliente_37 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_37, 'King vet S.A.C', '20609560844', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_37 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_37, 'KING VET', 'LOS GORRIONES 237', 'CHORRILLOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_37 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_37, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [038] ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C
--       RUC: 20601427193  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C', 'RUC', '20601427193', 1);
SET @id_cliente_38 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_38, 'ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C', '20601427193', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_38 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_38, 'Odontop', 'AVENIDA EL SOL ESTE 545 BARRANCO', 'BARRANCO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_38 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_38, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [039] CEV BUSTAMANTE E.I.R.L.
--       RUC: 20610248706  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CEV BUSTAMANTE E.I.R.L.', 'RUC', '20610248706', 1);
SET @id_cliente_39 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_39, 'CEV BUSTAMANTE E.I.R.L.', '20610248706', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_39 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_39, 'Centro de especialidades veterinarias Bustamante', 'CALLE ENRIQUE BARRON 202', 'BARRANCO', 'LIMA', 'LIMA', NULL, '906002393', 1);
SET @id_sede_39 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_39, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [040] CORPORACION SONRISA 3D SAC
--       RUC: 20606610557  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION SONRISA 3D SAC', 'RUC', '20606610557', 1);
SET @id_cliente_40 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_40, 'CORPORACION SONRISA 3D SAC', '20606610557', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_40 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_40, 'SONRISA 3D', 'AV. ARIOSTO MATELLINI NRO. 661 URB. NUEVO CHORRILLOS (3ER PISO) LIMA - LIMA - CHORRILLOS', 'CHORRILLOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_40 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_40, '2026-07-03', 'quincenal', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [041] CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C.
--       RUC: 20607342441  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C.', 'RUC', '20607342441', 1);
SET @id_cliente_41 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_41, 'CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C.', '20607342441', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_41 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_41, 'Castilla & Gaspar Odontología Integral', 'Av. San Luis 1483 - San Luis', 'SAN LUIS', 'LIMA', 'LIMA', 'GABRIELA MONTENEGRO', NULL, 1);
SET @id_sede_41 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_41, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [042] MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CERRADA
--       RUC: 20511018553  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CERRADA', 'RUC', '20511018553', 1);
SET @id_cliente_42 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_42, 'MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CERRADA', '20511018553', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_42 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_42, 'CENTRO MEDICO SAN JOSE MARELLO', 'AV. CANADA 3789 - SAN LUIS', 'SAN LUIS', 'LIMA', 'LIMA', NULL, '992097010', 1);
SET @id_sede_42 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_42, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [043] DOCTORLABS S.A.C.
--       RUC: 20612134210  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DOCTORLABS S.A.C.', 'RUC', '20612134210', 1);
SET @id_cliente_43 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_43, 'DOCTORLABS S.A.C.', '20612134210', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_43 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_43, 'DOCTORLABS', 'Calle Los Negocios 223 Surquillo.', 'SURQUILLO', 'LIMA', 'LIMA', NULL, '961051008', 1);
SET @id_sede_43 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_43, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [044] ANIMEDICA VET SAC
--       RUC: 20601722098  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ANIMEDICA VET SAC', 'RUC', '20601722098', 1);
SET @id_cliente_44 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_44, 'ANIMEDICA VET SAC', '20601722098', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_44 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_44, 'ANIMEDICA VET', 'Av Bertello 512 - CERCADO DE LIMA (A MEDIA CUADRA DE MANUEL CASOS)', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 'FIORELLA CARDENAS', '991109701', 1);
SET @id_sede_44 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_44, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [045] MEDICVET INTEGRATIVA SAC
--       RUC: 20612548430  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MEDICVET INTEGRATIVA SAC', 'RUC', '20612548430', 1);
SET @id_cliente_45 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_45, 'MEDICVET INTEGRATIVA SAC', '20612548430', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_45 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_45, 'Clinica veterinaria Aristocat', 'Av Brasil 1263', 'JESUS MARIA', 'LIMA', 'LIMA', 'MIGUEL CALDERON', NULL, 1);
SET @id_sede_45 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_45, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [046] HUAMANI VILLANUEVA KATIA KARINA
--       RUC: 10427788399  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('HUAMANI VILLANUEVA KATIA KARINA', 'RUC', '10427788399', 1);
SET @id_cliente_46 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_46, 'HUAMANI VILLANUEVA KATIA KARINA', '10427788399', 'BREÑA', 'LIMA', 'LIMA', 1);
SET @id_empresa_46 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_46, 'DRA. KAT', 'Av. Bolivia 1120 - BREÑA', 'BREÑA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_46 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_46, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [047] VANEDENT EIRL
--       RUC: 20603826273  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VANEDENT EIRL', 'RUC', '20603826273', 1);
SET @id_cliente_47 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_47, 'VANEDENT EIRL', '20603826273', 'BREÑA', 'LIMA', 'LIMA', 1);
SET @id_empresa_47 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_47, 'VANEDENT EIRL', 'Juan Pablo Fernandini 1019 - Breña', 'BREÑA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_47 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_47, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [048] Clínica dental happy faces
--       RUC: 20609097061  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica dental happy faces', 'RUC', '20609097061', 1);
SET @id_cliente_48 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_48, 'Clínica dental happy faces', '20609097061', 'BREÑA', 'LIMA', 'LIMA', 1);
SET @id_empresa_48 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_48, 'Clínica dental happy faces', 'Jirón Jorge Chávez 505', 'BREÑA', 'LIMA', 'LIMA', NULL, '955593878', 1);
SET @id_sede_48 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_48, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [049] AD CENTRO DE INNOVACION DENTAL EIRL
--       RUC: 20557251015  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('AD CENTRO DE INNOVACION DENTAL EIRL', 'RUC', '20557251015', 1);
SET @id_cliente_49 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_49, 'AD CENTRO DE INNOVACION DENTAL EIRL', '20557251015', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_49 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_49, 'AD CENTRO DE INNOVACION DENTAL EIRL', 'AV HIPOLITO UNANUE 144 URB LA COLONIAL', 'CALLAO', 'LIMA', 'LIMA', NULL, '964321882', 1);
SET @id_sede_49 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_49, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [050] ROSALES SILVA RAQUEL
--       RUC: 10425407495  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ROSALES SILVA RAQUEL', 'RUC', '10425407495', 1);
SET @id_cliente_50 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_50, 'ROSALES SILVA RAQUEL', '10425407495', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_50 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_50, 'MIYAROVET', 'Av Perú 2651', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'PEDRO ROSALES', '965724774', 1);
SET @id_sede_50 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_50, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [051] LOVE & PETS VETERINARIAS SAC
--       RUC: 20610706747  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LOVE & PETS VETERINARIAS SAC', 'RUC', '20610706747', 1);
SET @id_cliente_51 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_51, 'LOVE & PETS VETERINARIAS SAC', '20610706747', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_51 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_51, 'animal lovers', 'AV. LA PAZ 1998 URB. CIUDAD DE PAPEL', 'SAN MIGUEL', 'LIMA', 'LIMA', 'ALCIDES', NULL, 1);
SET @id_sede_51 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_51, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [052] CLINICA VETERINARIA DEL NORTE SAC
--       RUC: 20613146149  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA DEL NORTE SAC', 'RUC', '20613146149', 1);
SET @id_cliente_52 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_52, 'CLINICA VETERINARIA DEL NORTE SAC', '20613146149', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_52 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_52, 'CLINICA VETERINARIA DEL NORTE', '- Av. 2 de Octubre Mz. H2 Lote 27. AA.HH Los Olivos de Pro. - Distrito Los Olivos', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_52 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_52, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [053] MEDICOS SOLIDARIOS SMG SAC
--       RUC: 20543542157  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MEDICOS SOLIDARIOS SMG SAC', 'RUC', '20543542157', 1);
SET @id_cliente_53 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_53, 'MEDICOS SOLIDARIOS SMG SAC', '20543542157', '120', 'LIMA', 'LIMA', 1);
SET @id_empresa_53 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_53, 'VINALI', 'CHINCHA', '120', 'LIMA', 'LIMA', '993831538', NULL, 1);
SET @id_sede_53 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_53, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [054] VETERINARIA & SPA HAPPY CAN S.A.C.
--       RUC: 20602429106  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA & SPA HAPPY CAN S.A.C.', 'RUC', '20602429106', 1);
SET @id_cliente_54 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_54, 'VETERINARIA & SPA HAPPY CAN S.A.C.', '20602429106', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_54 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_54, 'VETERINARIA & SPA HAPPY CAN S.A.C.', 'jirón madre selva 341 urb santa Isabel carabayllo', 'CARABAYLLO', 'LIMA', 'LIMA', 'NATALY MARQUEZ', '975385460', 1);
SET @id_sede_54 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_54, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [055] INVERSIONES MEFANE SAC
--       RUC: 20606393521  |  Visitas junio: 2
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INVERSIONES MEFANE SAC', 'RUC', '20606393521', 1);
SET @id_cliente_55 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_55, 'INVERSIONES MEFANE SAC', '20606393521', '70', 'LIMA', 'LIMA', 1);
SET @id_empresa_55 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_55, 'EL MISTER VETERINARIA', 'SAN BARTOLO', '70', 'LIMA', 'LIMA', '+51 990 380 560', NULL, 1);
SET @id_sede_55 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_55, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 2. ', 1);

-- ──────────────────────────────────────────────────────

-- [056] ZOOLO MASCOTAS VETERINARIAS S.A.C.
--       RUC: 20607760561  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ZOOLO MASCOTAS VETERINARIAS S.A.C.', 'RUC', '20607760561', 1);
SET @id_cliente_56 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_56, 'ZOOLO MASCOTAS VETERINARIAS S.A.C.', '20607760561', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_56 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_56, 'Zoolo mascotas veterinaria', 'Jirón amazonas 311 urb caja de agua sjl', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'LAURA RUIZ', '987419105', 1);
SET @id_sede_56 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_56, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [057] ORTOGAM S.R.L.
--       RUC: 20472832302  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ORTOGAM S.R.L.', 'RUC', '20472832302', 1);
SET @id_cliente_57 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_57, 'ORTOGAM S.R.L.', '20472832302', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_57 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_57, 'DENTAL ORTOGAM', 'AV. GRAN CHIMU NRO. 921 INT. 1 URB. ZARATE (PISO 2-ALT.PUENTE NUEVO) LIMA - LIMA - SAN JUAN DE LURIGANCHO', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'DR GAMBINI', '4596151', 1);
SET @id_sede_57 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_57, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [058] CENTRO OFTALMOLOGICO DR. GERONIMO EIRL
--       RUC: 20609329298  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO OFTALMOLOGICO DR. GERONIMO EIRL', 'RUC', '20609329298', 1);
SET @id_cliente_58 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_58, 'CENTRO OFTALMOLOGICO DR. GERONIMO EIRL', '20609329298', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_58 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_58, 'DR. JAVIER GERONIMO CENTRO OFTALMOLOGICO', 'AV GRAN CHIMU 745 MZNA B 1ER PISO ZARATE', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'MARIA MEZA', '994979820', 1);
SET @id_sede_58 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_58, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [059] TELLO CHUNGA NORMA JANNET
--       RUC: 10423855946  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('TELLO CHUNGA NORMA JANNET', 'RUC', '10423855946', 1);
SET @id_cliente_59 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_59, 'TELLO CHUNGA NORMA JANNET', '10423855946', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_59 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_59, 'Veterinaria Mangomarca', 'Jr: Templo de la Luna 335 urb. Mangomarca.S.J.L', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '986373167', 1);
SET @id_sede_59 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_59, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [060] Veterinaria Elías Mendoza Cerna
--       RUC: 10267189442  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Veterinaria Elías Mendoza Cerna', 'RUC', '10267189442', 1);
SET @id_cliente_60 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_60, 'Veterinaria Elías Mendoza Cerna', '10267189442', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_60 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_60, 'Sumaq Kawsay', 'av Portada del Sol 421. urbanización Zárate.  Sjl', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '945066343', 1);
SET @id_sede_60 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_60, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [061] QUEZADA HUERTA GROUP SAC
--       RUC: 20610904859  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('QUEZADA HUERTA GROUP SAC', 'RUC', '20610904859', 1);
SET @id_cliente_61 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_61, 'QUEZADA HUERTA GROUP SAC', '20610904859', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_61 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_61, 'Centro Odontológico Especializado “QUEZADA”', 'AV. PROCERES DE LA INDEPENDENCIA NRO 2999 INT A13 2DO PISO - C', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '951977917', 1);
SET @id_sede_61 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_61, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [062] EJERCITO PERUANO Escuela Militar de Chorrillos
--       RUC: 20131369124  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('EJERCITO PERUANO Escuela Militar de Chorrillos', 'RUC', '20131369124', 1);
SET @id_cliente_62 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_62, 'EJERCITO PERUANO Escuela Militar de Chorrillos', '20131369124', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_62 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_62, 'ESCUELA MILITAR', 'AV. ESCUELA MILITAR SN CHORRILLOS', 'CHORRILLOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_62 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_62, '2026-07-03', 'mensual', 20.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [063] JUMPA RIVERA MARCIA KRISTIE SANDY
--       RUC: 10708868499  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JUMPA RIVERA MARCIA KRISTIE SANDY', 'RUC', '10708868499', 1);
SET @id_cliente_63 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_63, 'JUMPA RIVERA MARCIA KRISTIE SANDY', '10708868499', 'SAN JUAN DE LURIGANCHO 1', 'LIMA', 'LIMA', 1);
SET @id_empresa_63 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_63, 'CLINICA VETERINARIA JUMANJI PET SHOP - SPA', 'Av. Canto Grande 2671', 'SAN JUAN DE LURIGANCHO 1', 'LIMA', 'LIMA', 'MARCIA', '960562062', 1);
SET @id_sede_63 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_63, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [064] Corporativo Veterinario SAC
--       RUC: 20546435432  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Corporativo Veterinario SAC', 'RUC', '20546435432', 1);
SET @id_cliente_64 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_64, 'Corporativo Veterinario SAC', '20546435432', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_64 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_64, 'Clinica Veterinaria Pet Point', 'Jr. Los Quipus 282 Urb. Zarate SJL', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '924122764', 1);
SET @id_sede_64 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_64, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [065] Grupos Sanitovet SAC
--       RUC: 20566337402  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Grupos Sanitovet SAC', 'RUC', '20566337402', 1);
SET @id_cliente_65 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_65, 'Grupos Sanitovet SAC', '20566337402', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_65 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_65, 'Grupos Sanitovet SAC', 'AV LOS NOGALES 450 URB CANTO BELLO- SAN JUAN DE LURIGANCHO', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '961846448', 1);
SET @id_sede_65 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_65, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [066] NARRO EGUIA BRYAN ENRIQUE
--       RUC: 10746602958  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('NARRO EGUIA BRYAN ENRIQUE', 'RUC', '10746602958', 1);
SET @id_cliente_66 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_66, 'NARRO EGUIA BRYAN ENRIQUE', '10746602958', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_66 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_66, 'NARRO EGUIA BRYAN ENRIQUE', 'CALLE GANIMEDES 363 URB. GANIMEDES SJL', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '990007911', 1);
SET @id_sede_66 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_66, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [067] INVERSIONES JL TASAYCO E.I.R.L.
--       RUC: 20607028606  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INVERSIONES JL TASAYCO E.I.R.L.', 'RUC', '20607028606', 1);
SET @id_cliente_67 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_67, 'INVERSIONES JL TASAYCO E.I.R.L.', '20607028606', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_67 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_67, 'VETERINARIA PET SHOP  HAPPY DOG', 'Av 13 de enero 2369 urb san carlos san juan de lurigancho', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'JOSE LUIS TASAYCO', '902727254', 1);
SET @id_sede_67 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_67, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [068] YURIZ SALUD E.I.R.L.
--       RUC: 20610795201  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('YURIZ SALUD E.I.R.L.', 'RUC', '20610795201', 1);
SET @id_cliente_68 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_68, 'YURIZ SALUD E.I.R.L.', '20610795201', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_68 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_68, 'Odontologia compleja Dra Yuri Zelada', 'Av. próceres de la independencia 2479 - SAN JUAN DE LURIGANCHO', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'YURI ZELADA', '992208896', 1);
SET @id_sede_68 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_68, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [069] CORPORACION EMPRESARIAL SANNA VET S.A.C.
--       RUC: 20609481103  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION EMPRESARIAL SANNA VET S.A.C.', 'RUC', '20609481103', 1);
SET @id_cliente_69 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_69, 'CORPORACION EMPRESARIAL SANNA VET S.A.C.', '20609481103', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_69 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_69, 'CLINICA VETERINARIA MUNDO ANIMAL', 'AV. 13 DE ENERO  2201 URB. LA HUAYRONA', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_69 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_69, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [070] VALNIM SAC
--       RUC: 20601506573  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VALNIM SAC', 'RUC', '20601506573', 1);
SET @id_cliente_70 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_70, 'VALNIM SAC', '20601506573', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_70 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_70, 'VET CLINIC', 'AV. CANTO GRANDE 3649 ALT PDRO 9 DE AV CANTO GRANDE - SJL', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'ROGER CARBAJAL', '955114566', 1);
SET @id_sede_70 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_70, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [071] JANAMPA CLEMENTE VICTOR ALBERTO
--       RUC: 10730485714  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JANAMPA CLEMENTE VICTOR ALBERTO', 'RUC', '10730485714', 1);
SET @id_cliente_71 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_71, 'JANAMPA CLEMENTE VICTOR ALBERTO', '10730485714', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_71 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_71, 'JANAMPA CLEMENTE VICTOR ALBERTO', 'Mariscal caceres mz B 13 Lt. 24 -  san juan de lurigancho', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '953518627', 1);
SET @id_sede_71 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_71, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [072] BRAÑEZ VIVAS LEONIDAS CERILO
--       RUC: 10162969868  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('BRAÑEZ VIVAS LEONIDAS CERILO', 'RUC', '10162969868', 1);
SET @id_cliente_72 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_72, 'BRAÑEZ VIVAS LEONIDAS CERILO', '10162969868', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_72 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_72, 'DENTAL EL PUEBLO', 'JR LOS INGENIIEROS MZ G LT 11 AAHH JAIME ZUBIETA CALDERON - SAN JUAN DE LURIGANCHO', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '966425446', 1);
SET @id_sede_72 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_72, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [073] VETERINARIAS LOTSO S.A.C.
--       RUC: 20603217579  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIAS LOTSO S.A.C.', 'RUC', '20603217579', 1);
SET @id_cliente_73 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_73, 'VETERINARIAS LOTSO S.A.C.', '20603217579', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_73 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_73, 'VETERINARIA LOTSO', 'MZ A LT 20 GRUPO 6 CRUZ MOTUPE', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'NATALY', NULL, 1);
SET @id_sede_73 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_73, '2026-07-03', 'mensual', 58.3, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [074] LESCANO AGUIRRE JESUS ENRIQUE
--       RUC: 10075482570  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LESCANO AGUIRRE JESUS ENRIQUE', 'RUC', '10075482570', 1);
SET @id_cliente_74 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_74, 'LESCANO AGUIRRE JESUS ENRIQUE', '10075482570', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_74 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_74, 'Snoopy Vets', 'URB. LOS PINOS MZ D LT 12 1ERA ETAPA SAN JUAN DE LURIGANCHO', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_74 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_74, '2026-07-03', 'mensual', 62.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [075] GRUPO ODONTOLOGICO CASAL S.A.C.
--       RUC: 20565355199  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO ODONTOLOGICO CASAL S.A.C.', 'RUC', '20565355199', 1);
SET @id_cliente_75 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_75, 'GRUPO ODONTOLOGICO CASAL S.A.C.', '20565355199', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_75 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_75, 'Dental CASAL', 'Av. Circunvalación Mz. B13 Lt. 27 Programa Ciudad Mariscal Cáceres – San Juan de Lurigancho', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'ARACELI CASTILLO', '990686666', 1);
SET @id_sede_75 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_75, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [076] Lia cárdenas Alcazar
--       RUC: 10425712409  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Lia cárdenas Alcazar', 'RUC', '10425712409', 1);
SET @id_cliente_76 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_76, 'Lia cárdenas Alcazar', '10425712409', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_76 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_76, 'familydent', 'Av canto grande N 3650 2do piso SAN JUAN DE LURIGANCHO', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'Lia', NULL, 1);
SET @id_sede_76 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_76, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [077] Dávila Gutiérrez Davis Clint
--       RUC: 10455206371  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Dávila Gutiérrez Davis Clint', 'RUC', '10455206371', 1);
SET @id_cliente_77 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_77, 'Dávila Gutiérrez Davis Clint', '10455206371', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_77 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_77, 'Mariscal Pet''s', 'Av. Héroes del Cenepa con jirón(calle) Geologos Mz J1 Lt 22  Urb. Mariscal', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '944558400', 1);
SET @id_sede_77 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_77, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [078] ESPINOZA ATENCIO FABIOLA CATHERINE
--       RUC: 10705051807  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ESPINOZA ATENCIO FABIOLA CATHERINE', 'RUC', '10705051807', 1);
SET @id_cliente_78 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_78, 'ESPINOZA ATENCIO FABIOLA CATHERINE', '10705051807', 'SAN JUAN DE LURIGANCHO 1', 'LIMA', 'LIMA', 1);
SET @id_empresa_78 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_78, 'FABIDENT', 'Av. pirámide del sol 526 Zárate - SAN JUAN DE LURIGANCHO', 'SAN JUAN DE LURIGANCHO 1', 'LIMA', 'LIMA', 'FABIOLA 991 833 333', NULL, 1);
SET @id_sede_78 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_78, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [079] Hipólity MEDICAL Group EIRL
--       RUC: 20614742101  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Hipólity MEDICAL Group EIRL', 'RUC', '20614742101', 1);
SET @id_cliente_79 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_79, 'Hipólity MEDICAL Group EIRL', '20614742101', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_79 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_79, 'Hipólity Salud', 'AV. 13 DE ENERO NUM 961-965 Y JR. LAS GRULLAS NUMERO 1087, URB. HORIZONTE DE ZARATE - SAN JUAN DE LURIGANCHO', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '944393376', 1);
SET @id_sede_79 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_79, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [080] PIZARRO PRADA ANTHONY MARTIN
--       RUC: 10721943114  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PIZARRO PRADA ANTHONY MARTIN', 'RUC', '10721943114', 1);
SET @id_cliente_80 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_80, 'PIZARRO PRADA ANTHONY MARTIN', '10721943114', 'EL AGUSTINO', 'LIMA', 'LIMA', 1);
SET @id_empresa_80 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_80, 'EDENTYS', 'Av. Riva agüero #487 - El Agustino (al costado. Del grifo petro perú)', 'EL AGUSTINO', 'LIMA', 'LIMA', 'YAIRA SAAVEDRA', '922179951', 1);
SET @id_sede_80 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_80, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [081] vetSpizan eirl
--       RUC: 20606290951  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('vetSpizan eirl', 'RUC', '20606290951', 1);
SET @id_cliente_81 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_81, 'vetSpizan eirl', '20606290951', 'EL AGUSTINO', 'LIMA', 'LIMA', 1);
SET @id_empresa_81 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_81, 'centro medico veterinario vetSpizan', 'Ca. Las guindas MZ B lt.20 Urbanización las palmeras.El Agustino', 'EL AGUSTINO', 'LIMA', 'LIMA', 'ELMA DUEÑAS', '991443636', 1);
SET @id_sede_81 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_81, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [082] Jorge Luis Chavez Jara
--       RUC: 10704322521  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Jorge Luis Chavez Jara', 'RUC', '10704322521', 1);
SET @id_cliente_82 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_82, 'Jorge Luis Chavez Jara', '10704322521', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_82 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_82, 'Odonto Escobar', 'Av. Santa Rosa 2415 SJL (Referencia: Cruce con Av Jorge Basadre Este)', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', NULL, '936074776', 1);
SET @id_sede_82 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_82, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [083] Corporación Fierro Artica SAC
--       RUC: 20610671901  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Corporación Fierro Artica SAC', 'RUC', '20610671901', 1);
SET @id_cliente_83 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_83, 'Corporación Fierro Artica SAC', '20610671901', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_83 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_83, 'Dental Plus', 'Calle Cascanueces 272, Santa Anita', 'SANTA ANITA', 'LIMA', 'LIMA', 'ALONSO', '971131906', 1);
SET @id_sede_83 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_83, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [084] TORRES AGUIRRE JORGE LUIS
--       RUC: 10225147081  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('TORRES AGUIRRE JORGE LUIS', 'RUC', '10225147081', 1);
SET @id_cliente_84 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_84, 'TORRES AGUIRRE JORGE LUIS', '10225147081', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_84 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_84, 'ENTRE MASCOTAS', 'Av Santa Rosa 343 URB santa Anita', 'SANTA ANITA', 'LIMA', 'LIMA', 'JORGE', '962692950', 1);
SET @id_sede_84 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_84, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [085] GRUPO SANAR S.A.C.
--       RUC: 20601470412  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO SANAR S.A.C.', 'RUC', '20601470412', 1);
SET @id_cliente_85 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_85, 'GRUPO SANAR S.A.C.', '20601470412', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_85 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_85, 'SANAR', 'Av. Santa Rosa 392 - Santa Anita', 'SANTA ANITA', 'LIMA', 'LIMA', 'VERONICA', NULL, 1);
SET @id_sede_85 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_85, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [086] VETERINARIA LOS FLAMENCOS E.I.R.L.
--       RUC: 20611282291  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA LOS FLAMENCOS E.I.R.L.', 'RUC', '20611282291', 1);
SET @id_cliente_86 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_86, 'VETERINARIA LOS FLAMENCOS E.I.R.L.', '20611282291', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_86 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_86, 'Veterinaria los flamencos', 'Los flamencos 435 Urb Sta Anita', 'SANTA ANITA', 'LIMA', 'LIMA', 'SANTOME VICTORIA', NULL, 1);
SET @id_sede_86 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_86, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [087] LOPEZ ROJAS JOSE CARLOS
--       RUC: 10201214314  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LOPEZ ROJAS JOSE CARLOS', 'RUC', '10201214314', 1);
SET @id_cliente_87 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_87, 'LOPEZ ROJAS JOSE CARLOS', '10201214314', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_87 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_87, 'UNIVERSALDENT', 'Av.07 De Junio N 385 Mz. C4 Lt. 15 Los Ficus - Santa Anita', 'SANTA ANITA', 'LIMA', 'LIMA', 'JOSE LOPEZ', NULL, 1);
SET @id_sede_87 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_87, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [088] Rosalinda Rubio Lezama
--       RUC: 10706071101  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Rosalinda Rubio Lezama', 'RUC', '10706071101', 1);
SET @id_cliente_88 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_88, 'Rosalinda Rubio Lezama', '10706071101', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_88 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_88, 'Rubio Veterinaria', 'Jr. Chavin 303 2do piso Coop. Los Chancas de Andahuaylas', 'SANTA ANITA', 'LIMA', 'LIMA', 'ROSALINDA', NULL, 1);
SET @id_sede_88 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_88, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [089] DR. CHRISTIAN S.A.C.
--       RUC: 20607896489  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DR. CHRISTIAN S.A.C.', 'RUC', '20607896489', 1);
SET @id_cliente_89 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_89, 'DR. CHRISTIAN S.A.C.', '20607896489', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_89 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_89, 'POLICLINICO DR. CHRISTIAN', 'Av Los Chancas Mz R Lote 5 Urb. San Carlos- SANTA ANITA', 'SANTA ANITA', 'LIMA', 'LIMA', 'NAOMI MARIELA', '912955820', 1);
SET @id_sede_89 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_89, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [090] Veterinaria vida animal e.i.r.l.
--       RUC: 20613580051  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Veterinaria vida animal e.i.r.l.', 'RUC', '20613580051', 1);
SET @id_cliente_90 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_90, 'Veterinaria vida animal e.i.r.l.', '20613580051', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_90 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_90, 'Veterinaria vida animal', 'Ruiseñores 625 santa anita', 'SANTA ANITA', 'LIMA', 'LIMA', NULL, '948885745', 1);
SET @id_sede_90 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_90, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [091] Inversiones Glory SAC
--       RUC: 20609885999  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Inversiones Glory SAC', 'RUC', '20609885999', 1);
SET @id_cliente_91 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_91, 'Inversiones Glory SAC', '20609885999', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_91 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_91, 'HABANA PETS', 'AV LOS RUISEÑORES 768', 'SANTA ANITA', 'LIMA', 'LIMA', 'MARIA SOLEDAD', NULL, 1);
SET @id_sede_91 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_91, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [092] stephanie llantoy cosio
--       RUC: 10472168105  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('stephanie llantoy cosio', 'RUC', '10472168105', 1);
SET @id_cliente_92 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_92, 'stephanie llantoy cosio', '10472168105', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_92 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_92, 'Brillante Odontologia', 'jiron las nueces MzG LT5 las praderas de santa anita', 'SANTA ANITA', 'LIMA', 'LIMA', NULL, '986960503', 1);
SET @id_sede_92 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_92, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [093] Ayllu Dent S.A.C
--       RUC: 20604651043  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Ayllu Dent S.A.C', 'RUC', '20604651043', 1);
SET @id_cliente_93 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_93, 'Ayllu Dent S.A.C', '20604651043', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_93 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_93, 'Aylludent', 'Calle Marcelino Varela 378 Los Ficus Santa Anita', 'SANTA ANITA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_93 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_93, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [094] SIERRA FLORES KARINA STEFANY
--       RUC: 10463902131  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SIERRA FLORES KARINA STEFANY', 'RUC', '10463902131', 1);
SET @id_cliente_94 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_94, 'SIERRA FLORES KARINA STEFANY', '10463902131', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_94 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_94, 'SIERRA FLORES KARINA STEFANY', 'AV. EUCALIPTOS 732', 'SANTA ANITA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_94 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_94, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [095] Luis Estiv Goyas Blancas
--       RUC: 10409294613  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Luis Estiv Goyas Blancas', 'RUC', '10409294613', 1);
SET @id_cliente_95 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_95, 'Luis Estiv Goyas Blancas', '10409294613', 'Santa Anita', 'LIMA', 'LIMA', 1);
SET @id_empresa_95 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_95, 'GOYAS BLANCAS - ODONTOLOGIA INTEGRAL', 'Calle las vegas Mz D5 Lt 01 Santa Anita', 'Santa Anita', 'LIMA', 'LIMA', NULL, '982090692', 1);
SET @id_sede_95 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_95, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [096] ROMERO OBREGON ANDREA BELEN
--       RUC: 10451242526  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ROMERO OBREGON ANDREA BELEN', 'RUC', '10451242526', 1);
SET @id_cliente_96 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_96, 'ROMERO OBREGON ANDREA BELEN', '10451242526', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_96 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_96, 'Consultorio dental Romero Dent', 'jirón aymaras 590  , coop. Los chancas . Santa Anita', 'SANTA ANITA', 'LIMA', 'LIMA', NULL, '967000076', 1);
SET @id_sede_96 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_96, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [097] EMPRESA GVET GESTIONES VETERINARIAS EIRL
--       RUC: 20608516434  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('EMPRESA GVET GESTIONES VETERINARIAS EIRL', 'RUC', '20608516434', 1);
SET @id_cliente_97 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_97, 'EMPRESA GVET GESTIONES VETERINARIAS EIRL', '20608516434', 'SANTA ANITA', 'LIMA', 'LIMA', 1);
SET @id_empresa_97 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_97, 'TERRA-VET', 'JIRON LAS VIOLETAS MZ I LOTE 17 ASOCIACIÓN VILLA SANTA ANITA', 'SANTA ANITA', 'LIMA', 'LIMA', NULL, '933683532', 1);
SET @id_sede_97 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_97, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [098] Galaxy pets SAC
--       RUC: 20613952153  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Galaxy pets SAC', 'RUC', '20613952153', 1);
SET @id_cliente_98 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_98, 'Galaxy pets SAC', '20613952153', 'ATE', 'LIMA', 'LIMA', 1);
SET @id_empresa_98 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_98, 'GALAXY PETS', 'AV LOS QUECHUAS 905 SALAMANCA -ATE', 'ATE', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_98 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_98, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [099] HUARACA DELGADO FLOR DE MARIA
--       RUC: 10208874476  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('HUARACA DELGADO FLOR DE MARIA', 'RUC', '10208874476', 1);
SET @id_cliente_99 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_99, 'HUARACA DELGADO FLOR DE MARIA', '10208874476', 'ate', 'LIMA', 'LIMA', 1);
SET @id_empresa_99 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_99, 'GEOPETS', 'Calle llanos Mz A Lt 1 Ate Vitarte', 'ate', 'LIMA', 'LIMA', 'FLOR DE MARIA', '995681306', 1);
SET @id_sede_99 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_99, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [100] CLINICA VETERINARIA SASH SA
--       RUC: 20601150205  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA SASH SA', 'RUC', '20601150205', 1);
SET @id_cliente_100 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_100, 'CLINICA VETERINARIA SASH SA', '20601150205', 'ATE', 'LIMA', 'LIMA', 1);
SET @id_empresa_100 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_100, 'SASH', 'AV LOS QUECHUAS 350 - ATE', 'ATE', 'LIMA', 'LIMA', 'ALEXANDRA BALDEON', NULL, 1);
SET @id_sede_100 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_100, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [101] CANDIDO VET PET SHOP SPA E.I.R.L - CANDIDO E.I.R.L
--       RUC: 20603933061  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CANDIDO VET PET SHOP SPA E.I.R.L - CANDIDO E.I.R.L', 'RUC', '20603933061', 1);
SET @id_cliente_101 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_101, 'CANDIDO VET PET SHOP SPA E.I.R.L - CANDIDO E.I.R.L', '20603933061', 'ATE', 'LIMA', 'LIMA', 1);
SET @id_empresa_101 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_101, 'CÁNDIDO', 'Pje. Daniel A. Carrión N° 119, Salamanca - Ate', 'ATE', 'LIMA', 'LIMA', 'MARIELLA PALOMINO', '990506193', 1);
SET @id_sede_101 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_101, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [102] FARRO GONZALEZ MARIA GLORIA
--       RUC: 10104239469  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('FARRO GONZALEZ MARIA GLORIA', 'RUC', '10104239469', 1);
SET @id_cliente_102 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_102, 'FARRO GONZALEZ MARIA GLORIA', '10104239469', 'ATE', 'LIMA', 'LIMA', 1);
SET @id_empresa_102 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_102, 'DENTAL FELIPE', 'ASS. SAN JUAN BAUTISTA MZ A LT 2 2DO PISO - ATE', 'ATE', 'LIMA', 'LIMA', 'MARITA FARRO', NULL, 1);
SET @id_sede_102 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_102, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [103] MANUEL ALEJANDRO VIDAL FLORES
--       RUC: 10410038523  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MANUEL ALEJANDRO VIDAL FLORES', 'RUC', '10410038523', 1);
SET @id_cliente_103 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_103, 'MANUEL ALEJANDRO VIDAL FLORES', '10410038523', 'ATE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_103 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_103, 'CONSULTORIO DENTAL VIDAL', 'ASO. CAMPO SOL AV. 24 DE SEPTIEMBRE MZ E LT 15 SEGUNDO PISO CHOSICA', 'ATE LURIGANCHO', 'LIMA', 'LIMA', NULL, '980798491', 1);
SET @id_sede_103 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_103, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [104] DENTAL FULLSONRISAS S.A.C.
--       RUC: 20613766546  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DENTAL FULLSONRISAS S.A.C.', 'RUC', '20613766546', 1);
SET @id_cliente_104 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_104, 'DENTAL FULLSONRISAS S.A.C.', '20613766546', 'ATE', 'LIMA', 'LIMA', 1);
SET @id_empresa_104 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_104, 'Dental FullSonrisas', 'asoc. El porvenir de vitarte Mz. D lot.1, 2do piso', 'ATE', 'LIMA', 'LIMA', NULL, '968490271', 1);
SET @id_sede_104 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_104, '2026-07-03', 'mensual', 50.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [105] PERU CARM S.A.C.
--       RUC: 20524233330  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PERU CARM S.A.C.', 'RUC', '20524233330', 1);
SET @id_cliente_105 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_105, 'PERU CARM S.A.C.', '20524233330', 'ATE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_105 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_105, 'VETERINARIA LA ERA DE LAS MASCOTAS', 'AV. BERNARDO BALAGUER MZA. B LOTE. 18 URB. LA ALAMEDA DE ÑAÑA (A 50 METROS DE OFIC SERENAZGO) 3ERA ETAPA - LURIGANCHO', 'ATE LURIGANCHO', 'LIMA', 'LIMA', 'CARLOS RODRIGUEZ', NULL, 1);
SET @id_sede_105 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_105, '2026-07-03', 'mensual', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [106] HUATUCO GONZALES GINA MIRIAM
--       RUC: 10107142458  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('HUATUCO GONZALES GINA MIRIAM', 'RUC', '10107142458', 1);
SET @id_cliente_106 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_106, 'HUATUCO GONZALES GINA MIRIAM', '10107142458', 'ATE', 'LIMA', 'LIMA', 1);
SET @id_empresa_106 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_106, 'MI SONRISA', 'Centro comercial plaza vitarte , Block 2B, Of. 105- Ate Carretera central .', 'ATE', 'LIMA', 'LIMA', NULL, '999231306', 1);
SET @id_sede_106 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_106, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [107] Javier Casas Luyo
--       RUC: 10707886019  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Javier Casas Luyo', 'RUC', '10707886019', 1);
SET @id_cliente_107 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_107, 'Javier Casas Luyo', '10707886019', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_107 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_107, 'Consultorio Odontológico ROLUM', 'Av. Flora Tristán 633 2do piso La Molina', 'LA MOLINA', 'LIMA', 'LIMA', 'MARTA MONTENEGRO', NULL, 1);
SET @id_sede_107 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_107, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [108] VEVET S.A.C.
--       RUC: 20609951525  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VEVET S.A.C.', 'RUC', '20609951525', 1);
SET @id_cliente_108 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_108, 'VEVET S.A.C.', '20609951525', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_108 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_108, 'Proyecto Pet', 'Av. La Fontana 440 Stand   2049 y 2047 - la molina', 'LA MOLINA', 'LIMA', 'LIMA', 'CECILIA CONTEÑA', NULL, 1);
SET @id_sede_108 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_108, '2026-07-03', 'mensual', 50.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [109] Canales Larrea, Angela María
--       RUC: 10403783019  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Canales Larrea, Angela María', 'RUC', '10403783019', 1);
SET @id_cliente_109 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_109, 'Canales Larrea, Angela María', '10403783019', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_109 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_109, 'Carita Feliz consultorio Odontológico Especializado', 'Calle Nicolás Copérnico 104 esquina con Avenida Constructores 1197 - 1199 oficina 301 lote 21 Urbanización Santa Patricia etapa 3 La Molina', 'LA MOLINA', 'LIMA', 'LIMA', NULL, '998844923', 1);
SET @id_sede_109 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_109, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [110] CENTRO MEDICO DENTAL SANTA INES S.A.
--       RUC: 20331894789  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO MEDICO DENTAL SANTA INES S.A.', 'RUC', '20331894789', 1);
SET @id_cliente_110 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_110, 'CENTRO MEDICO DENTAL SANTA INES S.A.', '20331894789', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_110 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_110, 'CENTRO MEDICO Y DENTAL SANTA INES', 'Cal Félix Lope De Vega N 193 2do piso Urbanización Santa Patricia III etapa la MolinA', 'LA MOLINA', 'LIMA', 'LIMA', NULL, '941341142', 1);
SET @id_sede_110 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_110, '2026-07-03', 'mensual', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [111] CENTRO PRE-NATAL VIDA NUEVA
--       RUC: 20429156883  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO PRE-NATAL VIDA NUEVA', 'RUC', '20429156883', 1);
SET @id_cliente_111 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_111, 'CENTRO PRE-NATAL VIDA NUEVA', '20429156883', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_111 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_111, 'Dental Sialer', 'Av La Fontana 440 CC La Rotonda 2 Oficina 2078, La Molina', 'LA MOLINA', 'LIMA', 'LIMA', NULL, '913860321', 1);
SET @id_sede_111 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_111, '2026-07-03', 'mensual', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [112] CORPORACION DENTAL PERUANA SONRISA SEGURA SAC
--       RUC: 20606650346  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION DENTAL PERUANA SONRISA SEGURA SAC', 'RUC', '20606650346', 1);
SET @id_cliente_112 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_112, 'CORPORACION DENTAL PERUANA SONRISA SEGURA SAC', '20606650346', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_112 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_112, 'SONRISA SEGURA LA MOLINA', 'AV. JAVIER PRADO ESTE NRO. 5790 INT. PSO3 URB. LA FONTANA LIMA - LIMA - LA MOLINA', 'LA MOLINA', 'LIMA', 'LIMA', NULL, '950450756', 1);
SET @id_sede_112 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_112, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [113] CENTRO ODONTOLOGICO ESPECIALIZADO BIODENTAMERICA S.A.C
--       RUC: 20609073129  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO ODONTOLOGICO ESPECIALIZADO BIODENTAMERICA S.A.C', 'RUC', '20609073129', 1);
SET @id_cliente_113 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_113, 'CENTRO ODONTOLOGICO ESPECIALIZADO BIODENTAMERICA S.A.C', '20609073129', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_113 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_113, 'CENTRO ODONTOLOGICO ESPECIALIZADO BIODENTAMERICA S.A.C', 'AV. La Molina 1021, Urb. Las Acacias - La Molina', 'LA MOLINA', 'LIMA', 'LIMA', NULL, '999869256', 1);
SET @id_sede_113 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_113, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [114] ZUAZO CORTEZ MILAGRITOS ADRIANA
--       RUC: 10222999869  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ZUAZO CORTEZ MILAGRITOS ADRIANA', 'RUC', '10222999869', 1);
SET @id_cliente_114 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_114, 'ZUAZO CORTEZ MILAGRITOS ADRIANA', '10222999869', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_114 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_114, 'Veterinaria Rastros pet care', 'AV LOS FRESNOS 1859 - LA MOLINA', 'LA MOLINA', 'LIMA', 'LIMA', 'MARIBEL DUQUE', NULL, 1);
SET @id_sede_114 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_114, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [115] WORLD ENTERPRICE PETS & VETS S.A.C.
--       RUC: 20604497559  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('WORLD ENTERPRICE PETS & VETS S.A.C.', 'RUC', '20604497559', 1);
SET @id_cliente_115 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_115, 'WORLD ENTERPRICE PETS & VETS S.A.C.', '20604497559', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_115 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_115, 'MR PET', 'Samoa 328 sol de la molina', 'LA MOLINA', 'LIMA', 'LIMA', 'TATIANA ZUÑIGA', '999006552', 1);
SET @id_sede_115 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_115, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [116] PRETTY PET S.A.C.
--       RUC: 20600475399  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PRETTY PET S.A.C.', 'RUC', '20600475399', 1);
SET @id_cliente_116 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_116, 'PRETTY PET S.A.C.', '20600475399', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_116 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_116, 'PRETTY PET', 'Alameda de los Condores 326, la Molina', 'LA MOLINA', 'LIMA', 'LIMA', 'LILIANA', '912620047', 1);
SET @id_sede_116 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_116, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [117] Corporación HKS EIRL
--       RUC: 20609205947  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Corporación HKS EIRL', 'RUC', '20609205947', 1);
SET @id_cliente_117 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_117, 'Corporación HKS EIRL', '20609205947', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_117 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_117, 'Corporación HKS EIRL', 'calle Samoa 373 Oficina 203A Sol de la molina Tercera etapa La Molina', 'LA MOLINA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_117 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_117, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [118] UCAL S.A.C
--       RUC: 20537886618  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('UCAL S.A.C', 'RUC', '20537886618', 1);
SET @id_cliente_118 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_118, 'UCAL S.A.C', '20537886618', 'LA MOLINA', 'LIMA', 'LIMA', 1);
SET @id_empresa_118 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_118, 'UCAL', 'Av. la Molina N°3755 Urb. sol de la Molina', 'LA MOLINA', 'LIMA', 'LIMA', 'Enf. Sandy Navarro, Karina Reynoso', NULL, 1);
SET @id_sede_118 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_118, '2026-07-03', 'mensual', 30.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [119] Juan Francisco Murrugarra Sánchez
--       RUC: 10415827330  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Juan Francisco Murrugarra Sánchez', 'RUC', '10415827330', 1);
SET @id_cliente_119 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_119, 'Juan Francisco Murrugarra Sánchez', '10415827330', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_119 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_119, 'CONSULTORIO SONRI- SALUD', 'Av. Prolongación Cesar Canevaro 345 "A" Urb. Valle Sarón, San Juan de Miraflores', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 'FRANCISCO', NULL, 1);
SET @id_sede_119 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_119, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [120] CARES MEDICAL GROUP S.A.C.
--       RUC: 20605355324  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CARES MEDICAL GROUP S.A.C.', 'RUC', '20605355324', 1);
SET @id_cliente_120 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_120, 'CARES MEDICAL GROUP S.A.C.', '20605355324', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_120 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_120, 'Cares Medical Group', 'Av. Belisario Suarez 953 San Juan de Miraflores', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 'CESAR DEL VALLE BARDALES', '998590278', 1);
SET @id_sede_120 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_120, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [121] VERA BERROSPI DONNA PRISCILA
--       RUC: 10474665602  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VERA BERROSPI DONNA PRISCILA', 'RUC', '10474665602', 1);
SET @id_cliente_121 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_121, 'VERA BERROSPI DONNA PRISCILA', '10474665602', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_121 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_121, 'veterinaria vera', 'av miguel iglesias mz b lt5 san juan de miraflores', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 'SONIA', NULL, 1);
SET @id_sede_121 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_121, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [122] Pekitas Dent E.I.R.L
--       RUC: 20611773367  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Pekitas Dent E.I.R.L', 'RUC', '20611773367', 1);
SET @id_cliente_122 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_122, 'Pekitas Dent E.I.R.L', '20611773367', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_122 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_122, 'Pekitas Dent', 'AV. BELISARIO SUAREZ 704 SAN JUAN DE MIRAFLORES', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 'EFRAIN', '926788784', 1);
SET @id_sede_122 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_122, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [123] EDUARDO SALAS ZORRILLA
--       RUC: 10421021363  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('EDUARDO SALAS ZORRILLA', 'RUC', '10421021363', 1);
SET @id_cliente_123 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_123, 'EDUARDO SALAS ZORRILLA', '10421021363', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_123 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_123, 'IDENTICAL SAN JUAN DE MIRAFLORES', 'Av. César Canevaro 361, San Juan de Miraflores', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_123 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_123, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [124] ENJOY DENTAL GROUP S.A.C.
--       RUC: 20609564416  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ENJOY DENTAL GROUP S.A.C.', 'RUC', '20609564416', 1);
SET @id_cliente_124 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_124, 'ENJOY DENTAL GROUP S.A.C.', '20609564416', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_124 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_124, 'ENJOY DENTAL GROUP', 'AV.PEDRO JOSE MIOTTA 995 URBANIZACION EL AMUTA SAN JUAN DE MIRAFLORES', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 'DAYSI RABANAL', '954706990', 1);
SET @id_sede_124 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_124, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [125] Ivonne Geraldine Montes Valenzuela
--       RUC: 10481649515  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Ivonne Geraldine Montes Valenzuela', 'RUC', '10481649515', 1);
SET @id_cliente_125 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_125, 'Ivonne Geraldine Montes Valenzuela', '10481649515', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_125 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_125, 'Dentalivo', 'Pasaje José Olaya 220 Urb. San Juanito - SJM', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '941538931', 1);
SET @id_sede_125 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_125, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [126] Oda Rios melgar
--       RUC: 10419707371  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Oda Rios melgar', 'RUC', '10419707371', 1);
SET @id_cliente_126 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_126, 'Oda Rios melgar', '10419707371', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_126 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_126, 'Veterinaria Melgar', 'jirón Felipe Arancibia 851 SAN JUAN DE MIRAFLORES', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '924380019', 1);
SET @id_sede_126 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_126, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [127] CORPORACION PERUANA DE FRANQUICIAS DENTALES
--       RUC: 20606688823  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION PERUANA DE FRANQUICIAS DENTALES', 'RUC', '20606688823', 1);
SET @id_cliente_127 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_127, 'CORPORACION PERUANA DE FRANQUICIAS DENTALES', '20606688823', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_127 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_127, 'SONRISA SEGURA SAN JUAN DE MIRAFLORES', 'AV. BELISARIO SUAREZ NRO. 923 URB. SAN JUAN LIMA - LIMA - SAN JUAN DE MIRAFLORES', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_127 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_127, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [128] FIORELA NUÑEZ ROSAS
--       RUC: 10752476883  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('FIORELA NUÑEZ ROSAS', 'RUC', '10752476883', 1);
SET @id_cliente_128 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_128, 'FIORELA NUÑEZ ROSAS', '10752476883', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_128 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_128, 'Veterinaria Fiovet', 'AV. BELISARIO SUAREZ 1204', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '958487533', 1);
SET @id_sede_128 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_128, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [129] Cristiam Roger Ayma Cusma
--       RUC: 10421409566  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Cristiam Roger Ayma Cusma', 'RUC', '10421409566', 1);
SET @id_cliente_129 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_129, 'Cristiam Roger Ayma Cusma', '10421409566', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_129 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_129, 'Consultorio veterinario Kcholos', 'AV. Miguel Iglesias Mz G lt 2 asociación Ricardo Palma, SAN JUAN DE MIRAFLORES', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '992122457', 1);
SET @id_sede_129 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_129, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [130] ENTRE MOTAS EIRL
--       RUC: 20609377764  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ENTRE MOTAS EIRL', 'RUC', '20609377764', 1);
SET @id_cliente_130 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_130, 'ENTRE MOTAS EIRL', '20609377764', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_130 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_130, 'VETERINARIA ENTRE MOTAS', 'CALLE ARTURO SUAREZ 730 - SAN JUAN DE MIRAFLORES', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '941223447', 1);
SET @id_sede_130 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_130, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [131] VETERINARIA SAN JUDAS TADEO E. I. R. L.
--       RUC: 20612088731  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA SAN JUDAS TADEO E. I. R. L.', 'RUC', '20612088731', 1);
SET @id_cliente_131 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_131, 'VETERINARIA SAN JUDAS TADEO E. I. R. L.', '20612088731', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_131 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_131, 'VETERINARIA SAN JUDAS TADEO', 'AV. DEFENSORES DE LIMA NRO. 1228 URB. SAN JUANITO LIMA - LIMA - SAN JUAN DE MIRAFLORES', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '952041575', 1);
SET @id_sede_131 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_131, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [132] Janeth Garamendi Alarcón
--       RUC: 15506656319  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Janeth Garamendi Alarcón', 'RUC', '15506656319', 1);
SET @id_cliente_132 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_132, 'Janeth Garamendi Alarcón', '15506656319', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_132 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_132, 'Veterinaria GOTITA', 'Av. Canevaro 479 SJM', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '989104994', 1);
SET @id_sede_132 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_132, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [133] ADVANCE SALUD S.A.C.
--       RUC: 20553692246  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ADVANCE SALUD S.A.C.', 'RUC', '20553692246', 1);
SET @id_cliente_133 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_133, 'ADVANCE SALUD S.A.C.', '20553692246', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 1);
SET @id_empresa_133 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_133, 'Beleza Odontologia & Spa', 'Av. Pachacutec 3346 2do piso Distrito de villa María del triunfo', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 'ANA MARIA', '950058324', 1);
SET @id_sede_133 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_133, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [134] SOTO ENCISO ROSA LUCY ANGELICA
--       RUC: 10101197552  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SOTO ENCISO ROSA LUCY ANGELICA', 'RUC', '10101197552', 1);
SET @id_cliente_134 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_134, 'SOTO ENCISO ROSA LUCY ANGELICA', '10101197552', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 1);
SET @id_empresa_134 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_134, 'Consultorio Odontológico Solsalud', 'Av. José Carlos Mariategui #1551 San Gabriel VM', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', NULL, '992309822', 1);
SET @id_sede_134 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_134, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [135] CLINICA VETERINARIA TRINYVET E.I.R.L.
--       RUC: 20605946527  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA TRINYVET E.I.R.L.', 'RUC', '20605946527', 1);
SET @id_cliente_135 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_135, 'CLINICA VETERINARIA TRINYVET E.I.R.L.', '20605946527', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 1);
SET @id_empresa_135 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_135, 'CLINICA VETERINARIA TRINYVET E.I.R.L.', 'Av El Sol 884 Villa María del Triunfo', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', NULL, '921307437', 1);
SET @id_sede_135 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_135, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [136] Miriam Rocio Gamarra López
--       RUC: 10090813434  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Miriam Rocio Gamarra López', 'RUC', '10090813434', 1);
SET @id_cliente_136 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_136, 'Miriam Rocio Gamarra López', '10090813434', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 1);
SET @id_empresa_136 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_136, 'Miriam Rocio Gamarra López', 'Av. 27 de Diciembre 957  Tablada   Villa María del Triunfo', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', NULL, '999941151', 1);
SET @id_sede_136 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_136, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [137] HOSPITAL CLINICO VETERINARIO DEL SUR EMPRESA INDIVIDUAL
--       RUC: 20538599175  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('HOSPITAL CLINICO VETERINARIO DEL SUR EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - HOSPIVETSUR E.', 'RUC', '20538599175', 1);
SET @id_cliente_137 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_137, 'HOSPITAL CLINICO VETERINARIO DEL SUR EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - HOSPIVETSUR E.', '20538599175', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 1);
SET @id_empresa_137 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_137, 'Hospivet Sur', 'Av. Pachacútec 3677 villa María del triunfo', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 'Rocio Chavarry', NULL, 1);
SET @id_sede_137 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_137, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [138] PAREDES NAVARRO PATRICIA
--       RUC: 10106193091  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PAREDES NAVARRO PATRICIA', 'RUC', '10106193091', 1);
SET @id_cliente_138 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_138, 'PAREDES NAVARRO PATRICIA', '10106193091', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 1);
SET @id_empresa_138 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_138, 'Podologia Láser Paredes', 'Av. Villa María #405 VMT', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', NULL, '943560626', 1);
SET @id_sede_138 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_138, '2026-07-03', 'mensual', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [139] SERVICIOS ODONTOLOGICOS INTEGRALES VAMDENT E.I.R.L.
--       RUC: 20549566228  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SERVICIOS ODONTOLOGICOS INTEGRALES VAMDENT E.I.R.L.', 'RUC', '20549566228', 1);
SET @id_cliente_139 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_139, 'SERVICIOS ODONTOLOGICOS INTEGRALES VAMDENT E.I.R.L.', '20549566228', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 1);
SET @id_empresa_139 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_139, 'VANDENT', 'Av 27 de diciembre 681 San Francisco de la tablada de Lurin  Villa María del Triunfo', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', NULL, '923975893', 1);
SET @id_sede_139 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_139, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [140] CORPORACION DE FRANQUICIAS ODONTOLOGICAS SAC
--       RUC: 20613473255  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION DE FRANQUICIAS ODONTOLOGICAS SAC', 'RUC', '20613473255', 1);
SET @id_cliente_140 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_140, 'CORPORACION DE FRANQUICIAS ODONTOLOGICAS SAC', '20613473255', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', 1);
SET @id_empresa_140 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_140, 'SONRISA SEGURA VILLA MARIA DEL TRIUNFO', 'AV. VILLA MARIA NRO. 231 INT. PSO2 SEC. VILLA MARIA LIMA - LIMA - VILLA MARIA DEL TRIUNFO', 'VILLA MARIA DEL TRIUNFO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_140 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_140, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [141] Clínica Veterinaria & Pet Shop SERVICAN EIRL
--       RUC: 20609283174  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica Veterinaria & Pet Shop SERVICAN EIRL', 'RUC', '20609283174', 1);
SET @id_cliente_141 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_141, 'Clínica Veterinaria & Pet Shop SERVICAN EIRL', '20609283174', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_141 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_141, 'Clínica Veterinaria & Pet Shop SERVICAN EIRL', 'Av Central No 308 Urbanización El Brillante Pamplona Alta San Juan de Miraflores', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '951356263', 1);
SET @id_sede_141 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_141, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [142] STUDIO DENTAL 3M S.A.C
--       RUC: 20610815481  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('STUDIO DENTAL 3M S.A.C', 'RUC', '20610815481', 1);
SET @id_cliente_142 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_142, 'STUDIO DENTAL 3M S.A.C', '20610815481', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_142 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_142, 'STUDIO Dental', 'Calle Francisco bolognesi 1818 Mz 167 Lt.13 José Gálvez Sector 2 Gr. 7 Mz. M lote 10 Av revolución 1459 Villa El Salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'LISSET CUARESMA', '955403424', 1);
SET @id_sede_142 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_142, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [143] HONORIO CERNA ELENA ELIZABETH
--       RUC: 10419702094  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('HONORIO CERNA ELENA ELIZABETH', 'RUC', '10419702094', 1);
SET @id_cliente_143 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_143, 'HONORIO CERNA ELENA ELIZABETH', '10419702094', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_143 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_143, 'Honorio Dent', 'sector 1, grupo 20, manzana O, lote 4. Villa el salvador ( referencia: Av. Los angeles entre la ruta b y álamos)', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'ELENA HONORIO', '954784825', 1);
SET @id_sede_143 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_143, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [144] SERVICIOS MEDICOS ODONTOLOGICOS FLORES S.A.C.
--       RUC: 20609057450  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SERVICIOS MEDICOS ODONTOLOGICOS FLORES S.A.C.', 'RUC', '20609057450', 1);
SET @id_cliente_144 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_144, 'SERVICIOS MEDICOS ODONTOLOGICOS FLORES S.A.C.', '20609057450', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_144 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_144, 'Multident', 'Av. Central 1642 Sector 2 Grupo 8', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'FLOR SALINAS', '974365578', 1);
SET @id_sede_144 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_144, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [145] SALUD DENTAL ODONTOLOGIA INTEGRAL
--       RUC: 20602353240  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SALUD DENTAL ODONTOLOGIA INTEGRAL', 'RUC', '20602353240', 1);
SET @id_cliente_145 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_145, 'SALUD DENTAL ODONTOLOGIA INTEGRAL', '20602353240', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_145 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_145, 'SALUD DENTAL', 'AV REVOLUCION 1710 - sector 2 Grupo 14 Mz A LT 14', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'ASISTENTE FIORELLA', '981396981', 1);
SET @id_sede_145 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_145, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [146] CLINICA DE LA SONRISA PERU S.A.C.
--       RUC: 20609243661  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA DE LA SONRISA PERU S.A.C.', 'RUC', '20609243661', 1);
SET @id_cliente_146 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_146, 'CLINICA DE LA SONRISA PERU S.A.C.', '20609243661', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_146 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_146, 'CLINICA DE LA SONRISA', 'Sector 1 Grupo 16 Mz J Lote 15 - Villa el Salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '960206360', 1);
SET @id_sede_146 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_146, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [147] DE LA CRUZ DEUDOR JOSE LUIS
--       RUC: 10408260031  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DE LA CRUZ DEUDOR JOSE LUIS', 'RUC', '10408260031', 1);
SET @id_cliente_147 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_147, 'DE LA CRUZ DEUDOR JOSE LUIS', '10408260031', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_147 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_147, 'WAU VETERINARIA', 'av. revolucion mz b lote 11 sc 2 grpo 12 villa el slavador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'JOSE DE LA CRUZ', '902358144', 1);
SET @id_sede_147 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_147, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [148] CACERES PASTOR RAUL EFRAIN
--       RUC: 10405249290  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CACERES PASTOR RAUL EFRAIN', 'RUC', '10405249290', 1);
SET @id_cliente_148 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_148, 'CACERES PASTOR RAUL EFRAIN', '10405249290', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_148 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_148, 'Clínica Veterinaria Mascovilla', 'sector 2, grupo 3, mz i, lote 21, Villa el Salvador.', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'RAUL CÁCERES', '997336645', 1);
SET @id_sede_148 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_148, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [149] RYM SERVICIOS DE ESPECIALIDAD S.A.C.
--       RUC: 20613514229  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RYM SERVICIOS DE ESPECIALIDAD S.A.C.', 'RUC', '20613514229', 1);
SET @id_cliente_149 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_149, 'RYM SERVICIOS DE ESPECIALIDAD S.A.C.', '20613514229', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_149 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_149, 'CLINICA DENTAL RYM', 'Micaela bastidas mz f lote 21 segundo piso departamento 2-Villa el salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '967818556', 1);
SET @id_sede_149 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_149, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [150] Jesús kiyoshi haramura glave
--       RUC: 10468277307  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Jesús kiyoshi haramura glave', 'RUC', '10468277307', 1);
SET @id_cliente_150 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_150, 'Jesús kiyoshi haramura glave', '10468277307', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_150 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_150, 'armonident', 'Av revolución sector 2 grupo 14 mz B lt 10 Villa el salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '993318305', 1);
SET @id_sede_150 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_150, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [151] GRUPO SONRIE PERU SAC
--       RUC: 20601286158  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO SONRIE PERU SAC', 'RUC', '20601286158', 1);
SET @id_cliente_151 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_151, 'GRUPO SONRIE PERU SAC', '20601286158', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_151 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_151, 'SONRISA SEGURA VES', 'MZA. F LOTE. 14 GRU. 8 SECTOR 2 (SEGUNDO PISO) LIMA - LIMA - VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '941133616', 1);
SET @id_sede_151 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_151, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [152] Medical center G.A SAC
--       RUC: 20614657678  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Medical center G.A SAC', 'RUC', '20614657678', 1);
SET @id_cliente_152 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_152, 'Medical center G.A SAC', '20614657678', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_152 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_152, 'Medical center G.A SAC', 'av. central 555, sector 1 manzana M, lote23,grupo 3 Al frente de la iglesia de los mormones. (Veterinaria Cevet) Villa el Salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '913696049', 1);
SET @id_sede_152 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_152, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [153] GRACE JESY ALARCON GUTIERREZ
--       RUC: 10488439281  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRACE JESY ALARCON GUTIERREZ', 'RUC', '10488439281', 1);
SET @id_cliente_153 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_153, 'GRACE JESY ALARCON GUTIERREZ', '10488439281', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_153 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_153, 'ODONTOMAGIC', 'coop. América Mz:y Lt11 segundo piso. San Juan de Miraflores', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '964310716', 1);
SET @id_sede_153 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_153, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [154] jessica landa andia
--       RUC: 10106468589  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('jessica landa andia', 'RUC', '10106468589', 1);
SET @id_cliente_154 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_154, 'jessica landa andia', '10106468589', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_154 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_154, 'Mr. Guau', 'Av los alamos mz c lt 4 sjm', 'SAN JUAN DE MIRAFLORES', 'LIMA', 'LIMA', NULL, '976154491', 1);
SET @id_sede_154 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_154, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [155] QUISPE VALLE EDUARDO JOSUE
--       RUC: 10429863606  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('QUISPE VALLE EDUARDO JOSUE', 'RUC', '10429863606', 1);
SET @id_cliente_155 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_155, 'QUISPE VALLE EDUARDO JOSUE', '10429863606', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_155 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_155, 'ODONTONOVA', 'Sector 2 grupo 12 mz B lt 13', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'EDUARDO', '925831774', 1);
SET @id_sede_155 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_155, '2026-07-03', 'mensual', 50.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [156] RT MEDIC EIRL
--       RUC: 20612211044  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RT MEDIC EIRL', 'RUC', '20612211044', 1);
SET @id_cliente_156 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_156, 'RT MEDIC EIRL', '20612211044', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_156 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_156, 'VETERINARIA LOPCAN', 'SECTOR 3 GRUPO 28 MZ P LT 6 VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '992353426', 1);
SET @id_sede_156 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_156, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [157] CENTRO VETERINARIO OASIS DE LIMA SUR S.A.C.
--       RUC: 20610844929  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO VETERINARIO OASIS DE LIMA SUR S.A.C.', 'RUC', '20610844929', 1);
SET @id_cliente_157 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_157, 'CENTRO VETERINARIO OASIS DE LIMA SUR S.A.C.', '20610844929', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_157 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_157, 'Hospital veterinario oasis', 'sector 9 grupo 4 manzana E lote 15 Av María Elena Moyano- villa el salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_157 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_157, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [158] ESCORZA VILLEGAS BLANCA JAKELINE
--       RUC: 10476115375  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ESCORZA VILLEGAS BLANCA JAKELINE', 'RUC', '10476115375', 1);
SET @id_cliente_158 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_158, 'ESCORZA VILLEGAS BLANCA JAKELINE', '10476115375', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_158 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_158, 'FAMONT', 'Sector 3, grupo 16, Mercado Atahualpa tienda #15 - segundo piso. Ref.: Av Revolución.', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'BLANCA ESCORZA', '994556827', 1);
SET @id_sede_158 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_158, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [159] COLQUI INGA CAROLINA
--       RUC: 10211361650  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('COLQUI INGA CAROLINA', 'RUC', '10211361650', 1);
SET @id_cliente_159 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_159, 'COLQUI INGA CAROLINA', '10211361650', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_159 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_159, 'Consultorio Dental Belen', 'Av. Revolución cuadra 16 sector 2 grupo 13 Mz E Lte. 5  Villa el Salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'CAROLINA', NULL, 1);
SET @id_sede_159 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_159, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [160] VARGAS SOR SERVICIOS INTEGRALES S. CIVIL DE R.L
--       RUC: 20556829170  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VARGAS SOR SERVICIOS INTEGRALES S. CIVIL DE R.L', 'RUC', '20556829170', 1);
SET @id_cliente_160 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_160, 'VARGAS SOR SERVICIOS INTEGRALES S. CIVIL DE R.L', '20556829170', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_160 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_160, 'Family Dentist', 'panamericana Sur MZ 29.9 sub lote A1 , segundo piso local L219, distrito de villa el salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'MELISSA', '952857546', 1);
SET @id_sede_160 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_160, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [161] ESPINOZA GARCIA MILTON
--       RUC: 10229966931  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ESPINOZA GARCIA MILTON', 'RUC', '10229966931', 1);
SET @id_cliente_161 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_161, 'ESPINOZA GARCIA MILTON', '10229966931', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_161 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_161, 'POSTA VETERINARIA SAN FRANCISCO DE ASIS', 'ST.9 GP.4 MZ F LOTE 10 OASIS DE VILLA-VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'MILTON', '943977478', 1);
SET @id_sede_161 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_161, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [162] CORPORACIÓN AMBAR E.I.R.L
--       RUC: 20608487213  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACIÓN AMBAR E.I.R.L', 'RUC', '20608487213', 1);
SET @id_cliente_162 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_162, 'CORPORACIÓN AMBAR E.I.R.L', '20608487213', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_162 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_162, 'Clínica veterinaria Ámbar', 'Av. Cesar Vallejos Sector 3 grupo 25 mz 0 lote 1', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '992429961', 1);
SET @id_sede_162 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_162, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [163] ROMERO MORALES ROCIO AURORA
--       RUC: 10417772559  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ROMERO MORALES ROCIO AURORA', 'RUC', '10417772559', 1);
SET @id_cliente_163 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_163, 'ROMERO MORALES ROCIO AURORA', '10417772559', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_163 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_163, 'Dental khalident', 'sector 6 prupo 11 mz a lote 12 villa el salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'DR. ROBERT IBARRA COSTAS', '967704328', 1);
SET @id_sede_163 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_163, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [164] mendoza gonzales Diana Katterine
--       RUC: 10419266286  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('mendoza gonzales Diana Katterine', 'RUC', '10419266286', 1);
SET @id_cliente_164 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_164, 'mendoza gonzales Diana Katterine', '10419266286', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_164 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_164, 'pet Shop mascotitas', 'sector 2 grupo 10 MZ N lote 13 villa el salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'DIANA MENDOZA', '934444649', 1);
SET @id_sede_164 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_164, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [165] CENTRO MEDICO VETERINARIO & REHABILITACION REHAVET S.A.
--       RUC: 20607942871  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO MEDICO VETERINARIO & REHABILITACION REHAVET S.A.C.', 'RUC', '20607942871', 1);
SET @id_cliente_165 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_165, 'CENTRO MEDICO VETERINARIO & REHABILITACION REHAVET S.A.C.', '20607942871', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_165 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_165, 'REHAVET', 'AV JOSE CARLOS  MARIATEGUI SECTOR 3 GRUPO 29 mz B lt 3 AAHH chavin de  huantar', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 'Mónica valdeiglesias', '902415097', 1);
SET @id_sede_165 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_165, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [166] Katherine Sanchez Valdez
--       RUC: 10456262754  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Katherine Sanchez Valdez', 'RUC', '10456262754', 1);
SET @id_cliente_166 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_166, 'Katherine Sanchez Valdez', '10456262754', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_166 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_166, 'DX VETERINARY', 'Av. Revolución Mz J Lote 32 2da etapa Urbanización Pachacamac-villa el salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', '900 126 063', NULL, 1);
SET @id_sede_166 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_166, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [167] C & F ODONTOLOGIA INTEGRAL S.A.C.
--       RUC: 20612208825  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('C & F ODONTOLOGIA INTEGRAL S.A.C.', 'RUC', '20612208825', 1);
SET @id_cliente_167 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_167, 'C & F ODONTOLOGIA INTEGRAL S.A.C.', '20612208825', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_167 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_167, 'C & F ODONTOLOGIA INTEGRAL S.A.C.', 'AA.HH Oasis de Villa Sector 10, Grupo 01 – Mz. “N” Lote 07, 2do Piso – Distrito de Villa el Salvador', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_167 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_167, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [168] MOREANO VEGA BRENDA LUCERO
--       RUC: 10479890205  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MOREANO VEGA BRENDA LUCERO', 'RUC', '10479890205', 1);
SET @id_cliente_168 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_168, 'MOREANO VEGA BRENDA LUCERO', '10479890205', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', 1);
SET @id_empresa_168 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_168, 'CONSULTORIO DENTAL VILLA SMILE', 'Sector 3, grupo 28, Mz. N, lote 5-VILLA EL SALVADOR', 'VILLA EL SALVADOR', 'LIMA', 'LIMA', NULL, '994648190', 1);
SET @id_sede_168 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_168, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [169] Ursula Lidia Pérez Benito
--       RUC: 10106357477  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Ursula Lidia Pérez Benito', 'RUC', '10106357477', 1);
SET @id_cliente_169 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_169, 'Ursula Lidia Pérez Benito', '10106357477', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_169 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_169, 'CONSULTORIO ODONTOLOGICO', 'Av. paseo de la República prolongación Mz. B-01 LT 19 Urbanización Paseo de la República chorrillos', 'CHORRILLOS', 'LIMA', 'LIMA', 'URSULA PEREZ', '989941569', 1);
SET @id_sede_169 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_169, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [170] Milagros Mitma Ramírez
--       RUC: 10700511494  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Milagros Mitma Ramírez', 'RUC', '10700511494', 1);
SET @id_cliente_170 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_170, 'Milagros Mitma Ramírez', '10700511494', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_170 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_170, 'Consultorio Odontologico AnMident', 'Av. Los Faisanes 358 Dpto 805 Torre A - Chorrillos', 'CHORRILLOS', 'LIMA', 'LIMA', 'Angeles ataupillco/ recp-MILAGROS MITMA', '985133068', 1);
SET @id_sede_170 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_170, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [171] GUIDENT EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA
--       RUC: 20557299212  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GUIDENT EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA', 'RUC', '20557299212', 1);
SET @id_cliente_171 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_171, 'GUIDENT EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA', '20557299212', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_171 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_171, 'GUIDENT', 'urbanización Santa Rosa Quinta etapa calle 01 mz A Lt 29 chorrilllos', 'CHORRILLOS', 'LIMA', 'LIMA', 'PAMELA GOMEZ', '987951124', 1);
SET @id_sede_171 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_171, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [172] RAMOS GUERRERO LIZETH ARACELY
--       RUC: 10727044774  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RAMOS GUERRERO LIZETH ARACELY', 'RUC', '10727044774', 1);
SET @id_cliente_172 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_172, 'RAMOS GUERRERO LIZETH ARACELY', '10727044774', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_172 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_172, 'Consultorio DentalPRO', 'Av. Defensores del Morro #503 oficina 203 (segundo piso) Chorrillos', 'CHORRILLOS', 'LIMA', 'LIMA', NULL, '953853952', 1);
SET @id_sede_172 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_172, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [173] J & R DENTAL E.I.R.L
--       RUC: 20608460722  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('J & R DENTAL E.I.R.L', 'RUC', '20608460722', 1);
SET @id_cliente_173 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_173, 'J & R DENTAL E.I.R.L', '20608460722', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_173 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_173, 'J & R DENTAL', 'Jr. Los Pumas 143 . Urb. Paseo de la República / chorrillos', 'CHORRILLOS', 'LIMA', 'LIMA', 'Rodrigo  Chavarria Manrique', '969703708', 1);
SET @id_sede_173 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_173, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [174] CRISOSTOMO RODRIGUEZ JENNIFER VANESSA
--       RUC: 10441370381  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CRISOSTOMO RODRIGUEZ JENNIFER VANESSA', 'RUC', '10441370381', 1);
SET @id_cliente_174 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_174, 'CRISOSTOMO RODRIGUEZ JENNIFER VANESSA', '10441370381', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_174 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_174, 'VETERINARIA MEDSCOTAS', 'JR. CARLOS GIL 168, a 50 metros de la cuadra 7 de la avenida ex Huaylas. - CHORRILLOS', 'CHORRILLOS', 'LIMA', 'LIMA', 'VANESSA CRISOSTOMO', '952211742', 1);
SET @id_sede_174 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_174, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [175] VILLA PET''S E.I.R.L.
--       RUC: 20601928877  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VILLA PET''S E.I.R.L.', 'RUC', '20601928877', 1);
SET @id_cliente_175 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_175, 'VILLA PET''S E.I.R.L.', '20601928877', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_175 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_175, 'Pets on Board', 'Alameda Los Horizontes 1001- Chorrillos', 'CHORRILLOS', 'LIMA', 'LIMA', 'ANNA LOPEZ', '970340330', 1);
SET @id_sede_175 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_175, '2026-07-03', 'mensual', 118.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [176] Augusto Donayre Casas
--       RUC: 10705486048  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Augusto Donayre Casas', 'RUC', '10705486048', 1);
SET @id_cliente_176 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_176, 'Augusto Donayre Casas', '10705486048', 'CHORRILLOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_176 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_176, 'clínica veterinaria RENVET', 'Avenida cordillera vilcanota mz. f15. Sublote 6c, delicias de villa,', 'CHORRILLOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_176 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_176, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [177] servicios veterinarios Gallardo SAC
--       RUC: 20602356532  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('servicios veterinarios Gallardo SAC', 'RUC', '20602356532', 1);
SET @id_cliente_177 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_177, 'servicios veterinarios Gallardo SAC', '20602356532', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_177 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_177, 'veterinaria Vet''s & Pet''s', 'jr Rosendo Vidaurre 401 Barranco', 'BARRANCO', 'LIMA', 'LIMA', 'CHRISTINA GALLARDO', '972765768', 1);
SET @id_sede_177 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_177, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [178] GUTIERREZ DEL VALLE CLAUDIA ISABEL
--       RUC: 10107106869  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GUTIERREZ DEL VALLE CLAUDIA ISABEL', 'RUC', '10107106869', 1);
SET @id_cliente_178 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_178, 'GUTIERREZ DEL VALLE CLAUDIA ISABEL', '10107106869', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_178 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_178, 'VETERINARIA LA ESTACION', 'Av. Bolognesi 725 -  BARRANCO', 'BARRANCO', 'LIMA', 'LIMA', 'KATHERINE 994274959 / 2429320', NULL, 1);
SET @id_sede_178 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_178, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [179] Feel  Vet SAC
--       RUC: 20612328456  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Feel  Vet SAC', 'RUC', '20612328456', 1);
SET @id_cliente_179 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_179, 'Feel  Vet SAC', '20612328456', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_179 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_179, 'Feel Vet', 'jr medrano silva 198 barranco', 'BARRANCO', 'LIMA', 'LIMA', 'karla pulgar', '982512332', 1);
SET @id_sede_179 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_179, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [180] Centro de terapia física y rehabilitación AVS SAC
--       RUC: 20612275409  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Centro de terapia física y rehabilitación AVS SAC', 'RUC', '20612275409', 1);
SET @id_cliente_180 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_180, 'Centro de terapia física y rehabilitación AVS SAC', '20612275409', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_180 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_180, 'Arhtromed', 'Av. Francisco Bolognesi 563', 'BARRANCO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_180 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_180, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [181] VETERINARIA VENTURA E.I.R.L.
--       RUC: 20602267599  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA VENTURA E.I.R.L.', 'RUC', '20602267599', 1);
SET @id_cliente_181 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_181, 'VETERINARIA VENTURA E.I.R.L.', '20602267599', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_181 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_181, 'Veterinaria Ventura', 'Parque Raimondi 199 - BARRANCO', 'BARRANCO', 'LIMA', 'LIMA', 'PAULO  ESPINOZA', NULL, 1);
SET @id_sede_181 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_181, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [182] PETS FARMA VETERINARIA EIRL
--       RUC: 20602556736  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PETS FARMA VETERINARIA EIRL', 'RUC', '20602556736', 1);
SET @id_cliente_182 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_182, 'PETS FARMA VETERINARIA EIRL', '20602556736', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_182 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_182, 'PETS FARMA VETERINARIA EIRL', 'MEDRANO SILVA 370', 'BARRANCO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_182 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_182, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [183] MAILLET VET EIRL
--       RUC: 20613318233  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MAILLET VET EIRL', 'RUC', '20613318233', 1);
SET @id_cliente_183 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_183, 'MAILLET VET EIRL', '20613318233', 'BARRANCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_183 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_183, 'MAILLET VET', 'Calle Luna Pizarro 104 Barranco', 'BARRANCO', 'LIMA', 'LIMA', NULL, '922360196', 1);
SET @id_sede_183 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_183, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [184] CONSULTORIA RADIOLOGICA S.A.C.
--       RUC: 20607382795  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CONSULTORIA RADIOLOGICA S.A.C.', 'RUC', '20607382795', 1);
SET @id_cliente_184 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_184, 'CONSULTORIA RADIOLOGICA S.A.C.', '20607382795', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_184 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_184, 'IDX - IMÁGENES Y DIAGNÓSTICO ORAL Y MAXILOFACIAL', 'AV. RICARDO PALMA 341 INT. 406 MIRAFLORES - LIMA (EDIFICIO PLATINO)', 'MIRAFLORES', 'LIMA', 'LIMA', 'VANIA GOMEZ', '989083862', 1);
SET @id_sede_184 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_184, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [185] ALLQUSERVICIOS S.A.C.
--       RUC: 20608628666  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ALLQUSERVICIOS S.A.C.', 'RUC', '20608628666', 1);
SET @id_cliente_185 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_185, 'ALLQUSERVICIOS S.A.C.', '20608628666', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_185 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_185, 'CLINICA VETERINARIA WALAC', 'CALLE CARLOS AUGUSTO SALAVERRY NRO. 157', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, '989941164', 1);
SET @id_sede_185 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_185, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [186] ODONTOCRED E.I.R.L
--       RUC: 20545995795  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ODONTOCRED E.I.R.L', 'RUC', '20545995795', 1);
SET @id_cliente_186 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_186, 'ODONTOCRED E.I.R.L', '20545995795', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_186 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_186, 'ODONTOCRED', 'Av. Petit Thouars 4350 Of. 302 Miraflores', 'MIRAFLORES', 'LIMA', 'LIMA', 'JESSICA PELÁEZ', '975520545', 1);
SET @id_sede_186 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_186, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [187] NATURAL PETS SERVICIOS VETERINARIOS S.A.C.
--       RUC: 20606847093  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('NATURAL PETS SERVICIOS VETERINARIOS S.A.C.', 'RUC', '20606847093', 1);
SET @id_cliente_187 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_187, 'NATURAL PETS SERVICIOS VETERINARIOS S.A.C.', '20606847093', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_187 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_187, 'NATURAL PETS', 'Avenida reducto 916 Miraflores', 'MIRAFLORES', 'LIMA', 'LIMA', 'Dra Ximena Cartolin', '924874683', 1);
SET @id_sede_187 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_187, '2026-07-03', 'mensual', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [188] LOURDES KARINA PAREDES CAIHUACAS
--       RUC: 10408752162  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LOURDES KARINA PAREDES CAIHUACAS', 'RUC', '10408752162', 1);
SET @id_cliente_188 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_188, 'LOURDES KARINA PAREDES CAIHUACAS', '10408752162', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_188 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_188, 'CONSULTORIO ODONTOLÓGICO PADRE PIO', 'AV. ALFREDO BENAVIDES 1238, OFICINA 201, MIRAFLORES', 'MIRAFLORES', 'LIMA', 'LIMA', 'lourdes paredes', NULL, 1);
SET @id_sede_188 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_188, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [189] PET INDUSTRY SAC
--       RUC: 20609956659  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PET INDUSTRY SAC', 'RUC', '20609956659', 1);
SET @id_cliente_189 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_189, 'PET INDUSTRY SAC', '20609956659', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_189 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_189, 'PASARELA', 'AV ALFREDO BENAVIDES 2193 MIRAFLORES', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_189 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_189, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [190] Karen Ilse Ploog Cortes
--       RUC: 10409273586  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Karen Ilse Ploog Cortes', 'RUC', '10409273586', 1);
SET @id_cliente_190 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_190, 'Karen Ilse Ploog Cortes', '10409273586', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_190 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_190, 'Karen Ilse Ploog Cortes', 'Calle Martir Jose Olaya 129 of.406-Miraflores', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, '933442577', 1);
SET @id_sede_190 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_190, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [191] JC REHAB EIRL
--       RUC: 20603575718  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JC REHAB EIRL', 'RUC', '20603575718', 1);
SET @id_cliente_191 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_191, 'JC REHAB EIRL', '20603575718', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_191 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_191, 'CUBAMEDIC PERÚ', 'Av. LARCO 812, Interior 501, Miraflores', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, '938138186994306675', 1);
SET @id_sede_191 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_191, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [192] CLINICA DENTAL SMILE PERFECTION
--       RUC: 20604380007  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA DENTAL SMILE PERFECTION', 'RUC', '20604380007', 1);
SET @id_cliente_192 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_192, 'CLINICA DENTAL SMILE PERFECTION', '20604380007', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_192 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_192, 'CLINICA DENTAL SMILE PERFECTION', 'Av. Coronel Inclán 235 Miraflores piso 3 consultorio 307', 'MIRAFLORES', 'LIMA', 'LIMA', 'LIZETH GUILLEN - RECEP', '951570212', 1);
SET @id_sede_192 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_192, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [193] Dental specialists SAC
--       RUC: 20548900361  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Dental specialists SAC', 'RUC', '20548900361', 1);
SET @id_cliente_193 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_193, 'Dental specialists SAC', '20548900361', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_193 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_193, 'Advanced dental', 'calle bolivar 270 of 103 Miraflores', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_193 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_193, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [194] VERAMENDI MEDIC SACS
--       RUC: 20613628101  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VERAMENDI MEDIC SACS', 'RUC', '20613628101', 1);
SET @id_cliente_194 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_194, 'VERAMENDI MEDIC SACS', '20613628101', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_194 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_194, 'KRISTHA ODONTOLOGÍA', 'calle Schell 343 oficina 202 Miraflores', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, '978714080', 1);
SET @id_sede_194 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_194, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [195] CENTRO ODONTOLOGICO ESPECIALIZADO VMT S.A.C.
--       RUC: 20601969646  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO ODONTOLOGICO ESPECIALIZADO VMT S.A.C.', 'RUC', '20601969646', 1);
SET @id_cliente_195 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_195, 'CENTRO ODONTOLOGICO ESPECIALIZADO VMT S.A.C.', '20601969646', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_195 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_195, 'CENTRO ODONTOLOGICO ESPECIALIZADO VMT S.A.C.', 'CA. GENERAL RECAVARREN 131 DPTO. 204', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_195 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_195, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [196] CENTRO DE DIAGNOSTICO 3D SAC
--       RUC: 20610058648  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO DE DIAGNOSTICO 3D SAC', 'RUC', '20610058648', 1);
SET @id_cliente_196 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_196, 'CENTRO DE DIAGNOSTICO 3D SAC', '20610058648', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_196 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_196, 'SONRISA 3D', 'CALLE BOLOGNESI 229 MIRAFLORES 5TO PISO', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_196 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_196, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [197] COAC MIRAFLORES E.I.R.L
--       RUC: 20614823021  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('COAC MIRAFLORES E.I.R.L', 'RUC', '20614823021', 1);
SET @id_cliente_197 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_197, 'COAC MIRAFLORES E.I.R.L', '20614823021', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_197 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_197, 'ANDREA CONTRERAS', 'CALLE PORTA 130 PISO 3 OFICINA 303, MIRAFLORES', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, '933201207', 1);
SET @id_sede_197 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_197, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [198] Odontología especializada Smile Plus E.I.R.L
--       RUC: 20607074802  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Odontología especializada Smile Plus E.I.R.L', 'RUC', '20607074802', 1);
SET @id_cliente_198 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_198, 'Odontología especializada Smile Plus E.I.R.L', '20607074802', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_198 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_198, 'Smileplus', 'Calle Aricota 106 of 1003 Santiago de Surco', 'SURCO', 'LIMA', 'LIMA', 'LUCERO PAREDES', '937118403', 1);
SET @id_sede_198 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_198, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [199] VET SAN PATRICIO SAC
--       RUC: 20613529897  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VET SAN PATRICIO SAC', 'RUC', '20613529897', 1);
SET @id_cliente_199 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_199, 'VET SAN PATRICIO SAC', '20613529897', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_199 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_199, 'VETERINARIA SAN PATRICIO', 'JR. DOÑA CATALINA 497 URB. LOS ROSALES – SANTIAGO DE SURCO', 'SURCO', 'LIMA', 'LIMA', NULL, '949781693', 1);
SET @id_sede_199 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_199, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [200] MULTISERVICIOS  DE SALUD CHR S.A.C
--       RUC: 20546143733  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MULTISERVICIOS  DE SALUD CHR S.A.C', 'RUC', '20546143733', 1);
SET @id_cliente_200 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_200, 'MULTISERVICIOS  DE SALUD CHR S.A.C', '20546143733', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_200 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_200, 'RENOVA SMILES SURCO', 'LOS LAURELES 104 OFICINA 302 SURCO EDIFICIO  LUMIERE', 'SURCO', 'LIMA', 'LIMA', '912868671', NULL, 1);
SET @id_sede_200 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_200, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [201] RAMIREZ LEGONIA SILVIA JESUS
--       RUC: 10100074236  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RAMIREZ LEGONIA SILVIA JESUS', 'RUC', '10100074236', 1);
SET @id_cliente_201 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_201, 'RAMIREZ LEGONIA SILVIA JESUS', '10100074236', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_201 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_201, 'Veterinaria Villa Ramirez', 'Calle Augusto Wiese 766 vista alegre surco', 'SURCO', 'LIMA', 'LIMA', 'SILVIA RAMIREZ', '983574102', 1);
SET @id_sede_201 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_201, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [202] GRUPO SALVAS PERU S.A.C
--       RUC: 20609182815  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO SALVAS PERU S.A.C', 'RUC', '20609182815', 1);
SET @id_cliente_202 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_202, 'GRUPO SALVAS PERU S.A.C', '20609182815', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_202 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_202, 'NANVAS ODONTOSTETIC', 'CALLE MONTERROSA 284 , PISO 5 - OFICINA 504', 'SURCO', 'LIMA', 'LIMA', 'MARIA ACOSTA', '944234410', 1);
SET @id_sede_202 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_202, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [203] LIDER DENT INVERSIONES MEDICAS SAC
--       RUC: 20603720670  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LIDER DENT INVERSIONES MEDICAS SAC', 'RUC', '20603720670', 1);
SET @id_cliente_203 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_203, 'LIDER DENT INVERSIONES MEDICAS SAC', '20603720670', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_203 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_203, 'LIDER DENT', 'AV. LA ENCALADA 746 OFICINA 204-SURCO', 'SURCO', 'LIMA', 'LIMA', NULL, '902934211', 1);
SET @id_sede_203 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_203, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [204] Odonto Shine  B&E
--       RUC: 20604055327  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Odonto Shine  B&E', 'RUC', '20604055327', 1);
SET @id_cliente_204 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_204, 'Odonto Shine  B&E', '20604055327', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_204 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_204, 'Odonto Shine', 'calle Boulevard 162 oficina 1203-surco', 'SURCO', 'LIMA', 'LIMA', NULL, '963683585', 1);
SET @id_sede_204 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_204, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [205] Omar Antonio Cedeño Zegarra
--       RUC: 10407027235  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Omar Antonio Cedeño Zegarra', 'RUC', '10407027235', 1);
SET @id_cliente_205 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_205, 'Omar Antonio Cedeño Zegarra', '10407027235', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_205 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_205, 'PetShop el trigal 1', 'Av Velasco Astete 2078 centro comercial el trigal , surco', 'SURCO', 'LIMA', 'LIMA', '997 886 056 - SE PROGRAMÓ', NULL, 1);
SET @id_sede_205 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_205, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [206] Centro Odontológico Fritz EIRL
--       RUC: 20507230033  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Centro Odontológico Fritz EIRL', 'RUC', '20507230033', 1);
SET @id_cliente_206 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_206, 'Centro Odontológico Fritz EIRL', '20507230033', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_206 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_206, 'Centro Odontológico Fritz', 'jirón los lanceros 196 letra B surco', 'SURCO', 'LIMA', 'LIMA', NULL, '966735153', 1);
SET @id_sede_206 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_206, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [207] LEOPOLDO MENESES ENTERPRISES E.I.R.L.
--       RUC: 20607524760  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LEOPOLDO MENESES ENTERPRISES E.I.R.L.', 'RUC', '20607524760', 1);
SET @id_cliente_207 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_207, 'LEOPOLDO MENESES ENTERPRISES E.I.R.L.', '20607524760', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_207 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_207, 'BMF BY LEOPOLDO MENESES', 'Jirón Cruz del Sur #140, oficina 707, Edificio Time, Santiago de Surco', 'SURCO', 'LIMA', 'LIMA', NULL, '940111363', 1);
SET @id_sede_207 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_207, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [208] CORPORACION SONRISA SEGURA SAC
--       RUC: 20603143788  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION SONRISA SEGURA SAC', 'RUC', '20603143788', 1);
SET @id_cliente_208 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_208, 'CORPORACION SONRISA SEGURA SAC', '20603143788', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_208 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_208, 'SONRISA SEGURA SURCO', 'JR. MONTE ROSA NRO. 233 INT. 708 URB. CHACARILLA DEL ESTANQUE LIMA - LIMA - SANTIAGO DE SURCO', 'SURCO', 'LIMA', 'LIMA', NULL, '954777858', 1);
SET @id_sede_208 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_208, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [209] SERVICIOS VETERINARIOS INGE S.A.C.
--       RUC: 20473466148  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SERVICIOS VETERINARIOS INGE S.A.C.', 'RUC', '20473466148', 1);
SET @id_cliente_209 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_209, 'SERVICIOS VETERINARIOS INGE S.A.C.', '20473466148', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_209 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_209, 'CLINICA VETERINARIA RONDON', 'PEDRO VENTURO 104 URB. HIGUERETA   SANTIAGO DE SURCO', 'SURCO', 'LIMA', 'LIMA', 'ZULMA GUILLEN', '981042649', 1);
SET @id_sede_209 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_209, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [210] CABRERA & GALLESI SAC
--       RUC: 20610280791  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CABRERA & GALLESI SAC', 'RUC', '20610280791', 1);
SET @id_cliente_210 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_210, 'CABRERA & GALLESI SAC', '20610280791', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_210 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_210, 'Dental Cabrera', 'AV.AREQUIPA 4026 MIRAFLORES', 'MIRAFLORES', 'LIMA', 'LIMA', 'LUZ', '983469689', 1);
SET @id_sede_210 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_210, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [211] M & E TRAUMATOLOGIA S.A.C.
--       RUC: 20611155639  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('M & E TRAUMATOLOGIA S.A.C.', 'RUC', '20611155639', 1);
SET @id_cliente_211 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_211, 'M & E TRAUMATOLOGIA S.A.C.', '20611155639', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_211 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_211, 'M&E TRAUMATÓLOGIA', 'JR. VISTA ALEGRE MZ A31  LT 20  URBANO SAGITARIO - SURCO', 'SURCO', 'LIMA', 'LIMA', 'JAZMIN ORBEGOZO', NULL, 1);
SET @id_sede_211 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_211, '2026-07-03', 'mensual', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [212] VETERINARIA BLASVET SURCO E.I.R.L.
--       RUC: 20609943158  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA BLASVET SURCO E.I.R.L.', 'RUC', '20609943158', 1);
SET @id_cliente_212 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_212, 'VETERINARIA BLASVET SURCO E.I.R.L.', '20609943158', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_212 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_212, 'BLAS VET', 'AV. AVIACION NRO. 4874 URB. RESID. HIGUERETA LIMA', 'SURCO', 'LIMA', 'LIMA', 'KEYLA', NULL, 1);
SET @id_sede_212 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_212, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [213] CLINICA VETERINARIA GONZALEZ S.A.C.
--       RUC: 20553542431  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA GONZALEZ S.A.C.', 'RUC', '20553542431', 1);
SET @id_cliente_213 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_213, 'CLINICA VETERINARIA GONZALEZ S.A.C.', '20553542431', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_213 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_213, 'línica veterinaria Gonzalez', 'av Mateo pumacahua mz l1 lote 8a surco', 'SURCO', 'LIMA', 'LIMA', 'LILIANA VALDEIGLESIAS', '992761752', 1);
SET @id_sede_213 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_213, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [214] DR. JOSE LUIS VET S.A.C.
--       RUC: 20609067137  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DR. JOSE LUIS VET S.A.C.', 'RUC', '20609067137', 1);
SET @id_cliente_214 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_214, 'DR. JOSE LUIS VET S.A.C.', '20609067137', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_214 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_214, 'Veterinaria DR JOSÉ LUIS VET', 'Asociación banco de semillas mz D lt 11', 'SURCO', 'LIMA', 'LIMA', '10AM A 5 PM', '998245986', 1);
SET @id_sede_214 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_214, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [215] ENDODONCIARTE EIRL
--       RUC: 20614306131  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ENDODONCIARTE EIRL', 'RUC', '20614306131', 1);
SET @id_cliente_215 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_215, 'ENDODONCIARTE EIRL', '20614306131', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_215 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_215, 'ENDODONCIARTE', 'Elias Aguirre 126 of 702 Miraflores', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, '991564459', 1);
SET @id_sede_215 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_215, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [216] DE ABREU BECERRA DIANA CLARA
--       RUC: 15603657109  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DE ABREU BECERRA DIANA CLARA', 'RUC', '15603657109', 1);
SET @id_cliente_216 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_216, 'DE ABREU BECERRA DIANA CLARA', '15603657109', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_216 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_216, 'The Pet King', 'Jirón camino real 379, Santiago de surco', 'SURCO', 'LIMA', 'LIMA', 'JUAN JESUS BRAVO', '937299130', 1);
SET @id_sede_216 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_216, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [217] CEMIVET SAC
--       RUC: 20612314510  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CEMIVET SAC', 'RUC', '20612314510', 1);
SET @id_cliente_217 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_217, 'CEMIVET SAC', '20612314510', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_217 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_217, 'CEMIVET SAC', 'Jirón Viña Lariena Mz O lote 6, Urb. Los parrales de Surco. Surco', 'SURCO', 'LIMA', 'LIMA', NULL, '997892111', 1);
SET @id_sede_217 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_217, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [218] Cosmetic Dent EIRL
--       RUC: 20548390908  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Cosmetic Dent EIRL', 'RUC', '20548390908', 1);
SET @id_cliente_218 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_218, 'Cosmetic Dent EIRL', '20548390908', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_218 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_218, 'Cosmetic Dent EIRL', 'Jr guardia civil norte Mz J lt 6 urb los parrales Surco', 'SURCO', 'LIMA', 'LIMA', NULL, '990914334', 1);
SET @id_sede_218 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_218, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [219] Veterinaria central traverso eirl
--       RUC: 20609375575  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Veterinaria central traverso eirl', 'RUC', '20609375575', 1);
SET @id_cliente_219 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_219, 'Veterinaria central traverso eirl', '20609375575', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_219 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_219, 'Veterinaria central traverso eirl', 'AV. JORGE CHAVEZ NRO. 1444 URB. EL PALMAR LIMA - LIMA - SANTIAGO DE SURCO', 'SURCO', 'LIMA', 'LIMA', 'Leslie', '940205630', 1);
SET @id_sede_219 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_219, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [220] CUBASALUD E.I.R.L.
--       RUC: 20612269051  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CUBASALUD E.I.R.L.', 'RUC', '20612269051', 1);
SET @id_cliente_220 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_220, 'CUBASALUD E.I.R.L.', '20612269051', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_220 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_220, 'CUBASALUD E.I.R.L.', 'Jr. Las Magnolias Mz. I Lt. 1, Interior 3, Urb. Prolongación San Ignacio de Monterrico Sur, Surco.', 'SURCO', 'LIMA', 'LIMA', NULL, '931481856', 1);
SET @id_sede_220 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_220, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [221] Susan Leroy Garro Bedriñana
--       RUC: 10098796491  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Susan Leroy Garro Bedriñana', 'RUC', '10098796491', 1);
SET @id_cliente_221 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_221, 'Susan Leroy Garro Bedriñana', '10098796491', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_221 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_221, 'Consultorio Odontológico Le Dent', 'JR. SAN PEDRITO N° 186 CONST 1 MZ A LT. 16 URB. CRUZ DE SURCO (COOVIECMA)', 'SURCO', 'LIMA', 'LIMA', 'SUSAN', NULL, 1);
SET @id_sede_221 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_221, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [222] Rosario Aurora Zegarra Medina
--       RUC: 10088218987  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Rosario Aurora Zegarra Medina', 'RUC', '10088218987', 1);
SET @id_cliente_222 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_222, 'Rosario Aurora Zegarra Medina', '10088218987', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_222 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_222, 'PetShop el trigal 2', 'Av Guardia Civil Norte Mz B lote 10 - surco', 'SURCO', 'LIMA', 'LIMA', 'HAROLD CABRERA - 963 354 622', NULL, 1);
SET @id_sede_222 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_222, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [223] SuDentist EIRL
--       RUC: 20601410495  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SuDentist EIRL', 'RUC', '20601410495', 1);
SET @id_cliente_223 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_223, 'SuDentist EIRL', '20601410495', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_223 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_223, 'EsSuDentist', 'ca. Emrique martinelli freundt 132 urb. San antonio de surco', 'SURCO', 'LIMA', 'LIMA', 'DR ELLEN HUAPAYA TORRES', '988543433', 1);
SET @id_sede_223 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_223, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [224] M&S DENTAL ATELIER SOCIEDAD ANÓNIMA CERRADA - M&S DENTA
--       RUC: 20600375335  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('M&S DENTAL ATELIER SOCIEDAD ANÓNIMA CERRADA - M&S DENTAL ATELIER S.A.C.', 'RUC', '20600375335', 1);
SET @id_cliente_224 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_224, 'M&S DENTAL ATELIER SOCIEDAD ANÓNIMA CERRADA - M&S DENTAL ATELIER S.A.C.', '20600375335', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_224 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_224, 'M&S Dental Atelier', 'Calle Bayovar Sur 295 - Surco', 'SURCO', 'LIMA', 'LIMA', 'FABIOLA RAMOS', NULL, 1);
SET @id_sede_224 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_224, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [225] INVERSIONES TCQ S.A.C.
--       RUC: 20605043021  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INVERSIONES TCQ S.A.C.', 'RUC', '20605043021', 1);
SET @id_cliente_225 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_225, 'INVERSIONES TCQ S.A.C.', '20605043021', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_225 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_225, 'Veterinaria Vet Society', 'CALLE DOÑA DELMIRA 400 URB. LOS ROSALES - SANTIAGO DE SURCO', 'SURCO', 'LIMA', 'LIMA', 'ADRIANA', '935126981', 1);
SET @id_sede_225 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_225, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [226] VILLAVERDE MOSCOL ROCIO ISABEL
--       RUC: 10480123943  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VILLAVERDE MOSCOL ROCIO ISABEL', 'RUC', '10480123943', 1);
SET @id_cliente_226 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_226, 'VILLAVERDE MOSCOL ROCIO ISABEL', '10480123943', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_226 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_226, 'Servident surco', 'avenida alcides vigo, mz d1 lote 25. urb honor y lealtad. surco.2do piso. Referencia a la altura de la cuadra 9 de la avenida los próceres-SURCO', 'SURCO', 'LIMA', 'LIMA', 'DRA ROCIO VALVERDE', '969733125', 1);
SET @id_sede_226 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_226, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [227] MEDIC DENTAL SMILE E.I.R.L.
--       RUC: 20512338322  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MEDIC DENTAL SMILE E.I.R.L.', 'RUC', '20512338322', 1);
SET @id_cliente_227 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_227, 'MEDIC DENTAL SMILE E.I.R.L.', '20512338322', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_227 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_227, 'Dental Smile', 'AV. CAMINOS DEL INCA NRO. 3257 URB. PROLONGACION BENAVIDES LIMA - LIMA - SANTIAGO DE SURCO', 'SURCO', 'LIMA', 'LIMA', 'DR. PETER TALAVERANO', '999858723', 1);
SET @id_sede_227 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_227, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [228] Brenda del Pilar Durango Hernández
--       RUC: 10106346793  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Brenda del Pilar Durango Hernández', 'RUC', '10106346793', 1);
SET @id_cliente_228 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_228, 'Brenda del Pilar Durango Hernández', '10106346793', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_228 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_228, 'Dental D''Élite', 'Jr. Vista Alegre Mz B Lt 15 Villa Alegre Santiago de Surco', 'SURCO', 'LIMA', 'LIMA', 'Luciana Llontop', '926805957', 1);
SET @id_sede_228 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_228, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [229] SANCHEZ QUEVEDO ZENISMEL EUSEBI
--       RUC: 15604733097  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SANCHEZ QUEVEDO ZENISMEL EUSEBI', 'RUC', '15604733097', 1);
SET @id_cliente_229 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_229, 'SANCHEZ QUEVEDO ZENISMEL EUSEBI', '15604733097', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_229 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_229, 'Clínica veterinaria Adardog 24 horas', 'Surco viejo Jiron corbeta la unión 280', 'SURCO', 'LIMA', 'LIMA', NULL, '960574631', 1);
SET @id_sede_229 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_229, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [230] Jesus Rafael Gamarra Trujillo
--       RUC: 10081638875  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Jesus Rafael Gamarra Trujillo', 'RUC', '10081638875', 1);
SET @id_cliente_230 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_230, 'Jesus Rafael Gamarra Trujillo', '10081638875', 'RIMAC', 'LIMA', 'LIMA', 1);
SET @id_empresa_230 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_230, 'Jesusdent', 'Av. Guardia Republicana 571', 'RIMAC', 'LIMA', 'LIMA', 'JESUS GAMARRA', NULL, 1);
SET @id_sede_230 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_230, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [231] BARRA SOTO JANET CARMINA.
--       RUC: 10081611101  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('BARRA SOTO JANET CARMINA.', 'RUC', '10081611101', 1);
SET @id_cliente_231 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_231, 'BARRA SOTO JANET CARMINA.', '10081611101', 'RIMAC', 'LIMA', 'LIMA', 1);
SET @id_empresa_231 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_231, 'Odontolideres', 'Jr. La Colonia 117 . Urb . El manzano . Rímac', 'RIMAC', 'LIMA', 'LIMA', 'DRA. JANET BARRA / DR JOSE', '991675242', 1);
SET @id_sede_231 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_231, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [232] ASTUCURI YAURI JOSE ANTONIO
--       RUC: 10105985954  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ASTUCURI YAURI JOSE ANTONIO', 'RUC', '10105985954', 1);
SET @id_cliente_232 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_232, 'ASTUCURI YAURI JOSE ANTONIO', '10105985954', 'RIMAC', 'LIMA', 'LIMA', 1);
SET @id_empresa_232 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_232, 'Odontolideres', 'AV.ALCAZAR 710 2DO PISO RIMAC', 'RIMAC', 'LIMA', 'LIMA', 'DRA. JANET BARRA / DR JOSE', NULL, 1);
SET @id_sede_232 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_232, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [233] FLORES VELASQUEZ LUIS RENATO
--       RUC: 10081507193  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('FLORES VELASQUEZ LUIS RENATO', 'RUC', '10081507193', 1);
SET @id_cliente_233 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_233, 'FLORES VELASQUEZ LUIS RENATO', '10081507193', 'RIMAC', 'LIMA', 'LIMA', 1);
SET @id_empresa_233 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_233, 'Centro Odontológico Flores', 'Av. Proceres 505 Rimac', 'RIMAC', 'LIMA', 'LIMA', NULL, '997344853', 1);
SET @id_sede_233 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_233, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [234] Arturo cabrera fernandini
--       RUC: 10102231304  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Arturo cabrera fernandini', 'RUC', '10102231304', 1);
SET @id_cliente_234 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_234, 'Arturo cabrera fernandini', '10102231304', 'SURCO', 'LIMA', 'LIMA', 1);
SET @id_empresa_234 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_234, 'Arturo cabrera fernandini', 'Av caminos del Inca 1651 surco', 'SURCO', 'LIMA', 'LIMA', 'NAYELI - 969399563', NULL, 1);
SET @id_sede_234 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_234, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [235] GABRIELA AQUINO HILARES
--       RUC: 10100796801  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GABRIELA AQUINO HILARES', 'RUC', '10100796801', 1);
SET @id_cliente_235 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_235, 'GABRIELA AQUINO HILARES', '10100796801', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_235 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_235, 'GABRIELA AQUINO HILARES', 'AV AVIACION 2591 DISTRITO SAN BORJA', 'SAN BORJA', 'LIMA', 'LIMA', 'ANA', '956741310', 1);
SET @id_sede_235 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_235, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [236] Linares Clinica Veterinaria EIRL
--       RUC: 20613242776  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Linares Clinica Veterinaria EIRL', 'RUC', '20613242776', 1);
SET @id_cliente_236 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_236, 'Linares Clinica Veterinaria EIRL', '20613242776', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_236 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_236, 'Linares Veterinaria & Spa', 'Av san Luis nro 2753. San Borja', 'SAN BORJA', 'LIMA', 'LIMA', NULL, '945156862', 1);
SET @id_sede_236 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_236, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [237] RABANAL FERNANDEZ CESAR RUBEN
--       RUC: 10267293754  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RABANAL FERNANDEZ CESAR RUBEN', 'RUC', '10267293754', 1);
SET @id_cliente_237 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_237, 'RABANAL FERNANDEZ CESAR RUBEN', '10267293754', 'san borja', 'LIMA', 'LIMA', 1);
SET @id_empresa_237 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_237, 'CONMSULTORIOS ODONTOLOGICOS DEL PACIFICO', 'AV. SAN LUIS N° 2069 OF 302', 'san borja', 'LIMA', 'LIMA', 'RUBEN RABANAL', '997883470', 1);
SET @id_sede_237 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_237, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [238] INVERSIONES SALASCORNEJO S.A.C.
--       RUC: 20611737506  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INVERSIONES SALASCORNEJO S.A.C.', 'RUC', '20611737506', 1);
SET @id_cliente_238 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_238, 'INVERSIONES SALASCORNEJO S.A.C.', '20611737506', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_238 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_238, 'Walac San Borja', 'Aviación 3187 san borja', 'SAN BORJA', 'LIMA', 'LIMA', 'ANDRES GUTIERREZ', '992319997', 1);
SET @id_sede_238 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_238, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [239] GRUPO GRESE EIRL
--       RUC: 20609318709  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO GRESE EIRL', 'RUC', '20609318709', 1);
SET @id_cliente_239 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_239, 'GRUPO GRESE EIRL', '20609318709', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_239 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_239, 'GRUPO GRESE EIRL', 'AV. JULIO BAILETTI 198 SAN BORJA', 'SAN BORJA', 'LIMA', 'LIMA', NULL, '959206729', 1);
SET @id_sede_239 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_239, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [240] Club Sonrisa Perú S.A.C
--       RUC: 20608397192  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Club Sonrisa Perú S.A.C', 'RUC', '20608397192', 1);
SET @id_cliente_240 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_240, 'Club Sonrisa Perú S.A.C', '20608397192', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_240 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_240, 'Club Sonrisa', 'Av. Primavera 939 San Borja. Oficina 504 Chacarilla – San Borja', 'SAN BORJA', 'LIMA', 'LIMA', NULL, '970800813', 1);
SET @id_sede_240 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_240, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [241] DENTALISTA S.A.C.
--       RUC: 20611537698  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DENTALISTA S.A.C.', 'RUC', '20611537698', 1);
SET @id_cliente_241 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_241, 'DENTALISTA S.A.C.', '20611537698', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_241 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_241, 'Dentalista', 'Avenida San Borja Norte 549 oficina 203 San Borja', 'SAN BORJA', 'LIMA', 'LIMA', NULL, '908708444', 1);
SET @id_sede_241 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_241, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [242] Clínica dental Snowdent eirl
--       RUC: 20607657077  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica dental Snowdent eirl', 'RUC', '20607657077', 1);
SET @id_cliente_242 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_242, 'Clínica dental Snowdent eirl', '20607657077', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_242 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_242, 'Snowdent', 'calle José Álvarez calderon 181a torres de limatambo San Borja', 'SAN BORJA', 'LIMA', 'LIMA', NULL, '946560898', 1);
SET @id_sede_242 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_242, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [243] VET PRIME - DIAGNÓSTICO ECOGRÁFICO SOCIEDAD ANÓNIMA CER
--       RUC: 20615600572  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VET PRIME - DIAGNÓSTICO ECOGRÁFICO SOCIEDAD ANÓNIMA CERRADA', 'RUC', '20615600572', 1);
SET @id_cliente_243 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_243, 'VET PRIME - DIAGNÓSTICO ECOGRÁFICO SOCIEDAD ANÓNIMA CERRADA', '20615600572', 'SAN BORJA', 'LIMA', 'LIMA', 1);
SET @id_empresa_243 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_243, 'VET PRIME', 'AVENIDA CIRCUNVALACIÓN 2830 - SAN BORJA / (referencia al costado de la facultad de veterinaria de san marcos)', 'SAN BORJA', 'LIMA', 'LIMA', NULL, '991342544', 1);
SET @id_sede_243 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_243, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [244] Beauty Touch Estética Orofacial  & Odontologia
--       RUC: 20608795074  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Beauty Touch Estética Orofacial  & Odontologia', 'RUC', '20608795074', 1);
SET @id_cliente_244 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_244, 'Beauty Touch Estética Orofacial  & Odontologia', '20608795074', 'MIRAFLORES', 'LIMA', 'LIMA', 1);
SET @id_empresa_244 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_244, 'Beauty Touch', 'avenida paseo de la república  5970 recepción y oficina 519', 'MIRAFLORES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_244 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_244, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [245] KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C.
--       RUC: 20518247761  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C.', 'RUC', '20518247761', 1);
SET @id_cliente_245 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_245, 'KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C.', '20518247761', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 1);
SET @id_empresa_245 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_245, 'Policlínico San Pedro', 'Av. San Martín 184 Urb. Mz CL Lte 21 Urb. Unidad 6 Canto Grande S.J.L.', 'SAN JUAN DE LURIGANCHO', 'LIMA', 'LIMA', 'KATIA VALVERDE', '949685710', 1);
SET @id_sede_245 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_245, '2026-07-03', 'quincenal', 200.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [246] Francisco Choque Huaman
--       RUC: 10409070910  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Francisco Choque Huaman', 'RUC', '10409070910', 1);
SET @id_cliente_246 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_246, 'Francisco Choque Huaman', '10409070910', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_246 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_246, 'Charming Vet', 'Av. San Juan 469 - San Luis', 'SAN LUIS', 'LIMA', 'LIMA', 'FRANCISCO', '933396305', 1);
SET @id_sede_246 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_246, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [247] DENTAL VEGADENT EIRL
--       RUC: 20600736397  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DENTAL VEGADENT EIRL', 'RUC', '20600736397', 1);
SET @id_cliente_247 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_247, 'DENTAL VEGADENT EIRL', '20600736397', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_247 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_247, 'Dental Vegadent', 'AV. AGUSTIN DE LA ROSA TORO 882 OF 302', 'SAN LUIS', 'LIMA', 'LIMA', NULL, '981838814', 1);
SET @id_sede_247 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_247, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [248] Carla Elena Ramirez Reyes
--       RUC: 10741677151  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Carla Elena Ramirez Reyes', 'RUC', '10741677151', 1);
SET @id_cliente_248 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_248, 'Carla Elena Ramirez Reyes', '10741677151', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_248 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_248, 'PATALEANDO VET-SPA', 'Av.canada 3791 - San Luis', 'SAN LUIS', 'LIMA', 'LIMA', 'CARLA', '933098017', 1);
SET @id_sede_248 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_248, '2026-07-03', 'mensual', 50.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [249] Arnaldo Nique Medrano Verastegui
--       RUC: 10106058208  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Arnaldo Nique Medrano Verastegui', 'RUC', '10106058208', 1);
SET @id_cliente_249 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_249, 'Arnaldo Nique Medrano Verastegui', '10106058208', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_249 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_249, 'Veterinaria MiauGuauWasi', 'Jr José Orengo 984 San Luis', 'SAN LUIS', 'LIMA', 'LIMA', NULL, '989497142', 1);
SET @id_sede_249 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_249, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [250] SERVICIOS DE CIRUGIA VETERINARIA E IMAGENES DR. LUIS RA
--       RUC: 20611878282  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SERVICIOS DE CIRUGIA VETERINARIA E IMAGENES DR. LUIS RAMOS E.I.R.L', 'RUC', '20611878282', 1);
SET @id_cliente_250 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_250, 'SERVICIOS DE CIRUGIA VETERINARIA E IMAGENES DR. LUIS RAMOS E.I.R.L', '20611878282', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_250 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_250, 'DR. LUIS RAMOS- CIRUGIA VETERINARIA ESPECIALIZADA', 'AV. CANADA Nº 3660 SAN LUIS', 'SAN LUIS', 'LIMA', 'LIMA', 'FREDY ARANDA -  912 119 642', NULL, 1);
SET @id_sede_250 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_250, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [251] GARCIA RAMIREZ WASHINGTON
--       RUC: 10061555418  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GARCIA RAMIREZ WASHINGTON', 'RUC', '10061555418', 1);
SET @id_cliente_251 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_251, 'GARCIA RAMIREZ WASHINGTON', '10061555418', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_251 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_251, 'Wash Dent Consultorios Odontológicos', 'Av San Luis 1299, Urb. Javier Prado, V Etapa, San Luis', 'SAN LUIS', 'LIMA', 'LIMA', NULL, '994726237', 1);
SET @id_sede_251 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_251, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [252] JCM SERVICIOS ODONTOLOGICO E.I.R.L
--       RUC: 20611241411  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JCM SERVICIOS ODONTOLOGICO E.I.R.L', 'RUC', '20611241411', 1);
SET @id_cliente_252 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_252, 'JCM SERVICIOS ODONTOLOGICO E.I.R.L', '20611241411', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_252 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_252, 'JCM SMILE CENTER', 'CAL. JOSE NEYRA 155 URB. LA CALERA DE LA MERCED SURQUILLO - LIMA-LIMA', 'SURQUILLO', 'LIMA', 'LIMA', NULL, '972163813', 1);
SET @id_sede_252 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_252, '2026-07-03', 'mensual', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [253] PET EXPRESSION S.A.C.
--       RUC: 20602970478  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PET EXPRESSION S.A.C.', 'RUC', '20602970478', 1);
SET @id_cliente_253 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_253, 'PET EXPRESSION S.A.C.', '20602970478', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_253 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_253, 'pet express vet', 'Domingo MARTINEZ Luján 933 surquillo', 'SURQUILLO', 'LIMA', 'LIMA', 'ALEX SUAREZ', '959763474', 1);
SET @id_sede_253 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_253, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [254] ILLUMINANCE DENTAL E.I.R.L.
--       RUC: 20610637591  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ILLUMINANCE DENTAL E.I.R.L.', 'RUC', '20610637591', 1);
SET @id_cliente_254 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_254, 'ILLUMINANCE DENTAL E.I.R.L.', '20610637591', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_254 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_254, 'CLÍNICA DENTAL ILLUMINANCE', 'CALLE LOS PAUJILES  168, SURQUILLO', 'SURQUILLO', 'LIMA', 'LIMA', 'MILAGROS', '963418142', 1);
SET @id_sede_254 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_254, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [255] CHAVEZ VILLANUEVA SUSAN SHIRLEY
--       RUC: 10425174733  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CHAVEZ VILLANUEVA SUSAN SHIRLEY', 'RUC', '10425174733', 1);
SET @id_cliente_255 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_255, 'CHAVEZ VILLANUEVA SUSAN SHIRLEY', '10425174733', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_255 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_255, 'Elemento Dental', 'calle la pera 415 surquillo', 'SURQUILLO', 'LIMA', 'LIMA', 'SUSAN SHIRLEY', '991203269', 1);
SET @id_sede_255 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_255, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [256] DEMMTAL SAC
--       RUC: 20612003280  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DEMMTAL SAC', 'RUC', '20612003280', 1);
SET @id_cliente_256 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_256, 'DEMMTAL SAC', '20612003280', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_256 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_256, 'DEMMTAL SAC', 'Calle María Elena Moyano 198 la Calera', 'SURQUILLO', 'LIMA', 'LIMA', 'MARCO', '998673630', 1);
SET @id_sede_256 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_256, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [257] ECOGRAPET SAC
--       RUC: 20543895157  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ECOGRAPET SAC', 'RUC', '20543895157', 1);
SET @id_cliente_257 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_257, 'ECOGRAPET SAC', '20543895157', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_257 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_257, 'GRUPO RUBIO', 'Calle La Pera 155. Surquillo', 'SURQUILLO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_257 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_257, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [258] CAVA ODONTOLOGIA ESPECIALIZADA S.A.C.
--       RUC: 20609132010  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CAVA ODONTOLOGIA ESPECIALIZADA S.A.C.', 'RUC', '20609132010', 1);
SET @id_cliente_258 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_258, 'CAVA ODONTOLOGIA ESPECIALIZADA S.A.C.', '20609132010', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_258 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_258, 'cava Odontologia especializada', 'jiron Manuel irribarren 261 - surquillo', 'SURQUILLO', 'LIMA', 'LIMA', NULL, '992425070', 1);
SET @id_sede_258 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_258, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [259] MUNICIPALIDAD DISTRITAL DE SURQUILLO
--       RUC: 20131372346  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MUNICIPALIDAD DISTRITAL DE SURQUILLO', 'RUC', '20131372346', 1);
SET @id_cliente_259 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_259, 'MUNICIPALIDAD DISTRITAL DE SURQUILLO', '20131372346', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_259 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_259, 'VETERINARIA MUNICIPAL SURQUILLO', 'Av. Angamos Este 1804', 'SURQUILLO', 'LIMA', 'LIMA', NULL, '997728143', 1);
SET @id_sede_259 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_259, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [260] ATM SERVET SAC
--       RUC: 20603611579  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ATM SERVET SAC', 'RUC', '20603611579', 1);
SET @id_cliente_260 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_260, 'ATM SERVET SAC', '20603611579', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_260 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_260, 'Puntovet', 'Av Mariscal Caceres 521 Surquillo', 'SURQUILLO', 'LIMA', 'LIMA', NULL, '916724286', 1);
SET @id_sede_260 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_260, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [261] Empresa de servicios veterinarios y comerciales Puppy C
--       RUC: 20611103540  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Empresa de servicios veterinarios y comerciales Puppy Center SAC', 'RUC', '20611103540', 1);
SET @id_cliente_261 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_261, 'Empresa de servicios veterinarios y comerciales Puppy Center SAC', '20611103540', 'SURQUILLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_261 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_261, 'Puppy Center SAC', 'JR. DANTE 225 SURQUILLO', 'SURQUILLO', 'LIMA', 'LIMA', NULL, '953249270', 1);
SET @id_sede_261 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_261, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [262] ASISTENCIA ODONTOLOGICA ESPECIALIZADA SOCIEDAD ANONIMA 
--       RUC: 20538031993  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ASISTENCIA ODONTOLOGICA ESPECIALIZADA SOCIEDAD ANONIMA CERRADA S.A.C.', 'RUC', '20538031993', 1);
SET @id_cliente_262 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_262, 'ASISTENCIA ODONTOLOGICA ESPECIALIZADA SOCIEDAD ANONIMA CERRADA S.A.C.', '20538031993', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_262 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_262, 'ASIS DENT', 'AV. ABANCAY N° 256 OFICJNA 202. CERCADO DE LIMA', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 'DORY', NULL, 1);
SET @id_sede_262 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_262, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [263] HEALTHY PETS E.I.R.L.
--       RUC: 20551879837  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('HEALTHY PETS E.I.R.L.', 'RUC', '20551879837', 1);
SET @id_cliente_263 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_263, 'HEALTHY PETS E.I.R.L.', '20551879837', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_263 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_263, 'VETERINARIA HEALTHY PETS', 'Av. Luis braille 1477- 1479 Urb. La Trinidad - Cercado de Lima', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 'RAQUEL VEGA', '991429225', 1);
SET @id_sede_263 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_263, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [264] PROPET SR S.A.C
--       RUC: 20608794191  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PROPET SR S.A.C', 'RUC', '20608794191', 1);
SET @id_cliente_264 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_264, 'PROPET SR S.A.C', '20608794191', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_264 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_264, 'PLANETA VET', 'AV. ENRIQUE MEIGGS 956 - CERCADO DE LIMA', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 'PATRICIA ARESTEGUI', '960379242', 1);
SET @id_sede_264 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_264, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [265] SANCHEZ PEREZ JORGE ANDRES
--       RUC: 10731723244  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SANCHEZ PEREZ JORGE ANDRES', 'RUC', '10731723244', 1);
SET @id_cliente_265 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_265, 'SANCHEZ PEREZ JORGE ANDRES', '10731723244', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_265 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_265, 'VESEL LABORATORIO CLÍNICO', 'Jr. Edmundo Moreau 995 Urb Roma Cercado de Lima', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 'JORGE SANCHEZ PEREZ', '991639415', 1);
SET @id_sede_265 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_265, '2026-07-03', 'mensual', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [266] RELUZ ORELLANA VICTOR MARTIN
--       RUC: 10081374703  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RELUZ ORELLANA VICTOR MARTIN', 'RUC', '10081374703', 1);
SET @id_cliente_266 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_266, 'RELUZ ORELLANA VICTOR MARTIN', '10081374703', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_266 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_266, 'Consultorio Dental V. Reluz', 'Jr. Enrique Barron 1200 Santa Beatriz - CERCADO DE LIMA', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 'VICTOR RELUZ ORELLANA', NULL, 1);
SET @id_sede_266 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_266, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [267] ESCOBAR VASQUEZ MERY ROSARIO
--       RUC: 10411613696  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ESCOBAR VASQUEZ MERY ROSARIO', 'RUC', '10411613696', 1);
SET @id_cliente_267 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_267, 'ESCOBAR VASQUEZ MERY ROSARIO', '10411613696', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_267 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_267, 'Petology', 'Av. Naciones unidas 1611', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 'ANTONIO', '947137831', 1);
SET @id_sede_267 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_267, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [268] MEDENT SALUD EIRL
--       RUC: 20607005371  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MEDENT SALUD EIRL', 'RUC', '20607005371', 1);
SET @id_cliente_268 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_268, 'MEDENT SALUD EIRL', '20607005371', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_268 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_268, 'MEDENT SALUD EIRL', 'Calle buenaventura sepulveda 1257- CERCADO', 'CERCADO DE LIMA', 'LIMA', 'LIMA', NULL, '987565534', 1);
SET @id_sede_268 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_268, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [269] MIKADENT S.A.C
--       RUC: 20600344707  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MIKADENT S.A.C', 'RUC', '20600344707', 1);
SET @id_cliente_269 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_269, 'MIKADENT S.A.C', '20600344707', 'CERCADO DE LIMA', 'LIMA', 'LIMA', 1);
SET @id_empresa_269 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_269, 'Mikadent', 'Jr. Santa Rosalía 622 local comercial 2 , Urb Santa Emma', 'CERCADO DE LIMA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_269 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_269, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [270] GORDILLO MALDONADO CARLA ROSA EMILIA
--       RUC: 10078621643  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GORDILLO MALDONADO CARLA ROSA EMILIA', 'RUC', '10078621643', 1);
SET @id_cliente_270 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_270, 'GORDILLO MALDONADO CARLA ROSA EMILIA', '10078621643', 'SAN ISIDRO', 'LIMA', 'LIMA', 1);
SET @id_empresa_270 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_270, 'Consultorio Odontológico Dra Carla  Gordillo', 'AV. JOSE GALVEZ BARRENECHEA 127 OF 303 SAN ISIDRO', 'SAN ISIDRO', 'LIMA', 'LIMA', 'CARLA', '976017231', 1);
SET @id_sede_270 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_270, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [271] CENTRO DE TERAPIA ALTERNATIVA Y ANTIENVEJECIMIENTO S.A.
--       RUC: 20511051682  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO DE TERAPIA ALTERNATIVA Y ANTIENVEJECIMIENTO S.A.C', 'RUC', '20511051682', 1);
SET @id_cliente_271 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_271, 'CENTRO DE TERAPIA ALTERNATIVA Y ANTIENVEJECIMIENTO S.A.C', '20511051682', 'SAN ISIDRO', 'LIMA', 'LIMA', 1);
SET @id_empresa_271 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_271, 'CENTRO DE TERAPIA ALTERNATIVA Y ANTIENVEJECIMIENTO S.A.C', 'AL.GONZALES OLAECHEA NRO. 211 LIMA - LIMA - SAN ISIDRO', 'SAN ISIDRO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_271 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_271, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [272] SOPIEST S.A.C.
--       RUC: 20600642023  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SOPIEST S.A.C.', 'RUC', '20600642023', 1);
SET @id_cliente_272 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_272, 'SOPIEST S.A.C.', '20600642023', 'SAN ISIDRO', 'LIMA', 'LIMA', 1);
SET @id_empresa_272 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_272, 'Cpeo odontología especializada', 'Av camino real 175 San Isidro', 'SAN ISIDRO', 'LIMA', 'LIMA', 'MIA DAVALOS - RECP JOB MONTESINOS', '933044595', 1);
SET @id_sede_272 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_272, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [273] REVISI COMPANY E.I.R.L.
--       RUC: 20392922203  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('REVISI COMPANY E.I.R.L.', 'RUC', '20392922203', 1);
SET @id_cliente_273 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_273, 'REVISI COMPANY E.I.R.L.', '20392922203', 'SAN ISIDRO', 'LIMA', 'LIMA', 1);
SET @id_empresa_273 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_273, 'Consultorio Odontológico Especializado Rafael Vilchez', 'Av. José Gálvez Barrenechea 127 San Isidro', 'SAN ISIDRO', 'LIMA', 'LIMA', 'DUGLIMAR RODRIGUEZ', '942836990', 1);
SET @id_sede_273 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_273, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [274] CONSULTORIO MEDICO DEL SUEÑO Y RESPIRACION SAC
--       RUC: 20610886958  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CONSULTORIO MEDICO DEL SUEÑO Y RESPIRACION SAC', 'RUC', '20610886958', 1);
SET @id_cliente_274 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_274, 'CONSULTORIO MEDICO DEL SUEÑO Y RESPIRACION SAC', '20610886958', 'SAN ISIDRO', 'LIMA', 'LIMA', 1);
SET @id_empresa_274 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_274, 'DORMA: SUEÑO Y RESPIRACION', 'Av. Javier Prado Este 1184 Of. 201 - San Isidro', 'SAN ISIDRO', 'LIMA', 'LIMA', NULL, '959176878', 1);
SET @id_sede_274 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_274, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [275] CHAVEZ VEREAU NATALI
--       RUC: 10425189021  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CHAVEZ VEREAU NATALI', 'RUC', '10425189021', 1);
SET @id_cliente_275 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_275, 'CHAVEZ VEREAU NATALI', '10425189021', 'SAN ISIDRO', 'LIMA', 'LIMA', 1);
SET @id_empresa_275 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_275, 'S&N Odontólogas', 'Av aramburu 245 2 piso - san Isidro', 'SAN ISIDRO', 'LIMA', 'LIMA', NULL, '992902272', 1);
SET @id_sede_275 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_275, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [276] FRANCE VET PERÚ EIRL
--       RUC: 20612029891  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('FRANCE VET PERÚ EIRL', 'RUC', '20612029891', 1);
SET @id_cliente_276 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_276, 'FRANCE VET PERÚ EIRL', '20612029891', 'SAN ISIDRO', 'LIMA', 'LIMA', 1);
SET @id_empresa_276 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_276, 'FRANCE VET PERÚ', 'Petit Thouars 3479 SAN ISIDRO', 'SAN ISIDRO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_276 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_276, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [277] ICBSAS
--       RUC: 20613697447  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ICBSAS', 'RUC', '20613697447', 1);
SET @id_cliente_277 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_277, 'ICBSAS', '20613697447', 'SAN ISIDRO', 'LIMA', 'LIMA', 1);
SET @id_empresa_277 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_277, 'Peruimplantecapilar', 'Javier prado este 1184. San isidro', 'SAN ISIDRO', 'LIMA', 'LIMA', NULL, '964548000', 1);
SET @id_sede_277 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_277, '2026-07-03', 'mensual', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [278] VILLAGOMEZ MORALES CAROLINA ISABEL
--       RUC: 10731254309  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VILLAGOMEZ MORALES CAROLINA ISABEL', 'RUC', '10731254309', 1);
SET @id_cliente_278 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_278, 'VILLAGOMEZ MORALES CAROLINA ISABEL', '10731254309', 'LA VICTORIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_278 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_278, 'Veterinaria Branilú Pet''s', 'Av. Palermo 196 Urb Balconcillo La Victoria', 'LA VICTORIA', 'LIMA', 'LIMA', NULL, '923438161', 1);
SET @id_sede_278 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_278, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [279] AntoFabri VS SAC
--       RUC: 20611638931  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('AntoFabri VS SAC', 'RUC', '20611638931', 1);
SET @id_cliente_279 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_279, 'AntoFabri VS SAC', '20611638931', 'LA VICTORIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_279 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_279, 'VesaVet', 'Calle Luis Espejo 1087 Santa Catalina La Victoria', 'LA VICTORIA', 'LIMA', 'LIMA', 'DRA GABRIELA SALAZAR', '987598086', 1);
SET @id_sede_279 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_279, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [280] AJA MEDINA HERMANOS S.A.C.
--       RUC: 20612142221  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('AJA MEDINA HERMANOS S.A.C.', 'RUC', '20612142221', 1);
SET @id_cliente_280 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_280, 'AJA MEDINA HERMANOS S.A.C.', '20612142221', 'SAN LUIS', 'LIMA', 'LIMA', 1);
SET @id_empresa_280 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_280, 'Sanar - Odontología Integral', 'Av. Del Aire 1557 (Mezzanine) - San Luis', 'SAN LUIS', 'LIMA', 'LIMA', 'NICOLE', '932457683', 1);
SET @id_sede_280 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_280, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [281] SIETE GUTIERREZ VDA DE ALVARADO YOLANDA
--       RUC: 10086605517  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SIETE GUTIERREZ VDA DE ALVARADO YOLANDA', 'RUC', '10086605517', 1);
SET @id_cliente_281 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_281, 'SIETE GUTIERREZ VDA DE ALVARADO YOLANDA', '10086605517', 'LA VICTORIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_281 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_281, 'Consultorio Médico Obstétrico
Dr AlvaradoS', 'Av Parque 12 de Octubre 2453-A  La Victoria', 'LA VICTORIA', 'LIMA', 'LIMA', 'SAMUEL TORRES HUAPAYA', '966189124', 1);
SET @id_sede_281 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_281, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [282] DILAS DENT E.I.R.L.
--       RUC: 20609344246  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DILAS DENT E.I.R.L.', 'RUC', '20609344246', 1);
SET @id_cliente_282 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_282, 'DILAS DENT E.I.R.L.', '20609344246', 'LA VICTORIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_282 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_282, 'DILAS DENT E.I.R.L.', 'PROLONGACION LA MAR CUADRA 7 MZ B LT 6 LA VICTORIA', 'LA VICTORIA', 'LIMA', 'LIMA', 'DILAS', '956527512', 1);
SET @id_sede_282 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_282, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [283] Rafael Ricardo Benito Quispe
--       RUC: 10406142391  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Rafael Ricardo Benito Quispe', 'RUC', '10406142391', 1);
SET @id_cliente_283 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_283, 'Rafael Ricardo Benito Quispe', '10406142391', 'LA VICTORIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_283 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_283, 'Veterinaria Rafael Ricardo Benito Quispe', 'Jirón Italia 1905 - La Victoria', 'LA VICTORIA', 'LIMA', 'LIMA', 'RAFAEL', '999591620', 1);
SET @id_sede_283 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_283, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [284] SAYRITUPAC RIOS ALICIA
--       RUC: 10215740710  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SAYRITUPAC RIOS ALICIA', 'RUC', '10215740710', 1);
SET @id_cliente_284 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_284, 'SAYRITUPAC RIOS ALICIA', '10215740710', 'LA VICTORIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_284 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_284, 'Consultorio Odontológico "PrevenDent"', 'Marcelino Gonzáles 293, dpto 101 urb Sta Catalina, La Victoria', 'LA VICTORIA', 'LIMA', 'LIMA', 'JHON SOCA', '992008323', 1);
SET @id_sede_284 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_284, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [285] DENTALMANS E.I.R.L.
--       RUC: 20601130506  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DENTALMANS E.I.R.L.', 'RUC', '20601130506', 1);
SET @id_cliente_285 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_285, 'DENTALMANS E.I.R.L.', '20601130506', 'LA VICTORIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_285 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_285, 'DENTALMANS EIRL', 'Avenida 3 de febrero 921- La Victoria', 'LA VICTORIA', 'LIMA', 'LIMA', NULL, '953100332', 1);
SET @id_sede_285 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_285, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [286] Milagros Felicia Anicama Carranza
--       RUC: 10434524739  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Milagros Felicia Anicama Carranza', 'RUC', '10434524739', 1);
SET @id_cliente_286 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_286, 'Milagros Felicia Anicama Carranza', '10434524739', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_286 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_286, 'Consultorio Dental Santa Cruz', 'Avenida General Santa Cruz 123. Jesús María', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_286 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_286, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [287] MILAGROS BRIONES LAU LI
--       RUC: 10472000336  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MILAGROS BRIONES LAU LI', 'RUC', '10472000336', 1);
SET @id_cliente_287 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_287, 'MILAGROS BRIONES LAU LI', '10472000336', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_287 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_287, 'INSPIRA DENT', 'JR HUAMACHUCO 1443 JESUS MARÍA', 'JESUS MARIA', 'LIMA', 'LIMA', 'luis briones', NULL, 1);
SET @id_sede_287 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_287, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [288] ROSAS CARRERA ETZABE YAMILETT
--       RUC: 10448904836  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ROSAS CARRERA ETZABE YAMILETT', 'RUC', '10448904836', 1);
SET @id_cliente_288 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_288, 'ROSAS CARRERA ETZABE YAMILETT', '10448904836', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_288 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_288, 'Ceol Dent', 'Av Cuba 1285 2do piso Jesús María', 'JESUS MARIA', 'LIMA', 'LIMA', 'KIMBERLY RODRIGUEZ', '992726616', 1);
SET @id_sede_288 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_288, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [289] REHTO SALUD SAC
--       RUC: 20612105473  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('REHTO SALUD SAC', 'RUC', '20612105473', 1);
SET @id_cliente_289 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_289, 'REHTO SALUD SAC', '20612105473', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_289 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_289, 'REHTO SALUD SAC', 'CALLE TEODORO CARDENAS 130 - 6TO. PISO SANTA BEATRIZ', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, '976575900', 1);
SET @id_sede_289 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_289, '2026-07-03', 'mensual', 75.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [290] Fernando Acosta Soria
--       RUC: 10406125713  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Fernando Acosta Soria', 'RUC', '10406125713', 1);
SET @id_cliente_290 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_290, 'Fernando Acosta Soria', '10406125713', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_290 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_290, 'OdontoFAS', 'calle: Horacio Urteaga 1477 - B, Jesús Maria', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_290 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_290, '2026-07-03', 'mensual', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [291] EVET LIMA S.A.C.
--       RUC: 20602939864  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('EVET LIMA S.A.C.', 'RUC', '20602939864', 1);
SET @id_cliente_291 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_291, 'EVET LIMA S.A.C.', '20602939864', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_291 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_291, 'EVET CANTERAC', 'jirón general canterac 325 Jesús maría', 'JESUS MARIA', 'LIMA', 'LIMA', 'CLAUDIA ROMERO', '923707865', 1);
SET @id_sede_291 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_291, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [292] MUNICIPALIDAD DISTRITAL DE JESUS MARIA
--       RUC: 20131366290  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MUNICIPALIDAD DISTRITAL DE JESUS MARIA', 'RUC', '20131366290', 1);
SET @id_cliente_292 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_292, 'MUNICIPALIDAD DISTRITAL DE JESUS MARIA', '20131366290', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_292 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_292, 'MUNICIPALIDAD DISTRITAL DE JESUS MARIA', 'AV. DE LA PERUANIDAD N° 150 (JUNTO AL INGRESO DE LA CONCHA ACUSTICA)', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_292 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_292, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [293] LOKIPET S.A.C
--       RUC: 20608486888  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LOKIPET S.A.C', 'RUC', '20608486888', 1);
SET @id_cliente_293 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_293, 'LOKIPET S.A.C', '20608486888', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_293 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_293, 'Lokipet', 'Avenida Ricardo Tizón y Bueno 634 Jesús María', 'JESUS MARIA', 'LIMA', 'LIMA', 'ANDREA FERREYRA', '946475735', 1);
SET @id_sede_293 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_293, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [294] Servicios Veterinarios Sebasmedic EIRL
--       RUC: 20613400002  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Servicios Veterinarios Sebasmedic EIRL', 'RUC', '20613400002', 1);
SET @id_cliente_294 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_294, 'Servicios Veterinarios Sebasmedic EIRL', '20613400002', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_294 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_294, 'veterinaria Sebasmedic', 'Jr Huáscar 1666 Jesús María', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, '989723140', 1);
SET @id_sede_294 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_294, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [295] VETERINARIA HUSARES DE JUNIN SAC
--       RUC: 20610675787  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA HUSARES DE JUNIN SAC', 'RUC', '20610675787', 1);
SET @id_cliente_295 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_295, 'VETERINARIA HUSARES DE JUNIN SAC', '20610675787', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_295 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_295, 'Veterinaria Húsares de Junín', 'AV. HUSARES DE JUNIN 210', 'JESUS MARIA', 'LIMA', 'LIMA', 'CARMELA', NULL, 1);
SET @id_sede_295 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_295, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [296] IRIS MEDICINA FELINA E.I.R.L.
--       RUC: 20611828820  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('IRIS MEDICINA FELINA E.I.R.L.', 'RUC', '20611828820', 1);
SET @id_cliente_296 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_296, 'IRIS MEDICINA FELINA E.I.R.L.', '20611828820', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_296 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_296, 'IRIS MEDICINA FELINA', 'AV. FRANCISCO JAVIER MARIATEGUI 1579 JESUS MARIA', 'JESUS MARIA', 'LIMA', 'LIMA', 'LUCERO RECALDE', '906938250', 1);
SET @id_sede_296 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_296, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [297] Alessandra Patricia Villena Cumpa
--       RUC: 10470044743  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Alessandra Patricia Villena Cumpa', 'RUC', '10470044743', 1);
SET @id_cliente_297 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_297, 'Alessandra Patricia Villena Cumpa', '10470044743', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_297 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_297, 'Veterinaria Liverpool', 'Av Cayetano Heredia 457 Jesus María', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, '987815368', 1);
SET @id_sede_297 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_297, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [298] DOWAVA EIRL
--       RUC: 20612006564  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DOWAVA EIRL', 'RUC', '20612006564', 1);
SET @id_cliente_298 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_298, 'DOWAVA EIRL', '20612006564', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_298 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_298, 'RECUPET', 'jiron huiracocha 1549 – 1551 JESUS MARIA', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, '908772198', 1);
SET @id_sede_298 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_298, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [299] CONSULTORIO DENTAL DR. CUADROS E.I.R.L.
--       RUC: 20615187322  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CONSULTORIO DENTAL DR. CUADROS E.I.R.L.', 'RUC', '20615187322', 1);
SET @id_cliente_299 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_299, 'CONSULTORIO DENTAL DR. CUADROS E.I.R.L.', '20615187322', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_299 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_299, 'DR CUADROS', 'Jiron caracas 2479 - Jesús María', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, '920093630', 1);
SET @id_sede_299 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_299, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [300] VitalPro SAC
--       RUC: 20614280639  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VitalPro SAC', 'RUC', '20614280639', 1);
SET @id_cliente_300 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_300, 'VitalPro SAC', '20614280639', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_300 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_300, 'VitalPro SAC', 'Av. San Felipe 198 Jesús Maria', 'JESUS MARIA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_300 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_300, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [301] INVERSIONES Y SERVICIOS GENERALES ANIMALAND S.A.C.
--       RUC: 20610005501  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INVERSIONES Y SERVICIOS GENERALES ANIMALAND S.A.C.', 'RUC', '20610005501', 1);
SET @id_cliente_301 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_301, 'INVERSIONES Y SERVICIOS GENERALES ANIMALAND S.A.C.', '20610005501', 'VENTANILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_301 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_301, 'veterinaria animaland', 'Jr Las Magnolias mz w lt 4 Luis Felipe de las casas ventanilla.', 'VENTANILLA', 'LIMA', 'LIMA', 'Gerente de Clínica veterinaria Cimevet', '950337756', 1);
SET @id_sede_301 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_301, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [302] VETERINARIA SATELITE EIRL
--       RUC: 20601313872  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA SATELITE EIRL', 'RUC', '20601313872', 1);
SET @id_cliente_302 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_302, 'VETERINARIA SATELITE EIRL', '20601313872', 'VENTANILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_302 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_302, 'VETERINARIA SATELITE EIRL', 'AV EUCALIPTOS MZ 5 LT 19, Urb. satélite - VENTANILLA', 'VENTANILLA', 'LIMA', 'LIMA', 'CESAR GALINDO HUAMAN', NULL, 1);
SET @id_sede_302 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_302, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [303] BERROSPI GROUP SAC
--       RUC: 20606846356  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('BERROSPI GROUP SAC', 'RUC', '20606846356', 1);
SET @id_cliente_303 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_303, 'BERROSPI GROUP SAC', '20606846356', 'VENTANILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_303 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_303, 'ERROSPI HEALTH', 'CRUCE DE AV AYACUCHO CON TRUJILLO MZ J16LT5 distrito de MI PERU - CALLAO', 'VENTANILLA', 'LIMA', 'LIMA', 'JESUS BERROSPI', '983581752', 1);
SET @id_sede_303 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_303, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [304] CENTRO VETERINARIO J Y B EIRL
--       RUC: 20610578161  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO VETERINARIO J Y B EIRL', 'RUC', '20610578161', 1);
SET @id_cliente_304 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_304, 'CENTRO VETERINARIO J Y B EIRL', '20610578161', 'VENTANILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_304 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_304, 'SATELITE', 'PRY Pachacutec - Mz. J Lt. 21, AAHH Los Jazmines - Ventanilla, Callao', 'VENTANILLA', 'LIMA', 'LIMA', 'CARMEN BAO', '978859697', 1);
SET @id_sede_304 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_304, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [305] LA JARA HERNANDEZ VICTOR JUAN CARLOS
--       RUC: 10448686456  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LA JARA HERNANDEZ VICTOR JUAN CARLOS', 'RUC', '10448686456', 1);
SET @id_cliente_305 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_305, 'LA JARA HERNANDEZ VICTOR JUAN CARLOS', '10448686456', 'VENTANILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_305 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_305, 'Clínica Veterinaria Mascolitas', 'Av. Huaura, Mz A 11 lote 2- Mi Perú (referencia a media cuadra de la base de serenazgo de Av. Ayacucho)', 'VENTANILLA', 'LIMA', 'LIMA', 'VICTOR LA JARA', '960328312', 1);
SET @id_sede_305 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_305, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [306] SIMPET SAC
--       RUC: 20610344489  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SIMPET SAC', 'RUC', '20610344489', 1);
SET @id_cliente_306 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_306, 'SIMPET SAC', '20610344489', 'VENTANILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_306 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_306, 'SIMPET SAC', 'Av. Pedro Beltrán Mz 24 Lt 31. Ciudad Satélite referencia frente a la veterinaria municipal de ventanilla .', 'VENTANILLA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_306 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_306, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [307] Lourdes Juliana Mathias López
--       RUC: 10076457382  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Lourdes Juliana Mathias López', 'RUC', '10076457382', 1);
SET @id_cliente_307 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_307, 'Lourdes Juliana Mathias López', '10076457382', 'VENTANILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_307 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_307, 'Entre patitas y patotas', 'Av. Pedro Beltrán 207 Urb. Satélite Ventanilla - Callao', 'VENTANILLA', 'LIMA', 'LIMA', NULL, '979778619', 1);
SET @id_sede_307 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_307, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [308] Clínica Veterinaria Eovet sac
--       RUC: 20612475408  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica Veterinaria Eovet sac', 'RUC', '20612475408', 1);
SET @id_cliente_308 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_308, 'Clínica Veterinaria Eovet sac', '20612475408', 'VENTANILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_308 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_308, 'Veterinaria villa los reyes', 'Calle 22 mz M lt 12 ubr villa los reyes provincia const del callao, provincia const callao ventanilla', 'VENTANILLA', 'LIMA', 'LIMA', NULL, '933468041', 1);
SET @id_sede_308 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_308, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [309] Díaz Manco Tiffany Betsabe
--       RUC: 10431798927  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Díaz Manco Tiffany Betsabe', 'RUC', '10431798927', 1);
SET @id_cliente_309 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_309, 'Díaz Manco Tiffany Betsabe', '10431798927', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_309 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_309, 'TiTan Veterinaria', 'Av julio C Tello 677- Lince', 'LINCE', 'LIMA', 'LIMA', NULL, '991752314', 1);
SET @id_sede_309 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_309, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [310] grupo Trujillo & asociados SAC
--       RUC: 20544979389  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('grupo Trujillo & asociados SAC', 'RUC', '20544979389', 1);
SET @id_cliente_310 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_310, 'grupo Trujillo & asociados SAC', '20544979389', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_310 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_310, 'Incisive Dental Studios', 'av paseo de la República 2490- lince', 'LINCE', 'LIMA', 'LIMA', NULL, '986667704', 1);
SET @id_sede_310 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_310, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [311] ESTHETICDENT SAC
--       RUC: 20513473665  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ESTHETICDENT SAC', 'RUC', '20513473665', 1);
SET @id_cliente_311 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_311, 'ESTHETICDENT SAC', '20513473665', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_311 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_311, 'ESTHETICDENT SAC', 'JIRON JOSE DE LA TORRE UGARTE 166 OFICINA 1102 LINCE (ALTURA DE                                                LA CUADRA 25 DE LA AV. AREQUIPA)', 'LINCE', 'LIMA', 'LIMA', NULL, '996977994', 1);
SET @id_sede_311 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_311, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [312] VETERINARIA BLAS VET LINCE
--       RUC: 20609931559  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA BLAS VET LINCE', 'RUC', '20609931559', 1);
SET @id_cliente_312 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_312, 'VETERINARIA BLAS VET LINCE', '20609931559', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_312 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_312, 'BLAS VET', 'JOSE LEAL 1029 LINCE', 'LINCE', 'LIMA', 'LIMA', 'MARICIELO PINTADO', '943530364', 1);
SET @id_sede_312 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_312, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [313] RENACER, SALUD Y BELLEZA S.A.C.
--       RUC: 20609118343  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RENACER, SALUD Y BELLEZA S.A.C.', 'RUC', '20609118343', 1);
SET @id_cliente_313 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_313, 'RENACER, SALUD Y BELLEZA S.A.C.', '20609118343', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_313 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_313, 'RENACERIS', 'AV. ARENALES 1912- OFICINA 1001- LINCE (CRUCE DE CANEVARO CON ARENALES)', 'LINCE', 'LIMA', 'LIMA', 'KAREN CASTRO', NULL, 1);
SET @id_sede_313 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_313, '2026-07-03', 'mensual', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [314] CLINICA VETERINARIA ANIMALANDIA M & S S.A.C.
--       RUC: 20609260140  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA ANIMALANDIA M & S S.A.C.', 'RUC', '20609260140', 1);
SET @id_cliente_314 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_314, 'CLINICA VETERINARIA ANIMALANDIA M & S S.A.C.', '20609260140', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_314 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_314, 'VETERINARIA ANIMALANDIA', 'Jr. Julio Cesar Tello 1184 Urb. Risso - Lince', 'LINCE', 'LIMA', 'LIMA', 'MICHAEL FLORES', '984251001', 1);
SET @id_sede_314 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_314, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [315] Becodent sacs
--       RUC: 20608989863  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Becodent sacs', 'RUC', '20608989863', 1);
SET @id_cliente_315 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_315, 'Becodent sacs', '20608989863', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_315 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_315, 'Becodent', 'Av paseo de la republica 1900 segundo piso -LINCE', 'LINCE', 'LIMA', 'LIMA', 'DRA. VALERIA PAXI', '910695930', 1);
SET @id_sede_315 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_315, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [316] ASENDENT PERU S.A.C.
--       RUC: 20611786582  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ASENDENT PERU S.A.C.', 'RUC', '20611786582', 1);
SET @id_cliente_316 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_316, 'ASENDENT PERU S.A.C.', '20611786582', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_316 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_316, 'CLÍNICA DE ESPECIALIDADES ODONTOLÓGICAS ASEN DENT PERU', 'AV ARENALES 1807 - 2DO PISO - LINCE', 'LINCE', 'LIMA', 'LIMA', 'KATHERIN BECERRA', '992190929', 1);
SET @id_sede_316 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_316, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [317] VET PLUS EIRL
--       RUC: 20109724778  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VET PLUS EIRL', 'RUC', '20109724778', 1);
SET @id_cliente_317 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_317, 'VET PLUS EIRL', '20109724778', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_317 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_317, 'CLINICA VETERINARIA DELGADO', 'Jr Soledad 354 Lince', 'LINCE', 'LIMA', 'LIMA', NULL, '978192555', 1);
SET @id_sede_317 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_317, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [318] VETCARE S.A.C.
--       RUC: 20614046172  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETCARE S.A.C.', 'RUC', '20614046172', 1);
SET @id_cliente_318 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_318, 'VETCARE S.A.C.', '20614046172', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_318 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_318, 'Vetcare', 'Jr Manuel Gomez 451 Lince', 'LINCE', 'LIMA', 'LIMA', NULL, '932744283', 1);
SET @id_sede_318 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_318, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [319] Grupo inversiones J&J asociados sac
--       RUC: 20614036002  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Grupo inversiones J&J asociados sac', 'RUC', '20614036002', 1);
SET @id_cliente_319 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_319, 'Grupo inversiones J&J asociados sac', '20614036002', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_319 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_319, 'Somos Dental Orthoimplant', 'Av prolongación Iquitos 1880 Lince', 'LINCE', 'LIMA', 'LIMA', NULL, '980288145', 1);
SET @id_sede_319 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_319, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [320] SIALER GONZALES DORA MAYRA
--       RUC: 10732106711  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SIALER GONZALES DORA MAYRA', 'RUC', '10732106711', 1);
SET @id_cliente_320 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_320, 'SIALER GONZALES DORA MAYRA', '10732106711', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_320 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_320, 'PARIS PET', 'Jr. MAMA OCLLO 1954 LINCE', 'LINCE', 'LIMA', 'LIMA', NULL, '953387334', 1);
SET @id_sede_320 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_320, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [321] Juan Diego Flores Rodas
--       RUC: 10707743081  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Juan Diego Flores Rodas', 'RUC', '10707743081', 1);
SET @id_cliente_321 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_321, 'Juan Diego Flores Rodas', '10707743081', 'LINCE', 'LIMA', 'LIMA', 1);
SET @id_empresa_321 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_321, 'Dr. Hool Dental Care & Orthodontics', 'Jirón Brigadier Mateo Pumacahua 2529- Lince', 'LINCE', 'LIMA', 'LIMA', NULL, '992159595', 1);
SET @id_sede_321 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_321, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [322] NOBU ODONTOLOGIA SAC
--       RUC: 20613678035  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('NOBU ODONTOLOGIA SAC', 'RUC', '20613678035', 1);
SET @id_cliente_322 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_322, 'NOBU ODONTOLOGIA SAC', '20613678035', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_322 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_322, 'Nobu Dental Studio', 'Av roca de vergallo 493 oficina 1312 Magdalena', 'MAGDALENA', 'LIMA', 'LIMA', 'KARLA BORJA - 945 658 132', NULL, 1);
SET @id_sede_322 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_322, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [323] BELLEZA Y CIENCIA SAC
--       RUC: 20548548625  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('BELLEZA Y CIENCIA SAC', 'RUC', '20548548625', 1);
SET @id_cliente_323 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_323, 'BELLEZA Y CIENCIA SAC', '20548548625', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_323 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_323, 'Bellesens', 'AV FAUSTINO SANCHEZ CARRION 270', 'MAGDALENA', 'LIMA', 'LIMA', 'JACKELINE', '990163536', 1);
SET @id_sede_323 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_323, '2026-07-03', 'mensual', 170.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [324] ADMINISTRADORA DE SERVICIOS INTEGRALES DE SALUD S.A.C. 
--       RUC: 20555957808  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ADMINISTRADORA DE SERVICIOS INTEGRALES DE SALUD S.A.C. - ADSERINSA', 'RUC', '20555957808', 1);
SET @id_cliente_324 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_324, 'ADMINISTRADORA DE SERVICIOS INTEGRALES DE SALUD S.A.C. - ADSERINSA', '20555957808', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_324 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_324, 'COT DENT', 'AV SUCRE 538 MADGALENA DEL MAR , LIMA', 'MAGDALENA', 'LIMA', 'LIMA', NULL, '962329544', 1);
SET @id_sede_324 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_324, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [325] INSTITUTO VETERINARIO DE ESPECIALIDADES MEDICAS S.A.C.
--       RUC: 20563289636  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INSTITUTO VETERINARIO DE ESPECIALIDADES MEDICAS S.A.C.', 'RUC', '20563289636', 1);
SET @id_cliente_325 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_325, 'INSTITUTO VETERINARIO DE ESPECIALIDADES MEDICAS S.A.C.', '20563289636', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_325 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_325, 'SERV.VETERINARIOS SAN ANTONIO', 'Jirón Arequipa 108 Magdalena del Mar', 'MAGDALENA', 'LIMA', 'LIMA', 'KATHERIN', '997913620', 1);
SET @id_sede_325 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_325, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [326] URIBE REVOREDO MANUEL RICARDO
--       RUC: 10443725062  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('URIBE REVOREDO MANUEL RICARDO', 'RUC', '10443725062', 1);
SET @id_cliente_326 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_326, 'URIBE REVOREDO MANUEL RICARDO', '10443725062', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_326 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_326, 'URIBE REVOREDO MANUEL RICARDO', 'Calle Roca De Vergallo 493 oficina 1309 - Magdalena', 'MAGDALENA', 'LIMA', 'LIMA', NULL, '946737353', 1);
SET @id_sede_326 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_326, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [327] DRAS VALVERDE SAC
--       RUC: 20609785412  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DRAS VALVERDE SAC', 'RUC', '20609785412', 1);
SET @id_cliente_327 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_327, 'DRAS VALVERDE SAC', '20609785412', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_327 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_327, 'ROVALDENT', 'Calle Tomás Ramsey 930 oficina 706. Edificios Soho - Magdalena del mar', 'MAGDALENA', 'LIMA', 'LIMA', 'ALEJANDRA ARROYO - 995071555', NULL, 1);
SET @id_sede_327 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_327, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [328] Gilberto Arturo Huapaya Marcos
--       RUC: 10258111473  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Gilberto Arturo Huapaya Marcos', 'RUC', '10258111473', 1);
SET @id_cliente_328 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_328, 'Gilberto Arturo Huapaya Marcos', '10258111473', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_328 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_328, 'Ortodoncia Huapaya', 'jr castilla 731 oficina 206, magdalena del mar', 'MAGDALENA', 'LIMA', 'LIMA', 'GILBERT HUAPAYA', '999605717', 1);
SET @id_sede_328 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_328, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [329] GOMEZ ALARCO JOSSEP MAURO
--       RUC: 10406806818  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GOMEZ ALARCO JOSSEP MAURO', 'RUC', '10406806818', 1);
SET @id_cliente_329 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_329, 'GOMEZ ALARCO JOSSEP MAURO', '10406806818', 'MAGDALENA', 'LIMA', 'LIMA', 1);
SET @id_empresa_329 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_329, 'Jossmau Odontólogos', 'Rodolfo Rutte 424 Magdalena Del Mar', 'MAGDALENA', 'LIMA', 'LIMA', 'ROSANGELA MENDOZA', '996375157', 1);
SET @id_sede_329 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_329, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [330] AIDA YENI CRISTOBAL JAUNI
--       RUC: 10479926897  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('AIDA YENI CRISTOBAL JAUNI', 'RUC', '10479926897', 1);
SET @id_cliente_330 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_330, 'AIDA YENI CRISTOBAL JAUNI', '10479926897', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_330 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_330, 'CONSULTORIO VETERINARIO SAN BERNARDO', 'URB-PREVI BOCANEGRA MZ 19 LT 10 CALLAO', 'CALLAO', 'LIMA', 'LIMA', NULL, '974972828', 1);
SET @id_sede_330 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_330, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [331] margarita martell martinez
--       RUC: 10087226480  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('margarita martell martinez', 'RUC', '10087226480', 1);
SET @id_cliente_331 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_331, 'margarita martell martinez', '10087226480', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_331 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_331, 'veterinaria happyfriends', 'asociacion propietarios 7 de agosto mz A lote 1 - callao', 'CALLAO', 'LIMA', 'LIMA', 'MARGARITA', NULL, 1);
SET @id_sede_331 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_331, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [332] OCL DENTAL S.A.C.
--       RUC: 20606384221  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('OCL DENTAL S.A.C.', 'RUC', '20606384221', 1);
SET @id_cliente_332 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_332, 'OCL DENTAL S.A.C.', '20606384221', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_332 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_332, 'CONSULTORIO MULTIDENT', 'AV. ALEJANDRO BERTELLO BOLLATI N° 1500 - CALLAO', 'CALLAO', 'LIMA', 'LIMA', 'LETTY MARIN', '941241842', 1);
SET @id_sede_332 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_332, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [333] CHRISTIAN FELIX LUYO AVILA
--       RUC: 10471530188  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CHRISTIAN FELIX LUYO AVILA', 'RUC', '10471530188', 1);
SET @id_cliente_333 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_333, 'CHRISTIAN FELIX LUYO AVILA', '10471530188', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_333 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_333, 'CONSULTORIO VETERINARIO SAN ROQUE', 'Jr. Miguel Grau 416 Carmen de la Legua Reynoso', 'CALLAO', 'LIMA', 'LIMA', 'CHRISTIAN LUYO', '912925326017518970', 1);
SET @id_sede_333 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_333, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [334] Centro Odontológico Biomedix sac
--       RUC: 20608719033  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Centro Odontológico Biomedix sac', 'RUC', '20608719033', 1);
SET @id_cliente_334 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_334, 'Centro Odontológico Biomedix sac', '20608719033', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_334 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_334, 'Consultorio Dental Biomedix', 'Av. Primero de mayo 1201, Carmen de la Legua Reynoso. Callao', 'CALLAO', 'LIMA', 'LIMA', NULL, '957787113', 1);
SET @id_sede_334 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_334, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [335] Peluditos Petshop EIRL
--       RUC: 20611797843  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Peluditos Petshop EIRL', 'RUC', '20611797843', 1);
SET @id_cliente_335 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_335, 'Peluditos Petshop EIRL', '20611797843', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_335 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_335, 'Peluditos Petshop EIRL', 'Av. Manuel Cipriano Dulanto 1668, Pueblo Libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_335 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_335, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [336] CENTRO ODONTOLOGICO LA MAR E.I.R.L.
--       RUC: 20609374331  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO ODONTOLOGICO LA MAR E.I.R.L.', 'RUC', '20609374331', 1);
SET @id_cliente_336 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_336, 'CENTRO ODONTOLOGICO LA MAR E.I.R.L.', '20609374331', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_336 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_336, 'CENTRO ODONTOLOGICO LA MAR', 'AV. LA MAR 1999 A PUEBLO LIBRE', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 'SERGIO MORENO', '956286738', 1);
SET @id_sede_336 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_336, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [337] MARÍA ÚRSULA DEL PILAR FLÓREZ CALDERÓN DE CARMEN
--       RUC: 10096755355  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MARÍA ÚRSULA DEL PILAR FLÓREZ CALDERÓN DE CARMEN', 'RUC', '10096755355', 1);
SET @id_cliente_337 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_337, 'MARÍA ÚRSULA DEL PILAR FLÓREZ CALDERÓN DE CARMEN', '10096755355', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_337 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_337, 'LIFETIME SMILE', 'CALLE MARTÍN OVIEDO 102 PUEBLO LIBRE', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 'SANDY CABRERA', '988804174', 1);
SET @id_sede_337 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_337, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [338] Thatiana Danae Fachin Arbildo
--       RUC: 10455510304  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Thatiana Danae Fachin Arbildo', 'RUC', '10455510304', 1);
SET @id_cliente_338 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_338, 'Thatiana Danae Fachin Arbildo', '10455510304', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_338 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_338, 'Garrita Feliz', 'Av. La Marina 725, Pueblo Libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 'THATIANA', '929554822', 1);
SET @id_sede_338 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_338, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [339] INVERSIONES ANTARA S.A.C.
--       RUC: 20610149147  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INVERSIONES ANTARA S.A.C.', 'RUC', '20610149147', 1);
SET @id_cliente_339 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_339, 'INVERSIONES ANTARA S.A.C.', '20610149147', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_339 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_339, 'Antara Pet Care', 'Av. Gral. José María Egusquiza 1088, Pueblo Libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 'ALISSON AYALA -  912 643 028', NULL, 1);
SET @id_sede_339 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_339, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [340] Consultorio Odontológico Dentios E.I.R.L
--       RUC: 20613838385  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Consultorio Odontológico Dentios E.I.R.L', 'RUC', '20613838385', 1);
SET @id_cliente_340 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_340, 'Consultorio Odontológico Dentios E.I.R.L', '20613838385', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_340 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_340, 'Consultorio Odontológico Dentios E.I.R.L', '⁠⁠Jr. Marcos Palomino 139 (antes Domingo Nieto) Pueblo Libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', NULL, '930267023', 1);
SET @id_sede_340 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_340, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [341] Veterinaria Animal Land SAC
--       RUC: 20609090171  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Veterinaria Animal Land SAC', 'RUC', '20609090171', 1);
SET @id_cliente_341 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_341, 'Veterinaria Animal Land SAC', '20609090171', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_341 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_341, 'Centro Médico Veterinario Animal Land', 'Av. Mariano H. Cornejo 1085. Pueblo Libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 'MAYRA TORRES', '993754332', 1);
SET @id_sede_341 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_341, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [342] GASTRO DIGESTIVO SAC
--       RUC: 20608381377  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GASTRO DIGESTIVO SAC', 'RUC', '20608381377', 1);
SET @id_cliente_342 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_342, 'GASTRO DIGESTIVO SAC', '20608381377', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_342 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_342, 'GASTRO DIGESTIVO', 'AV. LA MARINA 509 PUEBLO LIBRE', 'PUEBLO LIBRE', 'LIMA', 'LIMA', NULL, '941319852', 1);
SET @id_sede_342 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_342, '2026-07-03', 'mensual', 150.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [343] CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C.
--       RUC: 20609381834  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C.', 'RUC', '20609381834', 1);
SET @id_cliente_343 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_343, 'CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C.', '20609381834', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_343 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_343, 'veterinaria Candy', 'Calle prolongación Cayetano Heredia 311 "A" Pueblo Libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 'JOSELYN VILLALOBOS - recp', '2632782', 1);
SET @id_sede_343 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_343, '2026-07-03', 'mensual', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [344] VETERINARIOS PET+PERU S.A.C.
--       RUC: 20611970332  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIOS PET+PERU S.A.C.', 'RUC', '20611970332', 1);
SET @id_cliente_344 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_344, 'VETERINARIOS PET+PERU S.A.C.', '20611970332', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_344 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_344, 'Pet a Pet', 'Valencia 479 Pueblo libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 'ADRIAN SHIMABUKURO', NULL, 1);
SET @id_sede_344 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_344, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [345] VETERINARIA DEL RIO EIRL
--       RUC: 20614180952  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA DEL RIO EIRL', 'RUC', '20614180952', 1);
SET @id_cliente_345 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_345, 'VETERINARIA DEL RIO EIRL', '20614180952', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_345 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_345, 'VETERINARIA DEL RIO', 'AV. DEL RIO NRO. 388 URB.', 'PUEBLO LIBRE', 'LIMA', 'LIMA', NULL, '915003266', 1);
SET @id_sede_345 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_345, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [346] Wilmer Vasquez Ramirez
--       RUC: 10103985191  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Wilmer Vasquez Ramirez', 'RUC', '10103985191', 1);
SET @id_cliente_346 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_346, 'Wilmer Vasquez Ramirez', '10103985191', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_346 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_346, 'Grooming Pets', 'AV. LA MARINA 250 PUEBLO LIBRE', 'PUEBLO LIBRE', 'LIMA', 'LIMA', NULL, '993002363', 1);
SET @id_sede_346 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_346, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [347] Olivia Paola Carmona Quispe
--       RUC: 10704450996  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Olivia Paola Carmona Quispe', 'RUC', '10704450996', 1);
SET @id_cliente_347 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_347, 'Olivia Paola Carmona Quispe', '10704450996', 'PUEBLO LIBRE', 'LIMA', 'LIMA', 1);
SET @id_empresa_347 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_347, 'Aristopaws - Pet Care', 'Paseo Libertad 351-A, Pueblo libre', 'PUEBLO LIBRE', 'LIMA', 'LIMA', NULL, '937526092', 1);
SET @id_sede_347 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_347, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [348] Fiorella Quineche Andrade
--       RUC: 10417554691  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Fiorella Quineche Andrade', 'RUC', '10417554691', 1);
SET @id_cliente_348 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_348, 'Fiorella Quineche Andrade', '10417554691', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_348 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_348, 'Centro odontológico Qhalident', 'Av. Hipólito unanue #218 2 do piso Callao', 'CALLAO', 'LIMA', 'LIMA', 'DRA FIORELLA / ASIST. LUIS LOPEZ', '924644600', 1);
SET @id_sede_348 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_348, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [349] VETERINARIA 4PATAS SOCIEDAD ANONIMA CERRADA
--       RUC: 20609482231  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA 4PATAS SOCIEDAD ANONIMA CERRADA', 'RUC', '20609482231', 1);
SET @id_cliente_349 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_349, 'VETERINARIA 4PATAS SOCIEDAD ANONIMA CERRADA', '20609482231', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_349 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_349, 'VETERINARIA 4PATAS', 'Av. Oscar R. Benavides 2836/2838 Bellavista Callao', 'CALLAO', 'LIMA', 'LIMA', 'DR. PAUL ROJAS', '964882350', 1);
SET @id_sede_349 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_349, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [350] Servicios veterinarios Pet''s Medic sac
--       RUC: 20603950578  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Servicios veterinarios Pet''s Medic sac', 'RUC', '20603950578', 1);
SET @id_cliente_350 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_350, 'Servicios veterinarios Pet''s Medic sac', '20603950578', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_350 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_350, 'Pet''s Medic', 'AV. VICTOR RAUL HAYA DE LA TORRE MZA. B LOTE. 8 URB. LA ESTANCIA  - LA PERLA', 'CALLAO', 'LIMA', 'LIMA', 'PAOLA CASAS', '932038778', 1);
SET @id_sede_350 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_350, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [351] CENTRO ODONTOLÓGICO BENJAMÍN DOIG SAC
--       RUC: 20607006335  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO ODONTOLÓGICO BENJAMÍN DOIG SAC', 'RUC', '20607006335', 1);
SET @id_cliente_351 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_351, 'CENTRO ODONTOLÓGICO BENJAMÍN DOIG SAC', '20607006335', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_351 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_351, 'Benjamín Doig Odontología & Fisioterapia', 'Urb Benjamín Doig MZ F1 Lt 15 Pasaje Los Eucaliptos La Perla', 'CALLAO', 'LIMA', 'LIMA', NULL, '997635437', 1);
SET @id_sede_351 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_351, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [352] V&V Pets and Foods SAC
--       RUC: 20606195908  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('V&V Pets and Foods SAC', 'RUC', '20606195908', 1);
SET @id_cliente_352 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_352, 'V&V Pets and Foods SAC', '20606195908', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_352 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_352, 'Veterinaria Dodovet', 'Av Santa Rosa 519 local 02, Callao', 'CALLAO', 'LIMA', 'LIMA', 'HUGO VALDIVIA', '981195750', 1);
SET @id_sede_352 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_352, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [353] THE GROOMING PLACE-VETERINARIA & PET SHOP S.A.C.
--       RUC: 20613113721  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('THE GROOMING PLACE-VETERINARIA & PET SHOP S.A.C.', 'RUC', '20613113721', 1);
SET @id_cliente_353 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_353, 'THE GROOMING PLACE-VETERINARIA & PET SHOP S.A.C.', '20613113721', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_353 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_353, 'The groming place', 'Av haya de la torre mz l lt 14 - Bellavista', 'CALLAO', 'LIMA', 'LIMA', NULL, '901498158', 1);
SET @id_sede_353 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_353, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [354] JMP SERVICE S.A.C.
--       RUC: 20609968533  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JMP SERVICE S.A.C.', 'RUC', '20609968533', 1);
SET @id_cliente_354 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_354, 'JMP SERVICE S.A.C.', '20609968533', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_354 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_354, 'VETERIANRIA ANIMANIAK', 'AV FAUCETT 1863, BELLAVISTA', 'CALLAO', 'LIMA', 'LIMA', 'INES SABORIO', NULL, 1);
SET @id_sede_354 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_354, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [355] CASALT MULTISERVICIOS SAC
--       RUC: 20612308471  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CASALT MULTISERVICIOS SAC', 'RUC', '20612308471', 1);
SET @id_cliente_355 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_355, 'CASALT MULTISERVICIOS SAC', '20612308471', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_355 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_355, 'MULTIDENT FAUCETT', 'AV ELMER FAUCETT 1651 BELLAVISTA CALLAO', 'CALLAO', 'LIMA', 'LIMA', NULL, '949098655', 1);
SET @id_sede_355 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_355, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [356] Luz pilar solis javier
--       RUC: 10258012599  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Luz pilar solis javier', 'RUC', '10258012599', 1);
SET @id_cliente_356 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_356, 'Luz pilar solis javier', '10258012599', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_356 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_356, 'VETERINARIA COLITAS', 'av. Miguel Grau(ex buenos aires) 1103 callao', 'CALLAO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_356 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_356, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [357] HERNANDEZ ANDRADE MILIUSKA EDWIUMAR
--       RUC: 15604273886  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('HERNANDEZ ANDRADE MILIUSKA EDWIUMAR', 'RUC', '15604273886', 1);
SET @id_cliente_357 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_357, 'HERNANDEZ ANDRADE MILIUSKA EDWIUMAR', '15604273886', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_357 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_357, 'Posta veterinaria MV', 'Av. Víctor Raúl Haya de la torre 220 - La Perla', 'CALLAO', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_357 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_357, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [358] VETERINARIA MATUTE SAC
--       RUC: 20614380188  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETERINARIA MATUTE SAC', 'RUC', '20614380188', 1);
SET @id_cliente_358 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_358, 'VETERINARIA MATUTE SAC', '20614380188', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_358 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_358, 'VETERINARIA MATUTE', 'CALLE LOS EUCALIPTOS 504 BELLAVISTA CALLAO', 'CALLAO', 'LIMA', 'LIMA', NULL, '988180383', 1);
SET @id_sede_358 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_358, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [359] QUICENTRODENTAL EIRL
--       RUC: 20604167320  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('QUICENTRODENTAL EIRL', 'RUC', '20604167320', 1);
SET @id_cliente_359 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_359, 'QUICENTRODENTAL EIRL', '20604167320', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_359 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_359, 'QUICENTRODENTAL', 'AV VENEZUELA 2499 dpto B,URB SANTA CECILIA, BELLAVISTA', 'CALLAO', 'LIMA', 'LIMA', NULL, '964321882', 1);
SET @id_sede_359 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_359, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [360] VET BELLAVISTA SAC
--       RUC: 20615213331  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VET BELLAVISTA SAC', 'RUC', '20615213331', 1);
SET @id_cliente_360 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_360, 'VET BELLAVISTA SAC', '20615213331', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_360 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_360, 'Clinica Veterinaria Bellavista', 'AV. BUENOS AIRES 1436 URB. BELLAVISTA CALLAO', 'CALLAO', 'LIMA', 'LIMA', NULL, '942714712', 1);
SET @id_sede_360 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_360, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [361] Alorella Dent Sac
--       RUC: 20615481654  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Alorella Dent Sac', 'RUC', '20615481654', 1);
SET @id_cliente_361 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_361, 'Alorella Dent Sac', '20615481654', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_361 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_361, 'Alorella Dent', 'Calle Corales 320 Urb. Benjamin doig La Perla- Callao', 'CALLAO', 'LIMA', 'LIMA', NULL, '936152818', 1);
SET @id_sede_361 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_361, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [362] BUSTINZA RODRIGUEZ OLGA MARINA
--       RUC: 10004959464  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('BUSTINZA RODRIGUEZ OLGA MARINA', 'RUC', '10004959464', 1);
SET @id_cliente_362 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_362, 'BUSTINZA RODRIGUEZ OLGA MARINA', '10004959464', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_362 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_362, 'Veterinaria Ariel''s', 'AV LOS PROCERES 115 - SMP', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'LESLY ABRAHAN / JAMIR', NULL, 1);
SET @id_sede_362 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_362, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [363] Veterinaria Sanivet SAC
--       RUC: 20612144223  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Veterinaria Sanivet SAC', 'RUC', '20612144223', 1);
SET @id_cliente_363 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_363, 'Veterinaria Sanivet SAC', '20612144223', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_363 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_363, 'Sanivet clínica veterinaria', 'Calle Santa María Reyna MZ z lote 02, urb San Diego SMP', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'EFRAIN', '993818700', 1);
SET @id_sede_363 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_363, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [364] Christina Inga Villanueva
--       RUC: 10445138318  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Christina Inga Villanueva', 'RUC', '10445138318', 1);
SET @id_cliente_364 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_364, 'Christina Inga Villanueva', '10445138318', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_364 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_364, 'Consultorios Family Pets SMP', 'Calle Manuel tellería 127 condevilla señor SMP', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'Raul Enrique Cáceres Rodríguez', NULL, 1);
SET @id_sede_364 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_364, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [365] DENTAL SALCEDO SAC
--       RUC: 20615633683  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DENTAL SALCEDO SAC', 'RUC', '20615633683', 1);
SET @id_cliente_365 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_365, 'DENTAL SALCEDO SAC', '20615633683', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_365 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_365, 'DENTAL SALCEDO SAC', 'AV PERU 3760 - SMP', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'MARGELIS -SECRET', '015681062', 1);
SET @id_sede_365 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_365, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [366] MELYSALUD S.A.C
--       RUC: 20553512281  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MELYSALUD S.A.C', 'RUC', '20553512281', 1);
SET @id_cliente_366 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_366, 'MELYSALUD S.A.C', '20553512281', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_366 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_366, 'MELYSALUD', 'Av Perú  3785 smp', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'DR.JULIO YAYA', '970726281', 1);
SET @id_sede_366 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_366, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [367] Gino Antero Gambini Cercado
--       RUC: 10722267791  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Gino Antero Gambini Cercado', 'RUC', '10722267791', 1);
SET @id_cliente_367 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_367, 'Gino Antero Gambini Cercado', '10722267791', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_367 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_367, 'Consultorio dental Akiba', 'Av Jose Granda 3309 2do piso', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'GINO GAMBINI', '958227084', 1);
SET @id_sede_367 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_367, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [368] Malu Fernandez Rodriguez
--       RUC: 10418172890  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Malu Fernandez Rodriguez', 'RUC', '10418172890', 1);
SET @id_cliente_368 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_368, 'Malu Fernandez Rodriguez', '10418172890', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_368 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_368, 'VETERINARIA PARAISO', 'av santa Rosa B_21 01 asoc Coopip', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'YOLANDA SALAZAR', NULL, 1);
SET @id_sede_368 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_368, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [369] Marisol Gaona Valderrama
--       RUC: 10754878253  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Marisol Gaona Valderrama', 'RUC', '10754878253', 1);
SET @id_cliente_369 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_369, 'Marisol Gaona Valderrama', '10754878253', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_369 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_369, 'D''SALUD ANIMAL', 'Av Pacasmayo Mz A Lt8 Chavín 4ta etapa', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, '925667650', 1);
SET @id_sede_369 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_369, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [370] SANTOS MERA CINDY STHEFANY
--       RUC: 10472383952  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SANTOS MERA CINDY STHEFANY', 'RUC', '10472383952', 1);
SET @id_cliente_370 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_370, 'SANTOS MERA CINDY STHEFANY', '10472383952', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_370 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_370, 'My vet', 'JR. Pisac Mz. Lt 21 URB San Remo II - SMP', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, '987332694', 1);
SET @id_sede_370 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_370, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [371] GALLO CABALLERO ANGELO JULIO GUILLERMO
--       RUC: 10099525661  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GALLO CABALLERO ANGELO JULIO GUILLERMO', 'RUC', '10099525661', 1);
SET @id_cliente_371 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_371, 'GALLO CABALLERO ANGELO JULIO GUILLERMO', '10099525661', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_371 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_371, 'GALLO CABALLERO ANGELO JULIO GUILLERMO', 'Av San José Mz A Lt 12 Int. 1, Urb Las Mercedes, II Etapa, San Martin de Porres', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_371 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_371, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [372] FAMILIA MUELITAS SAC
--       RUC: 20615598349  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('FAMILIA MUELITAS SAC', 'RUC', '20615598349', 1);
SET @id_cliente_372 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_372, 'FAMILIA MUELITAS SAC', '20615598349', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_372 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_372, 'DOCTORES & MUELITAS', 'AV 12 DE OCTUBRE  381-A  SAN MARTIN DE PORRES', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_372 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_372, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [373] JARA VENTURA JOSE GIAN CARLO
--       RUC: 10421127269  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JARA VENTURA JOSE GIAN CARLO', 'RUC', '10421127269', 1);
SET @id_cliente_373 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_373, 'JARA VENTURA JOSE GIAN CARLO', '10421127269', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_373 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_373, 'Dental Estétic Jará V & Llanos', 'calle6 abril, Mz80, Lt1.AAHH municipal Chillón - Los olivos', 'LOS OLIVOS', 'LIMA', 'LIMA', 'MERY LLANOS', NULL, 1);
SET @id_sede_373 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_373, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [374] Bastidas Benites Alejandro Jaime Leonardo
--       RUC: 10731763416  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Bastidas Benites Alejandro Jaime Leonardo', 'RUC', '10731763416', 1);
SET @id_cliente_374 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_374, 'Bastidas Benites Alejandro Jaime Leonardo', '10731763416', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_374 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_374, 'Veterinaria Médica Pets', 'JR. Sao Paulo 1707- SAN MARTIN DE PORRES', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'ALEJANDRO', '951341665', 1);
SET @id_sede_374 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_374, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [375] Denthalix E.I.R.L.
--       RUC: 20613766295  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Denthalix E.I.R.L.', 'RUC', '20613766295', 1);
SET @id_cliente_375 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_375, 'Denthalix E.I.R.L.', '20613766295', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_375 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_375, 'Denthalix', 'Av. Juan Vicente Nicolini 320 - SMP', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, '950277049', 1);
SET @id_sede_375 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_375, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [376] CENTRO DENTAL LIMA NORTE
--       RUC: 20605177302  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO DENTAL LIMA NORTE', 'RUC', '20605177302', 1);
SET @id_cliente_376 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_376, 'CENTRO DENTAL LIMA NORTE', '20605177302', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_376 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_376, 'MENTA DENTISTAS', 'AV. TOMAS VALLE MZ G LT 7 URBANIZACION LUIS A. SANCHEZ', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'LESLIE TUANAMA', NULL, 1);
SET @id_sede_376 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_376, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [377] Emily Liliana Llacza Arellano
--       RUC: 10739542885  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Emily Liliana Llacza Arellano', 'RUC', '10739542885', 1);
SET @id_cliente_377 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_377, 'Emily Liliana Llacza Arellano', '10739542885', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_377 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_377, 'Are dent', 'Avenida Honorio delgado 351 Interior 201 smp', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, '949377396', 1);
SET @id_sede_377 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_377, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [378] Clínica Dental Brisa SAC
--       RUC: 20545590205  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica Dental Brisa SAC', 'RUC', '20545590205', 1);
SET @id_cliente_378 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_378, 'Clínica Dental Brisa SAC', '20545590205', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_378 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_378, 'Brisadent', 'Av. Tomás Valle  385', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'JUDITH VILLANUEVA', NULL, 1);
SET @id_sede_378 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_378, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [379] BYMDENT SAC
--       RUC: 20614287056  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('BYMDENT SAC', 'RUC', '20614287056', 1);
SET @id_cliente_379 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_379, 'BYMDENT SAC', '20614287056', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_379 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_379, 'BYMDENT SAC', 'AV. GERARDO UNGER 547 URB., INGENIERIA', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, '996312327', 1);
SET @id_sede_379 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_379, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [380] ILUMINITY DENT SAC
--       RUC: 20608585509  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ILUMINITY DENT SAC', 'RUC', '20608585509', 1);
SET @id_cliente_380 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_380, 'ILUMINITY DENT SAC', '20608585509', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_380 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_380, 'ILUMINITY DENT', 'AV UNIVERSITARIA 657', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 'GERALDINE', NULL, 1);
SET @id_sede_380 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_380, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [381] CORPORACION EMPRESARIAL SEGURA SAC
--       RUC: 20608245414  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION EMPRESARIAL SEGURA SAC', 'RUC', '20608245414', 1);
SET @id_cliente_381 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_381, 'CORPORACION EMPRESARIAL SEGURA SAC', '20608245414', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_381 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_381, 'SONRISA SEGURA SAN MARTIN DE PORRES', 'AV. EDUARDO DE HABICH NRO. 146 DPTO. PSO2 URB. INGENIERIA III (CUADRA 1 LADO DERECHO) LIMA - LIMA - SAN MARTIN DE PORRES', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_381 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_381, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [382] Aldo Enrique Gabriel Flores
--       RUC: 10099131166  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Aldo Enrique Gabriel Flores', 'RUC', '10099131166', 1);
SET @id_cliente_382 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_382, 'Aldo Enrique Gabriel Flores', '10099131166', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', 1);
SET @id_empresa_382 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_382, 'Estética dental AGF', 'AV. ALFREDO MENDIOLA 1582 1PISO URB. FIORI', 'SAN MARTIN DE PORRES', 'LIMA', 'LIMA', NULL, '993277137', 1);
SET @id_sede_382 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_382, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [383] IED INVERSIONES SAC
--       RUC: 20608615611  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('IED INVERSIONES SAC', 'RUC', '20608615611', 1);
SET @id_cliente_383 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_383, 'IED INVERSIONES SAC', '20608615611', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_383 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_383, 'IEDENTAL', 'JR. TUPAC YUPANQUI 7140 URB. TREBOL', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, '946678501', 1);
SET @id_sede_383 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_383, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [384] ACERO PULIDO ESTHER JEANETTE
--       RUC: 10424571330  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ACERO PULIDO ESTHER JEANETTE', 'RUC', '10424571330', 1);
SET @id_cliente_384 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_384, 'ACERO PULIDO ESTHER JEANETTE', '10424571330', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_384 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_384, 'Dental Smile Center', 'Angélica Gamarra de León Velarde 907 , Los Olivos.', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_384 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_384, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [385] ROSARIO FARIAS SERVICIOS VETERINARIOS E.I.R.L.
--       RUC: 20504596754  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ROSARIO FARIAS SERVICIOS VETERINARIOS E.I.R.L.', 'RUC', '20504596754', 1);
SET @id_cliente_385 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_385, 'ROSARIO FARIAS SERVICIOS VETERINARIOS E.I.R.L.', '20504596754', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_385 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_385, 'ECOVET', 'Av. Paso de los Andes 189 Maranga San Miguel', 'SAN MIGUEL', 'LIMA', 'LIMA', 'ROSARIO FARIAS', '995726990', 1);
SET @id_sede_385 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_385, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [386] Clínica odontológica Feijoo Eirl
--       RUC: 20602434916  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica odontológica Feijoo Eirl', 'RUC', '20602434916', 1);
SET @id_cliente_386 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_386, 'Clínica odontológica Feijoo Eirl', '20602434916', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_386 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_386, 'Centro Odontológico Feijoo', 'Av la Marina 2517 of 200c San Miguel', 'SAN MIGUEL', 'LIMA', 'LIMA', 'arla', '925395700', 1);
SET @id_sede_386 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_386, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [387] Servicios Veterinarios Pets Sites SAC
--       RUC: 20612298832  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Servicios Veterinarios Pets Sites SAC', 'RUC', '20612298832', 1);
SET @id_cliente_387 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_387, 'Servicios Veterinarios Pets Sites SAC', '20612298832', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_387 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_387, 'Veterinaria Pets Sites', 'AV UNIVERSITARIA 2029 SAN MIGUEL', 'SAN MIGUEL', 'LIMA', 'LIMA', NULL, '991627512', 1);
SET @id_sede_387 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_387, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [388] HEALTHY PETS HERMANOS SAC
--       RUC: 20612705951  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('HEALTHY PETS HERMANOS SAC', 'RUC', '20612705951', 1);
SET @id_cliente_388 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_388, 'HEALTHY PETS HERMANOS SAC', '20612705951', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_388 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_388, 'HEALTHY PETS HERMANOS SAC', 'AV VENEZUELA 6145 SAN MIGUEL', 'SAN MIGUEL', 'LIMA', 'LIMA', NULL, '987126399', 1);
SET @id_sede_388 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_388, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [389] Milagros del Rosario Mora Marquina
--       RUC: 10459641829  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Milagros del Rosario Mora Marquina', 'RUC', '10459641829', 1);
SET @id_cliente_389 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_389, 'Milagros del Rosario Mora Marquina', '10459641829', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_389 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_389, 'MilyVet Servicios Veterinarios', 'Jr. Coronel Inclán 238-A. San Miguel', 'SAN MIGUEL', 'LIMA', 'LIMA', 'MILAGROS MORA', '993872760', 1);
SET @id_sede_389 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_389, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [390] VELASCO GUERRERO MERCEDES JAQUELIN
--       RUC: 10469015608  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VELASCO GUERRERO MERCEDES JAQUELIN', 'RUC', '10469015608', 1);
SET @id_cliente_390 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_390, 'VELASCO GUERRERO MERCEDES JAQUELIN', '10469015608', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_390 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_390, 'CONSULTORIO DRA MERCEDES', 'calle fray Martín de murua 150. Oficina 704. San Miguel', 'SAN MIGUEL', 'LIMA', 'LIMA', 'MERCEDES VELAZCO', '972560003', 1);
SET @id_sede_390 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_390, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [391] YAURI HUIZA ROGER JHOSEF
--       RUC: 10422960304  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('YAURI HUIZA ROGER JHOSEF', 'RUC', '10422960304', 1);
SET @id_cliente_391 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_391, 'YAURI HUIZA ROGER JHOSEF', '10422960304', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_391 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_391, 'CODESst Odontología especializada', 'Av. Universitaria 672 Of.2 San Miguel', 'SAN MIGUEL', 'LIMA', 'LIMA', 'Roger Jhosef Yauri Huiza.', '964365171', 1);
SET @id_sede_391 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_391, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [392] Andrea Contreras Consultorio Odontológico SAC
--       RUC: 20611285974  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Andrea Contreras Consultorio Odontológico SAC', 'RUC', '20611285974', 1);
SET @id_cliente_392 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_392, 'Andrea Contreras Consultorio Odontológico SAC', '20611285974', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_392 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_392, 'Andrea Contreras Consultorio Odontológico', 'Av. La Marina Edif 2529. intercomunicador 202. consultorio 202. Al costado de inversiones la cruz.', 'SAN MIGUEL', 'LIMA', 'LIMA', 'ANDREA CONTRERAS', '946579419', 1);
SET @id_sede_392 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_392, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [393] LA BARATISIMA SAC
--       RUC: 20601353041  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LA BARATISIMA SAC', 'RUC', '20601353041', 1);
SET @id_cliente_393 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_393, 'LA BARATISIMA SAC', '20601353041', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_393 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_393, 'SONRISA SEGURA SAN MIGUEL', 'AV. BRIGIDA SILVA DE OCHOA NRO. 398 INT. 204 URB. PANDO ET. DOS LIMA - LIMA - SAN MIGUEL', 'SAN MIGUEL', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_393 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_393, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [394] Panoral Sac
--       RUC: 20478196106  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Panoral Sac', 'RUC', '20478196106', 1);
SET @id_cliente_394 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_394, 'Panoral Sac', '20478196106', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_394 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_394, 'Comercial Panoral', 'Av. La Marina 2659 San Miguel', 'SAN MIGUEL', 'LIMA', 'LIMA', NULL, '996944517', 1);
SET @id_sede_394 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_394, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [395] G&R House SAC
--       RUC: 20615032965  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('G&R House SAC', 'RUC', '20615032965', 1);
SET @id_cliente_395 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_395, 'G&R House SAC', '20615032965', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_395 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_395, 'Nova PET Spa', 'Calle Prolongación Manco Segundo 113-A', 'SAN MIGUEL', 'LIMA', 'LIMA', NULL, '934231090', 1);
SET @id_sede_395 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_395, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [396] CABALLERO NUÑEZ GUILLERMO ENRIQUE
--       RUC: 10033804364  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CABALLERO NUÑEZ GUILLERMO ENRIQUE', 'RUC', '10033804364', 1);
SET @id_cliente_396 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_396, 'CABALLERO NUÑEZ GUILLERMO ENRIQUE', '10033804364', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_396 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_396, 'CLINICA DENTAL ARMONIA', 'Av. Alfredo Mendiola 5559 Los Olivos', 'LOS OLIVOS', 'LIMA', 'LIMA', 'Lizbeth Tapia', '982851579', 1);
SET @id_sede_396 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_396, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [397] RIVERA CASTRO PAMELA LISSET
--       RUC: 10467049599  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RIVERA CASTRO PAMELA LISSET', 'RUC', '10467049599', 1);
SET @id_cliente_397 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_397, 'RIVERA CASTRO PAMELA LISSET', '10467049599', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_397 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_397, 'Dra. Rivera', 'Av. Las palmeras 5710. Urb. Villa norte. Los olivos', 'LOS OLIVOS', 'LIMA', 'LIMA', 'DRA PAMELA RIVERA', '951680758', 1);
SET @id_sede_397 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_397, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [398] CENTRO GINECO OBSTETRICO CONCEBIR EIRL
--       RUC: 20608547780  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO GINECO OBSTETRICO CONCEBIR EIRL', 'RUC', '20608547780', 1);
SET @id_cliente_398 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_398, 'CENTRO GINECO OBSTETRICO CONCEBIR EIRL', '20608547780', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_398 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_398, 'CENTRO GINECO OBSTETRICO CONCEBIR EIRL', 'JR CONFRATERNIDAD 554 PISO 2  URB PRO 2da ETAPA - LOS OLIVOS', 'LOS OLIVOS', 'LIMA', 'LIMA', 'JULY SOSA', '987613902', 1);
SET @id_sede_398 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_398, '2026-07-03', 'mensual', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [399] Corporación copito y danna  SAC
--       RUC: 20613878182  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Corporación copito y danna  SAC', 'RUC', '20613878182', 1);
SET @id_cliente_399 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_399, 'Corporación copito y danna  SAC', '20613878182', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_399 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_399, 'DENTIFRANK TRAINER', 'AV.RIO MARAÑON 735. URB. LOS PEREGRINOS DEL SEÑOR. LOS OLIVOS.', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, '924447152', 1);
SET @id_sede_399 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_399, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [400] LABORATORIO CLINICO ESPECIALIZADO HEMOLAB EIRL
--       RUC: 20608531468  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LABORATORIO CLINICO ESPECIALIZADO HEMOLAB EIRL', 'RUC', '20608531468', 1);
SET @id_cliente_400 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_400, 'LABORATORIO CLINICO ESPECIALIZADO HEMOLAB EIRL', '20608531468', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_400 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_400, 'HEMOLAB', 'AV MARAÑON MZ D  LOTE 7  ASOCIACION DE PROPIETARIOS DEL NORTE - LOS OLIVOS', 'LOS OLIVOS', 'LIMA', 'LIMA', 'FERNANDO MENDOZA', '982057478', 1);
SET @id_sede_400 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_400, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [401] MANRIQUE CHUQUISPUMA DARIO CRISANTO
--       RUC: 10439236219  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MANRIQUE CHUQUISPUMA DARIO CRISANTO', 'RUC', '10439236219', 1);
SET @id_cliente_401 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_401, 'MANRIQUE CHUQUISPUMA DARIO CRISANTO', '10439236219', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_401 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_401, 'Veterinaria Betolandia y sus amigos', 'Avenida Betancourt Mz 83 Lt 24 (Enrique Milla Ochoa - Los Olivos )', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_401 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_401, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [402] SOTO ABARCA EDGARD ANTENOR
--       RUC: 10086344772  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SOTO ABARCA EDGARD ANTENOR', 'RUC', '10086344772', 1);
SET @id_cliente_402 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_402, 'SOTO ABARCA EDGARD ANTENOR', '10086344772', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_402 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_402, 'Mi mundo Peludo', 'Jirón Manuel Ascencio Segura 202. Urb. Villa los Ángeles. Los olivos', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_402 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_402, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [403] CUENCA CARRION CARMEN
--       RUC: 10480336793  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CUENCA CARRION CARMEN', 'RUC', '10480336793', 1);
SET @id_cliente_403 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_403, 'CUENCA CARRION CARMEN', '10480336793', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_403 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_403, '3C ESTETICA', 'AV. SANTIAGO ANTUNEZ DE MAYOLO 1137 , LOS OLIVOS', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, '935291146', 1);
SET @id_sede_403 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_403, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [404] Karen Katherine Hernández Caba
--       RUC: 10467128171  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Karen Katherine Hernández Caba', 'RUC', '10467128171', 1);
SET @id_cliente_404 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_404, 'Karen Katherine Hernández Caba', '10467128171', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_404 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_404, 'MédicaDental – Odontología Integral', 'Av . Los Alisos 881 - Los Olivos', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_404 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_404, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [405] CCORI SUMAQ SRL
--       RUC: 20608165623  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CCORI SUMAQ SRL', 'RUC', '20608165623', 1);
SET @id_cliente_405 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_405, 'CCORI SUMAQ SRL', '20608165623', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_405 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_405, 'CCORI SUMAQ SRL', 'Avenida Carlos Izaguirre 1244 segundo piso. Los Olivos.', 'LOS OLIVOS', 'LIMA', 'LIMA', 'Nataly Lora Huanay', '958689131', 1);
SET @id_sede_405 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_405, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [406] Inversiones ceofam sac
--       RUC: 20510055897  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Inversiones ceofam sac', 'RUC', '20510055897', 1);
SET @id_cliente_406 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_406, 'Inversiones ceofam sac', '20510055897', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_406 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_406, 'FAMIDENTAL', 'Jr orion 328 urb mercurio los olivos', 'LOS OLIVOS', 'LIMA', 'LIMA', 'GRTE ADMINISTRATIVO JOSE MEDINA', '956550885', 1);
SET @id_sede_406 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_406, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [407] ESPECIALIDADES MEDICAS VETERINARIAS S.A.C. - ESMEVET
--       RUC: 20608063936  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ESPECIALIDADES MEDICAS VETERINARIAS S.A.C. - ESMEVET', 'RUC', '20608063936', 1);
SET @id_cliente_407 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_407, 'ESPECIALIDADES MEDICAS VETERINARIAS S.A.C. - ESMEVET', '20608063936', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_407 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_407, 'CEDIVET HOSPITAL', 'AV. CARLOS IZAGUIRRE 1280 LOS OLIVOS', 'LOS OLIVOS', 'LIMA', 'LIMA', 'SILVANA ALEJOS', NULL, 1);
SET @id_sede_407 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_407, '2026-07-03', 'mensual', 94.4, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [408] CLINICA DENTAL DIGITAL E.I.R.L.
--       RUC: 20614272792  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA DENTAL DIGITAL E.I.R.L.', 'RUC', '20614272792', 1);
SET @id_cliente_408 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_408, 'CLINICA DENTAL DIGITAL E.I.R.L.', '20614272792', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_408 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_408, 'CLINICA DENTAL DIGITAL E.I.R.L.', 'AV. CARLOS ALBERTO IZAGUIRRE NRO. 968 URB. LAS PALMERAS', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, '985972665', 1);
SET @id_sede_408 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_408, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [409] CENTRO DE ESPECIALIDADES MEDICAS CORAZÓN DE JESÚS E.I.R
--       RUC: 20609000881  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO DE ESPECIALIDADES MEDICAS CORAZÓN DE JESÚS E.I.R.L.', 'RUC', '20609000881', 1);
SET @id_cliente_409 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_409, 'CENTRO DE ESPECIALIDADES MEDICAS CORAZÓN DE JESÚS E.I.R.L.', '20609000881', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_409 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_409, 'CENTRO DE ESPECIALIDADES MEDICAS CORAZÓN DE JESÚS', 'AV. ALFREDO MENDIOLA 3857 DPTO. 201 URB. PANAMERICANA NORTE', 'LOS OLIVOS', 'LIMA', 'LIMA', 'ESTHER', '912295146', 1);
SET @id_sede_409 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_409, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [410] ORTOSTETIC SONRISA SAC
--       RUC: 20610237429  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ORTOSTETIC SONRISA SAC', 'RUC', '20610237429', 1);
SET @id_cliente_410 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_410, 'ORTOSTETIC SONRISA SAC', '20610237429', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_410 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_410, 'DR SONRISA', 'AV CARLOS IZAGUIRRE 728 2 PISO URB LAS PALMERAS DE LOS OLIVOS', 'LOS OLIVOS', 'LIMA', 'LIMA', 'YVAN RUIZ', NULL, 1);
SET @id_sede_410 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_410, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [411] INVERSIONES ENCANTHADA S.A.C
--       RUC: 20613727052  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INVERSIONES ENCANTHADA S.A.C', 'RUC', '20613727052', 1);
SET @id_cliente_411 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_411, 'INVERSIONES ENCANTHADA S.A.C', '20613727052', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_411 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_411, 'DENTAL HADA', 'JR. ORION 348 URB. MERCURIO', 'LOS OLIVOS', 'LIMA', 'LIMA', 'TERESA FUERTES', '903479433', 1);
SET @id_sede_411 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_411, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [412] GRUPO SALUD DENTAL SAC
--       RUC: 20609199823  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO SALUD DENTAL SAC', 'RUC', '20609199823', 1);
SET @id_cliente_412 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_412, 'GRUPO SALUD DENTAL SAC', '20609199823', 'LOS OLIVOS', 'LIMA', 'LIMA', 1);
SET @id_empresa_412 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_412, 'SONRISA SEGURA LOS OLIVOS', 'AV. CARLOS ALBERTO IZAGUIRRE NRO. 757 URB. PANAMERICANA NORTE (2DO PISO) LIMA - LIMA - LOS OLIVOS', 'LOS OLIVOS', 'LIMA', 'LIMA', NULL, '997150766', 1);
SET @id_sede_412 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_412, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [413] NAPURI REJAS FERNANDO ISIDORO
--       RUC: 10410545573  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('NAPURI REJAS FERNANDO ISIDORO', 'RUC', '10410545573', 1);
SET @id_cliente_413 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_413, 'NAPURI REJAS FERNANDO ISIDORO', '10410545573', '118', 'LIMA', 'LIMA', 1);
SET @id_empresa_413 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_413, 'NAPURI REJAS FERNANDO ISIDORO', 'CHINCHA', '118', 'LIMA', 'LIMA', '954 774 392', NULL, 1);
SET @id_sede_413 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_413, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [414] SERVICIOS MEDICOS INTEGRALES FAMISALUD SAC
--       RUC: 20508181796  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SERVICIOS MEDICOS INTEGRALES FAMISALUD SAC', 'RUC', '20508181796', 1);
SET @id_cliente_414 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_414, 'SERVICIOS MEDICOS INTEGRALES FAMISALUD SAC', '20508181796', '250', 'LIMA', 'LIMA', 1);
SET @id_empresa_414 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_414, 'SERVICIOS MEDICOS INTEGRALES FAMISALUD SAC', 'CHINCHA PISCO', '250', 'LIMA', 'LIMA', '934 925 664', NULL, 1);
SET @id_sede_414 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_414, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [415] Asociación Civil San Martin de Porres Perú ONG
--       RUC: 20609198801  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Asociación Civil San Martin de Porres Perú ONG', 'RUC', '20609198801', 1);
SET @id_cliente_415 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_415, 'Asociación Civil San Martin de Porres Perú ONG', '20609198801', '350', 'LIMA', 'LIMA', 1);
SET @id_empresa_415 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_415, 'Policlínico Solidario de Chincha', 'CHINCHA', '350', 'LIMA', 'LIMA', '956784052', NULL, 1);
SET @id_sede_415 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_415, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [416] SERVICIOS MEDICOS ESPECIALIZADO CERVANTES EIRL
--       RUC: 20607975087  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SERVICIOS MEDICOS ESPECIALIZADO CERVANTES EIRL', 'RUC', '20607975087', 1);
SET @id_cliente_416 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_416, 'SERVICIOS MEDICOS ESPECIALIZADO CERVANTES EIRL', '20607975087', '250', 'LIMA', 'LIMA', 1);
SET @id_empresa_416 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_416, 'SERVICIOS MEDICOS ESPECIALIZADO CERVANTES EIRL', 'CHINCHA', '250', 'LIMA', 'LIMA', '986 018 957/920 363 500', NULL, 1);
SET @id_sede_416 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_416, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [417] CORPORACION MEDICA D´NORA SAC
--       RUC: 20604975736  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION MEDICA D´NORA SAC', 'RUC', '20604975736', 1);
SET @id_cliente_417 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_417, 'CORPORACION MEDICA D´NORA SAC', '20604975736', '350', 'LIMA', 'LIMA', 1);
SET @id_empresa_417 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_417, 'CORPORACION MEDICA D´NORA SAC', 'CHINCHA', '350', 'LIMA', 'LIMA', '956 701 190', NULL, 1);
SET @id_sede_417 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_417, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [418] CLINICA VETERINARIA PRADO SAC
--       RUC: 20600507258  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA PRADO SAC', 'RUC', '20600507258', 1);
SET @id_cliente_418 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_418, 'CLINICA VETERINARIA PRADO SAC', '20600507258', '94.4', 'LIMA', 'LIMA', 1);
SET @id_empresa_418 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_418, 'CLINICA VETERINARIA PRADO SAC', 'CHINCHA', '94.4', 'LIMA', 'LIMA', '956 755 554', NULL, 1);
SET @id_sede_418 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_418, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [419] CLINICA HERNANI S.A.C
--       RUC: 20608647709  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA HERNANI S.A.C', 'RUC', '20608647709', 1);
SET @id_cliente_419 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_419, 'CLINICA HERNANI S.A.C', '20608647709', '7 X KG', 'LIMA', 'LIMA', 1);
SET @id_empresa_419 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_419, 'Clínica Nueva Salud', 'CHINCHA', '7 X KG', 'LIMA', 'LIMA', '917 107 479', NULL, 1);
SET @id_sede_419 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_419, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [420] PRINCIPAL VET SAC
--       RUC: 20607987441  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PRINCIPAL VET SAC', 'RUC', '20607987441', 1);
SET @id_cliente_420 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_420, 'PRINCIPAL VET SAC', '20607987441', '70', 'LIMA', 'LIMA', 1);
SET @id_empresa_420 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_420, 'PRINCIPAL VET SAC', 'CHINCHA', '70', 'LIMA', 'LIMA', 'Juan Luis Espinoza celular 981416243', NULL, 1);
SET @id_sede_420 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_420, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [421] CLINICA VETERINARIA ALONZO SAC
--       RUC: 20611374799  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA ALONZO SAC', 'RUC', '20611374799', 1);
SET @id_cliente_421 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_421, 'CLINICA VETERINARIA ALONZO SAC', '20611374799', '70', 'LIMA', 'LIMA', 1);
SET @id_empresa_421 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_421, 'CLINICA VETERINARIA ALONZO', 'CHINCHA', '70', 'LIMA', 'LIMA', 'LUIS ALONZO QUISPE PEÑA/GIESELA PALACIOS BUENDIA 936330122', NULL, 1);
SET @id_sede_421 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_421, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [422] LOZA AYBAR YULY KATHERINE
--       RUC: 10705649796  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LOZA AYBAR YULY KATHERINE', 'RUC', '10705649796', 1);
SET @id_cliente_422 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_422, 'LOZA AYBAR YULY KATHERINE', '10705649796', '70', 'LIMA', 'LIMA', 1);
SET @id_empresa_422 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_422, 'Veterinaria DFRANK', 'CHINCHA', '70', 'LIMA', 'LIMA', '956417372', NULL, 1);
SET @id_sede_422 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_422, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [423] Zuly Geraldine Ayón Cayo
--       RUC: 10469256621  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Zuly Geraldine Ayón Cayo', 'RUC', '10469256621', 1);
SET @id_cliente_423 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_423, 'Zuly Geraldine Ayón Cayo', '10469256621', '70', 'LIMA', 'LIMA', 1);
SET @id_empresa_423 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_423, 'Clínica Veterinaria ZAC', 'CHINCHA', '70', 'LIMA', 'LIMA', 'Zuly 964690993', NULL, 1);
SET @id_sede_423 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_423, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [424] RIVAS HUAMAN LUZ MARINA
--       RUC: 10458240715  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RIVAS HUAMAN LUZ MARINA', 'RUC', '10458240715', 1);
SET @id_cliente_424 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_424, 'RIVAS HUAMAN LUZ MARINA', '10458240715', '80', 'LIMA', 'LIMA', 1);
SET @id_empresa_424 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_424, 'CENTRO LAB', 'CHINCHA', '80', 'LIMA', 'LIMA', 'Esmeralda Palomino cel: 959241495', NULL, 1);
SET @id_sede_424 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_424, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [425] CARDENAS FIGUEROA ALEXANDER WILFREDO
--       RUC: 10446544522  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CARDENAS FIGUEROA ALEXANDER WILFREDO', 'RUC', '10446544522', 1);
SET @id_cliente_425 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_425, 'CARDENAS FIGUEROA ALEXANDER WILFREDO', '10446544522', '80', 'LIMA', 'LIMA', 1);
SET @id_empresa_425 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_425, 'Consultorio Dental Figueroa', 'CAÑETE', '80', 'LIMA', 'LIMA', '972034967', NULL, 1);
SET @id_sede_425 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_425, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [426] VET SERVICE & CIA E.I.R.L
--       RUC: 20602683169  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VET SERVICE & CIA E.I.R.L', 'RUC', '20602683169', 1);
SET @id_cliente_426 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_426, 'VET SERVICE & CIA E.I.R.L', '20602683169', '150', 'LIMA', 'LIMA', 1);
SET @id_empresa_426 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_426, 'VET SERVICE & CIA E.I.R.L', 'CAÑETE', '150', 'LIMA', 'LIMA', '970841494', NULL, 1);
SET @id_sede_426 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_426, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [427] SARMIENTO INFANTE JAIMAR JOHANA
--       RUC: 15606562613  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SARMIENTO INFANTE JAIMAR JOHANA', 'RUC', '15606562613', 1);
SET @id_cliente_427 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_427, 'SARMIENTO INFANTE JAIMAR JOHANA', '15606562613', '200', 'LIMA', 'LIMA', 1);
SET @id_empresa_427 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_427, 'ortopedia y topico j&s', 'CAÑETE', '200', 'LIMA', 'LIMA', '955 035 562', NULL, 1);
SET @id_sede_427 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_427, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [428] ZELAYA JULIAN SHARON ABIGAIL
--       RUC: 10703582856  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ZELAYA JULIAN SHARON ABIGAIL', 'RUC', '10703582856', 1);
SET @id_cliente_428 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_428, 'ZELAYA JULIAN SHARON ABIGAIL', '10703582856', '180', 'LIMA', 'LIMA', 1);
SET @id_empresa_428 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_428, 'CENTRO ODONTOLOGICO  Zodonto Centro', 'CAÑETE', '180', 'LIMA', 'LIMA', '965731881', NULL, 1);
SET @id_sede_428 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_428, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [429] MATOS CHAUPIN MARIBEL
--       RUC: 10409465663  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MATOS CHAUPIN MARIBEL', 'RUC', '10409465663', 1);
SET @id_cliente_429 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_429, 'MATOS CHAUPIN MARIBEL', '10409465663', '165', 'LIMA', 'LIMA', 1);
SET @id_empresa_429 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_429, 'MATOS CHAUPIN MARIBEL', 'CAÑETE', '165', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_429 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_429, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [430] Centro de Diagnostico Bioquim Laboratorio SCRL
--       RUC: 20495102255  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Centro de Diagnostico Bioquim Laboratorio SCRL', 'RUC', '20495102255', 1);
SET @id_cliente_430 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_430, 'Centro de Diagnostico Bioquim Laboratorio SCRL', '20495102255', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_430 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_430, '7AM A 7 PM', '118', 'EFECTIVO', 'LIMA', 'LIMA', 'Av municipalidad 269 3er Piso - ICA', NULL, 1);
SET @id_sede_430 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_430, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [431] CENTRO DIGESTIVO FERREL SAC
--       RUC: 20606160926  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO DIGESTIVO FERREL SAC', 'RUC', '20606160926', 1);
SET @id_cliente_431 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_431, 'CENTRO DIGESTIVO FERREL SAC', '20606160926', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_431 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_431, '9AM A 6 PM', '236', 'EFECTIVO', 'LIMA', 'LIMA', 'calle Tacones 253 urb san Isidro   ICA', NULL, 1);
SET @id_sede_431 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_431, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [432] CLINICA FORM VETERINARIA PTE BLANCO EIRL
--       RUC: 20410478529  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA FORM VETERINARIA PTE BLANCO EIRL', 'RUC', '20410478529', 1);
SET @id_cliente_432 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_432, 'CLINICA FORM VETERINARIA PTE BLANCO EIRL', '20410478529', 'CANCELADO', 'LIMA', 'LIMA', 1);
SET @id_empresa_432 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_432, '9AM A 6 PM', '94.4', 'CANCELADO', 'LIMA', 'LIMA', 'URB. PUENTE BLANCO J9 ICA', NULL, 1);
SET @id_sede_432 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_432, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [433] CLINICA VETERINARIA SAN MARTIN DE PORRES EIRL
--       RUC: 20534783010  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA SAN MARTIN DE PORRES EIRL', 'RUC', '20534783010', 1);
SET @id_cliente_433 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_433, 'CLINICA VETERINARIA SAN MARTIN DE PORRES EIRL', '20534783010', 'DEBE MAYO EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_433 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_433, 'De 9:30 a 12:30 y de 3:30 a 6 PM', '94.4', 'DEBE MAYO EFECTIVO', 'LIMA', 'LIMA', 'CALLE CASTRO VIRREYNA 269 - ICA', NULL, 1);
SET @id_sede_433 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_433, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [434] DAYSI IVETT DIAZ SANCHEZ
--       RUC: 10478360041  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DAYSI IVETT DIAZ SANCHEZ', 'RUC', '10478360041', 1);
SET @id_cliente_434 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_434, 'DAYSI IVETT DIAZ SANCHEZ', '10478360041', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_434 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_434, '9 AM A 12:30PM Y 4:30 PM A 8PM', '70', 'EFECTIVO', 'LIMA', 'LIMA', 'AV J.J. ELIAS 353 - ICA', NULL, 1);
SET @id_sede_434 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_434, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [435] NASCA VET SERVICIOS VETERINARIOS S.A.C.
--       RUC: 20601823307  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('NASCA VET SERVICIOS VETERINARIOS S.A.C.', 'RUC', '20601823307', 1);
SET @id_cliente_435 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_435, 'NASCA VET SERVICIOS VETERINARIOS S.A.C.', '20601823307', 'CANCELADO', 'LIMA', 'LIMA', 1);
SET @id_empresa_435 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_435, '9AM A 6 PM', '94.4', 'CANCELADO', 'LIMA', 'LIMA', 'CALLE CALLAO 469 NAZCA - ICA', NULL, 1);
SET @id_sede_435 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_435, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [436] POLICLINICO ESPECIALIZADO SAN JOSE EIRL
--       RUC: 20606364319  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('POLICLINICO ESPECIALIZADO SAN JOSE EIRL', 'RUC', '20606364319', 1);
SET @id_cliente_436 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_436, 'POLICLINICO ESPECIALIZADO SAN JOSE EIRL', '20606364319', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_436 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_436, '7:30am a 9:00pm', '200', 'EFECTIVO', 'LIMA', 'LIMA', 'PANAMERICANA SUR 319 - ICA', NULL, 1);
SET @id_sede_436 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_436, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [437] SARAVIA HUAMAN LUIS ALBERTO
--       RUC: 10445899548  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SARAVIA HUAMAN LUIS ALBERTO', 'RUC', '10445899548', 1);
SET @id_cliente_437 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_437, 'SARAVIA HUAMAN LUIS ALBERTO', '10445899548', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_437 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_437, '9AM A 10 AM', '65', 'EFECTIVO', 'LIMA', 'LIMA', 'AV SAN MARTIN 256 - ICA', NULL, 1);
SET @id_sede_437 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_437, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [438] CENTRO DE DIAGNOSTICO ESPECIALIZADO INTEGRALAB E.I.R.L.
--       RUC: 20609032180  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO DE DIAGNOSTICO ESPECIALIZADO INTEGRALAB E.I.R.L.', 'RUC', '20609032180', 1);
SET @id_cliente_438 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_438, 'CENTRO DE DIAGNOSTICO ESPECIALIZADO INTEGRALAB E.I.R.L.', '20609032180', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_438 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_438, '8 AM A 12 PM  LLAMA 15 MINUTOS ANTES', '150', 'EFECTIVO', 'LIMA', 'LIMA', 'Prolongacion Ayabaca 1208', NULL, 1);
SET @id_sede_438 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_438, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [439] Clinica Dental Señor Nazareno EIRL
--       RUC: 20452838011  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clinica Dental Señor Nazareno EIRL', 'RUC', '20452838011', 1);
SET @id_cliente_439 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_439, 'Clinica Dental Señor Nazareno EIRL', '20452838011', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_439 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_439, '9AM A 12 PM', '80', 'EFECTIVO', 'LIMA', 'LIMA', 'Av. Municipalidad #212 2do piso', NULL, 1);
SET @id_sede_439 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_439, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [440] Clínica Veterinaria Martinez E.I.R.L
--       RUC: 20494351855  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica Veterinaria Martinez E.I.R.L', 'RUC', '20494351855', 1);
SET @id_cliente_440 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_440, 'Clínica Veterinaria Martinez E.I.R.L', '20494351855', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_440 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_440, '9 AM A 6 PM', '94.4', 'EFECTIVO', 'LIMA', 'LIMA', 'Av. San Martin 1473 Mz "E" Lt "7" urb sol de Ica - Ica - Ica -Ica', NULL, 1);
SET @id_sede_440 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_440, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [441] ROSA MERCEDES DONAYRE CAYO
--       RUC: 10414097729  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ROSA MERCEDES DONAYRE CAYO', 'RUC', '10414097729', 1);
SET @id_cliente_441 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_441, 'ROSA MERCEDES DONAYRE CAYO', '10414097729', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_441 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_441, '8AM A 6 PM', '118', 'EFECTIVO', 'LIMA', 'LIMA', 'PANAMERICANA SUR KM 308 LOS AQUIJES ICA', NULL, 1);
SET @id_sede_441 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_441, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [442] clinica veterinaria brown e.i.r.l
--       RUC: 20603070462  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('clinica veterinaria brown e.i.r.l', 'RUC', '20603070462', 1);
SET @id_cliente_442 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_442, 'clinica veterinaria brown e.i.r.l', '20603070462', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_442 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_442, '9 AM A 6 PM', '118', 'EFECTIVO', 'LIMA', 'LIMA', 'victorio gotuzzo bianchi 230 la tinguiña ica', NULL, 1);
SET @id_sede_442 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_442, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [443] CORPORACION EMPRESARIAL SEÑOR DE LUREN SAC
--       RUC: 20605036512  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION EMPRESARIAL SEÑOR DE LUREN SAC', 'RUC', '20605036512', 1);
SET @id_cliente_443 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_443, 'CORPORACION EMPRESARIAL SEÑOR DE LUREN SAC', '20605036512', 'QUINCENAL', 'LIMA', 'LIMA', 1);
SET @id_empresa_443 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_443, '9 AM A 6 PM', '300', 'QUINCENAL', 'LIMA', 'LIMA', 'ASOC. SAN MARTIN MZ D1 LT3 ICA', NULL, 1);
SET @id_sede_443 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_443, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [444] ANIMAL CENTER GUERRERO SAC
--       RUC: 20602844332  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ANIMAL CENTER GUERRERO SAC', 'RUC', '20602844332', 1);
SET @id_cliente_444 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_444, 'ANIMAL CENTER GUERRERO SAC', '20602844332', 'DEBE ABRIL EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_444 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_444, '9am a 1 pm y 3 pma 6 pm', '80', 'DEBE ABRIL EFECTIVO', 'LIMA', 'LIMA', 'MZ E LT 5 PJ SEÑOR DE LUREN II ETAPA - ICA', NULL, 1);
SET @id_sede_444 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_444, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [445] VIDAMEDIC INVERSIONES SAC
--       RUC: 20611971495  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VIDAMEDIC INVERSIONES SAC', 'RUC', '20611971495', 1);
SET @id_cliente_445 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_445, 'VIDAMEDIC INVERSIONES SAC', '20611971495', 'DEBE MAYO EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_445 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_445, '10AM A 1 PM Y 2 PM A 6 PM', '118', 'DEBE MAYO EFECTIVO', 'LIMA', 'LIMA', 'Urbanizacion san jose, L 19, av los maestros', NULL, 1);
SET @id_sede_445 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_445, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [446] LEXMI QUINTANILLA TAMBRA
--       RUC: 10410633391  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('LEXMI QUINTANILLA TAMBRA', 'RUC', '10410633391', 1);
SET @id_cliente_446 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_446, 'LEXMI QUINTANILLA TAMBRA', '10410633391', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_446 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_446, '8AM A 2 PM', '118', 'EFECTIVO', 'LIMA', 'LIMA', 'CALLE SAN FRANCISCO 255', NULL, 1);
SET @id_sede_446 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_446, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [447] CLÍNICA NIÑO JESUS DE PRAGA SAC
--       RUC: 20611467410  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLÍNICA NIÑO JESUS DE PRAGA SAC', 'RUC', '20611467410', 1);
SET @id_cliente_447 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_447, 'CLÍNICA NIÑO JESUS DE PRAGA SAC', '20611467410', 'EFECT-TRANS', 'LIMA', 'LIMA', 1);
SET @id_empresa_447 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_447, '9AM A 1 PM Y 3 PM A 6 PM', '100', 'EFECT-TRANS', 'LIMA', 'LIMA', 'AV. SAN MARTIN 541 - ICA', NULL, 1);
SET @id_sede_447 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_447, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [448] CENTRO DIAGNOSTICO ECOFETAL SOCIEDAD ANONIMA CERRADA
--       RUC: 20608833766  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO DIAGNOSTICO ECOFETAL SOCIEDAD ANONIMA CERRADA', 'RUC', '20608833766', 1);
SET @id_cliente_448 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_448, 'CENTRO DIAGNOSTICO ECOFETAL SOCIEDAD ANONIMA CERRADA', '20608833766', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_448 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_448, '9:30AM A 11:30AM', '120', 'EFECTIVO', 'LIMA', 'LIMA', 'Calle lima 487 segundo piso IcaCalle lima 487 segundo piso Ica', NULL, 1);
SET @id_sede_448 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_448, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [449] Dr. Francisco Roman M. EIRL
--       RUC: 20604590371  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Dr. Francisco Roman M. EIRL', 'RUC', '20604590371', 1);
SET @id_cliente_449 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_449, 'Dr. Francisco Roman M. EIRL', '20604590371', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_449 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_449, '9am a 6pm', '120', 'EFECTIVO', 'LIMA', 'LIMA', 'Calle margaritas Nº420, San isidro', NULL, 1);
SET @id_sede_449 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_449, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [450] Emerson Escriba Palomino
--       RUC: 10215605880  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Emerson Escriba Palomino', 'RUC', '10215605880', 1);
SET @id_cliente_450 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_450, 'Emerson Escriba Palomino', '10215605880', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_450 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_450, '11am a 8 pm', '70', 'EFECTIVO', 'LIMA', 'LIMA', 'Calle Tacna N°117', NULL, 1);
SET @id_sede_450 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_450, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [451] KELY BURGA GONZALES
--       RUC: 10430226059  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('KELY BURGA GONZALES', 'RUC', '10430226059', 1);
SET @id_cliente_451 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_451, 'KELY BURGA GONZALES', '10430226059', 'DEBE ABRIL Y MAYO EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_451 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_451, '9am a 6pm', '90', 'DEBE ABRIL Y MAYO EFECTIVO', 'LIMA', 'LIMA', 'AV. ARENALES 630 2DO PISO', NULL, 1);
SET @id_sede_451 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_451, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [452] CLINICA DENTAL PERUDENT EIRL
--       RUC: 20600279581  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA DENTAL PERUDENT EIRL', 'RUC', '20600279581', 1);
SET @id_cliente_452 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_452, 'CLINICA DENTAL PERUDENT EIRL', '20600279581', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_452 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_452, '9 am a 1 pm y de 4 pm a 9pm', '70', 'EFECTIVO', 'LIMA', 'LIMA', 'AV. SAN MARTIN 389 SEGUNDO PISO    ICA - ICA -ICA', NULL, 1);
SET @id_sede_452 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_452, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [453] clinica veterinaria faccevet sac
--       RUC: 20601805741  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('clinica veterinaria faccevet sac', 'RUC', '20601805741', 1);
SET @id_cliente_453 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_453, 'clinica veterinaria faccevet sac', '20601805741', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_453 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_453, '9am a 6pm', '70', 'EFECTIVO', 'LIMA', 'LIMA', 'av. Pachacutec yupanqui 885-parcona -ica', NULL, 1);
SET @id_sede_453 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_453, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [454] RRGASTROCENTER SAC
--       RUC: 20614114682  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RRGASTROCENTER SAC', 'RUC', '20614114682', 1);
SET @id_cliente_454 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_454, 'RRGASTROCENTER SAC', '20614114682', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_454 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_454, '8aM A 1PM', '100', 'EFECTIVO', 'LIMA', 'LIMA', 'calle azahares 148- urb san isidro', NULL, 1);
SET @id_sede_454 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_454, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [455] Rosemary Uribe
--       RUC: 10703063352  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Rosemary Uribe', 'RUC', '10703063352', 1);
SET @id_cliente_455 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_455, 'Rosemary Uribe', '10703063352', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_455 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_455, '10 am a 7pm', '70', 'EFECTIVO', 'LIMA', 'LIMA', 'Prolongación Castrovirreyna 829', NULL, 1);
SET @id_sede_455 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_455, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [456] POLICLINICO BIOQUIM E.I.R.L
--       RUC: 20604003335  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('POLICLINICO BIOQUIM E.I.R.L', 'RUC', '20604003335', 1);
SET @id_cliente_456 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_456, 'POLICLINICO BIOQUIM E.I.R.L', '20604003335', 'EFECTIVO', 'LIMA', 'LIMA', 1);
SET @id_empresa_456 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_456, '7:00AM A 7:PM', '100', 'EFECTIVO', 'LIMA', 'LIMA', 'CALLE CADIAS 115', NULL, 1);
SET @id_sede_456 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_456, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [457] Erika abigail almonte torres
--       RUC: 10802649300  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Erika abigail almonte torres', 'RUC', '10802649300', 1);
SET @id_cliente_457 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_457, 'Erika abigail almonte torres', '10802649300', 'CANCELADO', 'LIMA', 'LIMA', 1);
SET @id_empresa_457 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_457, '9am a 1 pm y 4pm a 8pm', '80', 'CANCELADO', 'LIMA', 'LIMA', 'Avenida ayabaca 1188 - barrio los grimaldos - Ica frente ala. Cochera de salida hospital regional Ic', NULL, 1);
SET @id_sede_457 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_457, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [458] VET LOVE PETS E.I.R.L.
--       RUC: 20610928219  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VET LOVE PETS E.I.R.L.', 'RUC', '20610928219', 1);
SET @id_cliente_458 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_458, 'VET LOVE PETS E.I.R.L.', '20610928219', 'INDEPENDENCIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_458 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_458, 'VET LOVE', 'Prolongación Tupac amaru 200 - independencia', 'INDEPENDENCIA', 'LIMA', 'LIMA', 'YANINA', '941604076', 1);
SET @id_sede_458 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_458, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [459] Pedro Luis Carlos Ávalos Sánchez
--       RUC: 10435868474  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Pedro Luis Carlos Ávalos Sánchez', 'RUC', '10435868474', 1);
SET @id_cliente_459 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_459, 'Pedro Luis Carlos Ávalos Sánchez', '10435868474', 'INDEPENDENCIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_459 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_459, 'Sante vet', 'Av. Los jazmines 224, independencia', 'INDEPENDENCIA', 'LIMA', 'LIMA', NULL, '950250820', 1);
SET @id_sede_459 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_459, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [460] JUAN CARLOS ASTONITAS ASTONITAS
--       RUC: 10087438282  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JUAN CARLOS ASTONITAS ASTONITAS', 'RUC', '10087438282', 1);
SET @id_cliente_460 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_460, 'JUAN CARLOS ASTONITAS ASTONITAS', '10087438282', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_460 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_460, 'QUALITY DENT', 'AV. RAFAEL ESCARDO 201 SAN MIGUEL', 'SAN MIGUEL', 'LIMA', 'LIMA', 'JUAN CARLOS', '998079870', 1);
SET @id_sede_460 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_460, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [461] PET SOUND SERVICIOS S.A.C
--       RUC: 20609944898  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PET SOUND SERVICIOS S.A.C', 'RUC', '20609944898', 1);
SET @id_cliente_461 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_461, 'PET SOUND SERVICIOS S.A.C', '20609944898', 'SAN MIGUEL', 'LIMA', 'LIMA', 1);
SET @id_empresa_461 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_461, 'PET SOUND', 'AV. DE LA MARINA NRO. 2500 URB. MARANGA ET. UNO LIMA - LIMA - SAN MIGUEL. LOCAL N°1110', 'SAN MIGUEL', 'LIMA', 'LIMA', 'ERIKA ZÚÑIGA', '969342445', 1);
SET @id_sede_461 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_461, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [462] Amara inversiones S.A.C
--       RUC: 20615198324  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Amara inversiones S.A.C', 'RUC', '20615198324', 1);
SET @id_cliente_462 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_462, 'Amara inversiones S.A.C', '20615198324', 'CALLAO', 'LIMA', 'LIMA', 1);
SET @id_empresa_462 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_462, 'Mis peluditos veterinaria', 'OTR.ETAPA 1 MZA. I LOTE. 1 URB. VALLE HERMOSO PROV. CONST. DEL CALLAO - PROV. CONST. DEL CALLAO - CALLAO', 'CALLAO', 'LIMA', 'LIMA', NULL, '907731793', 1);
SET @id_sede_462 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_462, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [463] El Milagro de tu Sonrisa EIRL
--       RUC: 20601583551  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('El Milagro de tu Sonrisa EIRL', 'RUC', '20601583551', 1);
SET @id_cliente_463 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_463, 'El Milagro de tu Sonrisa EIRL', '20601583551', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_463 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_463, 'Multident Carabayllo', 'Av Tupac Amaru 1664, carabayllo', 'CARABAYLLO', 'LIMA', 'LIMA', '905 475 351', NULL, 1);
SET @id_sede_463 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_463, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [464] ADVANCE DENTAL S.A.C.
--       RUC: 20609368129  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ADVANCE DENTAL S.A.C.', 'RUC', '20609368129', 1);
SET @id_cliente_464 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_464, 'ADVANCE DENTAL S.A.C.', '20609368129', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_464 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_464, 'Dental MI', 'CP San Pedro de Carabayllo, calle José de San Martín mz F, lt 24, segundo piso-Carabayllo', 'CARABAYLLO', 'LIMA', 'LIMA', 'DR. ALVAREZ', '987640175', 1);
SET @id_sede_464 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_464, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [465] Multiservicios Advance SAC
--       RUC: 20612191116  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Multiservicios Advance SAC', 'RUC', '20612191116', 1);
SET @id_cliente_465 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_465, 'Multiservicios Advance SAC', '20612191116', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_465 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_465, 'DENTAL MI', 'Av huarangal Mz C, Lt 3, 2do piso interior 02. A. H. las Casuarinas de Carabayllo', 'CARABAYLLO', 'LIMA', 'LIMA', NULL, '980499564', 1);
SET @id_sede_465 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_465, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [466] VETMED S.A.C
--       RUC: 20545864771  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VETMED S.A.C', 'RUC', '20545864771', 1);
SET @id_cliente_466 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_466, 'VETMED S.A.C', '20545864771', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_466 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_466, 'Central mascota', 'Av.universitaria 638 urb. Lucyana carabayllo', 'CARABAYLLO', 'LIMA', 'LIMA', 'SHIRLEY ESPINOZA', NULL, 1);
SET @id_sede_466 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_466, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [467] Clínica veterinaria Dr.JhonD''vet
--       RUC: 20612962198  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Clínica veterinaria Dr.JhonD''vet', 'RUC', '20612962198', 1);
SET @id_cliente_467 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_467, 'Clínica veterinaria Dr.JhonD''vet', '20612962198', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_467 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_467, 'Clínica veterinaria Dr.JhonD''vet', 'Av.tupac amaru 2942 p.j el progreso Carabayllo', 'CARABAYLLO', 'LIMA', 'LIMA', NULL, '995276739', 1);
SET @id_sede_467 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_467, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [468] D & L MARTINEZ S.A.C.
--       RUC: 20611411660  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('D & L MARTINEZ S.A.C.', 'RUC', '20611411660', 1);
SET @id_cliente_468 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_468, 'D & L MARTINEZ S.A.C.', '20611411660', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_468 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_468, 'La casa de Duke y Lola', 'Jirón Abraham Valdelomar Mz U6 Lt 28 Urb San Antonio de Carabayllo 3', 'CARABAYLLO', 'LIMA', 'LIMA', 'LUZ 976 326 688', NULL, 1);
SET @id_sede_468 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_468, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [469] Veterinaria Cabrera J y P S.A.C.
--       RUC: 20608642570  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Veterinaria Cabrera J y P S.A.C.', 'RUC', '20608642570', 1);
SET @id_cliente_469 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_469, 'Veterinaria Cabrera J y P S.A.C.', '20608642570', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_469 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_469, 'VETERINARIA CABRERA', 'AV TUPAC AMARU 2702 URB  EL PROGRESO - CARABAYLLO', 'CARABAYLLO', 'LIMA', 'LIMA', 'NATHALY CARDENAS', '991360688', 1);
SET @id_sede_469 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_469, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [470] GRUPO MULTISERVICIOS Y SALUD M & K E.I.R.L.
--       RUC: 20611538457  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO MULTISERVICIOS Y SALUD M & K E.I.R.L.', 'RUC', '20611538457', 1);
SET @id_cliente_470 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_470, 'GRUPO MULTISERVICIOS Y SALUD M & K E.I.R.L.', '20611538457', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_470 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_470, 'ODONTOLOGO RIE', 'AV. SR DE CAUDIVILLA MZA. T1 LOTE. 19 URB. RESIDENCIAL LUCYANA CARABAYLLO', 'CARABAYLLO', 'LIMA', 'LIMA', 'KATHIA PIANO', '966924066', 1);
SET @id_sede_470 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_470, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [471] PRUDENCIO MAU EDGARD ENRIQUE
--       RUC: 10098543860  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PRUDENCIO MAU EDGARD ENRIQUE', 'RUC', '10098543860', 1);
SET @id_cliente_471 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_471, 'PRUDENCIO MAU EDGARD ENRIQUE', '10098543860', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_471 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_471, 'VETERINARIA ENTRE PATAS Y AMIGOS', 'ASOCIACION LIMATAMBO MZ L LOTE  5    CARABAYLLO', 'CARABAYLLO', 'LIMA', 'LIMA', 'LILIANA GUTIERREZ', '918907155', 1);
SET @id_sede_471 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_471, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [472] 6GDENT S.A.C.
--       RUC: 20609724791  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('6GDENT S.A.C.', 'RUC', '20609724791', 1);
SET @id_cliente_472 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_472, '6GDENT S.A.C.', '20609724791', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_472 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_472, '6G DENT', 'Av. Amador Merino Reyna N° 265 (2da PISO)- CARABAYLLO', 'CARABAYLLO', 'LIMA', 'LIMA', 'NADESHKA NUÑEZ', '935858674', 1);
SET @id_sede_472 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_472, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [473] ELVIS OBLITAS TARRILLO
--       RUC: 10709139652  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ELVIS OBLITAS TARRILLO', 'RUC', '10709139652', 1);
SET @id_cliente_473 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_473, 'ELVIS OBLITAS TARRILLO', '10709139652', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_473 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_473, 'Veterinaria EOVET', 'AV. VISTA ALEGREMZ A LT 4 PARQUES DE CARBAYLLO', 'CARABAYLLO', 'LIMA', 'LIMA', NULL, '933468041', 1);
SET @id_sede_473 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_473, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [474] ARAVET CLINICA VETERINARIA S.A.C.
--       RUC: 20614821575  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ARAVET CLINICA VETERINARIA S.A.C.', 'RUC', '20614821575', 1);
SET @id_cliente_474 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_474, 'ARAVET CLINICA VETERINARIA S.A.C.', '20614821575', 'CARABAYLLO', 'LIMA', 'LIMA', 1);
SET @id_empresa_474 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_474, 'ARAVET CLINICA VETERINARIA S.A.C.', 'AV CHIMPU OCLLO MZ R LOTE 15 URB VILLA CORPAC - CARABAYLLO', 'CARABAYLLO', 'LIMA', 'LIMA', NULL, '992367337', 1);
SET @id_sede_474 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_474, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [475] RENGIDENT ODONTOLOGIA ESTETICA Y ESPECIALIZADA S.A.C.
--       RUC: 20614794063  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('RENGIDENT ODONTOLOGIA ESTETICA Y ESPECIALIZADA S.A.C.', 'RUC', '20614794063', 1);
SET @id_cliente_475 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_475, 'RENGIDENT ODONTOLOGIA ESTETICA Y ESPECIALIZADA S.A.C.', '20614794063', 'CIENEGUILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_475 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_475, 'RENGIDENT', 'Av.Antonio José de Sucre Mz C Lt 01 Zona D-TamboViejo-Cieneguilla', 'CIENEGUILLA', 'LIMA', 'LIMA', NULL, '971388420', 1);
SET @id_sede_475 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_475, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [476] consultorio médico pulso & vida
--       RUC: 20610407171  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('consultorio médico pulso & vida', 'RUC', '20610407171', 1);
SET @id_cliente_476 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_476, 'consultorio médico pulso & vida', '20610407171', 'CIENEGUILLA', 'LIMA', 'LIMA', 1);
SET @id_empresa_476 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_476, 'consultorio médico pulso & vida', 'Av San Martín , Zona C Mz D Lt 2 Tambo viejo', 'CIENEGUILLA', 'LIMA', 'LIMA', NULL, '982402469', 1);
SET @id_sede_476 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_476, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [477] Rosse Mery Vilchez Maravi
--       RUC: 10453900865  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Rosse Mery Vilchez Maravi', 'RUC', '10453900865', 1);
SET @id_cliente_477 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_477, 'Rosse Mery Vilchez Maravi', '10453900865', 'LURIN', 'LIMA', 'LIMA', 1);
SET @id_empresa_477 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_477, 'veterinaria vilmont pets', 'mz L ,Lote 25 villa Alejandro 1 era etapa lurin', 'LURIN', 'LIMA', 'LIMA', 'NILTON MONTOYA', '933581379', 1);
SET @id_sede_477 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_477, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [478] POLICARPO CACEDA KEVIN RAUL ALEXANDER
--       RUC: 10756752389  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('POLICARPO CACEDA KEVIN RAUL ALEXANDER', 'RUC', '10756752389', 1);
SET @id_cliente_478 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_478, 'POLICARPO CACEDA KEVIN RAUL ALEXANDER', '10756752389', 'LURIN', 'LIMA', 'LIMA', 1);
SET @id_empresa_478 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_478, 'Tintinvet vet', 'Mz G lt 2 lll etapa Villa Alejandro Lurin', 'LURIN', 'LIMA', 'LIMA', 'KATHERINE PEREZ', '945851702', 1);
SET @id_sede_478 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_478, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [479] consultorio dental Incisdent
--       RUC: 20610065717  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('consultorio dental Incisdent', 'RUC', '20610065717', 1);
SET @id_cliente_479 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_479, 'consultorio dental Incisdent', '20610065717', 'LURIN', 'LIMA', 'LIMA', 1);
SET @id_empresa_479 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_479, 'Incisdent', 'Lurin- Jr. Italia Mz. 4 LT. 1 km39 nvo.lurin antigua panamericana Sur (frente al paradero la cruz)', 'LURIN', 'LIMA', 'LIMA', 'MIRELLY DELGADO', '948501683', 1);
SET @id_sede_479 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_479, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [480] CENTRO MEDICO SAN CARLOS PEREZ E.I.R.L.
--       RUC: 20606659246  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CENTRO MEDICO SAN CARLOS PEREZ E.I.R.L.', 'RUC', '20606659246', 1);
SET @id_cliente_480 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_480, 'CENTRO MEDICO SAN CARLOS PEREZ E.I.R.L.', '20606659246', 'LURIN', 'LIMA', 'LIMA', 1);
SET @id_empresa_480 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_480, 'CENTRO MEDICO SAN CARLOS', 'JR. GRAU NRO. 207 A.H. LURIN CERCADO (A UNA CUADRA DE LA MUNICIPALIDAD) LIMA - LIMA - LURIN', 'LURIN', 'LIMA', 'LIMA', 'CARLOS PEREZ', NULL, 1);
SET @id_sede_480 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_480, '2026-07-03', 'mensual', 100.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [481] INVERSIONES MINECRAFT S.A.C.
--       RUC: 20603528574  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('INVERSIONES MINECRAFT S.A.C.', 'RUC', '20603528574', 1);
SET @id_cliente_481 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_481, 'INVERSIONES MINECRAFT S.A.C.', '20603528574', 'LURIN', 'LIMA', 'LIMA', 1);
SET @id_empresa_481 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_481, 'veterinaria D’Angelo', 'km 40 mza 6 lote 5 A.H. Nuevo lurin', 'LURIN', 'LIMA', 'LIMA', 'ANGELO ESPINOZA', '999433824', 1);
SET @id_sede_481 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_481, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [482] CORPORATIVO GALARSAN S.A.C.
--       RUC: 20608967941  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORATIVO GALARSAN S.A.C.', 'RUC', '20608967941', 1);
SET @id_cliente_482 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_482, 'CORPORATIVO GALARSAN S.A.C.', '20608967941', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_482 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_482, 'v', 'Av Belaúnde Oeste 309, Comas.', 'COMAS', 'LIMA', 'LIMA', 'yvonne', '997210372', 1);
SET @id_sede_482 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_482, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [483] Vega Villanueva, Hernan
--       RUC: 10423834990  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Vega Villanueva, Hernan', 'RUC', '10423834990', 1);
SET @id_cliente_483 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_483, 'Vega Villanueva, Hernan', '10423834990', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_483 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_483, 'Vega Dental World', 'Urbanización Villa Oropeza lot. 165 comas.', 'COMAS', 'LIMA', 'LIMA', 'HERNAN', '991766558', 1);
SET @id_sede_483 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_483, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [484] Miguel valencia delgado
--       RUC: 10167494027  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Miguel valencia delgado', 'RUC', '10167494027', 1);
SET @id_cliente_484 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_484, 'Miguel valencia delgado', '10167494027', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_484 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_484, 'Clinica veterinaria don micky', 'Av gerardo unger 6528 urb santa luzmila referencia al costado d la comisaría santa luzmila -COMAS', 'COMAS', 'LIMA', 'LIMA', NULL, '922643905', 1);
SET @id_sede_484 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_484, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [485] CIMEVET S.A.C.
--       RUC: 20609984474  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CIMEVET S.A.C.', 'RUC', '20609984474', 1);
SET @id_cliente_485 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_485, 'CIMEVET S.A.C.', '20609984474', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_485 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_485, 'Clínica veterinaria Cimevet', 'avenida universitaria norte 7381 A 2da etapa de Urbanizacion retablo comas', 'COMAS', 'LIMA', 'LIMA', 'Paulina Gonzales GRTE CIMEVET', '993584803', 1);
SET @id_sede_485 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_485, '2026-07-03', 'mensual', 70.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [486] JOCYAL & SERVICIOS SAC
--       RUC: 20492108848  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JOCYAL & SERVICIOS SAC', 'RUC', '20492108848', 1);
SET @id_cliente_486 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_486, 'JOCYAL & SERVICIOS SAC', '20492108848', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_486 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_486, 'Consultorio Dental Salud Oral - JOCYAL', 'Av. Túpac Amaru 1327 Urb. Huaquillay Comas km11', 'COMAS', 'LIMA', 'LIMA', NULL, '991924306', 1);
SET @id_sede_486 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_486, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [487] ASOCIACION DE DESARROLLO DE LA EDUCACION Y LA SALUD
--       RUC: 20136458923  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('ASOCIACION DE DESARROLLO DE LA EDUCACION Y LA SALUD', 'RUC', '20136458923', 1);
SET @id_cliente_487 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_487, 'ASOCIACION DE DESARROLLO DE LA EDUCACION Y LA SALUD', '20136458923', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_487 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_487, 'ADESA', 'JR TENIENTE JOSE LOPEZ 194 - COMAS', 'COMAS', 'LIMA', 'LIMA', 'SOFIA', NULL, 1);
SET @id_sede_487 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_487, '2026-07-03', 'mensual', 90.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [488] POMA MENDO JESUS RAFAEL
--       RUC: 10080545687  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('POMA MENDO JESUS RAFAEL', 'RUC', '10080545687', 1);
SET @id_cliente_488 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_488, 'POMA MENDO JESUS RAFAEL', '10080545687', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_488 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_488, 'CLINICA VETERINARIA RPM', 'AV TUPAC AMARU 1584 AAHH LA LIBERTAD', 'COMAS', 'LIMA', 'LIMA', 'JESUS POMA', '993212500', 1);
SET @id_sede_488 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_488, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [489] CHAVEZ MORE MAYRA VERONICA
--       RUC: 10489937773  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CHAVEZ MORE MAYRA VERONICA', 'RUC', '10489937773', 1);
SET @id_cliente_489 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_489, 'CHAVEZ MORE MAYRA VERONICA', '10489937773', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_489 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_489, 'CONSULTORIO DE GINECOLOGIA Y OBSTETRICIA Dra Mayra Chávez', 'JIRON arequipa 382 2do piso DEL PUEBLO JOVEN PAMPA DE COMAS DEL DISTRITO DE COMAS km 11', 'COMAS', 'LIMA', 'LIMA', 'MAYRA', '965113638', 1);
SET @id_sede_489 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_489, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [490] DIAZ RODAS ROSA CECILIA
--       RUC: 10440120925  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DIAZ RODAS ROSA CECILIA', 'RUC', '10440120925', 1);
SET @id_cliente_490 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_490, 'DIAZ RODAS ROSA CECILIA', '10440120925', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_490 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_490, 'CENTRO VETERINARIO ROMIVET', 'AV JOSÉ DE SUCRE 134 - EL CARMEN - COMAS', 'COMAS', 'LIMA', 'LIMA', 'DIAZ ROSA', '935992881', 1);
SET @id_sede_490 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_490, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [491] Abigail Marcelina Cáceres Saldaña
--       RUC: 10101937726  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Abigail Marcelina Cáceres Saldaña', 'RUC', '10101937726', 1);
SET @id_cliente_491 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_491, 'Abigail Marcelina Cáceres Saldaña', '10101937726', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_491 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_491, 'Abigail Marcelina Cáceres Saldaña', 'Jr. Jose Santos figueroa # 225 Sta. Luzmila - Comas', 'COMAS', 'LIMA', 'LIMA', 'ABIGAIL', '988732627', 1);
SET @id_sede_491 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_491, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [492] Any Johana Vasquez Ramirez
--       RUC: 10457775763  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Any Johana Vasquez Ramirez', 'RUC', '10457775763', 1);
SET @id_cliente_492 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_492, 'Any Johana Vasquez Ramirez', '10457775763', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_492 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_492, 'Consultorio dental Vasquez', 'AV. CARABAYLLO 524 URB. PARRAL, COMAS', 'COMAS', 'LIMA', 'LIMA', 'Dra. Any Johana Vasquez Ramirez', '951345752', 1);
SET @id_sede_492 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_492, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [493] URBINA ANTICONA EUGENIA YRIS
--       RUC: 10068030116  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('URBINA ANTICONA EUGENIA YRIS', 'RUC', '10068030116', 1);
SET @id_cliente_493 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_493, 'URBINA ANTICONA EUGENIA YRIS', '10068030116', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_493 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_493, 'Dental Miramar', 'Av. Tupac amaru 1015A Int. 1 segundo piso MZ Q Lt 28 Urb. Huaquillay 1ra. Etapa  comas.', 'COMAS', 'LIMA', 'LIMA', 'YRIS URBINA', '991194134', 1);
SET @id_sede_493 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_493, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [494] BLANKESY DENT ODONTOLOGOS SAC
--       RUC: 20613064401  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('BLANKESY DENT ODONTOLOGOS SAC', 'RUC', '20613064401', 1);
SET @id_cliente_494 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_494, 'BLANKESY DENT ODONTOLOGOS SAC', '20613064401', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_494 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_494, 'Blankesy Dent', 'Calle 23 #100 Urbanización Carabayllo, Comas', 'COMAS', 'LIMA', 'LIMA', NULL, '987535982', 1);
SET @id_sede_494 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_494, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [495] Cristian Alciviades Tafur Guerrero
--       RUC: 10455023187  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Cristian Alciviades Tafur Guerrero', 'RUC', '10455023187', 1);
SET @id_cliente_495 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_495, 'Cristian Alciviades Tafur Guerrero', '10455023187', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_495 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_495, 'CENTRO DE TERAPIAS', 'Calle 55, Mz A3, Lt. 32, Urb. El Pinar, Comas', 'COMAS', 'LIMA', 'LIMA', NULL, '937144263', 1);
SET @id_sede_495 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_495, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [496] CONSULTORIO DENTAL CORDOVA E.I.R.L.
--       RUC: 20609280329  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CONSULTORIO DENTAL CORDOVA E.I.R.L.', 'RUC', '20609280329', 1);
SET @id_cliente_496 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_496, 'CONSULTORIO DENTAL CORDOVA E.I.R.L.', '20609280329', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_496 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_496, 'CONSULTORIO DENTAL CORDOVA', 'MZ H3 LT 12 AV. UNIVERSITARIA NORTE N° 9183 URB. EL PINAR COMAS', 'COMAS', 'LIMA', 'LIMA', 'DIANA', '980074457', 1);
SET @id_sede_496 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_496, '2026-07-03', 'mensual', 60.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [497] DAMIAN OSCCO MARI LUZ
--       RUC: 10480513458  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('DAMIAN OSCCO MARI LUZ', 'RUC', '10480513458', 1);
SET @id_cliente_497 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_497, 'DAMIAN OSCCO MARI LUZ', '10480513458', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_497 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_497, 'DAMIAN DENT', 'Mz D lote 19 A.A.HH San juan bautista ,av los incas N° 720 comas', 'COMAS', 'LIMA', 'LIMA', NULL, '928053198', 1);
SET @id_sede_497 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_497, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [498] VIA ODONTOLOGICA ESECIALIZADA  S.A.C
--       RUC: 20611762462  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('VIA ODONTOLOGICA ESECIALIZADA  S.A.C', 'RUC', '20611762462', 1);
SET @id_cliente_498 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_498, 'VIA ODONTOLOGICA ESECIALIZADA  S.A.C', '20611762462', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_498 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_498, 'VOE', 'AV. MICAELA BASTIDAS 384- COMAS', 'COMAS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_498 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_498, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [499] GRUPO SAN BERNARDO S.A.C.
--       RUC: 20610776117  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('GRUPO SAN BERNARDO S.A.C.', 'RUC', '20610776117', 1);
SET @id_cliente_499 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_499, 'GRUPO SAN BERNARDO S.A.C.', '20610776117', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_499 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_499, 'GRUPO SAN BERNARDO S.A.C.', 'AV. RETABLO NRO. 1015 LIMA - LIMA - COMAS', 'COMAS', 'LIMA', 'LIMA', NULL, '945953704', 1);
SET @id_sede_499 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_499, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [500] SILVA HUAMANI ROSIO RAQUEL
--       RUC: 10099762263  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('SILVA HUAMANI ROSIO RAQUEL', 'RUC', '10099762263', 1);
SET @id_cliente_500 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_500, 'SILVA HUAMANI ROSIO RAQUEL', '10099762263', 'Comas', 'LIMA', 'LIMA', 1);
SET @id_empresa_500 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_500, 'CLINICA ODONTOLOGICA CHIO DENT', 'Av Andres Avelino Caceres 279 2da zona collique. Comas.', 'Comas', 'LIMA', 'LIMA', NULL, '997169352', 1);
SET @id_sede_500 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_500, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [501] Claritydent E.I.R.L.
--       RUC: 20600894529  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Claritydent E.I.R.L.', 'RUC', '20600894529', 1);
SET @id_cliente_501 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_501, 'Claritydent E.I.R.L.', '20600894529', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_501 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_501, 'claritydent', 'avenida Micaela Bastidas 295 urb san Agustín comas', 'COMAS', 'LIMA', 'LIMA', 'SARA MARCOS', NULL, 1);
SET @id_sede_501 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_501, '2026-07-03', 'mensual', 55.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [502] XIMAR SERVICIOS VETERINARIOS S.A.C.
--       RUC: 20608353187  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('XIMAR SERVICIOS VETERINARIOS S.A.C.', 'RUC', '20608353187', 1);
SET @id_cliente_502 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_502, 'XIMAR SERVICIOS VETERINARIOS S.A.C.', '20608353187', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_502 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_502, 'VETERINARIA XIMAR', 'Av. Sinchi Roca 598, Comas', 'COMAS', 'LIMA', 'LIMA', 'XIMENA COLOMA', '944990850', 1);
SET @id_sede_502 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_502, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [503] Dental Medical Group H & M E.I.R.L.
--       RUC: 20612478440  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Dental Medical Group H & M E.I.R.L.', 'RUC', '20612478440', 1);
SET @id_cliente_503 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_503, 'Dental Medical Group H & M E.I.R.L.', '20612478440', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_503 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_503, 'MERAKI', 'Av. Universitaria norte 9243 2do piso - Comas', 'COMAS', 'LIMA', 'LIMA', NULL, '994377120', 1);
SET @id_sede_503 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_503, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [504] Asociados Ganoza & Camac SAC
--       RUC: 20609904292  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Asociados Ganoza & Camac SAC', 'RUC', '20609904292', 1);
SET @id_cliente_504 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_504, 'Asociados Ganoza & Camac SAC', '20609904292', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_504 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_504, 'Sawa Vet', 'Mz G1 Lt 13 Urb El Pinar Comas', 'COMAS', 'LIMA', 'LIMA', 'EDGAR CAMAC ACOSTA', '970587944', 1);
SET @id_sede_504 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_504, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [505] PARIS PET SAC
--       RUC: 20613775430  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('PARIS PET SAC', 'RUC', '20613775430', 1);
SET @id_cliente_505 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_505, 'PARIS PET SAC', '20613775430', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_505 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_505, 'PARIS PET SAC', 'CALLE CIUDAD DE LIMA 138 / MZ G LT 15', 'COMAS', 'LIMA', 'LIMA', NULL, '963223398', 1);
SET @id_sede_505 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_505, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [506] TREE DENT PERU E.I.R.L.
--       RUC: 20614486121  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('TREE DENT PERU E.I.R.L.', 'RUC', '20614486121', 1);
SET @id_cliente_506 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_506, 'TREE DENT PERU E.I.R.L.', '20614486121', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_506 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_506, 'Tree Den ODontologia Especializada', 'Pásaje Francisco Salaverry 196 - 2do piso Comas', 'COMAS', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_506 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_506, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [507] OPERADORES ODONTOLOGICOS WALFER S.A.C.
--       RUC: 20556748684  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('OPERADORES ODONTOLOGICOS WALFER S.A.C.', 'RUC', '20556748684', 1);
SET @id_cliente_507 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_507, 'OPERADORES ODONTOLOGICOS WALFER S.A.C.', '20556748684', 'COMAS', 'LIMA', 'LIMA', 1);
SET @id_empresa_507 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_507, 'OPERADORES ODONTOLOGICOS WALFER S.A.C.', 'JR. WIRACOCHA CDA 2 URB SAN AGUSTIN II ETAPA', 'COMAS', 'LIMA', 'LIMA', NULL, '991189587', 1);
SET @id_sede_507 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_507, '2026-07-03', 'mensual', 80.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [508] CLINICA VETERINARIA GAVET PERU S.A.C.
--       RUC: 20609660831  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CLINICA VETERINARIA GAVET PERU S.A.C.', 'RUC', '20609660831', 1);
SET @id_cliente_508 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_508, 'CLINICA VETERINARIA GAVET PERU S.A.C.', '20609660831', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 1);
SET @id_empresa_508 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_508, 'CLINICA VETERINARIA GAVET PERU', 'AV.PUENTE PIEDRA 563 PUENTE PIEDRA', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 'MAGALY', NULL, 1);
SET @id_sede_508 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_508, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [509] F.S.Q. COMPANY S.A.C.
--       RUC: 20556252981  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('F.S.Q. COMPANY S.A.C.', 'RUC', '20556252981', 1);
SET @id_cliente_509 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_509, 'F.S.Q. COMPANY S.A.C.', '20556252981', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 1);
SET @id_empresa_509 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_509, 'F.S.Q. COMPANY S.A.C.', 'CERCADO DE PUENTE PIEDRA – PASAJE MARIANO MELGAR 105', 'PUENTE PIEDRA', 'LIMA', 'LIMA', NULL, '956984967', 1);
SET @id_sede_509 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_509, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [510] MIL MASCOTAS S.A.C.
--       RUC: 20610928103  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('MIL MASCOTAS S.A.C.', 'RUC', '20610928103', 1);
SET @id_cliente_510 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_510, 'MIL MASCOTAS S.A.C.', '20610928103', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 1);
SET @id_empresa_510 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_510, 'MIL MASCOTAS', 'MZ.A LT 01 DEL PROGRAMA DE VIVIENDA LAS VIÑAS DEL NORTE 1ERA ETAPA', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 'LESLY', NULL, 1);
SET @id_sede_510 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_510, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [511] CORPORACION ODONTOLOGICO SAN GABRIEL SAC
--       RUC: 20608423011  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('CORPORACION ODONTOLOGICO SAN GABRIEL SAC', 'RUC', '20608423011', 1);
SET @id_cliente_511 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_511, 'CORPORACION ODONTOLOGICO SAN GABRIEL SAC', '20608423011', 'PUENTE PIEDRA - SANTA ROSA', 'LIMA', 'LIMA', 1);
SET @id_empresa_511 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_511, 'CONSULTORIO DENTAL SAN GABRIEL', 'MZ K LOTE 17 JR LOS GERANIOS 129 URBANIZACION COOVITIOMAR DISTRITO DE SANTA ROSA', 'PUENTE PIEDRA - SANTA ROSA', 'LIMA', 'LIMA', 'ADRIANA', '998919242', 1);
SET @id_sede_511 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_511, '2026-07-03', 'mensual', 75.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [512] Veterinaria Dr Tarazona SAC
--       RUC: 20608359304  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Veterinaria Dr Tarazona SAC', 'RUC', '20608359304', 1);
SET @id_cliente_512 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_512, 'Veterinaria Dr Tarazona SAC', '20608359304', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 1);
SET @id_empresa_512 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_512, 'VETERINARIA DR TARAZONA', 'Av puente piedra 445- A urbanización cercado de puente piedra', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 'MANUEL TARAZONA', '970025814', 1);
SET @id_sede_512 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_512, '2026-07-03', 'mensual', 59.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [513] NICASIO SILVA CESAR FORTUNATO
--       RUC: 10437153723  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('NICASIO SILVA CESAR FORTUNATO', 'RUC', '10437153723', 1);
SET @id_cliente_513 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_513, 'NICASIO SILVA CESAR FORTUNATO', '10437153723', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 1);
SET @id_empresa_513 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_513, 'NICASIO SILVA CESAR FORTUNATO', 'Av. San Lorenzo Mz. C Lt. 12, piso 2, Puente Piedra', 'PUENTE PIEDRA', 'LIMA', 'LIMA', NULL, '962581276', 1);
SET @id_sede_513 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_513, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [514] Jeny Luz Lázaro Ramos
--       RUC: 10708688903  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Jeny Luz Lázaro Ramos', 'RUC', '10708688903', 1);
SET @id_cliente_514 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_514, 'Jeny Luz Lázaro Ramos', '10708688903', 'PUENTE PIEDRA', 'LIMA', 'LIMA', 1);
SET @id_empresa_514 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_514, 'Luz de vida', 'Jr. Francisco Bolognesi N 316, cercado de Puente Piedra', 'PUENTE PIEDRA', 'LIMA', 'LIMA', NULL, NULL, 1);
SET @id_sede_514 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_514, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [515] JUAREZ ALVAREZ CARMELA MAURA
--       RUC: 10072540463  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('JUAREZ ALVAREZ CARMELA MAURA', 'RUC', '10072540463', 1);
SET @id_cliente_515 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_515, 'JUAREZ ALVAREZ CARMELA MAURA', '10072540463', 'JESUS MARIA', 'LIMA', 'LIMA', 1);
SET @id_empresa_515 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_515, 'Veterinaria Húsares de Junín', 'AV. HUSARES DE JUNIN 210', 'JESUS MARIA', 'LIMA', 'LIMA', 'CARMELA', NULL, 1);
SET @id_sede_515 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_515, '2026-07-03', 'mensual', 65.0, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [516] Gonzales Elias Claudio Jesus
--       RUC: 10768018044  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Gonzales Elias Claudio Jesus', 'RUC', '10768018044', 1);
SET @id_cliente_516 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_516, 'Gonzales Elias Claudio Jesus', '10768018044', '150', 'LIMA', 'LIMA', 1);
SET @id_empresa_516 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_516, 'Pumavet', 'CHILCA', '150', 'LIMA', 'LIMA', '902402238', NULL, 1);
SET @id_sede_516 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_516, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

-- [517] Martha Sofía Zanabria Montoya
--       RUC: 10484766539  |  Visitas junio: 1
INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
  VALUES ('Martha Sofía Zanabria Montoya', 'RUC', '10484766539', 1);
SET @id_cliente_517 = LAST_INSERT_ID();

INSERT INTO Empresa (id_cliente, razon_social, ruc, distrito, provincia, departamento, activo)
  VALUES (@id_cliente_517, 'Martha Sofía Zanabria Montoya', '10484766539', '90', 'LIMA', 'LIMA', 1);
SET @id_empresa_517 = LAST_INSERT_ID();

INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, contacto_nombre, contacto_telefono, activo)
  VALUES (@id_empresa_517, 'Mente y Sonrisa', 'SAN BARTOLO', '90', 'LIMA', 'LIMA', 'Martha Sofía Zanabria Montoya - 921221638', NULL, 1);
SET @id_sede_517 = LAST_INSERT_ID();

INSERT INTO ContratoServicio (id_sede, fecha_inicio, frecuencia, tarifa, tipo_tarifa, observaciones, activo)
  VALUES (@id_sede_517, '2026-07-03', 'mensual', 0.00, 'por_servicio', '[IMPORTADO RUTAS JUNIO 2026] Visitas: 1. ', 1);

-- ──────────────────────────────────────────────────────

COMMIT;
SET foreign_key_checks = 1;

-- FIN: 517 clientes procesados