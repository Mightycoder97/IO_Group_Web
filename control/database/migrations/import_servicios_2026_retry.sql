-- Importación Retry (PAGOS CLIENTES LIMA)
SET FOREIGN_KEY_CHECKS = 0;
-- Asegurar existencia de Planta Principal (Requerido por FK)
INSERT IGNORE INTO Planta (id_planta, razon_social, ruc, direccion, activo) VALUES (1, 'PLANTA PRINCIPAL', '20000000000', 'LIMA', 1);

-- Hoja Retry: LADY SEGOVIA NARVAEZ
SET @id_sede_retry_0 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%LADY SEGOVIA NARVAEZ%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2020-10-16', 'SEPTIEMBRE', '2020-10-07', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2020-11-14', 'NOVIEMBRE', '2020-11-14', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2020-12-11', 'DICIEMBRE', '2020-12-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-02-13', 'FEBRERO', '2021-02-17', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-03-13', 'MARZO', '2021-03-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-04-14', 'ABRIL', '2021-04-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-05-14', 'MAYO', '2021-05-15', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-06-14', 'JUNIO', '2021-06-21', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-07-15', 'JULIO', '2021-07-16', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-08-14', 'AGOSTO', '2021-08-17', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-09-14', 'SEPTIEMBRE', '2021-09-14', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-10-13', 'OCTUBRE', '2021-10-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-11-11', 'NOVIEMBRE', '2021-11-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2021-12-18', 'DICIEMBRE', '2021-12-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-03-11', 'MARZO', '2022-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-04-22', 'ABRIL', '2022-04-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-05-10', 'MAYO', '2022-05-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-06-10', 'JUNIO', '2022-06-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-07-11', 'JULIO', '2022-07-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-08-08', 'AGOSTO', '2022-08-08', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-09-07', 'SEPTIEMBRE', '2022-09-07', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-10-10', 'OCTUBRE', '2022-10-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-08-11', 'NOVIEMBRE', '2022-08-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2022-12-12', 'DICIEMBRE', '2022-12-12', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2023-07-01', 'ENERO', '2023-07-01', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2023-08-02', 'FEBRERO', '2023-08-02', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2023-08-03', 'MARZO', '2023-08-03', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2023-12-04', 'ABRIL', '2023-12-04', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2023-09-05', 'MAYO', '2023-09-05', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2023-07-06', 'JUNIO', '2023-07-06', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2023-07-10', 'JULIO', '2023-07-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_0, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_0 LIMIT 1), '2023-10-12', 'OCTUBRE', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_0 IS NOT NULL;

-- Hoja Retry: DIAGNOSTICO Y SALUD PERU

SET @id_sede_retry_1 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20605795022'  LIMIT 1);

-- Hoja Retry: PLURAL MEDICAL
SET @id_sede_retry_1 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%PLURAL MEDICAL%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-03-25', 'MARZO', '2021-04-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-04-26', 'ABRIL', '2021-05-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-05-17', 'MAYO', '2021-06-16', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-06-16', 'JUNIO', '2021-07-14', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-06-30', 'JUNIO', '2021-07-14', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-07-28', 'JULIO', '2021-08-25', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-08-26', 'AGOSTO', '2021-09-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-09-23', 'SEPTIEMBRE', '2021-11-23', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-10-27', 'OCTUBRE', '2021-11-23', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2021-11-30', 'NOVIEMBRE', '2022-03-30', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2022-03-31', 'MARZO', '2022-04-24', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2022-05-13', 'MAYO', '2022-05-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2022-07-08', 'JULIO', '2022-07-08', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2022-09-12', 'SEPTIEMBRE', '2012-09-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_1, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_1 LIMIT 1), '2022-12-14', 'DICIEMBRE', '2023-01-01', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_1 IS NOT NULL;

-- Hoja Retry: CESAR SANCHEZ

SET @id_sede_retry_2 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10078551114'  LIMIT 1);

-- Hoja Retry: DARWIN ROBLES
SET @id_sede_retry_2 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%DARWIN ROBLES%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2020-07-08', 'JUNIO', '2020-06-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2020-08-07', 'JULIO', '2020-08-07', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2020-09-09', 'AGOSTO', '2020-09-09', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2020-10-09', 'SEPTIEMBRE', '2020-10-09', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2020-11-11', 'NOVIEMBRE', '2020-11-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2020-12-09', 'DICIEMBRE', '2020-12-09', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2021-01-09', 'ENERO', '2021-01-09', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2021-03-10', 'MARZO', '2021-03-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2021-04-10', 'ABRIL', '2021-04-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2021-05-11', 'MAYO', '2021-05-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2021-06-10', 'JUNIO', '2021-06-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2021-07-12', 'JULIO', '2021-07-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_2, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_2 LIMIT 1), '2021-08-11', 'AGOSTO', '2021-08-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_2 IS NOT NULL;

-- Hoja Retry: monica carrillo

SET @id_sede_retry_3 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10096752968'  LIMIT 1);

-- Hoja Retry: MANUEL DIAZ
SET @id_sede_retry_3 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%MANUEL DIAZ%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2021-06-15', 'ENERO', '2021-06-15', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2021-08-12', 'AGOSTO', '2021-08-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2021-10-12', 'OCTUBRE', '2021-10-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2022-01-08', 'ENERO', '2022-01-08', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2022-02-10', 'FEBRERO', '2002-02-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2022-08-11', 'AGOSTO', '2022-08-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2022-10-04', 'OCTUBRE', '2022-10-04', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2022-06-12', 'DICIEMBRE', '2022-06-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2023-04-02', 'FEBRERO', '2023-04-02', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2023-11-04', 'ABRIL', '2023-11-04', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2023-06-06', 'JUNIO', '2023-06-06', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_3, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_3 LIMIT 1), '2023-09-05', 'SEPTIEMBRE', '2023-09-05', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_3 IS NOT NULL;

-- Hoja Retry: vidal lopez
SET @id_sede_retry_4 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%vidal lopez%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_4, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_4 LIMIT 1), '2021-06-11', 'MARZO', '2021-03-16', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_4 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_4, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_4 LIMIT 1), '2021-08-12', 'AGOSTO', '2021-10-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_4 IS NOT NULL;

-- Hoja Retry: CERRADO11
SET @id_sede_retry_5 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%CERRADO11%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2021-04-27', 'ENERO', '2021-04-05', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2021-08-05', 'AGOSTO', '2021-08-05', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2021-11-30', 'NOVIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2022-01-28', 'ENERO', '2022-01-28', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2022-02-22', 'FEBRERO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2022-03-31', 'MARZO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2022-05-03', 'ABRIL', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2022-05-23', 'MAYO', '2022-05-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2022-07-24', 'JULIO', '2022-07-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2022-09-23', 'SEPTIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2022-11-22', 'NOVIEMBRE', '2022-11-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_5, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_5 LIMIT 1), '2023-01-23', 'ENERO', '2023-01-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_5 IS NOT NULL;

-- Hoja Retry: MARIA DE LOS ANGELES
SET @id_sede_retry_6 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%MARIA DE LOS ANGELES%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2021-08-05', 'AGOSTO', '2021-06-17', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2021-09-03', 'SEPTIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2021-10-26', 'OCTUBRE', '2021-10-26', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2021-11-22', 'NOVIEMBRE', '2021-11-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2021-12-27', 'DICIEMBRE', '2021-12-27', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-01-21', 'ENERO', '2022-01-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-02-19', 'FEBRERO', '2022-02-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-03-23', 'MARZO', '2022-03-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-04-27', 'ABRIL', '2022-04-27', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-05-18', 'MAYO', '2022-05-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-06-18', 'JUNIO', '2022-06-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-07-20', 'JULIO', '2022-07-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-08-17', 'AGOSTO', '2022-08-17', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-09-20', 'SEPTIEMBRE', '2022-09-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-10-19', 'OCTUBRE', NULL, 'pendiente', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-11-19', 'NOVIEMBRE', '2022-11-19', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2022-12-17', 'DICIEMBRE', '2022-12-17', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-01-19', 'ENERO', '2023-01-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-02-21', 'FEBRERO', '2023-02-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-03-21', 'MARZO', '2023-03-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-04-20', 'ABRIL', '2023-04-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-05-22', 'MAYO', '2023-05-22', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-06-21', 'JUNIO', '2023-06-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-07-19', 'JULIO', '2023-07-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-08-22', 'AGOSTO', '2023-08-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-09-20', 'SEPTIEMBRE', '2023-09-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-10-24', 'OCTUBRE', '2023-10-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-11-24', 'NOVIEMBRE', '2023-11-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2023-12-21', 'DICIEMBRE', '2023-12-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-01-24', 'ENERO', '2024-01-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-02-29', 'FEBRERO', '2024-02-29', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-03-22', 'MARZO', '2024-03-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-04-23', 'ABRIL', '2024-04-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-05-25', 'MAYO', '2024-05-25', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-06-24', 'JUNIO', '2024-06-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-07-24', 'JULIO', '2024-07-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-08-26', 'AGOSTO', '2024-08-26', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-09-25', 'SEPTIEMBRE', '2024-09-25', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-10-25', 'OCTUBRE', '2024-10-25', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-11-25', 'NOVIEMBRE', '2024-11-25', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_6, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_6 LIMIT 1), '2024-12-26', 'DICIEMBRE', '2024-12-26', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_6 IS NOT NULL;

-- Hoja Retry: LUIS TOLENTINO

SET @id_sede_retry_7 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10102746487'  LIMIT 1);

-- Hoja Retry: CIRO GUARDIA SMP

SET @id_sede_retry_7 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10101628111'  LIMIT 1);

-- Hoja Retry: JOSE BENDEZU
SET @id_sede_retry_7 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%JOSE BENDEZU%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2021-08-11', 'JULIO', '2021-07-14', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2021-09-07', 'SEPTIEMBRE', '2021-09-06', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2021-10-22', 'OCTUBRE', '2021-10-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2021-11-19', 'NOVIEMBRE', '2021-11-19', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2021-12-21', 'DICIEMBRE', '2021-12-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-01-20', 'ENERO', '2022-01-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-02-18', 'FEBRERO', '2022-02-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-03-22', 'MARZO', '2022-03-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-04-26', 'ABRIL', '2022-04-26', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-05-18', 'MAYO', '2022-05-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-06-20', 'JUNIO', '2022-06-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-07-19', 'JULIO', '2022-07-19', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-08-17', 'AGOSTO', '2022-08-17', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-09-27', 'SEPTIEMBRE', '2022-09-27', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-10-21', 'OCTUBRE', '2022-10-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-11-23', 'NOVIEMBRE', '2022-11-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2022-12-21', 'DICIEMBRE', '2022-12-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-01-20', 'ENERO', '2023-01-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-02-20', 'FEBRERO', '2023-02-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-03-20', 'MARZO', '2023-03-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-04-20', 'ABRIL', '2023-04-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-05-20', 'MAYO', '2023-05-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-06-20', 'JUNIO', '2023-05-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-07-18', 'JULIO', '2023-07-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-08-21', 'AGOSTO', '2023-08-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-09-20', 'SEPTIEMBRE', '2023-09-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-10-23', 'OCTUBRE', '2023-10-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2023-12-20', 'DICIEMBRE', '2023-12-13', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2024-02-22', 'FEBRERO', NULL, 'pendiente', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2024-03-21', 'MARZO', '2024-03-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2024-04-22', 'ABRIL', '2024-04-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2024-06-24', 'JUNIO', '2024-06-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2024-07-24', 'JULIO', '2024-07-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2024-08-23', 'AGOSTO', '2024-08-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2024-10-24', 'OCTUBRE', '2024-10-24', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2025-01-21', 'ENERO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2025-02-21', 'FEBRERO', '2025-02-21', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2025-03-24', 'MARZO', '2025-03-24', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2025-04-25', 'ABRIL', '2025-04-25', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2025-06-23', 'JUNIO', '2025-06-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_7, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_7 LIMIT 1), '2025-10-21', 'OCTUBRE', '2025-10-21', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_7 IS NOT NULL;

-- Hoja Retry: CERRADO15
SET @id_sede_retry_8 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%CERRADO15%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-10-19', 'OCTUBRE', '2020-11-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-10-26', 'OCTUBRE', '2020-11-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-11-03', 'NOVIEMBRE', '2020-12-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-11-09', 'NOVIEMBRE', '2020-12-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-11-16', 'NOVIEMBRE', '2020-12-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-11-23', 'NOVIEMBRE', '2020-12-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-11-30', 'NOVIEMBRE', '2020-12-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-12-07', 'DICIEMBRE', '2020-12-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-12-14', 'DICIEMBRE', '2021-02-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-12-21', 'DICIEMBRE', '2021-02-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2020-12-28', 'DICIEMBRE', '2021-02-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-01-04', 'ENERO', '2021-02-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-01-12', 'ENERO', '2021-02-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-01-18', 'ENERO', '2021-02-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-01-25', 'ENERO', '2021-05-14', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-02-01', 'FEBRERO', '2021-05-14', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-02-08', 'FEBRERO', '2021-05-14', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-02-15', 'FEBRERO', '2021-05-14', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-02-22', 'FEBRERO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-03-01', 'MARZO', '2021-03-30', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-03-08', 'MARZO', '2021-03-30', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-03-15', 'MARZO', '2021-04-13', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-03-22', 'MARZO', '2021-04-13', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-03-29', 'MARZO', '2021-04-13', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-04-20', 'ABRIL', '2021-06-10', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-04-27', 'ABRIL', '2021-06-10', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-05-03', 'MAYO', '2021-06-16', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-05-12', 'MAYO', '2021-06-16', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-05-17', 'MAYO', '2021-06-16', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-05-27', 'MAYO', '2021-06-16', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-06-02', 'JUNIO', '2021-07-09', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-06-10', 'JUNIO', '2021-07-09', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-06-18', 'JUNIO', '2021-07-09', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-06-23', 'JUNIO', '2021-07-09', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-06-30', 'JUNIO', '2021-07-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-07-09', 'JULIO', '2021-09-06', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-07-30', 'JULIO', '2021-09-06', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-08-06', 'AGOSTO', '2021-09-23', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-08-13', 'AGOSTO', '2021-09-23', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-08-20', 'AGOSTO', '2021-09-23', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-08-28', 'AGOSTO', '2021-09-23', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_8, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_8 LIMIT 1), '2021-09-03', 'SEPTIEMBRE', '2021-10-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_8 IS NOT NULL;

-- Hoja Retry: CERRADO - ONLY PETS
SET @id_sede_retry_9 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%CERRADO - ONLY PETS%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_9, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_9 LIMIT 1), '2020-12-28', 'NOVIEMBRE', '2020-11-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_9 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_9, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_9 LIMIT 1), '2021-02-08', 'FEBRERO', '2021-02-08', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_9 IS NOT NULL;

-- Hoja Retry: fabiola chininin

SET @id_sede_retry_10 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10412079197'  LIMIT 1);

-- Hoja Retry: LIZ RODRIGUEZ
SET @id_sede_retry_10 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%LIZ RODRIGUEZ%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2021-05-22', 'ABRIL', '2021-04-30', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2021-06-22', 'JUNIO', '2021-06-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2021-08-24', 'AGOSTO', '2021-08-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2021-09-24', 'SEPTIEMBRE', '2021-09-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2021-11-03', 'NOVIEMBRE', '2021-11-03', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2021-12-04', 'DICIEMBRE', '2021-12-04', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2022-01-03', 'ENERO', '2022-01-03', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2022-03-02', 'MARZO', '2022-03-02', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_10, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_10 LIMIT 1), '2022-05-05', 'MAYO', '2022-05-05', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_10 IS NOT NULL;

-- Hoja Retry: DAVID CUBAS

SET @id_sede_retry_11 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10069561379'  LIMIT 1);

-- Hoja Retry: EDGAR SALCEDO
SET @id_sede_retry_11 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%EDGAR SALCEDO%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2021-08-06', 'AGOSTO', '2021-08-06', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2021-09-04', 'SEPTIEMBRE', '2021-09-04', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2021-10-05', 'OCTUBRE', '2021-10-05', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2021-11-04', 'NOVIEMBRE', '2021-11-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2021-12-04', 'DICIEMBRE', '2022-02-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2022-01-11', 'ENERO', '2022-02-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2022-02-09', 'FEBRERO', '2022-07-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2022-04-01', 'ABRIL', '2022-07-12', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2022-06-01', 'JUNIO', '2022-07-12', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2022-07-01', 'JULIO', '2022-07-12', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2022-08-01', 'AGOSTO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_11, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_11 LIMIT 1), '2022-09-01', 'SEPTIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_11 IS NOT NULL;

-- Hoja Retry: CÉSAR AUGUSTO FERNANDEZ QUINTAN
SET @id_sede_retry_12 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%CÉSAR AUGUSTO FERNANDEZ QUINTAN%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2021-08-21', 'AGOSTO', '2021-08-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2021-09-21', 'SEPTIEMBRE', '2021-09-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2021-10-19', 'OCTUBRE', '2021-10-19', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2021-11-23', 'NOVIEMBRE', '2021-11-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2021-12-18', 'DICIEMBRE', '2021-12-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-01-28', 'ENERO', '2022-01-27', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-02-16', 'FEBRERO', '2022-02-16', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-03-18', 'MARZO', '2022-03-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-04-22', 'ABRIL', '2022-04-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-05-12', 'MAYO', '2022-05-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-06-24', 'JUNIO', '2022-06-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-07-16', 'JULIO', '2022-07-16', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-08-11', 'AGOSTO', '2022-08-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-09-20', 'SEPTIEMBRE', '2022-09-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-10-17', 'OCTUBRE', '2022-10-17', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-11-16', 'NOVIEMBRE', '2022-11-16', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2022-12-15', 'DICIEMBRE', '2022-12-15', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2023-01-16', 'ENERO', '2023-01-16', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2023-02-15', 'FEBRERO', '2023-02-15', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2023-03-15', 'MARZO', '2023-03-15', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2025-04-21', NULL, NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2025-05-17', NULL, NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_12, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_12 LIMIT 1), '2025-06-17', NULL, NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_12 IS NOT NULL;

-- Hoja Retry: SKRABONJA SIMON JUAN MARCOS

SET @id_sede_retry_13 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10076098030'  LIMIT 1);

-- Hoja Retry: LILIAN GIOVANNA SÁNCHEZ 1
SET @id_sede_retry_13 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%LILIAN GIOVANNA SÁNCHEZ 1%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_13, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_13 LIMIT 1), '2021-09-22', 'SEPTIEMBRE', '2021-09-03', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_13 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_13, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_13 LIMIT 1), '2021-11-03', 'NOVIEMBRE', '2021-11-03', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_13 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_13, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_13 LIMIT 1), '2021-12-06', 'DICIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_13 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_13, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_13 LIMIT 1), '2022-02-03', 'FEBRERO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_13 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_13, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_13 LIMIT 1), '2022-04-06', 'MARZO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_13 IS NOT NULL;

-- Hoja Retry: ECOSSALUD E.I.R.L. 

SET @id_sede_retry_14 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20605746544'  LIMIT 1);

-- Hoja Retry: MARFA.LAB S.A.C.

SET @id_sede_retry_14 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20605747371'  LIMIT 1);

-- Hoja Retry: MERY ROSARIO ESCOBAR VASQUEZ

SET @id_sede_retry_14 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10411613696'  LIMIT 1);

-- Hoja Retry: FLORES EGOCHEAGA NELLY SEVELYN

SET @id_sede_retry_14 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10764628824'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_14, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_14 LIMIT 1), '2021-11-09', 'NOVIEMBRE', '2021-10-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_14 IS NOT NULL;

-- Hoja Retry: ECOBIO Mediclab SAC 

SET @id_sede_retry_15 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20553145512'  LIMIT 1);

-- Hoja Retry: CALZADILLA HUDSON YESLANY MAREN
SET @id_sede_retry_15 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%CALZADILLA HUDSON YESLANY MAREN%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2021-12-22', 'DICIEMBRE', '2021-10-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-01-24', 'ENERO', '2022-01-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-02-21', 'FEBRERO', '2022-02-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-03-24', 'MARZO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-04-27', 'ABRIL', '2022-04-27', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-05-20', 'MAYO', '2022-05-20', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-06-21', 'JUNIO', '2022-06-21', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-07-19', 'JULIO', '2022-07-19', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-08-17', 'AGOSTO', '2022-08-17', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-09-20', 'SEPTIEMBRE', '2022-09-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-10-19', 'OCTUBRE', '2022-10-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-11-19', 'NOVIEMBRE', '2022-11-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2022-12-17', 'DICIEMBRE', '2022-12-17', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-01-18', 'ENERO', '2023-01-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-02-20', 'FEBRERO', '2023-02-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-03-21', 'MARZO', '2023-03-21', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-04-20', 'ABRIL', '2023-04-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-05-24', 'MAYO', '2023-05-24', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-06-21', 'JUNIO', '2023-06-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-07-19', 'JULIO', '2023-07-19', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-08-31', 'AGOSTO', '2023-08-31', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_15, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_15 LIMIT 1), '2023-09-21', 'SEPTIEMBRE', '2023-09-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_15 IS NOT NULL;

-- Hoja Retry: ANDERSON DE LA CRUZ CARBAJAL 

SET @id_sede_retry_16 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10449111481'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_16, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_16 LIMIT 1), '2022-02-01', 'FEBRERO', '2021-10-13', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_16 IS NOT NULL;

-- Hoja Retry: MARIA ALEJANDRA  ESCALANTE CONT
SET @id_sede_retry_17 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%MARIA ALEJANDRA  ESCALANTE CONT%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_17, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_17 LIMIT 1), '2022-01-17', 'ENERO', '2021-11-08', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_17 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_17, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_17 LIMIT 1), '2022-02-25', 'FEBRERO', '2022-02-25', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_17 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_17, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_17 LIMIT 1), '2022-04-21', 'ABRIL', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_17 IS NOT NULL;

-- Hoja Retry: SANTANA RIBEIRO DE OLIVEIRA MAR
SET @id_sede_retry_18 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%SANTANA RIBEIRO DE OLIVEIRA MAR%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2021-12-13', 'DICIEMBRE', '2021-11-09', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-01-12', 'ENERO', '2022-01-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-02-26', 'FEBRERO', '2022-02-26', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-04-13', 'ABRIL', '2022-04-13', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-05-09', 'MAYO', '2022-05-09', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-06-10', 'JUNIO', '2022-06-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-07-11', 'JULIO', '2022-07-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-08-08', 'AGOSTO', '2022-08-08', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-09-09', 'SEPTIEMBRE', '2022-09-09', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-10-10', 'OCTUBRE', '2022-10-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-10-11', 'NOVIEMBRE', '2022-10-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2022-07-12', 'DICIEMBRE', '2022-07-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2023-07-02', 'FEBRERO', '2023-07-02', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2023-08-03', 'MARZO', '2023-04-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2023-04-26', 'ABRIL', '2023-04-26', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2023-05-27', 'MAYO', '2023-05-27', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2023-06-28', 'JUNIO', '2023-06-28', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_18, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_18 LIMIT 1), '2023-09-08', 'SEPTIEMBRE', '2023-09-08', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_18 IS NOT NULL;

-- Hoja Retry: CLINICA VETERINARIA SAN ROQUE L

SET @id_sede_retry_19 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20605637371' AND (s.distrito LIKE '%LIMA%' OR s.direccion LIKE '%LIMA%') LIMIT 1);
SET @id_sede_retry_19 = COALESCE(@id_sede_retry_19, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20605637371' LIMIT 1));

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_19, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_19 LIMIT 1), '2021-11-18', 'NOVIEMBRE', '2021-11-22', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_19 IS NOT NULL;

-- Hoja Retry: DEL AGUILA TRINIDAD MARINEY (2)

SET @id_sede_retry_20 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10420710564'  LIMIT 1);

-- Hoja Retry: NANVAS IMPORT SAC     
SET @id_sede_retry_20 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%NANVAS IMPORT SAC%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_20, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_20 LIMIT 1), '2021-12-13', 'DICIEMBRE', '2021-12-07', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_20 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_20, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_20 LIMIT 1), '2022-02-11', 'FEBRERO', '2022-10-03', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_20 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_20, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_20 LIMIT 1), '2022-05-10', 'MAYO', '2022-05-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_20 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_20, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_20 LIMIT 1), '2022-08-24', 'AGOSTO', '2022-08-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_20 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_20, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_20 LIMIT 1), '2022-09-11', 'NOVIEMBRE', '2022-09-28', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_20 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_20, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_20 LIMIT 1), '2022-12-12', 'DICIEMBRE', '2022-12-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_20 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_20, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_20 LIMIT 1), '2025-06-17', NULL, NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_20 IS NOT NULL;

-- Hoja Retry: ROSA MILAGRITOS MARTINEZ BRAVO

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10426753613'  LIMIT 1);

-- Hoja Retry: SANCHEZ PLASENCIA ELENA ROSA   

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10180546699'  LIMIT 1);

-- Hoja Retry: Rosa Concepción García Saavedra

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10081423470'  LIMIT 1);

-- Hoja Retry: MIGUEL ANGEL JIMENEZ MANRIQUE
SET @id_sede_retry_21 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%MIGUEL ANGEL JIMENEZ MANRIQUE%' LIMIT 1);

-- Hoja Retry: MIGUEL ANGEL JIMENEZ MANRIQUE
SET @id_sede_retry_21 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%MIGUEL ANGEL JIMENEZ MANRIQUE%' LIMIT 1);

-- Hoja Retry: SUSANIBAR ENCARNACION EDWARD 

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10712913245'  LIMIT 1);

-- Hoja Retry: TUANAMA PIZANGO DARVIN

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10459397031'  LIMIT 1);

-- Hoja Retry: MATE INVERSIONES E.I.R.L.

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20603182872' AND (s.distrito LIKE '%ATE%' OR s.direccion LIKE '%ATE%') LIMIT 1);
SET @id_sede_retry_21 = COALESCE(@id_sede_retry_21, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20603182872' LIMIT 1));

-- Hoja Retry: VAMOS-PET SHOP S.A.C.

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20606196114'  LIMIT 1);

-- Hoja Retry: VIDA SALUD OCUPACIONAL S.A. (2)

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20607179370'  LIMIT 1);

-- Hoja Retry: VIDA SALUD OCUPACIONAL S.A.C.

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20607179370' AND (s.distrito LIKE '%PUENTE PIEDRA%' OR s.direccion LIKE '%PUENTE PIEDRA%') LIMIT 1);
SET @id_sede_retry_21 = COALESCE(@id_sede_retry_21, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20607179370' LIMIT 1));

-- Hoja Retry: Trauma y rehabilitación sport s

SET @id_sede_retry_21 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20608961527'  LIMIT 1);

-- Hoja Retry: CONTRERAS QUINTERO GERALDINE YO
SET @id_sede_retry_21 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%CONTRERAS QUINTERO GERALDINE YO%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_21, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_21 LIMIT 1), '2022-07-15', 'JULIO', '2022-03-05', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_21 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_21, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_21 LIMIT 1), '2022-09-12', 'SEPTIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_21 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_21, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_21 LIMIT 1), '2023-01-16', 'ENERO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_21 IS NOT NULL;

-- Hoja Retry: VET SANTA LUCIA SAC

SET @id_sede_retry_22 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20601751136'  LIMIT 1);

-- Hoja Retry: OMEGA ODONTOLOGIA ESPECIALI (2)

SET @id_sede_retry_22 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20608413562' AND (s.distrito LIKE '%INDEPENDENCIA%' OR s.direccion LIKE '%INDEPENDENCIA%') LIMIT 1);
SET @id_sede_retry_22 = COALESCE(@id_sede_retry_22, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20608413562' LIMIT 1));

-- Hoja Retry: POLICLINICO MICAELA BASTIDAS EI

SET @id_sede_retry_22 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20605634266'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_22, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_22 LIMIT 1), '2022-11-21', 'NOVIEMBRE', '2022-06-21', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_22 IS NOT NULL;

-- Hoja Retry: SALUS LABORIS SAC STA. CLRA ATE

SET @id_sede_retry_23 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20512609458' AND (s.distrito LIKE '%ATE%' OR s.direccion LIKE '%ATE%') LIMIT 1);
SET @id_sede_retry_23 = COALESCE(@id_sede_retry_23, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20512609458' LIMIT 1));

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_23, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_23 LIMIT 1), '2022-10-27', 'OCTUBRE', '2022-08-09', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_23 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_23, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_23 LIMIT 1), '2022-11-25', 'NOVIEMBRE', '2022-12-29', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_23 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_23, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_23 LIMIT 1), '2022-11-26', 'NOVIEMBRE', '2022-12-29', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_23 IS NOT NULL;

-- Hoja Retry: SALUS LABORIS SAC HUACHIPA

SET @id_sede_retry_24 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20512609458'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_24, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_24 LIMIT 1), '2022-10-14', 'OCTUBRE', '2022-08-09', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_24 IS NOT NULL;

-- Hoja Retry: SALUS LABORIS SAC PUENTE PIEDRA

SET @id_sede_retry_25 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20512609458' AND (s.distrito LIKE '%PUENTE PIEDRA%' OR s.direccion LIKE '%PUENTE PIEDRA%') LIMIT 1);
SET @id_sede_retry_25 = COALESCE(@id_sede_retry_25, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20512609458' LIMIT 1));

-- Hoja Retry: KIRUSAMI S.A.C.

SET @id_sede_retry_25 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20606232293'  LIMIT 1);

-- Hoja Retry: HORUS DOGPACKERS S.A.C.

SET @id_sede_retry_25 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20609157713'  LIMIT 1);

-- Hoja Retry:  CARSEC SAC

SET @id_sede_retry_25 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20557819313'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_25, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_25 LIMIT 1), '2022-10-18', 'OCTUBRE', '2022-08-05', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_25 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_25, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_25 LIMIT 1), '2022-11-18', 'NOVIEMBRE', NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_25 IS NOT NULL;

-- Hoja Retry: INVERSIONES BASHAR S.A.C.

SET @id_sede_retry_26 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20609741971'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_26, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_26 LIMIT 1), '2022-10-14', 'OCTUBRE', '2022-07-27', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_26 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_26, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_26 LIMIT 1), '2022-11-16', 'NOVIEMBRE', '2022-11-24', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_26 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_26, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_26 LIMIT 1), '2022-12-16', 'DICIEMBRE', '2023-05-01', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_26 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_26, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_26 LIMIT 1), '2023-01-17', 'ENERO', '2022-01-17', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_26 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_26, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_26 LIMIT 1), '2023-02-16', 'FEBRERO', '2023-03-15', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_26 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_26, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_26 LIMIT 1), '2023-03-16', 'MARZO', '2023-04-21', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_26 IS NOT NULL;

-- Hoja Retry: INSTITUTO GUESTALT DE LIMA S.A.

SET @id_sede_retry_27 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20502688881' AND (s.distrito LIKE '%LIMA%' OR s.direccion LIKE '%LIMA%') LIMIT 1);
SET @id_sede_retry_27 = COALESCE(@id_sede_retry_27, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20502688881' LIMIT 1));

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_27, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_27 LIMIT 1), '2022-10-20', 'OCTUBRE', '2022-08-12', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_27 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_27, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_27 LIMIT 1), '2023-04-18', 'ABRIL', NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_27 IS NOT NULL;

-- Hoja Retry: VITA DENTIS S.A.C.

SET @id_sede_retry_28 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20608310836' AND (s.distrito LIKE '%MIRAFLORES%' OR s.direccion LIKE '%MIRAFLORES%') LIMIT 1);
SET @id_sede_retry_28 = COALESCE(@id_sede_retry_28, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20608310836' LIMIT 1));

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_28, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_28 LIMIT 1), '2022-10-27', 'OCTUBRE', '2022-09-28', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_28 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_28, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_28 LIMIT 1), '2022-12-29', 'DICIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_28 IS NOT NULL;

-- Hoja Retry: INTEGRAL MEDICAL CARE S.A.C.

SET @id_sede_retry_29 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20607167908'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_29, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_29 LIMIT 1), '2022-10-17', 'OCTUBRE', '2022-10-05', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_29 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_29, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_29 LIMIT 1), '2022-10-31', 'OCTUBRE', '2022-10-31', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_29 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_29, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_29 LIMIT 1), '2022-11-15', 'NOVIEMBRE', '2022-11-15', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_29 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_29, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_29 LIMIT 1), '2022-11-29', 'NOVIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_29 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_29, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_29 LIMIT 1), '2022-12-14', 'DICIEMBRE', '2022-12-14', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_29 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_29, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_29 LIMIT 1), '2022-12-29', 'DICIEMBRE', '2022-12-29', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_29 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_29, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_29 LIMIT 1), '2023-01-16', 'ENERO', '2023-01-27', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_29 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_29, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_29 LIMIT 1), '2023-01-31', 'ENERO', '2023-02-15', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_29 IS NOT NULL;

-- Hoja Retry: VETERINARIA KUSI ALKHO SAC

SET @id_sede_retry_30 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20601799929'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_30, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_30 LIMIT 1), '2022-10-18', NULL, NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_30 IS NOT NULL;

-- Hoja Retry: F45 E.I.R.L.

SET @id_sede_retry_31 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20525005161'  LIMIT 1);

-- Hoja Retry: ONCOLOGIA INTEGRAL 

SET @id_sede_retry_31 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20604471738'  LIMIT 1);

-- Hoja Retry: SALIS SANTIAGO LESLY NORA

SET @id_sede_retry_31 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10612162617'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_31, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_31 LIMIT 1), '2022-12-22', 'DICIEMBRE', '2022-11-15', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_31 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_31, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_31 LIMIT 1), '2023-01-23', 'ENERO', '2022-11-15', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_31 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_31, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_31 LIMIT 1), '2023-02-23', 'FEBRERO', '2022-11-15', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_31 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_31, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_31 LIMIT 1), '2023-03-25', 'MARZO', '2023-03-25', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_31 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_31, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_31 LIMIT 1), '2023-05-25', 'MAYO', '2023-05-25', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_31 IS NOT NULL;

-- Hoja Retry:  DIABETES SOY DIABETICO

SET @id_sede_retry_32 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20526036922' AND (s.distrito LIKE '%LIMA%' OR s.direccion LIKE '%LIMA%') LIMIT 1);
SET @id_sede_retry_32 = COALESCE(@id_sede_retry_32, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20526036922' LIMIT 1));

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_32, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_32 LIMIT 1), '2022-12-19', 'DICIEMBRE', '2022-10-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_32 IS NOT NULL;

-- Hoja Retry: REHABLIMA E.I.R.L.

SET @id_sede_retry_33 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20609096315' AND (s.distrito LIKE '%LIMA%' OR s.direccion LIKE '%LIMA%') LIMIT 1);
SET @id_sede_retry_33 = COALESCE(@id_sede_retry_33, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20609096315' LIMIT 1));

-- Hoja Retry: MELYSALUD (2)

SET @id_sede_retry_33 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20553512281'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_33, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_33 LIMIT 1), '2023-01-31', 'ENERO', '2023-04-01', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_33 IS NOT NULL;

-- Hoja Retry: Jannet Melissa Salcedo Macal2

SET @id_sede_retry_34 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10461997673'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_34, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_34 LIMIT 1), '2023-02-02', 'FEBRERO', '2023-02-02', 'pagado', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_34 IS NOT NULL;

-- Hoja Retry: Jannet Melissa Salcedo Macalupu

SET @id_sede_retry_35 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10461997673'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_35, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_35 LIMIT 1), '2023-02-02', 'FEBRERO', NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_35 IS NOT NULL;

-- Hoja Retry: 2007 EMPRESA MUN CHO

SET @id_sede_retry_36 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20556621188' AND (s.distrito LIKE '%CHORRILLOS%' OR s.direccion LIKE '%CHORRILLOS%') LIMIT 1);
SET @id_sede_retry_36 = COALESCE(@id_sede_retry_36, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20556621188' LIMIT 1));

-- Hoja Retry: ORAL ESTHETIC CLASS EIRL

SET @id_sede_retry_36 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20548230960'  LIMIT 1);

-- Hoja Retry: Centro Médico Juan XXIII SAC

SET @id_sede_retry_36 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20117252281'  LIMIT 1);

-- Hoja Retry: ASISTENCIA VETERINARIA SALUD AN

SET @id_sede_retry_36 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20608470761'  LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_36, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_36 LIMIT 1), '2023-03-24', NULL, NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_36 IS NOT NULL;

-- Hoja Retry: Livia Teresa Rivas Ortega
SET @id_sede_retry_37 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%Livia Teresa Rivas Ortega%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2023-05-04', 'MAYO', '2023-12-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2023-07-08', 'JULIO', '2023-07-08', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2023-10-13', 'OCTUBRE', '2023-10-12', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2023-11-09', 'NOVIEMBRE', '2023-11-09', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2023-12-12', 'DICIEMBRE', '2023-12-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2024-01-11', 'ENERO', '2024-01-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2024-02-12', 'FEBRERO', '2024-02-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2024-03-12', 'MARZO', '2024-03-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2024-04-10', 'ABRIL', '2024-04-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2024-05-14', 'MAYO', '2024-05-14', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_37, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_37 LIMIT 1), '2024-09-13', 'SEPTIEMBRE', '2024-09-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_37 IS NOT NULL;

-- Hoja Retry: MENDIZABAL ARIZMENDI ARMANDO

SET @id_sede_retry_38 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10085138974'  LIMIT 1);

-- Hoja Retry: ECHEVARRIA ANGULO MARIA

SET @id_sede_retry_38 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10098349591' AND (s.distrito LIKE '%SANTA ROSA%' OR s.direccion LIKE '%SANTA ROSA%') LIMIT 1);
SET @id_sede_retry_38 = COALESCE(@id_sede_retry_38, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10098349591' LIMIT 1));

-- Hoja Retry: HERNANDEZ ANDRADE MILIUSKA EDWI
SET @id_sede_retry_38 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%HERNANDEZ ANDRADE MILIUSKA EDWI%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2023-09-19', 'SEPTIEMBRE', '2023-08-08', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2023-10-20', 'OCTUBRE', '2023-08-08', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2023-11-20', 'NOVIEMBRE', '2023-08-08', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2023-12-21', 'DICIEMBRE', '2023-12-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-01-22', 'ENERO', '2024-01-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-02-22', 'FEBRERO', '2024-02-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-03-21', 'MARZO', '2024-03-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-04-22', 'ABRIL', '2024-04-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-05-24', 'MAYO', '2024-05-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-06-22', 'JUNIO', '2024-06-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-07-22', 'JULIO', '2024-07-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-08-24', 'AGOSTO', '2024-08-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-09-24', 'SEPTIEMBRE', '2024-09-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-10-23', 'OCTUBRE', '2024-10-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-11-22', 'NOVIEMBRE', NULL, 'pendiente', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2024-12-23', 'DICIEMBRE', NULL, 'pendiente', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-01-22', 'ENERO', NULL, 'pendiente', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-02-22', 'FEBRERO', '2025-02-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-03-24', 'MARZO', '2025-03-24', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-04-25', 'ABRIL', '2025-04-25', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-05-23', 'MAYO', '2025-05-23', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-06-23', 'JUNIO', '2025-06-25', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-07-18', 'JULIO', '2025-07-18', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-08-25', 'AGOSTO', '2025-08-25', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-09-22', 'SEPTIEMBRE', '2025-09-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-10-21', 'OCTUBRE', '2025-10-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-11-21', 'NOVIEMBRE', '2025-11-21', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2025-12-22', 'DICIEMBRE', '2025-12-22', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_38, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_38 LIMIT 1), '2026-01-23', 'ENERO', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_38 IS NOT NULL;

-- Hoja Retry: ASIRI DENTAL MEDIC SAC

SET @id_sede_retry_39 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20611382708'  LIMIT 1);

-- Hoja Retry: HIDALGO CRUZ SOFIA MARIVEL

SET @id_sede_retry_39 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10097480465'  LIMIT 1);

-- Hoja Retry: MINISTERIO DE DEFENSA Ejército 
SET @id_sede_retry_39 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%MINISTERIO DE DEFENSA Ejército%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2023-11-06', 'NOVIEMBRE', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2023-12-05', 'DICIEMBRE', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-01-05', 'ENERO', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-02-06', 'FEBRERO', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-03-05', 'MARZO', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-04-06', 'ABRIL', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-05-11', 'MAYO', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-06-05', 'JUNIO', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-07-04', 'JULIO', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-08-05', 'AGOSTO', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-09-07', 'SEPTIEMBRE', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-10-07', 'OCTUBRE', '2023-10-11', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-11-06', 'NOVIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2024-12-05', 'DICIEMBRE', '2025-02-06', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_39, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_39 LIMIT 1), '2025-01-06', 'ENERO', '2025-02-06', 'pagado', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_39 IS NOT NULL;

-- Hoja Retry: DE ABREU BECERRA DIANA CLARA   
SET @id_sede_retry_40 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%DE ABREU BECERRA DIANA CLARA%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2023-12-27', 'DICIEMBRE', '2023-12-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-01-13', 'ENERO', '2023-12-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-02-13', 'FEBRERO', '2023-12-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-03-12', 'MARZO', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-04-11', 'ABRIL', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-05-15', 'MAYO', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-06-12', 'JUNIO', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-07-10', 'JULIO', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-08-12', 'AGOSTO', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-09-16', 'SEPTIEMBRE', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-10-14', 'OCTUBRE', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-11-12', 'NOVIEMBRE', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2024-12-13', 'DICIEMBRE', '2024-03-11', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-01-13', 'ENERO', '2025-01-13', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-02-12', 'FEBRERO', '2025-02-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-03-12', 'MARZO', '2025-03-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-04-14', 'ABRIL', '2025-04-14', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-05-14', 'MAYO', '2025-05-14', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-06-17', 'JUNIO', '2025-06-17', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-07-09', 'JULIO', '2025-07-09', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-08-14', 'AGOSTO', NULL, 'pendiente', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-09-12', 'SEPTIEMBRE', '2025-09-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-10-10', 'OCTUBRE', '2025-10-10', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-11-12', 'NOVIEMBRE', '2025-11-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2025-12-12', 'DICIEMBRE', '2025-12-12', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_40, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_40 LIMIT 1), '2026-01-16', 'ENERO', '2026-02-04', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_40 IS NOT NULL;

-- Hoja Retry: ARAUJO ROBLES JORGE LUIS     
SET @id_sede_retry_41 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%ARAUJO ROBLES JORGE LUIS%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-02-16', 'FEBRERO', '2023-12-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-03-18', 'MARZO', '2023-12-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-04-16', 'ABRIL', '2023-12-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-05-18', 'MAYO', '2024-05-27', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-06-17', 'JUNIO', '2024-06-18', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-07-16', 'JULIO', '2024-07-22', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-08-19', 'AGOSTO', '2024-08-20', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-09-18', 'SEPTIEMBRE', '2024-09-19', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-10-18', 'OCTUBRE', '2024-10-23', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-11-18', 'NOVIEMBRE', '2024-11-27', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_41, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_41 LIMIT 1), '2024-12-17', 'DICIEMBRE', '2024-12-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_41 IS NOT NULL;

-- Hoja Retry: ARMONIZACION FACIAL PERU SAC   

SET @id_sede_retry_42 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20611032359'  LIMIT 1);

-- Hoja Retry: CLINICA FELINA JACOBITA S.A (2)

SET @id_sede_retry_42 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20609688913' AND (s.distrito LIKE '%LIMA%' OR s.direccion LIKE '%LIMA%') LIMIT 1);
SET @id_sede_retry_42 = COALESCE(@id_sede_retry_42, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20609688913' LIMIT 1));

-- Hoja Retry: SALUD XPRESS SOCIEDAD ANONIMA C

SET @id_sede_retry_42 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20612344575'  LIMIT 1);

-- Hoja Retry: MARIA PATRICIA NAVAS CORDERO
SET @id_sede_retry_42 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%MARIA PATRICIA NAVAS CORDERO%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2024-09-27', 'SEPTIEMBRE', '2024-08-02', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2024-10-28', 'OCTUBRE', '2024-08-02', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2024-11-27', 'NOVIEMBRE', '2024-08-02', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2024-12-27', 'DICIEMBRE', NULL, 'pendiente', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-01-27', 'ENERO', NULL, 'pendiente', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-02-26', 'FEBRERO', '2025-02-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-03-27', 'MARZO', '2025-03-27', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-04-29', 'ABRIL', '2025-04-29', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-05-28', 'MAYO', '2025-05-28', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-06-27', 'JUNIO', '2025-06-27', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-07-25', 'JULIO', '2025-07-25', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-08-27', 'AGOSTO', '2025-08-27', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-09-26', 'SEPTIEMBRE', '2025-09-26', 'pagado', 'EFECTIVO', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-10-27', 'OCTUBRE', '2025-10-27', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-11-26', 'NOVIEMBRE', '2025-11-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2025-12-29', 'DICIEMBRE', '2025-12-29', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_42, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_42 LIMIT 1), '2026-01-30', 'ENERO', '2026-02-02', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_42 IS NOT NULL;

-- Hoja Retry:  HUERTAS RAMOS ANGELA ASTRID
SET @id_sede_retry_43 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%HUERTAS RAMOS ANGELA ASTRID%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2024-08-12', 'AGOSTO', '2024-06-03', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2024-09-25', 'SEPTIEMBRE', '2024-06-03', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2024-11-29', 'OCTUBRE', '2024-06-03', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2024-11-29', 'NOVIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2024-12-27', 'DICIEMBRE', NULL, 'pendiente', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2025-02-28', 'FEBRERO', '2025-03-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2025-03-26', 'MARZO', '2025-03-26', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2025-05-30', 'MAYO', '2025-05-30', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_43, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_43 LIMIT 1), '2025-06-25', 'JUNIO', '2025-07-01', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_43 IS NOT NULL;

-- Hoja Retry: VES OMONTE GUTIERREZ JOHAN R

SET @id_sede_retry_44 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10437752911' AND (s.distrito LIKE '%PACHACAMAC%' OR s.direccion LIKE '%PACHACAMAC%') LIMIT 1);
SET @id_sede_retry_44 = COALESCE(@id_sede_retry_44, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10437752911' LIMIT 1));

-- Hoja Retry: Maribel Jacqueline Vila Guillén

SET @id_sede_retry_44 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10407976911'  LIMIT 1);

-- Hoja Retry: Bazan Varas Maruja Consuelo

SET @id_sede_retry_44 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10086821686' AND (s.distrito LIKE '%ATE%' OR s.direccion LIKE '%ATE%') LIMIT 1);
SET @id_sede_retry_44 = COALESCE(@id_sede_retry_44, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10086821686' LIMIT 1));

-- Hoja Retry: LUNA HUANCA IGNACIO

SET @id_sede_retry_44 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10062648495'  LIMIT 1);

-- Hoja Retry: CARLOS GIL GABRIEL CALVO MAC
SET @id_sede_retry_44 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%CARLOS GIL GABRIEL CALVO MAC%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_44, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_44 LIMIT 1), '2024-12-17', 'DICIEMBRE', NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_44 IS NOT NULL;

-- Hoja Retry: GARCIA MIRANDA CESAR ARTURO

SET @id_sede_retry_45 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10215207876'  LIMIT 1);

-- Hoja Retry: samantha rojas        
SET @id_sede_retry_45 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%samantha rojas%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_45, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_45 LIMIT 1), '2025-02-27', 'FEBRERO', NULL, 'pendiente', NULL, 'Otros', 'completado'
WHERE @id_sede_retry_45 IS NOT NULL;

-- Hoja Retry: ANCONGrupo consorcio vet

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20607299944' AND (s.distrito LIKE '%ANCON%' OR s.direccion LIKE '%ANCON%') LIMIT 1);
SET @id_sede_retry_46 = COALESCE(@id_sede_retry_46, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20607299944' LIMIT 1));

-- Hoja Retry: Bertha paullo pomahuacre de Mon
SET @id_sede_retry_46 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%Bertha paullo pomahuacre de Mon%' LIMIT 1);

-- Hoja Retry: Bertha paullo pomahuacre de Mon
SET @id_sede_retry_46 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%Bertha paullo pomahuacre de Mon%' LIMIT 1);

-- Hoja Retry:  SERVSALUD SAC       

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20609251141'  LIMIT 1);

-- Hoja Retry:  LAU SALAZAR MIGUEL ANGEL      

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10405521712'  LIMIT 1);

-- Hoja Retry: Melissa Fiorella Becerra Trujil

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10471418299'  LIMIT 1);

-- Hoja Retry: Judith Chavarria Quispe

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10456050307'  LIMIT 1);

-- Hoja Retry: Luz pilar solis javier

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10258012599'  LIMIT 1);

-- Hoja Retry: DETECTA CENTRO ONCOLOGICO S (2)

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20515468499' AND (s.distrito LIKE '%SAN BORJA%' OR s.direccion LIKE '%SAN BORJA%') LIMIT 1);
SET @id_sede_retry_46 = COALESCE(@id_sede_retry_46, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20515468499' LIMIT 1));

-- Hoja Retry: GRUPO VETERINARIO LAS VIÑAS (2)

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20549914951' AND (s.distrito LIKE '%LA MOLINA%' OR s.direccion LIKE '%LA MOLINA%') LIMIT 1);
SET @id_sede_retry_46 = COALESCE(@id_sede_retry_46, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20549914951' LIMIT 1));

-- Hoja Retry: GRUPO VETERINARIO LAS VIÑAS SAC

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20549914951' AND (s.distrito LIKE '%LA MOLINA%' OR s.direccion LIKE '%LA MOLINA%') LIMIT 1);
SET @id_sede_retry_46 = COALESCE(@id_sede_retry_46, (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20549914951' LIMIT 1));

-- Hoja Retry: HOJA(4)

SET @id_sede_retry_46 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10712395619'  LIMIT 1);

-- Hoja Retry: CONSULTORIO DENTAL DR. CUADROS 
SET @id_sede_retry_46 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%CONSULTORIO DENTAL DR. CUADROS%' LIMIT 1);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, fecha_ejecucion, mes_servicio, fecha_pago, estado_pago, forma_pago, descripcion_residuo, estado)
SELECT @id_sede_retry_46, 1, (SELECT id_contrato FROM ContratoServicio WHERE id_sede = @id_sede_retry_46 LIMIT 1), '2026-01-21', 'ENERO', '2026-01-05', 'pagado', 'TRANSFERENCIA', 'Otros', 'completado'
WHERE @id_sede_retry_46 IS NOT NULL;

-- Hoja Retry: ATM SERVET SAC

SET @id_sede_retry_47 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20603611579'  LIMIT 1);

-- Hoja Retry: GARCIA RAMIREZ WASHINGTON

SET @id_sede_retry_47 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10061555418'  LIMIT 1);

-- Hoja Retry: VitalPro SAC

SET @id_sede_retry_47 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20614280639'  LIMIT 1);

-- Hoja Retry: DENTALISTA S.A.C.

SET @id_sede_retry_47 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20611537698'  LIMIT 1);

-- Hoja Retry: consultorio médico pulso & vida

SET @id_sede_retry_47 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20610407171'  LIMIT 1);

-- Hoja Retry: centro odontológico Loladent sa

SET @id_sede_retry_47 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '20614081890'  LIMIT 1);

-- Hoja Retry: Torres Paxi Keyla Jeaneth 

SET @id_sede_retry_47 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10460421514'  LIMIT 1);

-- Hoja Retry: Juan Diego Flores Rodas

SET @id_sede_retry_47 = (SELECT s.id_sede FROM Sede s JOIN Empresa e ON s.id_empresa = e.id_empresa WHERE e.ruc = '10707743081'  LIMIT 1);

-- Hoja Retry: hoja 2 (2)
SET @id_sede_retry_47 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%hoja 2 (2)%' LIMIT 1);

-- Hoja Retry: hoja 2 (2)
SET @id_sede_retry_47 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%hoja 2 (2)%' LIMIT 1);

-- Hoja Retry: hoja 2
SET @id_sede_retry_47 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%hoja 2%' LIMIT 1);

-- Hoja Retry: hoja 2
SET @id_sede_retry_47 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%hoja 2%' LIMIT 1);

-- Hoja Retry: HOJA 1 (3)
SET @id_sede_retry_47 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%HOJA 1 (3)%' LIMIT 1);

-- Hoja Retry: HOJA 1 (3)
SET @id_sede_retry_47 = (SELECT id_sede FROM Sede WHERE nombre_comercial LIKE '%HOJA 1 (3)%' LIMIT 1);