-- MIGRACIÓN MASIVA DE SERVICIOS (LIMA Y SUR) - 2024 a 2026
-- Generado el: 2026-06-26 17:48:43
SET FOREIGN_KEY_CHECKS = 0;

-- ==================================================
-- CLIENTE: VERSE BIEN CENTRO DE CIRUGIA ESTETICA INTEGRAL SAC (RUC: 20553898294) | Sede ID: 919 | Hoja: verse bien
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (919, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 919)) FROM ContratoServicio WHERE id_sede = 919 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 150.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45256');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62976', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PILLACA GONZALES JAIME WALTER (RUC: 10068481860) | Sede ID: 1215 | Hoja: jaime pillaca
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICINA ESTETICA Y BELLEZA INTEGRAL EIRL (RUC: 20603627581) | Sede ID: 834 | Hoja: Med est y belle int ZI medica
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (834, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 834)) FROM ContratoServicio WHERE id_sede = 834 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63197', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: BELLEZA Y CIENCIA SAC (RUC: 20548548625) | Sede ID: 280 | Hoja: belleza y ciencia
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 280)) FROM ContratoServicio WHERE id_sede = 280 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63155', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO QP E.I.R.L. (RUC: 20603297289) | Sede ID: 783 | Hoja: grupo qp 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (783, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 783)) FROM ContratoServicio WHERE id_sede = 783 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45372');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62790', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ONCOLOGIA S.A.C. (RUC: 20428674201) | Sede ID: 833 | Hoja: oncologia 
-- ==================================================

-- ==================================================
-- CLIENTE: ONCOLOGIA S.A.C. (RUC: 20428674201) | Sede ID: 833 | Hoja: ONCOLOGIA ESP.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (833, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 833)) FROM ContratoServicio WHERE id_sede = 833 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62714', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: INSTITUTO INTEGRAL VIDA PLENA SAC (RUC: 20477940642) | Sede ID: 1171 | Hoja: inst integral vida plena
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1171, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1171)) FROM ContratoServicio WHERE id_sede = 1171 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', 118.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45417');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62895', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INSTITUTO INTEGRAL VIDA PLENA SAC (RUC: 20477940642) | Sede ID: 1171 | Hoja: INST INTEG VIDA PLENA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1171, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1171)) FROM ContratoServicio WHERE id_sede = 1171 AND activo = 1), 'MAYO', '2026-06-15', 'completado', 'pendiente', NULL, 'transeferencia', 'por pagar', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45417');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62896', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1171, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1171)) FROM ContratoServicio WHERE id_sede = 1171 AND activo = 1), 'JULIO', '2026-07-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);

-- ==================================================
-- CLIENTE: MAXI MEDIC EIRL (RUC: 20544253094) | Sede ID: 20 | Hoja: maxi medic
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (20, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 20)) FROM ContratoServicio WHERE id_sede = 20 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45491');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63012', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HAMPI WASI SAC (RUC: 20603053037) | Sede ID: 1178 | Hoja: HAMPI WASI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1178, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1178)) FROM ContratoServicio WHERE id_sede = 1178 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);

-- ==================================================
-- CLIENTE: ASOCIACION DE DESARROLLO DE LA EDUCACION Y LA SALUD (RUC: 20136458923) | Sede ID: 878 | Hoja: ASOC DE DESARROLLO D LA EDUC Y 
-- ==================================================

-- ==================================================
-- CLIENTE: Cesmed Lima Norte SAC (RUC: 20605857613) | Sede ID: 962 | Hoja: Cesmed Lima Norte
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (962, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 962)) FROM ContratoServicio WHERE id_sede = 962 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-06-24', 'transferencia', 'YAPE', 85.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45393');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63330', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO MEDICO DE APOYO LOS ANGELES SRL (RUC: 20607248380) | Sede ID: 520 | Hoja: centro med de apoyo
-- ==================================================

-- ==================================================
-- CLIENTE: SANITAS CORPUS EIRL (RUC: 20549009884) | Sede ID: 497 | Hoja: sanitas corpus
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (497, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 497)) FROM ContratoServicio WHERE id_sede = 497 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62908', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (497, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 497)) FROM ContratoServicio WHERE id_sede = 497 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62910', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (497, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 497)) FROM ContratoServicio WHERE id_sede = 497 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62909', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (497, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 497)) FROM ContratoServicio WHERE id_sede = 497 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62907', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LU LEON VDA DE PEREZ ANA MARIA (RUC: 10091760547) | Sede ID: 543 | Hoja: ANA MARIA LU
-- ==================================================

-- ==================================================
-- CLIENTE: INSTITUTO ESPECIALIZADO EN SERVICIO DE SALUD SAC (RUC: 20600385411) | Sede ID: 902 | Hoja: INSTITUTO ESPECIALIZADO 
-- ==================================================

-- ==================================================
-- CLIENTE: OFTALMO MEDICAL CENTER S.A.C. (RUC: 20607132454) | Sede ID: 549 | Hoja: OFTALMO MEDICAL CENTER
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICHECK SALUD SAC. (RUC: 20603710658) | Sede ID: 377 | Hoja: SERVICHECK SALUD
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (377, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 377)) FROM ContratoServicio WHERE id_sede = 377 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 180.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45424');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62941', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO GINECO OBSTETRICO CONCEBIR EIRL (RUC: 20608547780) | Sede ID: 344 | Hoja: CONCEBIR
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (344, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 344)) FROM ContratoServicio WHERE id_sede = 344 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-06-24', 'transferencia', '6.1', 90.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63347', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DIAGNODENT S.A.C. (RUC: 20547256639) | Sede ID: 1057 | Hoja: CA- DIAGNODENT
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1057, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1057)) FROM ContratoServicio WHERE id_sede = 1057 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63435', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DIAGNODENT S.A.C. (RUC: 20547256639) | Sede ID: 1067 | Hoja: CO- DIAGNODENT
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1067, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1067)) FROM ContratoServicio WHERE id_sede = 1067 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45420');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62913', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LABORATORIO CLÍNICO SAMA S.A.C. (RUC: 20606759178) | Sede ID: 482 | Hoja: LAB CLIN SAMA
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS ESPECIALIZADOS SAN AGUSTIN SAC (RUC: 20554923527) | Sede ID: 348 | Hoja: SERV MED ESP SAN AGUSTIN
-- ==================================================

-- ==================================================
-- CLIENTE: Hernandez Campoverde Zoila (RUC: 10167611341) | Sede ID: 69 | Hoja: ZOILA HERNANDEZ
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (69, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 69)) FROM ContratoServicio WHERE id_sede = 69 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, '2', NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63218', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MEGAMEDIC L Y A SERVICIOS SAC (RUC: 20515275771) | Sede ID: 971 | Hoja: MeGAMEDIC L Y A SERV
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (971, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 971)) FROM ContratoServicio WHERE id_sede = 971 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, '7.1', NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63433', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: TELLO ROMANI YURI ROXANA (RUC: 10703453061) | Sede ID: 555 | Hoja: YURI TELLO
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL SALCEDO SAC (RUC: 20615633683) | Sede ID: 954 | Hoja: SALCEDO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (954, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 954)) FROM ContratoServicio WHERE id_sede = 954 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63236', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ODONTHO ESPECIALISTAS S.A.C (RUC: 20535640468) | Sede ID: 24 | Hoja: Odontho 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (24, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 24)) FROM ContratoServicio WHERE id_sede = 24 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-15', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45400');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62865', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DIAZ CHAVEZ MARIA ELEANA (RUC: 10077624924) | Sede ID: 1167 | Hoja: DIAZ CHAVEZ MARIA ELEANA 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1167, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1167)) FROM ContratoServicio WHERE id_sede = 1167 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-22', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45385');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63165', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PALOMINO CARREÑO MARIELA RUTH (RUC: 10432639971) | Sede ID: 893 | Hoja: PALOMINO CARREÑO MARIELA RUTH 
-- ==================================================

-- ==================================================
-- CLIENTE: FEBRES GARCIA CARLOS AUGUSTO (RUC: 10075417441) | Sede ID: 194 | Hoja: Carlos Febres
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (194, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 194)) FROM ContratoServicio WHERE id_sede = 194 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63134', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA AMERICANO DENTAL CADE E.I.R.L. (RUC: 20600820690) | Sede ID: 489 | Hoja: CLin Americano dental
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICAS OCLUDENT SAC (RUC: 20513753862) | Sede ID: 993 | Hoja: OCLUDENT
-- ==================================================

-- ==================================================
-- CLIENTE: K Y M ESTHETIC DENT SAC (RUC: 20600723571) | Sede ID: 265 | Hoja: K Y M ESTHETICDENET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (265, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 265)) FROM ContratoServicio WHERE id_sede = 265 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pagado', '2026-06-15', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45200');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62823', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: TUNY GALLARDO MARIO VLADIMIR (RUC: 10413218158) | Sede ID: 212 | Hoja: MARIO TUNY
-- ==================================================

-- ==================================================
-- CLIENTE: ASMAT FAJARDO KARINA CECILIA (RUC: 10103432052) | Sede ID: 608 | Hoja: KARINA ASMAT
-- ==================================================

-- ==================================================
-- CLIENTE: MORALES TEODORO ROSA NADIA (RUC: 10403378611) | Sede ID: 928 | Hoja: Rosa Morale
-- ==================================================

-- ==================================================
-- CLIENTE: RABANAL FERNANDEZ CESAR RUBEN (RUC: 10267293754) | Sede ID: 797 | Hoja: cesar Rabanal
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (797, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 797)) FROM ContratoServicio WHERE id_sede = 797 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-24', 'transferencia', 'yAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45403');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62886', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LUMAR E&P SAC (RUC: 20492602371) | Sede ID: 1074 | Hoja: lumar e&p
-- ==================================================

-- ==================================================
-- CLIENTE: ROBLES HURTADO SILVIA PILAR (RUC: 10406021055) | Sede ID: 1204 | Hoja: ROBLES HURTADO SILVIA PILAR
-- ==================================================

-- ==================================================
-- CLIENTE: CARRILLO VARGAS MONICA CELESTE (RUC: 10096752968) | Sede ID: 362 | Hoja: monica carrillo
-- ==================================================

-- ==================================================
-- CLIENTE: SMILE CITY S.A.C. (RUC: 20553030456) | Sede ID: 15 | Hoja: smile city
-- ==================================================

-- ==================================================
-- CLIENTE: ORTOGAM S.R.L. (RUC: 20472832302) | Sede ID: 1225 | Hoja: ORTOGAM
-- ==================================================

-- ==================================================
-- CLIENTE: ISMINIO VALVERDE ANGEL CUSTODIO (RUC: 10107783798) | Sede ID: 584 | Hoja: ANGEL ISMINIO
-- ==================================================

-- ==================================================
-- CLIENTE: ALZAMORA LIMO MARCO ANTONIO (RUC: 10400553608) | Sede ID: 380 | Hoja: MARCO ALZAMORA
-- ==================================================

-- ==================================================
-- CLIENTE: RIOS AREVALO JUAN CARLOS (RUC: 10093831123) | Sede ID: 630 | Hoja: JUAN CARLOS RIOS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (630, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 630)) FROM ContratoServicio WHERE id_sede = 630 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45123');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62799', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VEGA SANCHEZ SILVIA MARIBEL (RUC: 10411402113) | Sede ID: 333 | Hoja: SILVIA VEGA
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL BELO SORRISO SAC (RUC: 20601192153) | Sede ID: 393 | Hoja: DENTAL BELO SORRISO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (393, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 393)) FROM ContratoServicio WHERE id_sede = 393 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63194', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PRAIMDENT SOCIEDAD ANONIMA CERRADA (RUC: 20512898387) | Sede ID: 173 | Hoja: PRAIMDENT
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (173, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 173)) FROM ContratoServicio WHERE id_sede = 173 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'efectivo', 'CANCELADO', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45316');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62742', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PRESTACIONES ODONTOLOGICAS FRIMAJ DENT E.I.R.L. (RUC: 20601081866) | Sede ID: 519 | Hoja: PRESTACIONES ODONTOLOGICAS
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL CLASS S.A.C. (RUC: 20510975210) | Sede ID: 1179 | Hoja: dental class
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1179, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1179)) FROM ContratoServicio WHERE id_sede = 1179 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-15', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45408');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62873', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QUISPE MANCO BETTY (RUC: 10409776677) | Sede ID: 248 | Hoja: BETTY QUISPE 
-- ==================================================

-- ==================================================
-- CLIENTE: HUAMAN REYES ALESSANDRA ISABEL (RUC: 10704348563) | Sede ID: 358 | Hoja: ALESSANDRA HUAMAN
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO DENTAL GNJ S.A.C. (RUC: 20600453123) | Sede ID: 863 | Hoja: Grupo dental gnj
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (863, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 863)) FROM ContratoServicio WHERE id_sede = 863 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45426');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62943', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SALAZAR BRAVO CLAUDIO MARLON (RUC: 10067700967) | Sede ID: 356 | Hoja: CLAUDIO SALAZAR
-- ==================================================

-- ==================================================
-- CLIENTE: UNIDOS MI PRIMERA SONRISA SAC (RUC: 20604309621) | Sede ID: 790 | Hoja: UNIDOS MI PRIMERA SONRISA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (790, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 790)) FROM ContratoServicio WHERE id_sede = 790 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45259');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63029', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DENTOLUX SAC (RUC: 20600592654) | Sede ID: 1189 | Hoja: DENTOLUX
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1189, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1189)) FROM ContratoServicio WHERE id_sede = 1189 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63439', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ODONTOLOGIA GOYAS E.I.R.L. (RUC: 20548159211) | Sede ID: 1264 | Hoja: FERNANDO GOYAS 
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL FULLSONRISAS S.A.C. (RUC: 20613766546) | Sede ID: 903 | Hoja:  DENTAL FULLSONRISAS S.A.C.    
-- ==================================================

-- ==================================================
-- CLIENTE: QHALI KAY DENTAL EIRL (RUC: 20604537003) | Sede ID: 1268 | Hoja: QHALI KAY DENTAL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1268, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1268)) FROM ContratoServicio WHERE id_sede = 1268 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45231');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62588', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INVERSIONES DE SALUD Y BELLEZA MORALES S.A.C. (RUC: 20603504284) | Sede ID: 400 | Hoja: INVERS DE SALUD Y BELLEZA MORAL
-- ==================================================

-- ==================================================
-- CLIENTE: RAMOS HERNANDEZ MARIA ELENA (RUC: 10214574123) | Sede ID: 240 | Hoja: MARIA ELENA RAMOS
-- ==================================================

-- ==================================================
-- CLIENTE: CHAVEZ ROSALES ROSA MARIA (RUC: 10410499911) | Sede ID: 213 | Hoja: ROSA CHAVEZ ROSALES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (213, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 213)) FROM ContratoServicio WHERE id_sede = 213 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', '3.1', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45299');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62673', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DENTISFRESH E.I.R.L. (RUC: 20605614966) | Sede ID: 375 | Hoja: DENTISFRESH 
-- ==================================================

-- ==================================================
-- CLIENTE: INGA RUIZ FABIO ALBERTO (RUC: 10704348458) | Sede ID: 648 | Hoja: FABIO INGA
-- ==================================================

-- ==================================================
-- CLIENTE: SALVADOR SALVADOR ANGELA (RUC: 10428886475) | Sede ID: 775 | Hoja: ANGELA SALVADOR
-- ==================================================

-- ==================================================
-- CLIENTE: SALVATIERRA MENDOZA KETTY (RUC: 10101781335) | Sede ID: 1269 | Hoja: KETTY SALVATIERRA SJM
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1269, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1269)) FROM ContratoServicio WHERE id_sede = 1269 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45232');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62589', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JOSUE BOCANEGRA GAMERO (RUC: 10486192599) | Sede ID: 774 | Hoja: JOSUE BOCANEGRA
-- ==================================================

-- ==================================================
-- CLIENTE: GONZALES GAVIDIA DORA (RUC: 10108681875) | Sede ID: 580 | Hoja: DORA GONZALES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (580, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 580)) FROM ContratoServicio WHERE id_sede = 580 AND activo = 1), 'MAYO', '2026-06-08', 'completado', 'pagado', '2026-05-14', 'transferencia', 'YAPE', 50.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44324');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62578', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (580, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 580)) FROM ContratoServicio WHERE id_sede = 580 AND activo = 1), 'JUNIO', '2026-07-08', 'completado', 'pagado', '2026-06-08', 'efectivo', 'CANCELADO', 50.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45225');

-- ==================================================
-- CLIENTE: Intervención Especializada en Neurodesarrollo SAC (RUC: 20605132562) | Sede ID: 331 | Hoja: INTERVENCION ESPECIALIZADA EN N
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (331, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 331)) FROM ContratoServicio WHERE id_sede = 331 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-25', 'transferencia', 'BBVA', 130.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45436');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63192', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MAURA SANCHEZ PACHECO DE HUAMAN (RUC: 10442802306) | Sede ID: 620 | Hoja: MAURA SANCHEZ
-- ==================================================

-- ==================================================
-- CLIENTE: ELIANA MARIA AGUIRRE ALVARADO (RUC: 10200778851) | Sede ID: 1047 | Hoja: ELIANA AGUIRRE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1047, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1047)) FROM ContratoServicio WHERE id_sede = 1047 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45503');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63034', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SAKURA MARU DENTAL SAC (RUC: 20606421339) | Sede ID: 727 | Hoja: SAKURA MARU DENTAL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (727, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 727)) FROM ContratoServicio WHERE id_sede = 727 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45168');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62726', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LEON VENTOCILLA FREDDY RICARDO (RUC: 10103587692) | Sede ID: 1266 | Hoja: freddy leon
-- ==================================================

-- ==================================================
-- CLIENTE: SURICHAQUI QUISPE PATRICIA (RUC: 10201030574) | Sede ID: 676 | Hoja: patricia surichaqui
-- ==================================================

-- ==================================================
-- CLIENTE: HUAPAYA PANDO VICTOR ANDRES (RUC: 10100649620) | Sede ID: 593 | Hoja: victor huapaya
-- ==================================================

-- ==================================================
-- CLIENTE: HUAPAYA EGOAVIL MILAGROS ELENA (RUC: 10704331598) | Sede ID: 1271 | Hoja: MILAGROS HUAPAYA 
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA ODONTOLOGICA ACSADENT EIRL (RUC: 20515719327) | Sede ID: 370 | Hoja: CLIN ODONT ACSADENT
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (370, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 370)) FROM ContratoServicio WHERE id_sede = 370 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63327', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Johanna Patricia Gonzales Medina (RUC: 10402491685) | Sede ID: 722 | Hoja: JOHANNA PATRICIA GONZALES MEDIN
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (722, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 722)) FROM ContratoServicio WHERE id_sede = 722 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45080');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62725', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Tsukamoto Vilchez Luis (RUC: 10067253871) | Sede ID: 47 | Hoja: LUIS TSUKAMOTO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (47, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 47)) FROM ContratoServicio WHERE id_sede = 47 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-15', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45413');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62890', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CREART SALUD SAC (RUC: 20601663041) | Sede ID: 389 | Hoja: CREART SALUD
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (389, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 389)) FROM ContratoServicio WHERE id_sede = 389 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-23', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45369');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63230', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JESUS WILFREDO DE LA ROCA GARIBAY (RUC: 10104448751) | Sede ID: 673 | Hoja: JESUS DE LA ROCA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (673, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 673)) FROM ContratoServicio WHERE id_sede = 673 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', NULL, 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45254');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62643', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VICTORIO VELASQUEZ YAQUELIN ROCIO (RUC: 10412601845) | Sede ID: 531 | Hoja: YAQUELIN VICTORIO
-- ==================================================

-- ==================================================
-- CLIENTE: RAMIREZ DEZA HENRY WILMAN (RUC: 10103447025) | Sede ID: 373 | Hoja: HENRY RAMIREZ
-- ==================================================

-- ==================================================
-- CLIENTE: HUANCA GARCIA BENNY DAVID (RUC: 10107979081) | Sede ID: 491 | Hoja: BENNY HUANCA
-- ==================================================

-- ==================================================
-- CLIENTE: N Y L SERVICE DENT SAC (RUC: 20513940891) | Sede ID: 338 | Hoja: N Y L SERVICE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (338, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 338)) FROM ContratoServicio WHERE id_sede = 338 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63304', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HBL S.R.L. (RUC: 20548396850) | Sede ID: 50 | Hoja: HBL 
-- ==================================================

-- ==================================================
-- CLIENTE: GASTRO ENDOSCOPY E.I.R.L. (RUC: 20602289649) | Sede ID: 1357 | Hoja: GASTRO ENDOSCOPY
-- ==================================================

-- ==================================================
-- CLIENTE: VERGARA FELICES LUIS ALBERTO (RUC: 10077371864) | Sede ID: 51 | Hoja: luis vergara
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (51, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 51)) FROM ContratoServicio WHERE id_sede = 51 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, 65.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63152', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CECILIA ROSARIO HOSPINA MEZA (RUC: 10091776460) | Sede ID: 1130 | Hoja: CECILIA HOSPINA
-- ==================================================

-- ==================================================
-- CLIENTE: Tacuche Mesia Carlos (RUC: 10097385888) | Sede ID: 1186 | Hoja: carlos tacuche
-- ==================================================

-- ==================================================
-- CLIENTE: LIVIAC ANICAMA ERIKA YANETH (RUC: 10422988276) | Sede ID: 52 | Hoja: LIVIAC ANICAMA  ERIKA YANETH
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (52, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 52)) FROM ContratoServicio WHERE id_sede = 52 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 50.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45457');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62996', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CUELLAR VELAOCHAGA GABRIELA INES (RUC: 10724242451) | Sede ID: 1023 | Hoja: GABRIELA CUELLAR
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1023, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1023)) FROM ContratoServicio WHERE id_sede = 1023 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45501');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63031', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: C. D. Romodent EIRL (RUC: 20518558171) | Sede ID: 589 | Hoja: CLIN DENTAL ROMODENT
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (589, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 589)) FROM ContratoServicio WHERE id_sede = 589 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45230');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62580', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VARA BERNUY ERIKA ELIZABETH (RUC: 10106120566) | Sede ID: 922 | Hoja: ERIKA VARA
-- ==================================================

-- ==================================================
-- CLIENTE: EGOAVIL LA ROSA RAYMUNDO GUILLERMO (RUC: 10103447513) | Sede ID: 858 | Hoja: RAYMUNDO EGOAVIL
-- ==================================================

-- ==================================================
-- CLIENTE: Luiggi Orlando Cornejo Peralta (RUC: 10103292811) | Sede ID: 1481 | Hoja: LUIGGI CORNEJO
-- ==================================================

-- ==================================================
-- CLIENTE: Ulises Bravo Quispe Vargas (RUC: 10200734551) | Sede ID: 871 | Hoja: Ulises Bravo Quispe Vargas
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (871, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 871)) FROM ContratoServicio WHERE id_sede = 871 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 50.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45468');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63009', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JOE RAMIREZ GUZMAN (RUC: 10101934638) | Sede ID: 53 | Hoja: JOE RAMIREZ
-- ==================================================

-- ==================================================
-- CLIENTE: Hernandez Roman Gabriela Noemi (RUC: 10458499620) | Sede ID: 298 | Hoja: GABRIELA HERNANDEZ
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (298, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 298)) FROM ContratoServicio WHERE id_sede = 298 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63302', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: YVONNE OLIVIA OLIVARES TAIPE (RUC: 10218571871) | Sede ID: 206 | Hoja: YVONNE OLIVARES
-- ==================================================

-- ==================================================
-- CLIENTE: TAML ODONTOLOGOS SAC (RUC: 20514310654) | Sede ID: 693 | Hoja: TAML ODONTOLOGOS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (693, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 693)) FROM ContratoServicio WHERE id_sede = 693 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45228');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62723', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SALLO QUISPE CARMEN ABIGAIL (RUC: 10459779430) | Sede ID: 1275 | Hoja: CARMEN SALLO
-- ==================================================

-- ==================================================
-- CLIENTE: ARHUIS VELASQUEZ WILLIAM (RUC: 10431625461) | Sede ID: 60 | Hoja: WILLIAM ARHUIS
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO DE NUEVA GENERACION SONRIE S.A.C. (RUC: 20605325727) | Sede ID: 229 | Hoja: CENTR ODONT NUEVA GEN SONRIE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (229, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 229)) FROM ContratoServicio WHERE id_sede = 229 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45222');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62573', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DENTAL LITTLE KIDS E.I.R.L. (RUC: 20535905780) | Sede ID: 1270 | Hoja: DENTAL LITTLE KIDS
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION HIDALGO S.A.C. (RUC: 20538101525) | Sede ID: 941 | Hoja: CORPORACION HIDALGO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (941, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 941)) FROM ContratoServicio WHERE id_sede = 941 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pagado', '2026-06-13', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45379');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62826', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO SALUD SOLIS DÁVILA S.A.C. (RUC: 20603671288) | Sede ID: 927 | Hoja: GRUPO SALUD SOLIS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (927, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 927)) FROM ContratoServicio WHERE id_sede = 927 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45455');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62989', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: N Y A ALERTA VET S.A.C (RUC: 20563786265) | Sede ID: 1231 | Hoja: N Y A ALERTA VET SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1231, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1231)) FROM ContratoServicio WHERE id_sede = 1231 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63258', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Mayorca Perez Sandro Oliver (RUC: 10076375742) | Sede ID: 374 | Hoja: SANDRO MAYORCA
-- ==================================================

-- ==================================================
-- CLIENTE: FAMILIA MUELITAS SAC (RUC: 20615598349) | Sede ID: 1475 | Hoja: FAMILIA MUELITAS SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1475, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1475)) FROM ContratoServicio WHERE id_sede = 1475 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63253', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO DE ORTODONCIA Y REHABILITACION ESPECIALIZADA S.A.C. (RUC: 20606350610) | Sede ID: 737 | Hoja: CENTRO DE ORTODONCIA Y REHAB
-- ==================================================

-- ==================================================
-- CLIENTE: JOSELYN CASTRO ZAMBRANO (RUC: 10744650319) | Sede ID: 1126 | Hoja: JOSELYN CASTRO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1126, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1126)) FROM ContratoServicio WHERE id_sede = 1126 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pagado', '2026-06-26', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45495');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63436', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ILLUMINANCE DENTAL E.I.R.L. (RUC: 20610637591) | Sede ID: 838 | Hoja: MILAGROS LIZ DEL AGUILA
-- ==================================================

-- ==================================================
-- CLIENTE: TREMOLADAS E.I.R.L. (RUC: 20607117544) | Sede ID: 1100 | Hoja: TREMOLADAS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1100, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1100)) FROM ContratoServicio WHERE id_sede = 1100 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45324');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62729', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RG ODONTOLOGOS EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - RGO E.I.R.L. (RUC: 20605128191) | Sede ID: 1206 | Hoja: CERRADO5
-- ==================================================

-- ==================================================
-- CLIENTE: RG ODONTOLOGOS EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - RGO E.I.R.L. (RUC: 20605128191) | Sede ID: 1206 | Hoja: RG ODONTOLOGOS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1206, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1206)) FROM ContratoServicio WHERE id_sede = 1206 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-15', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45164');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62874', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CADEL SONRISAS S.A.C. (RUC: 20608025945) | Sede ID: 72 | Hoja: CADEL SONRISAS
-- ==================================================

-- ==================================================
-- CLIENTE: RICHARD QUISPE CANGAHUALA (RUC: 10471130732) | Sede ID: 339 | Hoja: RICHARD QUISPE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (339, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 339)) FROM ContratoServicio WHERE id_sede = 339 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45485');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63021', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: YESIKA YUDITH SOLIS YNOUYE (RUC: 10096362451) | Sede ID: 952 | Hoja: YESIKA SOLIS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (952, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 952)) FROM ContratoServicio WHERE id_sede = 952 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63235', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Arturo Kobayashi Shinya (RUC: 10066296461) | Sede ID: 1262 | Hoja: ARTURO KOBAYASHI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1262, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1262)) FROM ContratoServicio WHERE id_sede = 1262 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45091');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62730', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO DENTAL TROY DENT EIRL (RUC: 20602928137) | Sede ID: 963 | Hoja: CENTRO DENTAL TROY DENT
-- ==================================================

-- ==================================================
-- CLIENTE: DENTICARE ODONTOLOGIA E.I.R.L. (RUC: 20607058742) | Sede ID: 521 | Hoja: DENTICARE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (521, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 521)) FROM ContratoServicio WHERE id_sede = 521 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63137', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL RADIANTE DENT EIRL (RUC: 20606610875) | Sede ID: 287 | Hoja: CONS DENT RADIANTE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (287, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 287)) FROM ContratoServicio WHERE id_sede = 287 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63170', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PETS SHOP LA MOLINA SOCIEDAD ANONIMA CERRADA (RUC: 20509844357) | Sede ID: 1139 | Hoja: Pets Shop La Molina
-- ==================================================

-- ==================================================
-- CLIENTE: DOCTOR MASCOTA S.A.C. (RUC: 20606028581) | Sede ID: 330 | Hoja: SM-DOCTORMASCOTA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (330, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 330)) FROM ContratoServicio WHERE id_sede = 330 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63303', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (330, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 330)) FROM ContratoServicio WHERE id_sede = 330 AND activo = 1), 'magguie saldarriaga', '2026-07-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (330, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 330)) FROM ContratoServicio WHERE id_sede = 330 AND activo = 1), 'AGOSTO', '2026-08-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (330, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 330)) FROM ContratoServicio WHERE id_sede = 330 AND activo = 1), 'SEPTIEMBRE', '2026-09-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (330, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 330)) FROM ContratoServicio WHERE id_sede = 330 AND activo = 1), 'MES DEL SERVICIO', '2026-10-24', 'completado', 'pendiente', NULL, 'forma de pago', 'OBSERVACIÓN', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), 'N° FACTURA');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), 'N° MANIFIESTO', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ZEGARRA ALVA TEOFILO (RUC: 10102510246) | Sede ID: 1036 | Hoja: A-Teofilo Zegarra 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1036, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1036)) FROM ContratoServicio WHERE id_sede = 1036 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63102', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ZEGARRA ALVA TEOFILO (RUC: 10102510246) | Sede ID: 1036 | Hoja: J-Teofilo Zegarra
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1036, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1036)) FROM ContratoServicio WHERE id_sede = 1036 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63101', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: UCIVET SAC (RUC: 20601498902) | Sede ID: 1140 | Hoja: Ucivet
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1140, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1140)) FROM ContratoServicio WHERE id_sede = 1140 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62710', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1140, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1140)) FROM ContratoServicio WHERE id_sede = 1140 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62776', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1140, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1140)) FROM ContratoServicio WHERE id_sede = 1140 AND activo = 1), 'JUNIO', '2026-06-19', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63087', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1140, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1140)) FROM ContratoServicio WHERE id_sede = 1140 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62899', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1140, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1140)) FROM ContratoServicio WHERE id_sede = 1140 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63213', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1140, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1140)) FROM ContratoServicio WHERE id_sede = 1140 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63357', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: UCIVET SAC (RUC: 20601498902) | Sede ID: 1140 | Hoja: Ucivetesp
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1140, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1140)) FROM ContratoServicio WHERE id_sede = 1140 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62900', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA SAN GABRIEL SAC (RUC: 20600539699) | Sede ID: 628 | Hoja: san gabriel
-- ==================================================

-- ==================================================
-- CLIENTE: FAMONT PETS SAC (RUC: 20523984447) | Sede ID: 587 | Hoja: Famont pets
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (587, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 587)) FROM ContratoServicio WHERE id_sede = 587 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45229');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62579', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), '1895');

-- ==================================================
-- CLIENTE: CLUB MASCOTA VETERINARIA S.A.C. (RUC: 20600496132) | Sede ID: 422 | Hoja: Club Mascota
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (422, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 422)) FROM ContratoServicio WHERE id_sede = 422 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45163');
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), '62868');

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: SMP-EL HURON AZUL E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: MONTOYA GRANDA LOURDES LERIDA (RUC: 10084195648) | Sede ID: 864 | Hoja: Lourdes Montoya
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (864, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 864)) FROM ContratoServicio WHERE id_sede = 864 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 98.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45466');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63005', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ODONTOTRENDS SAC (RUC: 20607572713) | Sede ID: 1136 | Hoja: ODONTOTRENDS SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1136, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1136)) FROM ContratoServicio WHERE id_sede = 1136 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63256', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ANIMAL CLINIC PERU E.I.R.L. (RUC: 20602364128) | Sede ID: 183 | Hoja:  Animal Clinic Peru Chorrilo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (183, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 183)) FROM ContratoServicio WHERE id_sede = 183 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 94.40, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45298');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62672', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), '1933');

-- ==================================================
-- CLIENTE: GALINDO TIPISMANA ALVARO (RUC: 10717902888) | Sede ID: 35 | Hoja: Alvaro Galindo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (35, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 35)) FROM ContratoServicio WHERE id_sede = 35 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63424', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: AGUIRRE BELLIDO DE JARA CARLA SANDRIA AMALIA (RUC: 10099314058) | Sede ID: 1137 | Hoja: Aguirre Carla vet san miguel
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1137, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1137)) FROM ContratoServicio WHERE id_sede = 1137 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63313', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA SATELITE EIRL (RUC: 20601313872) | Sede ID: 911 | Hoja: VET Satelite
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (911, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 911)) FROM ContratoServicio WHERE id_sede = 911 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63099', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA FELIVET EIRL (RUC: 20556644471) | Sede ID: 867 | Hoja: VETERINARIA FELIVET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (867, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 867)) FROM ContratoServicio WHERE id_sede = 867 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45250');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63008', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA BASTET SALUKI EIRL (RUC: 20605875352) | Sede ID: 188 | Hoja: Bastet Saluki
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (188, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 188)) FROM ContratoServicio WHERE id_sede = 188 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pagado', '2026-06-26', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45476');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63429', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Veterinaria el gran danés SAC (RUC: 20603630689) | Sede ID: 1131 | Hoja: CA-vet el Gran Danes 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1131, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1131)) FROM ContratoServicio WHERE id_sede = 1131 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63437', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Veterinaria el gran danés SAC (RUC: 20603630689) | Sede ID: 48 | Hoja: CO-vet el Gran Danes
-- ==================================================

-- ==================================================
-- CLIENTE: LAVANDA PACHECO JUAN CARLOS (RUC: 10218633434) | Sede ID: 1185 | Hoja: juan carlos lavanda
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION VETERINARIA G&S SAC (RUC: 20603775016) | Sede ID: 645 | Hoja: CORP vet g y s
-- ==================================================

-- ==================================================
-- CLIENTE: VET D MASCOTA SAC (RUC: 20547105185) | Sede ID: 1187 | Hoja: vet d mascota
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1187, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1187)) FROM ContratoServicio WHERE id_sede = 1187 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63315', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INVERSIONES ARIAS LEGUA S.A.C. (RUC: 20604586501) | Sede ID: 740 | Hoja: inver arias 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (740, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 740)) FROM ContratoServicio WHERE id_sede = 740 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 65.00, 'BIOCONTAMINADO');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45365');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62784', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GOMEZ HIDALGO MARGARITA BEATRIZ (RUC: 10098642701) | Sede ID: 1244 | Hoja: Margarita Gomez
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1244, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1244)) FROM ContratoServicio WHERE id_sede = 1244 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63320', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LORD PETS E.I.R.L. (RUC: 20549113436) | Sede ID: 1122 | Hoja: LORD PETS
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA UNIDAS SJL E.I.R.L. (RUC: 20605127909) | Sede ID: 305 | Hoja: vet unidas
-- ==================================================

-- ==================================================
-- CLIENTE: ESPECIALIDADES MEDICAS VETERINARIAS S.A.C. - ESMEVET (RUC: 20608063936) | Sede ID: 1091 | Hoja: ESPECIALIDADES MEDICAS VETERINA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1091, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1091)) FROM ContratoServicio WHERE id_sede = 1091 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63332', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET CORP SAC (RUC: 20514178527) | Sede ID: 367 | Hoja: vetcorp
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (367, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 367)) FROM ContratoServicio WHERE id_sede = 367 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-05-18', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45248');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63022', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (367, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 367)) FROM ContratoServicio WHERE id_sede = 367 AND activo = 1), 'JULIO', '2026-07-18', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 60.00, NULL);

-- ==================================================
-- CLIENTE: PRIVET EIRL (RUC: 20603012411) | Sede ID: 563 | Hoja: PRIVET SAC
-- ==================================================

-- ==================================================
-- CLIENTE: ESTACION VETERINARIA S.A.C. (RUC: 20602600301) | Sede ID: 554 | Hoja: estacion vet 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (554, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 554)) FROM ContratoServicio WHERE id_sede = 554 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45329');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62798', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA SASH SA (RUC: 20601150205) | Sede ID: 969 | Hoja: clin vet SASH
-- ==================================================

-- ==================================================
-- CLIENTE: CANALES PEREZ CLAUDIA CECILIA (RUC: 10421439929) | Sede ID: 16 | Hoja: CLAUDIA CANALES
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA DEL RIO EIRL (RUC: 20614180952) | Sede ID: 1327 | Hoja: VETERINARIA DEL RIO EIR
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1327, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1327)) FROM ContratoServicio WHERE id_sede = 1327 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-24', 'transferencia', 'BCP', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45395');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63207', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ELGUERA DELGADO SANDRA (RUC: 10474020440) | Sede ID: 687 | Hoja: sandra elguera
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES BORE SAC (RUC: 20602673678) | Sede ID: 1234 | Hoja: INV BORE
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS VETERINARIOS FIOREVET E.I.R.L. (RUC: 20600604105) | Sede ID: 366 | Hoja: VET FIOREVET
-- ==================================================

-- ==================================================
-- CLIENTE: IPROVET EIRL (RUC: 20604354146) | Sede ID: 288 | Hoja: iprovet
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (288, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 288)) FROM ContratoServicio WHERE id_sede = 288 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);

-- ==================================================
-- CLIENTE: RAYMUNDO TINTAYO FERNANDO JULIAN (RUC: 10101974567) | Sede ID: 290 | Hoja: FERNANDO RAYMUNDO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (290, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 290)) FROM ContratoServicio WHERE id_sede = 290 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63225', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: UZURIAGA ALVARADO ELIZABETH EMILIA (RUC: 10225152069) | Sede ID: 1175 | Hoja: elizabeth uzuriaga
-- ==================================================

-- ==================================================
-- CLIENTE: CELI ARELLANO ROXANA OLENKA (RUC: 10418272355) | Sede ID: 1194 | Hoja: ROXANA CELI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1194, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1194)) FROM ContratoServicio WHERE id_sede = 1194 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-06-24', 'efectivo', 'CANCELADO + YAPE', 59.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63317', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QS VET SAC (RUC: 20602371515) | Sede ID: 890 | Hoja: QS VET 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (890, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 890)) FROM ContratoServicio WHERE id_sede = 890 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63142', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PET SHOP PERU SERVICIOS CANINO SAC (RUC: 20604435847) | Sede ID: 1078 | Hoja: PET SHOP PERU SERV CANINNO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1078, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1078)) FROM ContratoServicio WHERE id_sede = 1078 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-22', 'transferencia', 'YAPE +  s/10 de mayo', 75.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45339');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63201', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GOCO SPET SAC (RUC: 20605402578) | Sede ID: 318 | Hoja: GOCOSPET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (318, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 318)) FROM ContratoServicio WHERE id_sede = 318 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45260');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63020', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PINCHI HILDEBRANDT JAVIER (RUC: 10079452209) | Sede ID: 1045 | Hoja: JAVIER PINCHI
-- ==================================================

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 1162 | Hoja: PET MAX SAC magdalena
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1162, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1162)) FROM ContratoServicio WHERE id_sede = 1162 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62664', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1162, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1162)) FROM ContratoServicio WHERE id_sede = 1162 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62740', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1162, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1162)) FROM ContratoServicio WHERE id_sede = 1162 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63048', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1162, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1162)) FROM ContratoServicio WHERE id_sede = 1162 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62901', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1162, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1162)) FROM ContratoServicio WHERE id_sede = 1162 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63212', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1162, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1162)) FROM ContratoServicio WHERE id_sede = 1162 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63454', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 792 | Hoja: PET MAX - BENAVIDES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (792, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 792)) FROM ContratoServicio WHERE id_sede = 792 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62736', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (792, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 792)) FROM ContratoServicio WHERE id_sede = 792 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63043', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (792, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 792)) FROM ContratoServicio WHERE id_sede = 792 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63449', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 795 | Hoja: PETMAX SAC san borja
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (795, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 795)) FROM ContratoServicio WHERE id_sede = 795 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62665', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (795, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 795)) FROM ContratoServicio WHERE id_sede = 795 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62746', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (795, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 795)) FROM ContratoServicio WHERE id_sede = 795 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63044', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (795, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 795)) FROM ContratoServicio WHERE id_sede = 795 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63211', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (795, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 795)) FROM ContratoServicio WHERE id_sede = 795 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63450', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MONTES DIAZ MONICA LISSETH (RUC: 10407511617) | Sede ID: 854 | Hoja: MONICA MONTES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (854, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 854)) FROM ContratoServicio WHERE id_sede = 854 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63198', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: NOW PET FOOD DELIVERY S.A.C. (RUC: 20602550771) | Sede ID: 660 | Hoja: NOW PET FOOD DELIVERY
-- ==================================================

-- ==================================================
-- CLIENTE: LEVANO PACHAS RACIEL ANTONIO (RUC: 10218813009) | Sede ID: 741 | Hoja: RACIEL LEVANO
-- ==================================================

-- ==================================================
-- CLIENTE: GUTIERREZ DEL VALLE CLAUDIA ISABEL (RUC: 10107106869) | Sede ID: 320 | Hoja: SERV VET INTEGRALES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (320, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 320)) FROM ContratoServicio WHERE id_sede = 320 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, 'POR PAGAR', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45308');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62698', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INVERSIONES JL TASAYCO E.I.R.L. (RUC: 20607028606) | Sede ID: 1198 | Hoja: INVERSIONES JL TASAYCO E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: IBARRA YUPANQUI PAUL JHON (RUC: 10428015164) | Sede ID: 976 | Hoja: PAUL IBARRA
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA D´MASKOTAS S.A.C. (RUC: 20605942742) | Sede ID: 346 | Hoja: TA241-MASKOTAS
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA D´MASKOTAS S.A.C. (RUC: 20605942742) | Sede ID: 346 | Hoja: SR-MASKOTAS
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA D´MASKOTAS S.A.C. (RUC: 20605942742) | Sede ID: 346 | Hoja: TA2942-MASKOTAS
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIAS LOTSO S.A.C. (RUC: 20603217579) | Sede ID: 1006 | Hoja: VET LOTSO
-- ==================================================

-- ==================================================
-- CLIENTE: PET´S PLACE VETERINARIOS SAC (RUC: 20523846648) | Sede ID: 1129 | Hoja: MOLINA PET PLACE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1129, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1129)) FROM ContratoServicio WHERE id_sede = 1129 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62831', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS VETERINARIOS ESPECIALIZADOS S.A.C. (RUC: 20551542280) | Sede ID: 1132 | Hoja: BORJA PETS PLACE 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1132, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1132)) FROM ContratoServicio WHERE id_sede = 1132 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62882', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ZUAZO CORTEZ MILAGRITOS ADRIANA (RUC: 10222999869) | Sede ID: 575 | Hoja: MILAGRITOS ZUAZO
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIAS S.A.C. (RUC: 20604685126) | Sede ID: 1348 | Hoja: CF-EL DORADO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1348, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1348)) FROM ContratoServicio WHERE id_sede = 1348 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63279', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CUATRO PATAS S.A.C. (RUC: 20506759715) | Sede ID: 576 | Hoja: CUATRO PATAS
-- ==================================================

-- ==================================================
-- CLIENTE: ESPECIALIDADES VETERINARIAS EIRL (RUC: 20493029241) | Sede ID: 859 | Hoja: ESPECIALIDADES VETERINARIAS 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (859, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 859)) FROM ContratoServicio WHERE id_sede = 859 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferencia', 'por PAGAR', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45463');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63002', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MARCO DIAZ SERVICIOS VETERINARIOS EIRL (RUC: 20606290498) | Sede ID: 811 | Hoja: marco diaz serv
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (811, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 811)) FROM ContratoServicio WHERE id_sede = 811 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45439');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62927', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PET ID SAC (RUC: 20602765041) | Sede ID: 30 | Hoja: PET ID 
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA EL PALMAR EIRL (RUC: 20544039173) | Sede ID: 559 | Hoja: VET EL PALMAR
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (559, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 559)) FROM ContratoServicio WHERE id_sede = 559 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45364');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62782', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REPRESENTACIONES EL HURON AZUL EIRL (RUC: 20602159826) | Sede ID: 473 | Hoja: SM-REPRESENTACIONESELHURONAZUL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (473, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 473)) FROM ContratoServicio WHERE id_sede = 473 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63306', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REPRESENTACIONES EL HURON AZUL EIRL (RUC: 20602159826) | Sede ID: 463 | Hoja: C-REPRESENTACIONESELHURONAZUL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (463, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 463)) FROM ContratoServicio WHERE id_sede = 463 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63266', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REPRESENTACIONES EL HURON AZUL EIRL (RUC: 20602159826) | Sede ID: 463 | Hoja: CERRADO2
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIAS SAC (RUC: 20601401038) | Sede ID: 459 | Hoja: C-INVERSIONES EL HURON AZUL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (459, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 459)) FROM ContratoServicio WHERE id_sede = 459 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63264', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO GRESE EIRL (RUC: 20609318709) | Sede ID: 1347 | Hoja: GRUPO GRESE EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1347, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1347)) FROM ContratoServicio WHERE id_sede = 1347 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-15', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45409');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62876', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MI PATAZA EIRL (RUC: 20600890957) | Sede ID: 751 | Hoja: MI PATAZA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (751, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 751)) FROM ContratoServicio WHERE id_sede = 751 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45304');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62689', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA MATUTE SAC (RUC: 20614380188) | Sede ID: 1377 | Hoja: MARIA ELENA MATUTE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1377, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1377)) FROM ContratoServicio WHERE id_sede = 1377 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-23', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45475');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63280', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GABUS VET SAC (RUC: 20548058610) | Sede ID: 196 | Hoja: GABUS VET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (196, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 196)) FROM ContratoServicio WHERE id_sede = 196 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'BCP', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45141');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62765', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA ORBEGOSO EIRL (RUC: 20338615915) | Sede ID: 925 | Hoja: VETERINARIA ORBEGOSO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (925, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 925)) FROM ContratoServicio WHERE id_sede = 925 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45326');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62748', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (925, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 925)) FROM ContratoServicio WHERE id_sede = 925 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45472');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63051', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (925, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 925)) FROM ContratoServicio WHERE id_sede = 925 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63457', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET SERVICE & CIA E.I.R.L (RUC: 20602683169) | Sede ID: 803 | Hoja: health y medical vet
-- ==================================================

-- ==================================================
-- CLIENTE: CLIVET PANDA SAC (RUC: 20602340962) | Sede ID: 1165 | Hoja: CLIVET PANDA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1165, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1165)) FROM ContratoServicio WHERE id_sede = 1165 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45285');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62651', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MASTER IN PETS EIRL (RUC: 20544713354) | Sede ID: 286 | Hoja: MASTER IN PETS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (286, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 286)) FROM ContratoServicio WHERE id_sede = 286 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44725');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63262', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LOVE & PETS VETERINARIAS SAC (RUC: 20610706747) | Sede ID: 1221 | Hoja: LOVE & PETS VETERINARIAS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1221, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1221)) FROM ContratoServicio WHERE id_sede = 1221 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63319', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JOSE WILFREDO MARTINES MONTAÑEZ (RUC: 10257786001) | Sede ID: 1106 | Hoja: jose martinez
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1106, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1106)) FROM ContratoServicio WHERE id_sede = 1106 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-23', 'transferencia', 'YAPE', 98.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45376');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63245', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HOSPITAL VETERINARIO HUELLAS Y MAS HUELLAS SAC (RUC: 20566086566) | Sede ID: 342 | Hoja: HOSPITAL VET HUELLAS Y MAS HUE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (342, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 342)) FROM ContratoServicio WHERE id_sede = 342 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63210', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CARLOS RAMIRO POLO RAMIREZ (RUC: 10257259078) | Sede ID: 285 | Hoja: CARLOS POLO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (285, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 285)) FROM ContratoServicio WHERE id_sede = 285 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63096', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: AMELIA SOLIS CHAVEZ (RUC: 10409151880) | Sede ID: 267 | Hoja: AMELIA SOLIS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (267, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 267)) FROM ContratoServicio WHERE id_sede = 267 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63154', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GOGIN ARMAS ERIKA ROSA (RUC: 10104774500) | Sede ID: 201 | Hoja: ERIKA GOGIN
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (201, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 201)) FROM ContratoServicio WHERE id_sede = 201 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45162');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62866', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CAMILO´S VET SAC (RUC: 20548927995) | Sede ID: 1152 | Hoja: CAMILOS VET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1152, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1152)) FROM ContratoServicio WHERE id_sede = 1152 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-15', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45201');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62872', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DANIELA DEL ROSARIO PALACIOS BARBA (RUC: 10734263708) | Sede ID: 36 | Hoja: DANIELA DEL ROSARIO PALACIOS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (36, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 36)) FROM ContratoServicio WHERE id_sede = 36 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45434');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62920', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA UNIVERSAL PETS SAC (RUC: 20524244293) | Sede ID: 278 | Hoja: CLIN VET UNIV
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (278, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 278)) FROM ContratoServicio WHERE id_sede = 278 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63190', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RUBEN ANTONIO GALINDO ROCA (RUC: 10417525357) | Sede ID: 39 | Hoja: RUBEN GALINDO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (39, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 39)) FROM ContratoServicio WHERE id_sede = 39 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', '2026-06-20', 'efectivo', 'CANCELADO', 60.01, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45506');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63092', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CESAR PHOL CASAVILCA SIMON (RUC: 10722058181) | Sede ID: 215 | Hoja: P-CESAR CASALVICA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (215, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 215)) FROM ContratoServicio WHERE id_sede = 215 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', '2026-06-20', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45508');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63094', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Fredy Daniel Vilca Ninaja (RUC: 10012965635) | Sede ID: 291 | Hoja: FREDY VILCA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (291, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 291)) FROM ContratoServicio WHERE id_sede = 291 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63346', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS Y NEGOCIOS VETERINARIOS EL ALISO E.I.R.L. (RUC: 20600957300) | Sede ID: 157 | Hoja: serv y neg el aliso
-- ==================================================

-- ==================================================
-- CLIENTE: PET FRIENDLY SAC (RUC: 20601084628) | Sede ID: 455 | Hoja: PET FRIENDLY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (455, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 455)) FROM ContratoServicio WHERE id_sede = 455 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62892', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MARIA VALDEZ CARPIO (RUC: 10100626646) | Sede ID: 336 | Hoja: María Valdez
-- ==================================================

-- ==================================================
-- CLIENTE: Roberto Antonio Prieto Santos (RUC: 10401376254) | Sede ID: 421 | Hoja: roberto prieto
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (421, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 421)) FROM ContratoServicio WHERE id_sede = 421 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63231', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MARISA NINAHUANCA PALOMINO (RUC: 10215484063) | Sede ID: 1226 | Hoja: MARIsA NINAHUANCA
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA SAN JUDAS TADEO E. I. R. L. (RUC: 20612088731) | Sede ID: 1471 | Hoja: KARINA CABELLO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1471, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1471)) FROM ContratoServicio WHERE id_sede = 1471 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45070');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62596', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA MI CACHORRITO SAC (RUC: 20545373441) | Sede ID: 994 | Hoja: vet mi cachorrito
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (994, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 994)) FROM ContratoServicio WHERE id_sede = 994 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'efectivo', 'CANCELADO', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45419');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62911', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA MI CACHORRITO SAC (RUC: 20545373441) | Sede ID: 994 | Hoja: VET MI CACHORRITO COM
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (994, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 994)) FROM ContratoServicio WHERE id_sede = 994 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'efectivo', 'CANCELADO', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45419');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62912', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INTEGRAL VET SAC (RUC: 20508507730) | Sede ID: 984 | Hoja: INTEGRAL VET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (984, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 984)) FROM ContratoServicio WHERE id_sede = 984 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63271', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA SAN MARCOS SAC (RUC: 20554422072) | Sede ID: 230 | Hoja: VET SAN MARCOS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (230, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 230)) FROM ContratoServicio WHERE id_sede = 230 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45223');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62574', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Zavala Carlos Magali Inés (RUC: 10420138241) | Sede ID: 368 | Hoja: MAGALI ZAVALA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (368, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 368)) FROM ContratoServicio WHERE id_sede = 368 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45496');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63023', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA ACEVEDO EIRL (RUC: 20601872227) | Sede ID: 284 | Hoja: clin vet ACEVEDO (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (284, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 284)) FROM ContratoServicio WHERE id_sede = 284 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63184', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA ACEVEDO EIRL (RUC: 20601872227) | Sede ID: 284 | Hoja: clin vet ACEVEDO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (284, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 284)) FROM ContratoServicio WHERE id_sede = 284 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63169', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Laura Elizabeth Acuña Alvarez (RUC: 10714468222) | Sede ID: 300 | Hoja: LAURA ACUÑA
-- ==================================================

-- ==================================================
-- CLIENTE: CESAR PHOL CASAVILCA SIMON (RUC: 10722058181) | Sede ID: 215 | Hoja: A-CESAR CASAVILCA SIMON
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (215, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 215)) FROM ContratoServicio WHERE id_sede = 215 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', NULL, 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45508');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63095', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Silva Neyra Celia Rocio (RUC: 10061447003) | Sede ID: 953 | Hoja: SILVIA NEYRA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (953, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 953)) FROM ContratoServicio WHERE id_sede = 953 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63349', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LEONARDO GALINDO JURADO (RUC: 10700301686) | Sede ID: 41 | Hoja: LEONARDO GALINDO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (41, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 41)) FROM ContratoServicio WHERE id_sede = 41 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45507');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63093', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Silva Neyra Celia Rocio (RUC: 10061447003) | Sede ID: 953 | Hoja: CERRADO9
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Diagnostico Veterinario SAC (RUC: 20604188688) | Sede ID: 1306 | Hoja: CLIN DIAGNOSTICO VET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1306, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1306)) FROM ContratoServicio WHERE id_sede = 1306 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45490');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63036', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: WALAC SAC (RUC: 20536780506) | Sede ID: 719 | Hoja: WALAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (719, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 719)) FROM ContratoServicio WHERE id_sede = 719 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'yAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45293');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62687', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA D´MASKOTAS S.A.C. (RUC: 20605942742) | Sede ID: 346 | Hoja: COMAS-MASKOTAS
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES JMRI SAC (RUC: 20607354856) | Sede ID: 1338 | Hoja: INV JMRI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1338, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1338)) FROM ContratoServicio WHERE id_sede = 1338 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45354');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62814', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ZOO MEDIC VETERINARIA SAC (RUC: 20605826629) | Sede ID: 46 | Hoja: ZOO MEDIC VET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (46, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 46)) FROM ContratoServicio WHERE id_sede = 46 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pagado', '2026-06-01', 'transferencia', 'yAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45289');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62670', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JUAN MARTIN SOLANO CORNEJO (RUC: 10094598538) | Sede ID: 147 | Hoja: JUAN SOLANO COMAS
-- ==================================================

-- ==================================================
-- CLIENTE: JUAN MARTIN SOLANO CORNEJO (RUC: 10094598538) | Sede ID: 147 | Hoja: CARA - JUAN SOLANO
-- ==================================================

-- ==================================================
-- CLIENTE: JUAN MARTIN SOLANO CORNEJO (RUC: 10094598538) | Sede ID: 147 | Hoja: JUAN SOLANO
-- ==================================================

-- ==================================================
-- CLIENTE: TANIA ELVIRA RAMÍREZ CARRILLO (RUC: 10401006503) | Sede ID: 311 | Hoja: TANIA RAMIREZ
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (311, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 311)) FROM ContratoServicio WHERE id_sede = 311 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63156', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JOSE FERNANDO NUÑEZ VICAÑA (RUC: 10098519781) | Sede ID: 887 | Hoja: JOSE NUÑEZ
-- ==================================================

-- ==================================================
-- CLIENTE: ERNESTO EUDALDO SAAVEDRA MEZONES (RUC: 10067484083) | Sede ID: 571 | Hoja: ERNESTO SAAVEDRA
-- ==================================================

-- ==================================================
-- CLIENTE: CACEDA MARQUINA VICTOR OSWALDO (RUC: 10188640015) | Sede ID: 1272 | Hoja: victor caceda
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1272, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1272)) FROM ContratoServicio WHERE id_sede = 1272 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63206', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JULIA ALICIA ASLLA ESPINOZA (RUC: 10436041620) | Sede ID: 643 | Hoja: JULIA ASLLA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (643, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 643)) FROM ContratoServicio WHERE id_sede = 643 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45078');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62678', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VICENTELO ALVAN JOSE VICTOR (RUC: 10066449594) | Sede ID: 642 | Hoja: JOSE VICENTELO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (642, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 642)) FROM ContratoServicio WHERE id_sede = 642 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45056');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62677', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LESCANOVETS E.I.R.L. (RUC: 20602111998) | Sede ID: 1117 | Hoja: LESCANOVETS
-- ==================================================

-- ==================================================
-- CLIENTE: LESCANOVETS E.I.R.L. (RUC: 20602111998) | Sede ID: 1117 | Hoja: LESCANOVETS MARISCAL
-- ==================================================

-- ==================================================
-- CLIENTE: LESCANOVETS E.I.R.L. (RUC: 20602111998) | Sede ID: 1117 | Hoja: LESCANOVETS STA ROSA
-- ==================================================

-- ==================================================
-- CLIENTE: LUIS DOMINGO ARIAS GUTIERREZ (RUC: 10093702617) | Sede ID: 980 | Hoja: LUIS ARIAS
-- ==================================================

-- ==================================================
-- CLIENTE: BIOSERVET SRL (RUC: 20509303194) | Sede ID: 1110 | Hoja: BIOSERVET
-- ==================================================

-- ==================================================
-- CLIENTE: BIOSERVET SRL (RUC: 20509303194) | Sede ID: 1110 | Hoja: BIOSERVET 
-- ==================================================

-- ==================================================
-- CLIENTE: Marinazoo EIRL (RUC: 20554278443) | Sede ID: 49 | Hoja: MARINAZOO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (49, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 49)) FROM ContratoServicio WHERE id_sede = 49 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63217', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Inversiones Glory SAC (RUC: 20609885999) | Sede ID: 747 | Hoja: JUAN CARLOS CESPEDES
-- ==================================================

-- ==================================================
-- CLIENTE: SALAZAR GUTIERREZ MIGUEL ANGEL (RUC: 10100259546) | Sede ID: 83 | Hoja: MIGUEL SALAZAR
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA WASY VET E.I.R.L (RUC: 20604020931) | Sede ID: 965 | Hoja: VET WASY VET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (965, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 965)) FROM ContratoServicio WHERE id_sede = 965 AND activo = 1), 'MAYO', '2026-06-23', 'completado', 'pagado', '2026-06-23', 'transferencia', 'YAPE', 98.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45384');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63241', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA SAN JUAN MACIAS SRL (RUC: 20605479546) | Sede ID: 1133 | Hoja: CLIN VET SAN JUAN MACIAS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1133, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1133)) FROM ContratoServicio WHERE id_sede = 1133 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63179', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EDUARDO PAREDES MUÑOZ (RUC: 10257759038) | Sede ID: 972 | Hoja: EDUARDO PAREDES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (972, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 972)) FROM ContratoServicio WHERE id_sede = 972 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63176', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINIVET LASSY EIRL (RUC: 20514715808) | Sede ID: 271 | Hoja: CLINIVET LASSY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (271, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 271)) FROM ContratoServicio WHERE id_sede = 271 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63223', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MARILU PANTOJA AQUINO (RUC: 10102144487) | Sede ID: 55 | Hoja: MARILU PANTOJA
-- ==================================================

-- ==================================================
-- CLIENTE: CLINIVET LASSY EIRL (RUC: 20514715808) | Sede ID: 271 | Hoja: CERRADO10
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA ANIMAL LIFE S.A.C. (RUC: 20506975680) | Sede ID: 573 | Hoja: VET ANIMAL LIFE
-- ==================================================

-- ==================================================
-- CLIENTE: AYBAR VASQUEZ MIXI GRISELDA (RUC: 10215616920) | Sede ID: 534 | Hoja: MIXI AYBAR
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO OFTALMOLOGICO DR. GERONIMO EIRL (RUC: 20609329298) | Sede ID: 1141 | Hoja: CENTRO OFTALMOLOGICO DR. GERONI
-- ==================================================

-- ==================================================
-- CLIENTE: CASTRO WHU MIRKO ALEXIS (RUC: 10103490249) | Sede ID: 1108 | Hoja: MIRKO CASTRO
-- ==================================================

-- ==================================================
-- CLIENTE: ANIMAL LIFE EXTRA CARE S.A.C. (RUC: 20517811557) | Sede ID: 566 | Hoja: ANIMAL LIFE EXTRA CARE
-- ==================================================

-- ==================================================
-- CLIENTE: TOCON VALDIVIEZO LIZET VANESSA (RUC: 10422645514) | Sede ID: 65 | Hoja: LISET TOCON
-- ==================================================

-- ==================================================
-- CLIENTE: EVERPETS SAC (RUC: 20554613412) | Sede ID: 1245 | Hoja: EVERPETS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1245, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1245)) FROM ContratoServicio WHERE id_sede = 1245 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63181', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA SOLO PATAS S.A.C. (RUC: 20607644960) | Sede ID: 857 | Hoja: veterinaria solo patas
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (857, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 857)) FROM ContratoServicio WHERE id_sede = 857 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferenica', 'POR PAGAR', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45246');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63001', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO MEDICO VETERINARIO SURCO S.A.C. (RUC: 20604139121) | Sede ID: 411 | Hoja: CENTRO MED VET SURCO (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO MEDICO VETERINARIO SURCO S.A.C. (RUC: 20604139121) | Sede ID: 411 | Hoja: CENTRO MED VET SURCO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (411, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 411)) FROM ContratoServicio WHERE id_sede = 411 AND activo = 1), 'JUNIO', '2026-06-28', 'completado', 'pagado', NULL, 'efectivo', 'CANCELADO', 100.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45382');

-- ==================================================
-- CLIENTE: DERMIVET S.A.C. (RUC: 20603880421) | Sede ID: 764 | Hoja: DERMIVET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (764, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 764)) FROM ContratoServicio WHERE id_sede = 764 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'Yape', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45140');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62789', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MATIAS VET E.I.R.L (RUC: 20557975366) | Sede ID: 74 | Hoja: MATIAS VET (2)
-- ==================================================

-- ==================================================
-- CLIENTE: MATIAS VET E.I.R.L (RUC: 20557975366) | Sede ID: 74 | Hoja: MATIAS VET
-- ==================================================

-- ==================================================
-- CLIENTE: PAWS & TAILS E.I.R.L. (RUC: 20600836855) | Sede ID: 855 | Hoja: PAWS & TAILS E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (855, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 855)) FROM ContratoServicio WHERE id_sede = 855 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45461');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63000', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ORTIZ PEÑA DE MARQUINA ROSA MARIA ANDREA (RUC: 10099778313) | Sede ID: 968 | Hoja: ORTIZ PEÑA DE MARQUINA ROSA MAR
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO MEDICO VETERINARIO MEDIC VET E.I.R.L (RUC: 20543825612) | Sede ID: 866 | Hoja: CENTRO MEDICO VETERINARIO MEDIC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (866, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 866)) FROM ContratoServicio WHERE id_sede = 866 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45467');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63007', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JACOBO CASTILLA JESUS ANGELO (RUC: 10218602296) | Sede ID: 1203 | Hoja: JESÚS ANGELO JACOBO CASTILLA 
-- ==================================================

-- ==================================================
-- CLIENTE: N Y A ALERTA VET S.A.C (RUC: 20563786265) | Sede ID: 1231 | Hoja: CERRADO8
-- ==================================================

-- ==================================================
-- CLIENTE: JULIO ALBERTO MARTÍNEZ APAZA (RUC: 10069158264) | Sede ID: 699 | Hoja: JULIO ALBERTO MARTÍNEZ  APAZA 
-- ==================================================

-- ==================================================
-- CLIENTE: AR BIOANÁLISIS SAC (RUC: 20607211265) | Sede ID: 440 | Hoja: AR BIOANÁLISIS SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (440, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 440)) FROM ContratoServicio WHERE id_sede = 440 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62741', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (440, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 440)) FROM ContratoServicio WHERE id_sede = 440 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63049', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (440, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 440)) FROM ContratoServicio WHERE id_sede = 440 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63455', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HAPPY TOOTH E.I.R.L (RUC: 20546685897) | Sede ID: 214 | Hoja: HAPPY TOOTH EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: TORRES LIZAMA CLAUDIA PATRICIA (RUC: 10455032607) | Sede ID: 209 | Hoja: TORRES LIZAMA CLAUDIA PATRICIA
-- ==================================================

-- ==================================================
-- CLIENTE: APONTE SOLANO CLAUDIA HERLINDA (RUC: 10423137563) | Sede ID: 225 | Hoja: CLAUDIA HERLINDA APONTE SOLANO
-- ==================================================

-- ==================================================
-- CLIENTE: DANI PETS & VET S.A.C. (RUC: 20503481309) | Sede ID: 796 | Hoja: DANI PETS & VET S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (796, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 796)) FROM ContratoServicio WHERE id_sede = 796 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-20', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45337');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62925', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DR. ALPACA S.A.C. (RUC: 20602297218) | Sede ID: 1228 | Hoja: DR. ALPACA S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1228, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1228)) FROM ContratoServicio WHERE id_sede = 1228 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-19', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45294');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62931', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RAQUEL REBECA ALIAGA HERMOZA (RUC: 10405920498) | Sede ID: 644 | Hoja: RAQUEL REBECA ALIAGA HERMOZA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (644, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 644)) FROM ContratoServicio WHERE id_sede = 644 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45300');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62679', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DENTASHOP YOCHAVEL S.A.C. (RUC: 20603046294) | Sede ID: 675 | Hoja: DENTASHOP YOCHAVEL S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CHILENO CORDOVA FERNANDO JAVIER (RUC: 10103058398) | Sede ID: 220 | Hoja: CHILENO CORDOVA FERNANDO JAVIER
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (220, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 220)) FROM ContratoServicio WHERE id_sede = 220 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45262');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62921', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Grupo consorcio veterinario sac (RUC: 20607299944) | Sede ID: 78 | Hoja: Grupo consorcio veterinario sac
-- ==================================================

-- ==================================================
-- CLIENTE: G & G VETS FAMILY E.I.R.L. (RUC: 20607102288) | Sede ID: 263 | Hoja: G & G VETS FAMILY E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: GUZMAN SOLIS CARLOS SANDRO (RUC: 10416495497) | Sede ID: 650 | Hoja: GUZMAN SOLIS CARLOS SANDRO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (650, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 650)) FROM ContratoServicio WHERE id_sede = 650 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45067');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62680', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PRESTACIONES INNOVADORAS DENTALES SRL (RUC: 20554678620) | Sede ID: 726 | Hoja: PRESTACIONES INNOVADORAS DENTAL
-- ==================================================

-- ==================================================
-- CLIENTE: ACHANCARAY ROJAS WILFREDO (RUC: 10094084089) | Sede ID: 210 | Hoja: ACHANCARAY ROJAS WILFREDO
-- ==================================================

-- ==================================================
-- CLIENTE: C & F SALUD S.A.C. (RUC: 20600980875) | Sede ID: 496 | Hoja: ESPC & F SALUD S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: C & F SALUD S.A.C. (RUC: 20600980875) | Sede ID: 496 | Hoja: C & F SALUD S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (496, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 496)) FROM ContratoServicio WHERE id_sede = 496 AND activo = 1), '#VALUE!', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62906', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (496, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 496)) FROM ContratoServicio WHERE id_sede = 496 AND activo = 1), '#VALUE!', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62905', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (496, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 496)) FROM ContratoServicio WHERE id_sede = 496 AND activo = 1), '#VALUE!', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62904', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (496, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 496)) FROM ContratoServicio WHERE id_sede = 496 AND activo = 1), '#VALUE!', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62903', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA NORTH SAC (RUC: 20606899298) | Sede ID: 502 | Hoja: VETERINARIA NORTH SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: CUIDADOS VETERINARIOS G & M S.A.C. (RUC: 20608239406) | Sede ID: 243 | Hoja: CUIDADOS VETERINARIOS G & M S.A
-- ==================================================

-- ==================================================
-- CLIENTE: ELIZABETH RICALDI CAFFO (RUC: 10759045144) | Sede ID: 415 | Hoja: ELIZABETH RICALDI CAFFO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (415, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 415)) FROM ContratoServicio WHERE id_sede = 415 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', NULL, 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45498');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63025', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA DENTAL KUSI DENT EIRL (RUC: 20537043360) | Sede ID: 128 | Hoja: MG-CLINICA DENTAL KUSI DENT
-- ==================================================

-- ==================================================
-- CLIENTE: JUMPA RIVERA MARCIA KRISTIE SANDY (RUC: 10708868499) | Sede ID: 427 | Hoja: MARCIA KRISTIE SANDY JUMPA RIVE
-- ==================================================

-- ==================================================
-- CLIENTE: TORRES AGUIRRE JORGE LUIS (RUC: 10225147081) | Sede ID: 306 | Hoja:  TORRES AGUIRRE JORGE LUIS
-- ==================================================

-- ==================================================
-- CLIENTE: MATOS OLIVERA ABEL FRANK (RUC: 10403721625) | Sede ID: 1202 | Hoja: MATOS OLIVERA ABEL FRANK
-- ==================================================

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: L-ELHURONAZULE.I.R.L
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (466, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 466)) FROM ContratoServicio WHERE id_sede = 466 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 57.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45453');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62987', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIAS SAC (RUC: 20601401038) | Sede ID: 461 | Hoja: PL-INVERSIONESELHURON
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (461, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 461)) FROM ContratoServicio WHERE id_sede = 461 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63195', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: M-ELHURONAZULE.I.R.L 
-- ==================================================

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: CERRADO
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIAS RUNA LUNA E.I.R.L. (RUC: 20607091669) | Sede ID: 711 | Hoja: VETERINARIAS RUNA LUNA E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (711, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 711)) FROM ContratoServicio WHERE id_sede = 711 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45321');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62724', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Grupos Sanitovet SAC (RUC: 20566337402) | Sede ID: 518 | Hoja: GRUPO SANITOVET SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CACERES GUTIERREZ JESUS FREDY (RUC: 10441796990) | Sede ID: 769 | Hoja: CACERES GUTIERREZ JESUS FREDY
-- ==================================================

-- ==================================================
-- CLIENTE: GARIBAY CARHUAMACA LUIS ALBERTO (RUC: 10417691281) | Sede ID: 81 | Hoja: GARIBAY CARHUAMACA LUIS ALB (2)
-- ==================================================

-- ==================================================
-- CLIENTE: GARIBAY CARHUAMACA LUIS ALBERTO (RUC: 10417691281) | Sede ID: 81 | Hoja: CERRADO20
-- ==================================================

-- ==================================================
-- CLIENTE: CASTELLANOS VELAZCO MIGUEL ANGEL (RUC: 10087805170) | Sede ID: 457 | Hoja: CASTELLANOS VELAZCO MIGUELANGEL
-- ==================================================

-- ==================================================
-- CLIENTE: PALI INVERSIONES E.I.R.L. (RUC: 20554975918) | Sede ID: 1083 | Hoja: PALI INVERSIONES E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: VALENTIN BELLEZA APOLAYA (RUC: 10481301985) | Sede ID: 1089 | Hoja: VALENTIN BELLEZA APOLAYA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1089, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1089)) FROM ContratoServicio WHERE id_sede = 1089 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63178', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CRUZ GARCIA BRENDA DORILA (RUC: 10107649412) | Sede ID: 552 | Hoja: BRENDA DORILA CRUZ GARCIA
-- ==================================================

-- ==================================================
-- CLIENTE: YUREMMA SERRANO CHOQUE (RUC: 10427011904) | Sede ID: 80 | Hoja: YUREMMA SERRANO CHOQUE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (80, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 80)) FROM ContratoServicio WHERE id_sede = 80 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63168', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA PRANA S.R.L. (RUC: 20546186467) | Sede ID: 799 | Hoja: CLINICA VETERINARIA PRANA SRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (799, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 799)) FROM ContratoServicio WHERE id_sede = 799 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR + 3 CONT.', 89.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45284');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62926', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MEGA MASCOTA S.A.C. (RUC: 20608308912) | Sede ID: 1199 | Hoja: MEGA MASCOTA SAC
-- ==================================================

-- ==================================================
-- CLIENTE: IMPLANTODENTAL E.I.R.L. (RUC: 20604276161) | Sede ID: 651 | Hoja: IMPLANTODENTAL E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (651, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 651)) FROM ContratoServicio WHERE id_sede = 651 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45301');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62681', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ATAUSUPA OCROS NELLY MARIA (RUC: 10414475065) | Sede ID: 1229 | Hoja: NELLY MARIA ATAUSUPA OCROS
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO ESPECIALIZADO PROVIDENCE S.A.C. (RUC: 20602272011) | Sede ID: 1201 | Hoja: CENTRO ODONT ESPEC PROVIDENCE 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1201, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1201)) FROM ContratoServicio WHERE id_sede = 1201 AND activo = 1), 'JUNIO', '2026-06-06', 'completado', 'pagado', '2026-06-17', 'transferencia', 'BBVA', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45196');

-- ==================================================
-- CLIENTE: PRINCIPE ROMERO JORGE ARMANDO (RUC: 10801472619) | Sede ID: 1123 | Hoja: JORGE ARMANDO PRINCIPE ROMERO 
-- ==================================================

-- ==================================================
-- CLIENTE: ESCOBAR VASQUEZ MERY ROSARIO (RUC: 10411613696) | Sede ID: 1236 | Hoja: MERY ROSARIO ESCOBAR VASQUEZ
-- ==================================================

-- ==================================================
-- CLIENTE: ROSAS ALVA HUAMAN NANCY (RUC: 10099997228) | Sede ID: 43 | Hoja: ROSAS ALVA HUAMAN NANCY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (43, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 43)) FROM ContratoServicio WHERE id_sede = 43 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63425', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CASTAÑEDA SUAREZ MIGUEL ANGEL (RUC: 10468184546) | Sede ID: 596 | Hoja: CASTAÑEDA SUAREZ MIGUEL ANGEL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (596, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 596)) FROM ContratoServicio WHERE id_sede = 596 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45239');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62628', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO ESPECIALIZADO VMT S.A.C. (RUC: 20601969646) | Sede ID: 1341 | Hoja: CENTRO ODONT. ESPECIALIZADO VMT
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1341, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1341)) FROM ContratoServicio WHERE id_sede = 1341 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45325');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62732', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: BLANKESY DENT ODONTOLOGOS SAC (RUC: 20613064401) | Sede ID: 1379 | Hoja: BLANKESY DENT ODONTOLOGOS SAC
-- ==================================================

-- ==================================================
-- CLIENTE: POMA MENDO JESUS RAFAEL (RUC: 10080545687) | Sede ID: 1098 | Hoja: JESUS RAFAEL POMA MENDO
-- ==================================================

-- ==================================================
-- CLIENTE: PAULO CESAR SALDAÑA SILVERA (RUC: 10099787461) | Sede ID: 238 | Hoja:  PAULO CESAR SALDAÑA SILVERA   
-- ==================================================

-- ==================================================
-- CLIENTE: JAVIER ANTONIO ESTRADA CANTERO (RUC: 10071540320) | Sede ID: 89 | Hoja: JAVIER ANTONIO ESTRADA CANTERO
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO VETERINARIO J Y B EIRL (RUC: 20610578161) | Sede ID: 1148 | Hoja: CENTRO VETERINARIO J Y B
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1148, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1148)) FROM ContratoServicio WHERE id_sede = 1148 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63103', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QUISPE VALLE EDUARDO JOSUE (RUC: 10429863606) | Sede ID: 99 | Hoja:  QUISPE VALLE EDUARDO JOSUE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (99, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 99)) FROM ContratoServicio WHERE id_sede = 99 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 50.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45274');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62620', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EL LABRADOR SRL (RUC: 20479799785) | Sede ID: 445 | Hoja: EL LABRADOR SRL
-- ==================================================

-- ==================================================
-- CLIENTE: HKH Reumatologia EIRL (RUC: 20514423262) | Sede ID: 1143 | Hoja: HKH Reumatologia EIRL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1143, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1143)) FROM ContratoServicio WHERE id_sede = 1143 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63334', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INVERSIONES BUEN DOCTOR S.R.L. - IBUEND S.R.L. (RUC: 20603524315) | Sede ID: 756 | Hoja: INVERSIONES BUEN DOCTOR S.R.L. 
-- ==================================================

-- ==================================================
-- CLIENTE: THANI DENT S.A.C. (RUC: 20608386468) | Sede ID: 1254 | Hoja: THANI DENT S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1254, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1254)) FROM ContratoServicio WHERE id_sede = 1254 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45024');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62587', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: TIERRA ANIMAL SOCIEDAD ANONIMA CERRADA (RUC: 20607610151) | Sede ID: 759 | Hoja: TIERRA ANIMAL SOCIEDAD ANONIMA 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (759, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 759)) FROM ContratoServicio WHERE id_sede = 759 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 126.75, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45344');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62804', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MUÑIZ ZAMORA RUBEN LUCIO (RUC: 10214843183) | Sede ID: 97 | Hoja: RUBEN LUCIO MUÑIZ ZAMORA
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967) | Sede ID: 369 | Hoja: B-JHON DENT 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 369)) FROM ContratoServicio WHERE id_sede = 369 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63269', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA BLAS VET LINCE (RUC: 20609931559) | Sede ID: 851 | Hoja:  BLAS VET E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (851, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 851)) FROM ContratoServicio WHERE id_sede = 851 AND activo = 1), 'MAYO', '2026-06-20', 'completado', 'pagado', '2026-06-12', 'transferencia', 'BCP', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44611');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63140', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HELAR MARTIN HERNANDEZ MUÑANTE (RUC: 10214625658) | Sede ID: 1112 | Hoja: HELAR MARTIN HERNANDEZ MUÑANTE
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA D´PELOS S.A.C (RUC: 20606732610) | Sede ID: 600 | Hoja: VETERINARIA D´PELOS S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (600, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 600)) FROM ContratoServicio WHERE id_sede = 600 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45241');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62630', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA PANDA EIRL (RUC: 20506738807) | Sede ID: 208 | Hoja: VETERINARIA PANDA EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (208, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 208)) FROM ContratoServicio WHERE id_sede = 208 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45238');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62622', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SOMMEDICS GRAM S.A.C. (RUC: 20607922153) | Sede ID: 599 | Hoja: SOMMEDICS GRAM S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (599, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 599)) FROM ContratoServicio WHERE id_sede = 599 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45240');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62629', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CALDERON MOYA CHRISTIAN VICTOR (RUC: 10700148527) | Sede ID: 1278 | Hoja: Christian Victor Calderon M (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1278, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1278)) FROM ContratoServicio WHERE id_sede = 1278 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-25', 'transferencia', 'YAPE', 63.00, 'BIOCONTAMINADO');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45418');

-- ==================================================
-- CLIENTE: CALDERON MOYA CHRISTIAN VICTOR (RUC: 10700148527) | Sede ID: 1278 | Hoja: Christian Victor Calderon Moya
-- ==================================================

-- ==================================================
-- CLIENTE: MARCOS OSCAR CARHUAHUANCA CORTEZ (RUC: 10106196805) | Sede ID: 337 | Hoja: MARCOS OSCAR CARHUAHUANCA CORTE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (337, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 337)) FROM ContratoServicio WHERE id_sede = 337 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63227', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ANDRES EDUARDO CASTRO CABALLERO (RUC: 10470127797) | Sede ID: 561 | Hoja: ANDRES EDUARDO CASTRO CABALLERO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (561, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 561)) FROM ContratoServicio WHERE id_sede = 561 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63310', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SANCHEZ CUETO JOHNSTON BREAN (RUC: 10467628173) | Sede ID: 947 | Hoja: SANCHEZ CUETO JOHNSTON BREAN
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA BLASVET SURCO E.I.R.L. (RUC: 20609943158) | Sede ID: 840 | Hoja: BLASVET E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (840, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 840)) FROM ContratoServicio WHERE id_sede = 840 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45358');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62770', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA DENTAL DIGITAL E.I.R.L. (RUC: 20614272792) | Sede ID: 1163 | Hoja: CLINICA DENTAL DIGITAL EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1163, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1163)) FROM ContratoServicio WHERE id_sede = 1163 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-06-24', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63335', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VELASQUEZ VIZCARRA LUZ NATALY (RUC: 10444220592) | Sede ID: 307 | Hoja: LUZ NATALY VELASQUEZ VIZCARRA
-- ==================================================

-- ==================================================
-- CLIENTE: G & S ODONTOLOGIA S.A.C. (RUC: 20601488117) | Sede ID: 328 | Hoja: GyS Odontologia Sac
-- ==================================================

-- ==================================================
-- CLIENTE: OMONTE GUTIERREZ JOHAN ROLANDO (RUC: 10437752911) | Sede ID: 441 | Hoja: CH OMONTE GUTIERREZ JOHAN R
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (441, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 441)) FROM ContratoServicio WHERE id_sede = 441 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45291');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62676', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ROES DERMA WELLNESS IMPORTACIONES Y EXPORTACIONES S.A.C. (RUC: 20603961499) | Sede ID: 569 | Hoja: ROES DERMA WELLNESS IMPORTACION
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (569, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 569)) FROM ContratoServicio WHERE id_sede = 569 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45320');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62721', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA DOGTORAS S.R.L. (RUC: 20548219648) | Sede ID: 1080 | Hoja: CLINICA VETERINARIA DOGTORAS S.
-- ==================================================

-- ==================================================
-- CLIENTE: DEL AGUILA TRINIDAD MARINEYLLY (RUC: 10420710564) | Sede ID: 1273 | Hoja: DEL AGUILA TRINIDAD MARINEY (2)
-- ==================================================

-- ==================================================
-- CLIENTE: DEL AGUILA TRINIDAD MARINEYLLY (RUC: 10420710564) | Sede ID: 1273 | Hoja: DEL AGUILA TRINIDAD MARINEYLLY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1273, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1273)) FROM ContratoServicio WHERE id_sede = 1273 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63182', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Dentaurus Clínica Dental EIRL (RUC: 20538730816) | Sede ID: 174 | Hoja: DENTAURUS CLINICA DENTAL E.I.R.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (174, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 174)) FROM ContratoServicio WHERE id_sede = 174 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63133', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CITYPETS E.I.R.L. (RUC: 20552375905) | Sede ID: 550 | Hoja: CITYPETS E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (550, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 550)) FROM ContratoServicio WHERE id_sede = 550 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63174', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CMO SEÑORA DE GUADALUPE E.I.R.L. (RUC: 20606512598) | Sede ID: 1135 | Hoja: CMO SEÑORA DE GUADALUPE E.I (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1135, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1135)) FROM ContratoServicio WHERE id_sede = 1135 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63180', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CMO SEÑORA DE GUADALUPE E.I.R.L. (RUC: 20606512598) | Sede ID: 1135 | Hoja: CERRADO6
-- ==================================================

-- ==================================================
-- CLIENTE: PROPET SR S.A.C (RUC: 20608794191) | Sede ID: 258 | Hoja: PROPET SR S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (258, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 258)) FROM ContratoServicio WHERE id_sede = 258 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45452');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62985', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 562 | Hoja: PET MAX SAC  la molina
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (562, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 562)) FROM ContratoServicio WHERE id_sede = 562 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62820', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (562, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 562)) FROM ContratoServicio WHERE id_sede = 562 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62881', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (562, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 562)) FROM ContratoServicio WHERE id_sede = 562 AND activo = 1), 'JUNIO', '2026-06-19', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63059', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GIOVANNI MAXIMO SOTELO CASAFRANCA (RUC: 10094945726) | Sede ID: 680 | Hoja: GIOVANNI MAXIMO SOTELO CASAFRAN
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (680, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 680)) FROM ContratoServicio WHERE id_sede = 680 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45303');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62684', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: AMIPET VETERINARIA E.I.R.L. (RUC: 20556501794) | Sede ID: 398 | Hoja: AMIPET VETERINARIA E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (398, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 398)) FROM ContratoServicio WHERE id_sede = 398 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63263', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JOLICAHE S.A.C. (RUC: 20600499042) | Sede ID: 1093 | Hoja: O-JOLICAHE S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1093, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1093)) FROM ContratoServicio WHERE id_sede = 1093 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-05-28', 'transferencia', 'CANCELADO LOS s/30', 30.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63333', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JOLICAHE S.A.C. (RUC: 20600499042) | Sede ID: 1093 | Hoja: SMP-JOLICAHE S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1093, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1093)) FROM ContratoServicio WHERE id_sede = 1093 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63244', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INVERSIONES Y SERVICIOS VETERINARIOS S.A. (RUC: 20603293313) | Sede ID: 671 | Hoja: INVERSIONES Y SERV VETERINARIOS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (671, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 671)) FROM ContratoServicio WHERE id_sede = 671 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63139', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LABORATORIO CLINICO PERU LABS E.I.R.L. (RUC: 20607902268) | Sede ID: 577 | Hoja: PERULABS EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO ESPECIALIZADO BIODENTAMERICA S.A.C (RUC: 20609073129) | Sede ID: 1413 | Hoja: CENTRO ODONTOLOGICO ESPECIALIZA
-- ==================================================

-- ==================================================
-- CLIENTE: SANTHOME BERNALES VICTOR MANUEL (RUC: 10088051993) | Sede ID: 802 | Hoja: SANTHOME BERNALES VICTOR MANUEL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (802, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 802)) FROM ContratoServicio WHERE id_sede = 802 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45252');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62887', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MAPEVAS SOCIEDAD ANONIMA CERRADA (RUC: 20602841899) | Sede ID: 509 | Hoja: MAPEVAS ESP
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (509, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 509)) FROM ContratoServicio WHERE id_sede = 509 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62614', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (509, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 509)) FROM ContratoServicio WHERE id_sede = 509 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62889', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MAPEVAS SOCIEDAD ANONIMA CERRADA (RUC: 20602841899) | Sede ID: 509 | Hoja: MAPEVAS S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (509, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 509)) FROM ContratoServicio WHERE id_sede = 509 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62613', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (509, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 509)) FROM ContratoServicio WHERE id_sede = 509 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62888', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Casvi SAC (RUC: 20553444773) | Sede ID: 1237 | Hoja: Casvi SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1237, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1237)) FROM ContratoServicio WHERE id_sede = 1237 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45122');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62809', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: IMAGEN DENTAL CENTER E.I.R.L. (RUC: 20604816352) | Sede ID: 738 | Hoja: IMAGEN DENTAL CENTER E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: IMAGEN DENTAL CENTER E.I.R.L. (RUC: 20604816352) | Sede ID: 738 | Hoja: IMAGEN DENTAL CENTER E.I.R. (2)
-- ==================================================

-- ==================================================
-- CLIENTE: NAKURA S.A.C. (RUC: 20605223983) | Sede ID: 304 | Hoja: NAKURA S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (304, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 304)) FROM ContratoServicio WHERE id_sede = 304 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45493');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63019', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MM Y ASSOCIATED SAC (RUC: 20609706814) | Sede ID: 923 | Hoja: MM & ASSOCIATED S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Anngie Gissella Villar Calderón (RUC: 10413081667) | Sede ID: 940 | Hoja: ANNGIE GISSELLA VILLAR CALDERON
-- ==================================================

-- ==================================================
-- CLIENTE: RUBIO VALDIVIESO ALICIA MARIA (RUC: 10077531829) | Sede ID: 1025 | Hoja: RUBIO VALDIVIESO ALICIA MARIA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1025, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1025)) FROM ContratoServicio WHERE id_sede = 1025 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63162', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967) | Sede ID: 369 | Hoja: C5-JHON DENT
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967) | Sede ID: 369 | Hoja: V3-JHON DENT
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 369)) FROM ContratoServicio WHERE id_sede = 369 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63097', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JUAN CARLOS ASTONITAS ASTONITAS (RUC: 10087438282) | Sede ID: 341 | Hoja: JUAN CARLOS ASTONITAS ASTONITAS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (341, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 341)) FROM ContratoServicio WHERE id_sede = 341 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pagado', '2026-06-25', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45438');

-- ==================================================
-- CLIENTE: Clínica spce e.i.r.l (RUC: 20605797190) | Sede ID: 986 | Hoja: Clinica spce e.i.r.l
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (986, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 986)) FROM ContratoServicio WHERE id_sede = 986 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62749', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (986, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 986)) FROM ContratoServicio WHERE id_sede = 986 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63046', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (986, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 986)) FROM ContratoServicio WHERE id_sede = 986 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63452', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ADNMEDICAL E.I.R.L. (RUC: 20603372191) | Sede ID: 527 | Hoja:  ADNMEDICAL E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: RIVERA REYES RONY RANDALL (RUC: 10432543515) | Sede ID: 1169 | Hoja: PL RIVERA REYES RONY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1169, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1169)) FROM ContratoServicio WHERE id_sede = 1169 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63359', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RIVERA REYES RONY RANDALL (RUC: 10432543515) | Sede ID: 1168 | Hoja: SM -RIVERA REYES RONY RANDALL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1168, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1168)) FROM ContratoServicio WHERE id_sede = 1168 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63314', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967) | Sede ID: 369 | Hoja: CERRADO7
-- ==================================================

-- ==================================================
-- CLIENTE: MORALES MONTEJO LUIS ABELARDO (RUC: 10084704861) | Sede ID: 293 | Hoja: MORALES MONTEJO LUIS ABELARDO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (293, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 293)) FROM ContratoServicio WHERE id_sede = 293 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63326', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DIENTE FELIZ S.A.C. (RUC: 20602675921) | Sede ID: 703 | Hoja: DIENTE FELIZ S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (703, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 703)) FROM ContratoServicio WHERE id_sede = 703 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), 'NUEVO CONTRO');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62702', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Veterinaria Cabrera J y P S.A.C. (RUC: 20608642570) | Sede ID: 1197 | Hoja: Veterinaria cabrera j y p sac
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1197, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1197)) FROM ContratoServicio WHERE id_sede = 1197 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63441', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ALLQUSERVICIOS S.A.C. (RUC: 20608628666) | Sede ID: 700 | Hoja: ALLQUSERVICIOS S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (700, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 700)) FROM ContratoServicio WHERE id_sede = 700 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45066');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62743', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: WALDEMAR DAVILA MELGAREJO (RUC: 10060022963) | Sede ID: 223 | Hoja: WALDEMAR DAVILA MELGAREJO 
-- ==================================================

-- ==================================================
-- CLIENTE: RANILLA VALENTE GUISSELLA IVETTE (RUC: 10408896334) | Sede ID: 218 | Hoja: RANILLA VALENTE GUISSELLA IVETT
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (218, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 218)) FROM ContratoServicio WHERE id_sede = 218 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45327');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62796', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA MARINAPETS E.I.R.L. (RUC: 20523351754) | Sede ID: 103 | Hoja: VETERINARIA MARINAPETS E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: JOSÉ LUIS GONZALES UCHUYPOMA (RUC: 10106898664) | Sede ID: 1153 | Hoja: JOSÉ LUIS GONZALES UCHUYPOMA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1153, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1153)) FROM ContratoServicio WHERE id_sede = 1153 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63351', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SIMPET SAC (RUC: 20610344489) | Sede ID: 1176 | Hoja: IMVERSIONES SIMPET (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1176, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1176)) FROM ContratoServicio WHERE id_sede = 1176 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63105', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SIMPET SAC (RUC: 20610344489) | Sede ID: 1176 | Hoja: IMVERSIONES SIMPET
-- ==================================================

-- ==================================================
-- CLIENTE: PALOMINO SERVICIOS VETERINARIOS S.A.C. (RUC: 20605942637) | Sede ID: 100 | Hoja: PALOMINO SERVICIOS VETERINARIOS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (100, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 100)) FROM ContratoServicio WHERE id_sede = 100 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63426', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA REAL LOS LAURELES SAC (RUC: 20220832016) | Sede ID: 406 | Hoja: CLINICA REAL LOS LAURELES SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (406, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 406)) FROM ContratoServicio WHERE id_sede = 406 AND activo = 1), 'JUNIO', '2026-06-06', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62845', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (406, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 406)) FROM ContratoServicio WHERE id_sede = 406 AND activo = 1), 'JUNIO', '2026-06-03', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62844', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (406, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 406)) FROM ContratoServicio WHERE id_sede = 406 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62846', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (406, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 406)) FROM ContratoServicio WHERE id_sede = 406 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62847', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (406, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 406)) FROM ContratoServicio WHERE id_sede = 406 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62848', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ERIKA BERNARDINA ROJAS DIAZ (RUC: 10098342911) | Sede ID: 652 | Hoja: ERIKA BERNARDINA ROJAS DIAZ
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (652, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 652)) FROM ContratoServicio WHERE id_sede = 652 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45302');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62682', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO DE ESPECIALIDADES MEDICAS CORAZÓN DE JESÚS E.I.R.L. (RUC: 20609000881) | Sede ID: 1181 | Hoja: ESPECIALI.MED.CORAZON DE JESUS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1181, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1181)) FROM ContratoServicio WHERE id_sede = 1181 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63336', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MEDAVAC- LAB SAC (RUC: 20606809086) | Sede ID: 558 | Hoja: MEDAVAC- LAB SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (558, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 558)) FROM ContratoServicio WHERE id_sede = 558 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62855', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (558, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 558)) FROM ContratoServicio WHERE id_sede = 558 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62854', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (558, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 558)) FROM ContratoServicio WHERE id_sede = 558 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62853', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (558, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 558)) FROM ContratoServicio WHERE id_sede = 558 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62852', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (558, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 558)) FROM ContratoServicio WHERE id_sede = 558 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62851', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (558, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 558)) FROM ContratoServicio WHERE id_sede = 558 AND activo = 1), 'JUNIO', '2026-06-03', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62850', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RENACER, SALUD Y BELLEZA S.A.C. (RUC: 20609118343) | Sede ID: 891 | Hoja: RENACER, SALUD Y BELLEZA S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (891, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 891)) FROM ContratoServicio WHERE id_sede = 891 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', '2026-06-20', 'efectivo', 'CANCELADO', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45338');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63143', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SILVA MEZZICH PEDRO JOSE (RUC: 10094547003) | Sede ID: 876 | Hoja: SILVA MEZZICH PEDRO JOSE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (876, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 876)) FROM ContratoServicio WHERE id_sede = 876 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', '2026-06-20', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45336');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63141', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLAUDIO ALBERTO ACCO NOA (RUC: 10106448154) | Sede ID: 654 | Hoja: CLAUDIO ALBERTO ACCO NOA
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS GENERALES DE SALUD SANTA FE DEL SUR E.I.R.L. (RUC: 20606479311) | Sede ID: 106 | Hoja: serv generales santa fe del sur
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA ANIMALANDIA M & S S.A.C. (RUC: 20609260140) | Sede ID: 892 | Hoja: CLINICA VETERINARIA ANIMALANDIA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (892, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 892)) FROM ContratoServicio WHERE id_sede = 892 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63144', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Animal Garden sac (RUC: 20607053287) | Sede ID: 385 | Hoja: C-ANIMAL GARDEN S.A.C. 
-- ==================================================

-- ==================================================
-- CLIENTE: Animal Garden sac (RUC: 20607053287) | Sede ID: 392 | Hoja: JM-ANIMAL GARDEN S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (392, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 392)) FROM ContratoServicio WHERE id_sede = 392 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45486');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63024', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: POLICLINICO FAMILIAR SANTA ROSA E.I.R.L. (RUC: 20602032516) | Sede ID: 270 | Hoja: POLICLINICO FAMILIAR SANTA ROSA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (270, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 270)) FROM ContratoServicio WHERE id_sede = 270 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63188', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ANGEL Y CARLOS ODONTOLOGÌA ESPECIALIZADA S.A.C. (RUC: 20607752720) | Sede ID: 910 | Hoja: ANGEL Y CARLOS ODONTOLOGÌA ESPE
-- ==================================================

-- ==================================================
-- CLIENTE: PET EXPRESSION S.A.C. (RUC: 20602970478) | Sede ID: 493 | Hoja: PET EXPRESSION S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL CORDOVA E.I.R.L. (RUC: 20609280329) | Sede ID: 109 | Hoja: CONSULTORIO DENTAL CORDOVA E.I.
-- ==================================================

-- ==================================================
-- CLIENTE: HUAMAN ZARATE HENRY WALTER (RUC: 10107652634) | Sede ID: 1392 | Hoja: HUAMAN ZARATE HENRY WALTER
-- ==================================================

-- ==================================================
-- CLIENTE: VIRGEN DE LA ASUNCION M Y O S.A.C. (RUC: 20600024150) | Sede ID: 658 | Hoja:  VIRGEN DE LA ASUNCION M Y O S.
-- ==================================================

-- ==================================================
-- CLIENTE: FREDY ARTURO CERVANTES REYNA (RUC: 10072656887) | Sede ID: 273 | Hoja: FREDY ARTURO CERVANTES REYNA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (273, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 273)) FROM ContratoServicio WHERE id_sede = 273 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45482');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63016', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ESTRELLA APARICIO MELISSA GABRIELA (RUC: 10446650624) | Sede ID: 742 | Hoja: ESTRELLA APARICIO MELISSA GABRI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (742, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 742)) FROM ContratoServicio WHERE id_sede = 742 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45342');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62802', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PEREDO ARENAS FRANK ALEXANDER (RUC: 10417192463) | Sede ID: 691 | Hoja: PEREDO ARENAS FRANK ALEXANDER
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (691, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 691)) FROM ContratoServicio WHERE id_sede = 691 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-23', 'transferencia', 'YAPE', 62.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), 'B001-114');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62722', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO LA MAR E.I.R.L. (RUC: 20609374331) | Sede ID: 266 | Hoja: CENTRO ODONTOLOGICO LA MAR E.I.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (266, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 266)) FROM ContratoServicio WHERE id_sede = 266 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-23', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45347');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63187', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SANCHEZ SANCHEZ DE ROJAS LUCY EMPERATRIZ (RUC: 10153854853) | Sede ID: 1068 | Hoja:  SANCHEZ DE ROJAS LUCY EMPERATR
-- ==================================================

-- ==================================================
-- CLIENTE: DILAS DENT E.I.R.L. (RUC: 20609344246) | Sede ID: 862 | Hoja: DILAS DENT E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (862, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 862)) FROM ContratoServicio WHERE id_sede = 862 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45465');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63004', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET BELLAVISTA SAC (RUC: 20615213331) | Sede ID: 1444 | Hoja: VET BELLAVISTA S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1444, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1444)) FROM ContratoServicio WHERE id_sede = 1444 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63284', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: KRISTALDENT S.A.C. (RUC: 20549948775) | Sede ID: 661 | Hoja: KRISTALDENT SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (661, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 661)) FROM ContratoServicio WHERE id_sede = 661 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45253');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62641', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS ODONTOLOGICOS FLORES S.A.C. (RUC: 20609057450) | Sede ID: 601 | Hoja: SERVICIOS MEDICOS Y ODONTOLOGIC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (601, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 601)) FROM ContratoServicio WHERE id_sede = 601 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45242');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62631', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: King vet S.A.C (RUC: 20609560844) | Sede ID: 1342 | Hoja: KING VET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Lissett stefany Cordova Cordova (RUC: 10473515313) | Sede ID: 347 | Hoja: Lissett  stefany Cordova Cordov
-- ==================================================

-- ==================================================
-- CLIENTE: CASTILLO ARCE JORMAN AARON (RUC: 10483985377) | Sede ID: 110 | Hoja: CASTILLO ARCE JORMAN AARON
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (110, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 110)) FROM ContratoServicio WHERE id_sede = 110 AND activo = 1), 'JUNIO', '2026-06-26', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63427', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Peluditos Petshop EIRL (RUC: 20611797843) | Sede ID: 244 | Hoja: PELUDITOS PETSHOP
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (244, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 244)) FROM ContratoServicio WHERE id_sede = 244 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63186', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA GAVET PERU S.A.C. (RUC: 20609660831) | Sede ID: 231 | Hoja: CLINICA VETERINARIA GAVET PERU 
-- ==================================================

-- ==================================================
-- CLIENTE: AGROVETERINARIA MARTINEZ EIRL (RUC: 20135664538) | Sede ID: 1105 | Hoja: AGROVETERINARIA MARTINEZ EMPRES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1105, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1105)) FROM ContratoServicio WHERE id_sede = 1105 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-23', 'transferencia', 'YAPE', 98.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45374');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63276', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO UNITY S.A.C. (RUC: 20608683446) | Sede ID: 704 | Hoja: CENTRO ODONTOLOGICO UNITY S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: CELESTINO APOLINARIO ACENCIO BEKER (RUC: 10414166127) | Sede ID: 1113 | Hoja: CELESTINO APOLINARIO ACENCIO BE
-- ==================================================

-- ==================================================
-- CLIENTE: QUESQUEN CUYUBAMBA DHARIANA JUANA (RUC: 10457921824) | Sede ID: 978 | Hoja: QUESQUEN CUYUBAMBA DHARIANA JUA
-- ==================================================

-- ==================================================
-- CLIENTE: PROSEVAR S.A.C. (RUC: 20428962177) | Sede ID: 618 | Hoja: PROSEVAR S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Lizeth Magaly Marcatinco Cuba (RUC: 10487931921) | Sede ID: 277 | Hoja: Lizeth Magaly Marcatinco Cuba
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (277, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 277)) FROM ContratoServicio WHERE id_sede = 277 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-08', 'transferencia', 'YAPE', 110.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45071');

-- ==================================================
-- CLIENTE: CORPORACIÓN VETERINARIA SAN PÍO S.A.C. (RUC: 20606054832) | Sede ID: 407 | Hoja: CORPORACIÓN VETERINARIA SAN PÍO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (407, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 407)) FROM ContratoServicio WHERE id_sede = 407 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-15', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45414');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62891', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SANTOS SOTO LISSETTE LOURDES (RUC: 10107486491) | Sede ID: 295 | Hoja: SANTOS SOTO LISSETTE LOURDES
-- ==================================================

-- ==================================================
-- CLIENTE: OLIVIA VIOLETA CERACIO PANDURO (RUC: 10418529984) | Sede ID: 1010 | Hoja: OLIVIA VIOLETA CERACIO PANDURO 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1010, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1010)) FROM ContratoServicio WHERE id_sede = 1010 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-23', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45371');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63273', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PET INDUSTRY SAC (RUC: 20609956659) | Sede ID: 486 | Hoja: PET INDUSTRY S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (486, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 486)) FROM ContratoServicio WHERE id_sede = 486 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-19', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45317');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62718', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: TANAKA BUSTAMANTE ANGELA YOSHY (RUC: 10728758177) | Sede ID: 948 | Hoja: TANAKA BUSTAMANTE ANGELA YOSHY
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES ENCANTHADA S.A.C (RUC: 20613727052) | Sede ID: 1209 | Hoja: INVERSIONES ENCANTHADA SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1209, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1209)) FROM ContratoServicio WHERE id_sede = 1209 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63338', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: 6GDENT S.A.C. (RUC: 20609724791) | Sede ID: 1276 | Hoja: 6GDENT S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1276, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1276)) FROM ContratoServicio WHERE id_sede = 1276 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63444', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CORPORATIVO GALARSAN S.A.C. (RUC: 20608967941) | Sede ID: 116 | Hoja: CORPORATIVO GALARSAN S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO SALVAS PERU S.A.C (RUC: 20609182815) | Sede ID: 766 | Hoja: GRUPO SALVAS PERU S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (766, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 766)) FROM ContratoServicio WHERE id_sede = 766 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45351');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62805', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REPRESENTACIONES VETERINARIAS EL DORADO S.A.C. (RUC: 20604600597) | Sede ID: 460 | Hoja: L- EL DORADO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (460, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 460)) FROM ContratoServicio WHERE id_sede = 460 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 57.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45454');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62988', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CIMEVET S.A.C. (RUC: 20609984474) | Sede ID: 299 | Hoja: O- CIMEVET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CIMEVET S.A.C. (RUC: 20609984474) | Sede ID: 299 | Hoja: C-CIMEVET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES Y SERVICIOS GENERALES ANIMALAND S.A.C. (RUC: 20610005501) | Sede ID: 746 | Hoja: INVERSIONES Y SERVICIOS GENERAL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (746, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 746)) FROM ContratoServicio WHERE id_sede = 746 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63098', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MILAGROS BRIONES LAU LI (RUC: 10472000336) | Sede ID: 283 | Hoja: Milagros Briones Lau Li
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (283, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 283)) FROM ContratoServicio WHERE id_sede = 283 AND activo = 1), 'ABRIL', '2026-04-20', 'completado', 'pagado', '2026-04-26', 'transferencia', 'yAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43900');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (283, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 283)) FROM ContratoServicio WHERE id_sede = 283 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45483');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63017', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Los Peluches 24 hrs SAC (RUC: 20609651769) | Sede ID: 224 | Hoja: Los Peluches 24 hrs SAC
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS DE CIRUGIA VETERINARIA E IMAGENES DR. LUIS RAMOS E.I.R.L (RUC: 20611878282) | Sede ID: 1213 | Hoja: CIRUVET E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1213, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1213)) FROM ContratoServicio WHERE id_sede = 1213 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45432');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62949', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Lia cárdenas Alcazar (RUC: 10425712409) | Sede ID: 1158 | Hoja: Lia cárdenas Alcazar
-- ==================================================

-- ==================================================
-- CLIENTE: Becodent sacs (RUC: 20608989863) | Sede ID: 895 | Hoja: Becodent sacs
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (895, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 895)) FROM ContratoServicio WHERE id_sede = 895 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63145', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica Dental Brisa SAC (RUC: 20545590205) | Sede ID: 956 | Hoja: Clínica Dental Brisa SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (956, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 956)) FROM ContratoServicio WHERE id_sede = 956 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63237', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C. (RUC: 20609381834) | Sede ID: 1145 | Hoja: CLÍNICA VETERINARIA Y GROOM (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C. (RUC: 20609381834) | Sede ID: 1145 | Hoja: CLÍNICA VETERINARIA Y GROOMING 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1145, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1145)) FROM ContratoServicio WHERE id_sede = 1145 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63204', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GORDILLO MALDONADO CARLA ROSA EMILIA (RUC: 10078621643) | Sede ID: 117 | Hoja: GORDILLO MALDONADO CARLA ROSA E
-- ==================================================

-- ==================================================
-- CLIENTE: NATURAL PETS SERVICIOS VETERINARIOS S.A.C. (RUC: 20606847093) | Sede ID: 326 | Hoja: NATURAL PETS SERVICIOS VETERINA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (326, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 326)) FROM ContratoServicio WHERE id_sede = 326 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45065');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62716', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A.C (RUC: 20608420933) | Sede ID: 1128 | Hoja: SJL-MASKOTOPIA 
-- ==================================================

-- ==================================================
-- CLIENTE: Milagros Mitma Ramírez (RUC: 10700511494) | Sede ID: 655 | Hoja: Milagros Mitma Ramírez     
-- ==================================================

-- ==================================================
-- CLIENTE: ESCORZA VILLEGAS BLANCA JAKELINE (RUC: 10476115375) | Sede ID: 602 | Hoja: ESCORZA VILLEGAS BLANCA JAKELIN
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (602, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 602)) FROM ContratoServicio WHERE id_sede = 602 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45277');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62632', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA VENTURA E.I.R.L. (RUC: 20602267599) | Sede ID: 697 | Hoja: VETERINARIA VENTURA E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (697, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 697)) FROM ContratoServicio WHERE id_sede = 697 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45310');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62701', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JARA VENTURA JOSE GIAN CARLO (RUC: 10421127269) | Sede ID: 1184 | Hoja: JARA VENTURA JOSE GIAN CARLO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1184, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1184)) FROM ContratoServicio WHERE id_sede = 1184 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63257', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SALUD DENTAL ODONTOLOGIA INTEGRAL (RUC: 20602353240) | Sede ID: 603 | Hoja: SALUD DENTAL ODONTOLOGÍA INTEGR
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (603, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 603)) FROM ContratoServicio WHERE id_sede = 603 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45243');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62633', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: SM-ELHURONAZUL E.I.R.L 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (466, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 466)) FROM ContratoServicio WHERE id_sede = 466 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63307', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CABALLERO NUÑEZ GUILLERMO ENRIQUE (RUC: 10033804364) | Sede ID: 119 | Hoja: CABALLERO NUÑEZ GUILLERMO E (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (119, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 119)) FROM ContratoServicio WHERE id_sede = 119 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63342', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: URBINA ANTICONA EUGENIA YRIS (RUC: 10068030116) | Sede ID: 1246 | Hoja: URBINA ANTICONA EUGENIA YRIS
-- ==================================================

-- ==================================================
-- CLIENTE: DOCTOR MASCOTA S.A.C. (RUC: 20606028581) | Sede ID: 329 | Hoja: M-DOCTOR MASCOTA S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (329, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 329)) FROM ContratoServicio WHERE id_sede = 329 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63157', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ODONTOCRED E.I.R.L (RUC: 20545995795) | Sede ID: 1227 | Hoja: ODONTOCRED E.I.R.L
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1227, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1227)) FROM ContratoServicio WHERE id_sede = 1227 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'transferencia', 'YAPE CANCELADO', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45079');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62744', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ASTUCURI YAURI JOSE ANTONIO (RUC: 10105985954) | Sede ID: 918 | Hoja: C-ASTUCURI YAURI JOSE ANTONIO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (918, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 918)) FROM ContratoServicio WHERE id_sede = 918 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pagado', '2026-06-13', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45167');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62824', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ASTUCURI YAURI JOSE ANTONIO (RUC: 10105985954) | Sede ID: 918 | Hoja: A-ASTUCURI YAURI JOSE ANTONIO
-- ==================================================

-- ==================================================
-- CLIENTE: Inversiones ceofam sac (RUC: 20510055897) | Sede ID: 1002 | Hoja: Inversiones ceofam sac
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1002, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1002)) FROM ContratoServicio WHERE id_sede = 1002 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63331', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Emily Vasquez Muñoz (RUC: 10430410488) | Sede ID: 363 | Hoja: Emily Vasquez Muñoz
-- ==================================================

-- ==================================================
-- CLIENTE: Bastidas Benites Alejandro Jaime Leonardo (RUC: 10731763416) | Sede ID: 120 | Hoja: Bastidas Benites Alejandro Jaim
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (120, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 120)) FROM ContratoServicio WHERE id_sede = 120 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63220', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C. (RUC: 20518247761) | Sede ID: 1114 | Hoja: KAVELG ESPECIALES
-- ==================================================

-- ==================================================
-- CLIENTE: KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C. (RUC: 20518247761) | Sede ID: 1114 | Hoja: KAVELG
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1114, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1114)) FROM ContratoServicio WHERE id_sede = 1114 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62916', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1114, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1114)) FROM ContratoServicio WHERE id_sede = 1114 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62914', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1114, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1114)) FROM ContratoServicio WHERE id_sede = 1114 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62915', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1114, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1114)) FROM ContratoServicio WHERE id_sede = 1114 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62917', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MELYSALUD S.A.C (RUC: 20553512281) | Sede ID: 957 | Hoja: MELYSALUD (2)
-- ==================================================

-- ==================================================
-- CLIENTE: MELYSALUD S.A.C (RUC: 20553512281) | Sede ID: 957 | Hoja: MELYSALUD
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (957, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 957)) FROM ContratoServicio WHERE id_sede = 957 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63238', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: margarita martell martinez (RUC: 10087226480) | Sede ID: 883 | Hoja: margarita martell martinez
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (883, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 883)) FROM ContratoServicio WHERE id_sede = 883 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63175', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ANIMEDICA VET S.A.C. (RUC: 20601722098) | Sede ID: 1103 | Hoja: CL-ANIMEDICA VET SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1103, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1103)) FROM ContratoServicio WHERE id_sede = 1103 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45456');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62991', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO DENTAL LIMA NORTE (RUC: 20605177302) | Sede ID: 187 | Hoja: CENTRO DENTAL LIMA NORTE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (187, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 187)) FROM ContratoServicio WHERE id_sede = 187 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63222', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EMPRESA MUNICIPAL DE CHORRILLOS S.A.. (RUC: 20556621188) | Sede ID: 410 | Hoja: 1965 EMPRESA MUN CHO
-- ==================================================

-- ==================================================
-- CLIENTE: EMPRESA MUNICIPAL DE CHORRILLOS S.A.. (RUC: 20556621188) | Sede ID: 410 | Hoja: E1965 EMPRESA MUN CHO
-- ==================================================

-- ==================================================
-- CLIENTE: EMPRESA MUNICIPAL DE CHORRILLOS S.A.. (RUC: 20556621188) | Sede ID: 410 | Hoja: 2007 EMPRESA MUN CHO
-- ==================================================

-- ==================================================
-- CLIENTE: EMPRESA MUNICIPAL DE CHORRILLOS S.A.. (RUC: 20556621188) | Sede ID: 410 | Hoja: E2007 EMPRESA MUN CHO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (410, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 410)) FROM ContratoServicio WHERE id_sede = 410 AND activo = 1), 'JUNIO', '2026-06-19', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62967', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (410, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 410)) FROM ContratoServicio WHERE id_sede = 410 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62968', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Asociados Ganoza & Camac SAC (RUC: 20609904292) | Sede ID: 1260 | Hoja: Asociados Ganoza & Camac SAC
-- ==================================================

-- ==================================================
-- CLIENTE: PET SOUND SERVICIOS S.A.C (RUC: 20609944898) | Sede ID: 1111 | Hoja: PET SOUND SERVICIOS S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1111, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1111)) FROM ContratoServicio WHERE id_sede = 1111 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63459', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Abigail Marcelina Cáceres Saldaña (RUC: 10101937726) | Sede ID: 1224 | Hoja: Abigail Marcelina Cáceres Salda
-- ==================================================

-- ==================================================
-- CLIENTE: SIETE GUTIERREZ VDA DE ALVARADO YOLANDA (RUC: 10086605517) | Sede ID: 860 | Hoja: SIETE GUTIERREZ VDA DE ALVARADO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (860, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 860)) FROM ContratoServicio WHERE id_sede = 860 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45464');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63003', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MEDICVET INTEGRATIVA SAC (RUC: 20612548430) | Sede ID: 122 | Hoja: JM-MEDICVET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (122, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 122)) FROM ContratoServicio WHERE id_sede = 122 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45487');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63026', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MEDICVET INTEGRATIVA SAC (RUC: 20612548430) | Sede ID: 122 | Hoja: O-MEDICVET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (122, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 122)) FROM ContratoServicio WHERE id_sede = 122 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63325', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SILVANA KATHERINE ALVAREZ SOTELO (RUC: 10734554664) | Sede ID: 124 | Hoja: SILVANA KATHERINE ALVAREZ SOTEL
-- ==================================================

-- ==================================================
-- CLIENTE: Centro Odontológico Biomedix sac (RUC: 20608719033) | Sede ID: 1435 | Hoja: Centro Odontológico Biomedix sa
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1435, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1435)) FROM ContratoServicio WHERE id_sede = 1435 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63183', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA DENTAL KUSI DENT EIRL (RUC: 20537043360) | Sede ID: 128 | Hoja: PTP279 CLINICA DENTAL KUSI DENT
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DENTAL KUSI DENT EIRL (RUC: 20537043360) | Sede ID: 128 | Hoja: PTP275 CLINICA DENTAL KUSI DENT
-- ==================================================

-- ==================================================
-- CLIENTE: Carla Elena Ramirez Reyes (RUC: 10741677151) | Sede ID: 885 | Hoja: Carla Elena Ramirez Reyes 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (885, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 885)) FROM ContratoServicio WHERE id_sede = 885 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 50.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45430');

-- ==================================================
-- CLIENTE: Grupo Masias Perú sac (RUC: 20609097281) | Sede ID: 139 | Hoja: Grupo Masias Perú sac
-- ==================================================

-- ==================================================
-- CLIENTE: Jesus Rafael Gamarra Trujillo (RUC: 10081638875) | Sede ID: 141 | Hoja: Jesus Rafael Gamarra Trujillo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (141, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 141)) FROM ContratoServicio WHERE id_sede = 141 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pagado', '2026-06-13', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45378');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62822', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VEVET S.A.C. (RUC: 20609951525) | Sede ID: 582 | Hoja: VEVET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Gino Antero Gambini Cercado (RUC: 10722267791) | Sede ID: 958 | Hoja: Gino Antero Gambini Cercado
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (958, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 958)) FROM ContratoServicio WHERE id_sede = 958 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-20', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45333');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63239', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Malu Fernandez Rodriguez (RUC: 10418172890) | Sede ID: 961 | Hoja: Malu Fernandez Rodriguez
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (961, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 961)) FROM ContratoServicio WHERE id_sede = 961 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63240', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CEO CENTRO ESTETICO ODONTOLOGICO ESPECIALIZADO E.I.R.L. (RUC: 20557521411) | Sede ID: 718 | Hoja:  CEO ESPECIALIZADO E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: Rosario Aurora Zegarra Medina (RUC: 10088218987) | Sede ID: 745 | Hoja: Rosario Aurora Zegarra Medina
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (745, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 745)) FROM ContratoServicio WHERE id_sede = 745 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45366');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62785', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ROMERO MORALES ROCIO AURORA (RUC: 10417772559) | Sede ID: 761 | Hoja: ROMERO MORALES ROCIO AURORA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (761, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 761)) FROM ContratoServicio WHERE id_sede = 761 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45281');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62645', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Omar Antonio Cedeño Zegarra (RUC: 10407027235) | Sede ID: 1240 | Hoja: Omar Antonio Cedeño Zegarra 2
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1240, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1240)) FROM ContratoServicio WHERE id_sede = 1240 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45353');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62810', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Omar Antonio Cedeño Zegarra (RUC: 10407027235) | Sede ID: 1240 | Hoja: CERRADO3
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES TCQ S.A.C. (RUC: 20605043021) | Sede ID: 757 | Hoja: INVERSIONES TCQ S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (757, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 757)) FROM ContratoServicio WHERE id_sede = 757 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45368');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62788', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ARAVET CLINICA VETERINARIA S.A.C. (RUC: 20614821575) | Sede ID: 1429 | Hoja: JESSICA  CARTAGENA MEZA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1429, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1429)) FROM ContratoServicio WHERE id_sede = 1429 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63446', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: consultorio dental Incisdent (RUC: 20610065717) | Sede ID: 1035 | Hoja: consultorio dental Incisdent
-- ==================================================

-- ==================================================
-- CLIENTE: SuDentist EIRL (RUC: 20601410495) | Sede ID: 752 | Hoja: SuDentist EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (752, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 752)) FROM ContratoServicio WHERE id_sede = 752 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45367');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62786', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LOPEZ ROJAS JOSE CARLOS (RUC: 10201214314) | Sede ID: 544 | Hoja: LOPEZ ROJAS JOSE CARLOS
-- ==================================================

-- ==================================================
-- CLIENTE: Corporación Fierro Artica SAC (RUC: 20610671901) | Sede ID: 143 | Hoja: Corporación Fierro Artica SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Janet lizbeth Vergara Sanchez (RUC: 10401683670) | Sede ID: 583 | Hoja: Janet lizbeth Vergara Sanchez
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DENTAL SMILE PERFECTION (RUC: 20604380007) | Sede ID: 729 | Hoja: CLINICA DENTAL SMILE PERFECTION
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (729, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 729)) FROM ContratoServicio WHERE id_sede = 729 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-11', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45322');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62727', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QUISPE PEÑA DARIO ODILON (RUC: 10469878606) | Sede ID: 712 | Hoja: QUISPE PEÑA DARIO ODILON
-- ==================================================

-- ==================================================
-- CLIENTE: HUARACA DELGADO FLOR DE MARIA (RUC: 10208874476) | Sede ID: 966 | Hoja: HUARACA DELGADO FLOR DE MARIA
-- ==================================================

-- ==================================================
-- CLIENTE: Claritydent E.I.R.L. (RUC: 20600894529) | Sede ID: 821 | Hoja: Claritydent E.I.R.L. 
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO QUIRURGICO VETERINARIO E.I.R.L. (RUC: 20607826146) | Sede ID: 767 | Hoja: CENTRO QUIRURGICO VETERINARIO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (767, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 767)) FROM ContratoServicio WHERE id_sede = 767 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-26', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45396');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62856', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (767, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 767)) FROM ContratoServicio WHERE id_sede = 767 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62849', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VELASCO GUERRERO MERCEDES JAQUELIN (RUC: 10469015608) | Sede ID: 1116 | Hoja: VELASCO GUERRERO MERCEDES JAQUE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1116, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1116)) FROM ContratoServicio WHERE id_sede = 1116 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-05-30', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45437');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63312', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ASISTENCIA ODONTOLOGICA ESPECIALIZADA SOCIEDAD ANONIMA CERRADA S.A.C. (RUC: 20538031993) | Sede ID: 142 | Hoja: ASISTENCIA ODONTOLOGICA ESPECIA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (142, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 142)) FROM ContratoServicio WHERE id_sede = 142 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45450');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62983', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS MÉDICOS FELIPE CHAVARRÍA S.A.C. (RUC: 20606645237) | Sede ID: 448 | Hoja: SERVICIOS MÉDICOS FELIPE CHAVAR
-- ==================================================

-- ==================================================
-- CLIENTE: VALNIM SAC (RUC: 20601506573) | Sede ID: 516 | Hoja: VALNIM SAC
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO CORODENT S.A.C. (RUC: 20605902759) | Sede ID: 535 | Hoja: GRUPO CORODENT S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: OCL DENTAL S.A.C. (RUC: 20606384221) | Sede ID: 982 | Hoja: OCL DENTAL S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Thatiana Danae Fachin Arbildo (RUC: 10455510304) | Sede ID: 281 | Hoja: Thatiana Danae Fachin Arbildo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (281, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 281)) FROM ContratoServicio WHERE id_sede = 281 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63191', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CHAVEZ MORE MAYRA VERONICA (RUC: 10489937773) | Sede ID: 1154 | Hoja: CHAVEZ MORE MAYRA VERONICA
-- ==================================================

-- ==================================================
-- CLIENTE: MULTISERVICIOS DE SALUD CHR S.A.C (RUC: 20546143733) | Sede ID: 731 | Hoja: MULTISERVICIOS  DE SALUD CHR S.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (731, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 731)) FROM ContratoServicio WHERE id_sede = 731 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45331');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62801', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ADVANCE DENTAL S.A.C. (RUC: 20609368129) | Sede ID: 211 | Hoja: ADVANCE DENTAL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (211, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 211)) FROM ContratoServicio WHERE id_sede = 211 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63430', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ADVANCE SALUD S.A.C. (RUC: 20553692246) | Sede ID: 396 | Hoja: ADVANCE SALUD S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Francisco Choque Huaman (RUC: 10409070910) | Sede ID: 869 | Hoja: Francisco Choque Huaman
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (869, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 869)) FROM ContratoServicio WHERE id_sede = 869 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45428');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62944', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ESPINOZA GARCIA MILTON (RUC: 10229966931) | Sede ID: 606 | Hoja: ESPINOZA GARCIA MILTON
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (606, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 606)) FROM ContratoServicio WHERE id_sede = 606 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45279');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62636', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: OFTALMO MEDICAL CENTER S.A.C. (RUC: 20607132454) | Sede ID: 549 | Hoja: OFTALMO MEDICAL CENTER S.A. (4)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (549, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 549)) FROM ContratoServicio WHERE id_sede = 549 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', 92.50, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45399');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62858', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: OFTALMO MEDICAL CENTER S.A.C. (RUC: 20607132454) | Sede ID: 549 | Hoja: OFTALMO MEDICAL CENTER S.A. (3)
-- ==================================================

-- ==================================================
-- CLIENTE: OFTALMO MEDICAL CENTER S.A.C. (RUC: 20607132454) | Sede ID: 549 | Hoja: OFTALMO MEDICAL CENTER S.A. (2)
-- ==================================================

-- ==================================================
-- CLIENTE: OFTALMO MEDICAL CENTER S.A.C. (RUC: 20607132454) | Sede ID: 549 | Hoja: OFTALMO MEDICAL CENTER S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: COLQUI INGA CAROLINA (RUC: 10211361650) | Sede ID: 604 | Hoja: COLQUI INGA CAROLINA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (604, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 604)) FROM ContratoServicio WHERE id_sede = 604 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45278');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62634', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ELAM SALUD SAC (RUC: 20610311891) | Sede ID: 624 | Hoja: ELAM SALUD SAC
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA & SPA HAPPY CAN S.A.C. (RUC: 20602429106) | Sede ID: 973 | Hoja: TA-VETERINARIA & SPA HAPPY CAN
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA & SPA HAPPY CAN S.A.C. (RUC: 20602429106) | Sede ID: 146 | Hoja: MS-VETERINARIA & SPA HAPPY CAN
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (146, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 146)) FROM ContratoServicio WHERE id_sede = 146 AND activo = 1), 'JUNIO', '2026-06-28', 'completado', 'pagado', '2026-06-26', 'transferencia', 'YAPE', 59.00, NULL);

-- ==================================================
-- CLIENTE: VILLAGOMEZ MORALES CAROLINA ISABEL (RUC: 10731254309) | Sede ID: 148 | Hoja: VILLAGOMEZ MORALES CAROLINA ISA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (148, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 148)) FROM ContratoServicio WHERE id_sede = 148 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45458');

-- ==================================================
-- CLIENTE: mendoza gonzales Diana Katterine (RUC: 10419266286) | Sede ID: 763 | Hoja: mendoza gonzales Diana Katterin
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (763, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 763)) FROM ContratoServicio WHERE id_sede = 763 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45282');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62646', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GUIDENT EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA (RUC: 20557299212) | Sede ID: 681 | Hoja: CH GUIDENT EMPRESA INDIVIDUAL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (681, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 681)) FROM ContratoServicio WHERE id_sede = 681 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-22', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45292');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62685', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CACERES PASTOR RAUL EFRAIN (RUC: 10405249290) | Sede ID: 950 | Hoja: CACERES PASTOR RAUL EFRAIN
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (950, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 950)) FROM ContratoServicio WHERE id_sede = 950 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', NULL, 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45264');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62648', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JMK SERVICIOS INFANTILES S.A.C. (RUC: 20601505763) | Sede ID: 481 | Hoja: JMK SERVICIOS INFANTILES S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES ANTARA S.A.C. (RUC: 20610149147) | Sede ID: 684 | Hoja: INVERSIONES ANTARA S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (684, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 684)) FROM ContratoServicio WHERE id_sede = 684 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-22', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45390');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63196', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ANIMEDICA VET S.A.C. (RUC: 20601722098) | Sede ID: 1103 | Hoja: PL-ANIMEDICA VET S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1103, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1103)) FROM ContratoServicio WHERE id_sede = 1103 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63203', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RAMIREZ LEGONIA SILVIA JESUS (RUC: 10100074236) | Sede ID: 744 | Hoja: silvia ramirez
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (744, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 744)) FROM ContratoServicio WHERE id_sede = 744 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45343');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62803', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Veterinaria Animal Land SAC (RUC: 20609090171) | Sede ID: 1051 | Hoja: Veterinaria Animal Land SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1051, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1051)) FROM ContratoServicio WHERE id_sede = 1051 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63200', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Milagros Felicia Anicama Carranza (RUC: 10434524739) | Sede ID: 121 | Hoja: Milagros Felicia Anicama Carran
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (121, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 121)) FROM ContratoServicio WHERE id_sede = 121 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'Y', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45480');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63013', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA (RUC: 20384463470) | Sede ID: 435 | Hoja: REPRESENTACIONES MAGDA`S SJM
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (435, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 435)) FROM ContratoServicio WHERE id_sede = 435 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', NULL, 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45069');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62577', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA (RUC: 20384463470) | Sede ID: 438 | Hoja: REPRESENTACIONES MAGDA`S CHORRI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (438, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 438)) FROM ContratoServicio WHERE id_sede = 438 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45290');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62675', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA (RUC: 20384463470) | Sede ID: 435 | Hoja: REPRESENTACIONES MAGDA`S VES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (435, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 435)) FROM ContratoServicio WHERE id_sede = 435 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45265');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62650', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PRIVET EIRL (RUC: 20603012411) | Sede ID: 563 | Hoja: PRIVET S.A.C.     
-- ==================================================

-- ==================================================
-- CLIENTE: Sodento s.a.c. (RUC: 20608102249) | Sede ID: 636 | Hoja: Sodento s.a.c.
-- ==================================================

-- ==================================================
-- CLIENTE: MIL MASCOTAS S.A.C. (RUC: 20610928103) | Sede ID: 897 | Hoja: MIL MASCOTAS S.A.C.     
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO MEDICO RS S.A.C. (RUC: 20608577093) | Sede ID: 898 | Hoja: GRUPO MEDICO RS S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (898, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 898)) FROM ContratoServicio WHERE id_sede = 898 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-01', 'transferencia', 'BCP', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44876');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62737', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (898, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 898)) FROM ContratoServicio WHERE id_sede = 898 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-01', 'transferencia', 'BCP', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44876');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63045', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (898, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 898)) FROM ContratoServicio WHERE id_sede = 898 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pagado', '2026-06-01', 'transferencia', 'BCP', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44876');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63451', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DIAZ RODAS ROSA CECILIA (RUC: 10440120925) | Sede ID: 1182 | Hoja: DIAZ RODAS ROSA CECILIA
-- ==================================================

-- ==================================================
-- CLIENTE: Rosalinda Rubio Lezama (RUC: 10706071101) | Sede ID: 545 | Hoja: Rosalinda Rubio Lezama
-- ==================================================

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 792 | Hoja: PETMAX - JORGE CHAVEZ
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (792, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 792)) FROM ContratoServicio WHERE id_sede = 792 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62739', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (792, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 792)) FROM ContratoServicio WHERE id_sede = 792 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63047', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (792, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 792)) FROM ContratoServicio WHERE id_sede = 792 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63453', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CARES MEDICAL GROUP S.A.C. (RUC: 20605355324) | Sede ID: 591 | Hoja: CARES MEDICAL GROUP S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (591, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 591)) FROM ContratoServicio WHERE id_sede = 591 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45022');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62581', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HEALTHY PETS E.I.R.L. (RUC: 20551879837) | Sede ID: 184 | Hoja: HEALTHY PETS E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (184, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 184)) FROM ContratoServicio WHERE id_sede = 184 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45451');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62984', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PERU CARM S.A.C. (RUC: 20524233330) | Sede ID: 1125 | Hoja: PERU CARM S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: JMP SERVICE S.A.C. (RUC: 20609968533) | Sede ID: 1012 | Hoja: JMP SERVICE S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1012, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1012)) FROM ContratoServicio WHERE id_sede = 1012 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63274', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRADA (RUC: 20518132947) | Sede ID: 546 | Hoja:  SERVICIOS MEDICOS EL TREBO (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (546, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 546)) FROM ContratoServicio WHERE id_sede = 546 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 300.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45415');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62893', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRADA (RUC: 20518132947) | Sede ID: 1232 | Hoja:  SERVICIOS MEDICOS EL TREBOL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1232, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1232)) FROM ContratoServicio WHERE id_sede = 1232 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 480.40, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45421');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62918', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DIAZ ANTAURCO FLOR VERONICA (RUC: 10441448681) | Sede ID: 656 | Hoja: DIAZ ANTAURCO FLOR VERONICA
-- ==================================================

-- ==================================================
-- CLIENTE: YURIZ SALUD E.I.R.L. (RUC: 20610795201) | Sede ID: 1267 | Hoja: YURIZ SALUD E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: VILLAVERDE MOSCOL ROCIO ISABEL (RUC: 10480123943) | Sede ID: 1147 | Hoja: VILLAVERDE MOSCOL ROCIO ISABEL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1147, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1147)) FROM ContratoServicio WHERE id_sede = 1147 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-11', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45090');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62791', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET LOVE PETS E.I.R.L. (RUC: 20610928219) | Sede ID: 150 | Hoja: VET LOVE PETS E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES VETERINARIAS EL DORADO S.A.C. (RUC: 20604600597) | Sede ID: 460 | Hoja: CT-EL DORADO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (460, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 460)) FROM ContratoServicio WHERE id_sede = 460 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63265', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HONORIO CERNA ELENA ELIZABETH (RUC: 10419702094) | Sede ID: 361 | Hoja: HONORIO CERNA ELENA ELIZABETH
-- ==================================================

-- ==================================================
-- CLIENTE: Milagros del Rosario Mora Marquina (RUC: 10459641829) | Sede ID: 1107 | Hoja:  Milagros del Rosario Mora Marq
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1107, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1107)) FROM ContratoServicio WHERE id_sede = 1107 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63311', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO SANAR S.A.C. (RUC: 20601470412) | Sede ID: 530 | Hoja: GRUPO SANAR
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DENTAL SYACDENT S.A.C (RUC: 20600604717) | Sede ID: 1191 | Hoja: Clínica dental SYACDENT 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1191, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1191)) FROM ContratoServicio WHERE id_sede = 1191 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63440', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EMPRESA MUNICIPAL DE CHORRILLOS S.A.. (RUC: 20556621188) | Sede ID: 410 | Hoja: SJ EMPRESA MUN CHO
-- ==================================================

-- ==================================================
-- CLIENTE: VETMED S.A.C (RUC: 20545864771) | Sede ID: 539 | Hoja: VETMED S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (539, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 539)) FROM ContratoServicio WHERE id_sede = 539 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63432', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: STUDIO DENTAL 3M S.A.C (RUC: 20610815481) | Sede ID: 153 | Hoja: STUDIO DENTAL 3M S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (153, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 153)) FROM ContratoServicio WHERE id_sede = 153 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45237');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62621', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Rafael Ricardo Benito Quispe (RUC: 10406142391) | Sede ID: 865 | Hoja:  Rafael Ricardo Benito Quispe 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (865, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 865)) FROM ContratoServicio WHERE id_sede = 865 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-15', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), 'B001-113');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63006', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Javier Casas Luyo (RUC: 10707886019) | Sede ID: 451 | Hoja: Javier Casas Luyo
-- ==================================================

-- ==================================================
-- CLIENTE: Katherine Sanchez Valdez (RUC: 10456262754) | Sede ID: 1216 | Hoja: Katherine Sanchez Valdez     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1216, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1216)) FROM ContratoServicio WHERE id_sede = 1216 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45287');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62653', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Vega Villanueva, Hernan (RUC: 10423834990) | Sede ID: 154 | Hoja: Vega Villanueva, Hernan
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DE LA SONRISA PERU S.A.C. (RUC: 20609243661) | Sede ID: 662 | Hoja: CLINICA DE LA SONRISA PERU  (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DE LA SONRISA PERU S.A.C. (RUC: 20609243661) | Sede ID: 662 | Hoja: CLINICA DE LA SONRISA PERU S.A.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (662, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 662)) FROM ContratoServicio WHERE id_sede = 662 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'BCP', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45076');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62642', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Plural Medical SAC (RUC: 20538228860) | Sede ID: 1150 | Hoja: Plural Medical SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1150, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1150)) FROM ContratoServicio WHERE id_sede = 1150 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45169');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62772', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: V&V Pets and Foods SAC (RUC: 20606195908) | Sede ID: 975 | Hoja: V&V Pets and Foods SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (975, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 975)) FROM ContratoServicio WHERE id_sede = 975 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63270', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VARGAS SOR SERVICIOS INTEGRALES S. CIVIL DE R.L (RUC: 20556829170) | Sede ID: 605 | Hoja: VARGAS SOR SERVICIOS INTEGRALES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (605, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 605)) FROM ContratoServicio WHERE id_sede = 605 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45072');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62635', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CEV BUSTAMANTE E.I.R.L. (RUC: 20610248706) | Sede ID: 1323 | Hoja: CEV BUSTAMANTE E.I.R.L. (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1323, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1323)) FROM ContratoServicio WHERE id_sede = 1323 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-26', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45314');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62706', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CEV BUSTAMANTE E.I.R.L. (RUC: 20610248706) | Sede ID: 155 | Hoja: CEV BUSTAMANTE E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (155, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 155)) FROM ContratoServicio WHERE id_sede = 155 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-26', 'transferencia', 'BCP', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45481');

-- ==================================================
-- CLIENTE: Santos Collantes Alva (RUC: 10427871814) | Sede ID: 929 | Hoja: Santos Collantes Alva
-- ==================================================

-- ==================================================
-- CLIENTE: SANCHEZ PEREZ JORGE ANDRES (RUC: 10731723244) | Sede ID: 1048 | Hoja: SANCHEZ PEREZ JORGE ANDRES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1048, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1048)) FROM ContratoServicio WHERE id_sede = 1048 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45227');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62990', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GOMEZ ALARCO JOSSEP MAURO (RUC: 10406806818) | Sede ID: 1252 | Hoja: GOMEZ ALARCO JOSSEP MAURO
-- ==================================================

-- ==================================================
-- CLIENTE: DIGITAL DENT ODONTOLOGIA ESPECIALIZADA E.I.R.L. (RUC: 20610927972) | Sede ID: 1294 | Hoja: DIGITAL DENT ODONTOLOGIA ESPECI
-- ==================================================

-- ==================================================
-- CLIENTE: CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C. (RUC: 20607342441) | Sede ID: 166 | Hoja: 1483CASTILLA & GASPAR ODONTOLOG
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (166, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 166)) FROM ContratoServicio WHERE id_sede = 166 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45422');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62939', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C. (RUC: 20607342441) | Sede ID: 166 | Hoja: 1425CASTILLA & GASPAR ODONTOLOG
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (166, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 166)) FROM ContratoServicio WHERE id_sede = 166 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45423');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62940', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DENTAL VEGADENT EIRL (RUC: 20600736397) | Sede ID: 881 | Hoja: Hubert Vega Toledo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (881, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 881)) FROM ContratoServicio WHERE id_sede = 881 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45429');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62946', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C (RUC: 20601427193) | Sede ID: 912 | Hoja: ODONTOP ODONTOLOGIA ESPECIA (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (912, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 912)) FROM ContratoServicio WHERE id_sede = 912 AND activo = 1), 'MAYO', '2026-06-10', 'completado', 'pagado', '2026-06-20', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44404');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62703', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (912, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 912)) FROM ContratoServicio WHERE id_sede = 912 AND activo = 1), 'JUNIO', '2026-07-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45312');

-- ==================================================
-- CLIENTE: ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C (RUC: 20601427193) | Sede ID: 912 | Hoja: ODONTOP ODONTOLOGIA ESPECIALIZA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (912, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 912)) FROM ContratoServicio WHERE id_sede = 912 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-15', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45218');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62807', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Jessica Karina Cano Gonzalo (RUC: 10413543130) | Sede ID: 1217 | Hoja: Jessica Karina Cano Gonzalo
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO MEDICO SAN CARLOS PEREZ E.I.R.L. (RUC: 20606659246) | Sede ID: 1220 | Hoja: CENTRO MEDICO SAN CARLOS PEREZ 
-- ==================================================

-- ==================================================
-- CLIENTE: El Milagro de tu Sonrisa EIRL (RUC: 20601583551) | Sede ID: 169 | Hoja: El Milagro de tu Sonrisa EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS VETERINARIOS INGE S.A.C. (RUC: 20473466148) | Sede ID: 511 | Hoja: SERVICIOS VETERINARIOS INGE S.A
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (511, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 511)) FROM ContratoServicio WHERE id_sede = 511 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-24', 'transferencia', 'BBVA', 65.00, 'BIOCONTAMINADO');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45355');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62766', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO VETERINARIO LAS VIÑAS SAC (RUC: 20549914951) | Sede ID: 1402 | Hoja:  Grupo veterinario las viñas sa
-- ==================================================

-- ==================================================
-- CLIENTE: Pet lover Perú sac (RUC: 20517114597) | Sede ID: 565 | Hoja: Pet lover Perú sac
-- ==================================================

-- ==================================================
-- CLIENTE: CAVA ODONTOLOGIA ESPECIALIZADA S.A.C. (RUC: 20609132010) | Sede ID: 1304 | Hoja: CAVA ODONTOLOGIA ESPECIALIZADA 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1304, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1304)) FROM ContratoServicio WHERE id_sede = 1304 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-25', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45443');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62933', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: FLORES VELASQUEZ LUIS RENATO (RUC: 10081507193) | Sede ID: 1305 | Hoja: FLORES VELASQUEZ LUIS RENATO   
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1305, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1305)) FROM ContratoServicio WHERE id_sede = 1305 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pagado', '2026-06-13', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45381');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62829', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LIMA DEL MAR ESPECIALISTAS MEDICOS S.A.C. (RUC: 20603274084) | Sede ID: 1055 | Hoja: LIMA DEL MAR ESPECIALISTAS MEDI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1055, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1055)) FROM ContratoServicio WHERE id_sede = 1055 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45416');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62894', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Ursula Lidia Pérez Benito (RUC: 10106357477) | Sede ID: 172 | Hoja: Ursula Lidia Pérez Benito
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA NORTH SAC (RUC: 20606899298) | Sede ID: 499 | Hoja: VETERINARIA NORTH SAC
-- ==================================================

-- ==================================================
-- CLIENTE: LOVE & PETS VETERINARIAS SAC (RUC: 20610706747) | Sede ID: 1221 | Hoja: LOVE & PETS VETERINARIAS S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1221, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1221)) FROM ContratoServicio WHERE id_sede = 1221 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63321', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CITYPETS E.I.R.L. (RUC: 20552375905) | Sede ID: 550 | Hoja: CITYPETS E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: SOPIEST S.A.C. (RUC: 20600642023) | Sede ID: 1086 | Hoja: SOPIEST S.A.C.     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1086, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1086)) FROM ContratoServicio WHERE id_sede = 1086 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferencia', 'BCP', 104.14, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45332');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62977', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EVET LIMA S.A.C. (RUC: 20602939864) | Sede ID: 1109 | Hoja: EVET LIMA S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1109, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1109)) FROM ContratoServicio WHERE id_sede = 1109 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45489');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63035', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ONLY PETS S.A.C. (RUC: 20565843665) | Sede ID: 909 | Hoja: ONLY PETS S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA LOS FLAMENCOS E.I.R.L. (RUC: 20611282291) | Sede ID: 532 | Hoja: VETERINARIA LOS FLAMENCOS E.I.R
-- ==================================================

-- ==================================================
-- CLIENTE: WORLD ENTERPRICE PETS & VETS S.A.C. (RUC: 20604497559) | Sede ID: 578 | Hoja: WORLD ENTERPRICE PETS & VETS S.
-- ==================================================

-- ==================================================
-- CLIENTE: Grupo consorcio veterinario sac (RUC: 20607299944) | Sede ID: 78 | Hoja: CERRADO12
-- ==================================================

-- ==================================================
-- CLIENTE: Servicios veterinarios Pet's Medic sac (RUC: 20603950578) | Sede ID: 523 | Hoja: Servicios veterinarios Pet's Me
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (523, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 523)) FROM ContratoServicio WHERE id_sede = 523 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-23', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45370');

-- ==================================================
-- CLIENTE: CANDIDO VET PET SHOP SPA E.I.R.L - CANDIDO E.I.R.L (RUC: 20603933061) | Sede ID: 979 | Hoja: CANDIDO VET PET SHOP SPA EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: ROSALES SILVA RAQUEL (RUC: 10425407495) | Sede ID: 930 | Hoja: ROSALES SILVA RAQUEL (2)
-- ==================================================

-- ==================================================
-- CLIENTE: ROSALES SILVA RAQUEL (RUC: 10425407495) | Sede ID: 930 | Hoja: ROSALES SILVA RAQUEL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (930, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 930)) FROM ContratoServicio WHERE id_sede = 930 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-23', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45350');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63243', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET PLUS EIRL (RUC: 20109724778) | Sede ID: 1253 | Hoja: VET PLUS E.I.R.L.)
-- ==================================================

-- ==================================================
-- CLIENTE: VIRGEN DE LA ASUNCION M Y O S.A.C. (RUC: 20600024150) | Sede ID: 658 | Hoja: VIRGEN DE LA ASUNCION M Y O S.A
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA GONZALEZ S.A.C. (RUC: 20553542431) | Sede ID: 904 | Hoja: CLINICA VETERINARIA GONZALEZ S.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (904, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 904)) FROM ContratoServicio WHERE id_sede = 904 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45359');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62771', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GONVET PERU S.A.C. (RUC: 20602258328) | Sede ID: 189 | Hoja: GONVET PERU S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIA RADIOLOGICA S.A.C. (RUC: 20607382795) | Sede ID: 730 | Hoja: CONSULTORIA RADIOLOGICA S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (730, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 730)) FROM ContratoServicio WHERE id_sede = 730 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45244');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62738', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HOSPITAL CLINICO VETERINARIO DEL SUR EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - HOSPIVETSUR E. (RUC: 20538599175) | Sede ID: 1161 | Hoja: HOSPITAL CLINICO VETERINARIO DE
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO MEDICO VETERINARIO & REHABILITACION REHAVET S.A.C. (RUC: 20607942871) | Sede ID: 868 | Hoja: CENTRO MEDICO VETERINARIO & REH
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (868, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 868)) FROM ContratoServicio WHERE id_sede = 868 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45073');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62647', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Fiorella Quineche Andrade (RUC: 10417554691) | Sede ID: 179 | Hoja: Fiorella Quineche Andrade
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (179, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 179)) FROM ContratoServicio WHERE id_sede = 179 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63260', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Gilberto Arturo Huapaya Marcos (RUC: 10258111473) | Sede ID: 1041 | Hoja: Gilberto Arturo Huapaya Marcos 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1041, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1041)) FROM ContratoServicio WHERE id_sede = 1041 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63164', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO MULTISERVICIOS Y SALUD M & K E.I.R.L. (RUC: 20611538457) | Sede ID: 1233 | Hoja: GRUPO MULTISERVICIOS Y SALUD M 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1233, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1233)) FROM ContratoServicio WHERE id_sede = 1233 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63442', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CHAVEZ VILLANUEVA SUSAN SHIRLEY (RUC: 10425174733) | Sede ID: 847 | Hoja: CHAVEZ VILLANUEVA SUSAN SHIRLEY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (847, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 847)) FROM ContratoServicio WHERE id_sede = 847 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-15', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45166');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62929', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: J & R DENTAL E.I.R.L (RUC: 20608460722) | Sede ID: 777 | Hoja: J & R DENTAL E.I.R.L
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (777, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 777)) FROM ContratoServicio WHERE id_sede = 777 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45296');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62690', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INVERSIONES MINECRAFT S.A.C. (RUC: 20603528574) | Sede ID: 1241 | Hoja: INVERSIONES MINECRAFT S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: RENGIDENT ODONTOLOGIA ESTETICA Y ESPECIALIZADA S.A.C. (RUC: 20614794063) | Sede ID: 1401 | Hoja: RENGIFO SANGAMA KATHERIN DELFIN
-- ==================================================

-- ==================================================
-- CLIENTE: POLICARPO CACEDA KEVIN RAUL ALEXANDER (RUC: 10756752389) | Sede ID: 1022 | Hoja: POLICARPO CACEDA KEVIN RAUL ALE
-- ==================================================

-- ==================================================
-- CLIENTE: Fernando Acosta Soria (RUC: 10406125713) | Sede ID: 1038 | Hoja: FERNANDO ACOSTA SORIA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1038, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1038)) FROM ContratoServicio WHERE id_sede = 1038 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45488');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63033', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: XIMAR SERVICIOS VETERINARIOS S.A.C. (RUC: 20608353187) | Sede ID: 1026 | Hoja: XIMAR SERVICIOS VETERINARIOS S.
-- ==================================================

-- ==================================================
-- CLIENTE: DE LA CRUZ DEUDOR JOSE LUIS (RUC: 10408260031) | Sede ID: 688 | Hoja: DE LA CRUZ DEUDOR JOSE LUIS    
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (688, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 688)) FROM ContratoServicio WHERE id_sede = 688 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45255');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62644', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: AntoFabri VS SAC (RUC: 20611638931) | Sede ID: 221 | Hoja:  AntoFabri VS SAC     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (221, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 221)) FROM ContratoServicio WHERE id_sede = 221 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferencia', 'POR PGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45459');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62998', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MULTISERVICIOS DE SALUD CHR S.A.C (RUC: 20546143733) | Sede ID: 731 | Hoja: MULTISERVICIOS DE SALUD CHR S.A
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES SALASCORNEJO S.A.C. (RUC: 20611737506) | Sede ID: 848 | Hoja: INVERSIONES SALASCORNEJO S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (848, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 848)) FROM ContratoServicio WHERE id_sede = 848 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45407');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62871', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ZOOLO MASCOTAS VETERINARIAS S.A.C. (RUC: 20607760561) | Sede ID: 228 | Hoja: ZOOLO MASCOTAS VETERINARIAS S.A
-- ==================================================

-- ==================================================
-- CLIENTE: M & E TRAUMATOLOGIA S.A.C. (RUC: 20611155639) | Sede ID: 768 | Hoja: M & E TRAUMATOLOGIA S.A.C.     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (768, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 768)) FROM ContratoServicio WHERE id_sede = 768 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-23', 'transferencia', 'YAPE', 266.65, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45357');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62769', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica Integral Odonto Free EIRL (RUC: 20610423257) | Sede ID: 594 | Hoja: Clínica Integral Odonto Fre (2)
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Integral Odonto Free EIRL (RUC: 20610423257) | Sede ID: 594 | Hoja: Clínica Integral Odonto Free EI
-- ==================================================

-- ==================================================
-- CLIENTE: COTRINA CAMACHO ELMER ALBERTO (RUC: 10098269954) | Sede ID: 685 | Hoja: COTRINA CAMACHO ELMER ALBERTO  
-- ==================================================

-- ==================================================
-- CLIENTE: PRETTY PET S.A.C. (RUC: 20600475399) | Sede ID: 794 | Hoja: PRETTY PET S.A.C.     
-- ==================================================

-- ==================================================
-- CLIENTE: GRACE JESY ALARCON GUTIERREZ (RUC: 10488439281) | Sede ID: 590 | Hoja: GRACE JESY ALARCON GUTIERREZ   
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (590, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 590)) FROM ContratoServicio WHERE id_sede = 590 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45075');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62661', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DAMIAN OSCCO MARI LUZ (RUC: 10480513458) | Sede ID: 234 | Hoja: DAMIAN OSCCO MARI LUZ
-- ==================================================

-- ==================================================
-- CLIENTE: ENJOY DENTAL GROUP S.A.C. (RUC: 20609564416) | Sede ID: 907 | Hoja: ENJOY DENTAL GROUP S.A.C.     
-- ==================================================

-- ==================================================
-- CLIENTE: RIVERA CASTRO PAMELA LISSET (RUC: 10467049599) | Sede ID: 235 | Hoja: RIVERA CASTRO PAMELA LISSET    
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (235, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 235)) FROM ContratoServicio WHERE id_sede = 235 AND activo = 1), 'ABRIL', '2026-04-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63343', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (235, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 235)) FROM ContratoServicio WHERE id_sede = 235 AND activo = 1), 'MARZO', '2026-03-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63344', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (235, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 235)) FROM ContratoServicio WHERE id_sede = 235 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63345', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: servicios veterinarios Gallardo SAC (RUC: 20602356532) | Sede ID: 1480 | Hoja: servicios veterinarios Gallardo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1480, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1480)) FROM ContratoServicio WHERE id_sede = 1480 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45057');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62697', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INSTITUTO VETERINARIO DE ESPECIALIDADES MEDICAS S.A.C. (RUC: 20563289636) | Sede ID: 669 | Hoja: INSTITUTO VETERINARIO DE ESPECI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (669, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 669)) FROM ContratoServicio WHERE id_sede = 669 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-04-14', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43551');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63159', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: IRIS MEDICINA FELINA E.I.R.L. (RUC: 20611828820) | Sede ID: 1024 | Hoja: IRIS MEDICINA FELINA E.I.R.L.  
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1024, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1024)) FROM ContratoServicio WHERE id_sede = 1024 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45502');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63032', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LOKIPET S.A.C (RUC: 20608486888) | Sede ID: 247 | Hoja: LOKIPET S.A.C     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (247, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 247)) FROM ContratoServicio WHERE id_sede = 247 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45492');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63015', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: M&S DENTAL ATELIER SOCIEDAD ANÓNIMA CERRADA - M&S DENTAL ATELIER S.A.C. (RUC: 20600375335) | Sede ID: 754 | Hoja: M&S DENTAL ATELIER SOCIEDAD ANÓ
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (754, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 754)) FROM ContratoServicio WHERE id_sede = 754 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45111');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62787', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Mareli's odontología especializada eirl (RUC: 20600239075) | Sede ID: 1207 | Hoja: Mareli's odontología especializ
-- ==================================================

-- ==================================================
-- CLIENTE: LA JARA HERNANDEZ VICTOR JUAN CARLOS (RUC: 10448686456) | Sede ID: 1149 | Hoja: LA JARA HERNANDEZ VICTOR JUAN C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1149, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1149)) FROM ContratoServicio WHERE id_sede = 1149 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63104', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA 4PATAS SOCIEDAD ANONIMA CERRADA (RUC: 20609482231) | Sede ID: 237 | Hoja: VETERINARIA 4PATAS SOCIEDAD ANO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (237, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 237)) FROM ContratoServicio WHERE id_sede = 237 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63261', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ROSARIO FARIAS SERVICIOS VETERINARIOS E.I.R.L. (RUC: 20504596754) | Sede ID: 242 | Hoja: ROSARIO FARIAS SERVICIOS VETERI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (242, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 242)) FROM ContratoServicio WHERE id_sede = 242 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-06-25', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45386');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63301', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: YAURI HUIZA ROGER JHOSEF (RUC: 10422960304) | Sede ID: 1190 | Hoja: YAURI HUIZA ROGER JHOSEF     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1190, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1190)) FROM ContratoServicio WHERE id_sede = 1190 AND activo = 1), 'JUNIO', '2026-05-24', 'completado', 'pagado', '2026-05-21', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44683');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63317', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1190, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1190)) FROM ContratoServicio WHERE id_sede = 1190 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63316', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Vargas quispe Hugo Martin (RUC: 10422673241) | Sede ID: 251 | Hoja: Vargas quispe Hugo Martin     
-- ==================================================

-- ==================================================
-- CLIENTE: BERROSPI GROUP SAC (RUC: 20606846356) | Sede ID: 1030 | Hoja: BERROSPI GROUP SAC     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1030, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1030)) FROM ContratoServicio WHERE id_sede = 1030 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63100', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Miguel valencia delgado (RUC: 10167494027) | Sede ID: 249 | Hoja: Miguel valencia delgado     
-- ==================================================

-- ==================================================
-- CLIENTE: MEDIC DENTAL SMILE E.I.R.L. (RUC: 20512338322) | Sede ID: 1277 | Hoja: MEDIC DENTAL SMILE E.I.R.L.    
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1277, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1277)) FROM ContratoServicio WHERE id_sede = 1277 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45373');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62792', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JCM SERVICIOS ODONTOLOGICO E.I.R.L (RUC: 20611241411) | Sede ID: 250 | Hoja: JCM SERVICIOS ODONTOLOGICO E.I.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (250, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 250)) FROM ContratoServicio WHERE id_sede = 250 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45435');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62922', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO ODONTOLOGICO CASAL S.A.C. (RUC: 20565355199) | Sede ID: 1127 | Hoja: GRUPO ODONTOLOGICO CASAL S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIOS PET+PERU S.A.C. (RUC: 20611970332) | Sede ID: 1255 | Hoja: VETERINARIOS PET+PERU S.A.C.   
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1255, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1255)) FROM ContratoServicio WHERE id_sede = 1255 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-03-23', 'efectivo', 'CANCELADO EN RECOJO DE MARZO', 65.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63205', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1255, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1255)) FROM ContratoServicio WHERE id_sede = 1255 AND activo = 1), 'JULIO', '2026-07-22', 'completado', 'pagado', '2026-04-22', 'transferencia', 'YAPE', 65.00, NULL);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1255, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1255)) FROM ContratoServicio WHERE id_sede = 1255 AND activo = 1), 'AGOSTO', '2026-08-22', 'completado', 'pagado', '2026-05-20', 'transferencia', 'YAPE', 65.00, NULL);

-- ==================================================
-- CLIENTE: Odontología especializada Smile Plus E.I.R.L (RUC: 20607074802) | Sede ID: 257 | Hoja: ODONTOLOGIA ESPECIALIZADA SMILE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (257, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 257)) FROM ContratoServicio WHERE id_sede = 257 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45328');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62797', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PRUDENCIO MAU EDGARD ENRIQUE (RUC: 10098543860) | Sede ID: 1239 | Hoja: PRUDENCIO MAU EDGARD ENRIQUE   
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1239, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1239)) FROM ContratoServicio WHERE id_sede = 1239 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63443', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DRAS VALVERDE SAC (RUC: 20609785412) | Sede ID: 1033 | Hoja: DRAS VALVERDE S.A.C      
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1033, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1033)) FROM ContratoServicio WHERE id_sede = 1033 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-22', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45348');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63163', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GOICOCHEA ARAUJO SYLVIA ALESANDRA (RUC: 10483191907) | Sede ID: 255 | Hoja: GOICOCHEA ARAUJO SYLVIA ALESAND
-- ==================================================

-- ==================================================
-- CLIENTE: DENTILUXE BOUTIQUE DENTAL S.A.C. (RUC: 20611865253) | Sede ID: 748 | Hoja: DENTILUXE BOUTIQUE DENTAL S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: CHRISTIAN FELIX LUYO AVILA (RUC: 10471530188) | Sede ID: 1007 | Hoja: CHRISTIAN FELIX LUYO AVILA     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1007, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1007)) FROM ContratoServicio WHERE id_sede = 1007 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-22', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45335');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63185', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MARÍA ÚRSULA DEL PILAR FLÓREZ CALDERÓN DE CARMEN (RUC: 10096755355) | Sede ID: 274 | Hoja: MARÍA ÚRSULA DEL PILAR FLÓREZ C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (274, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 274)) FROM ContratoServicio WHERE id_sede = 274 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63189', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REVISI COMPANY E.I.R.L. (RUC: 20392922203) | Sede ID: 1088 | Hoja: REVISI COMPANY E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1088, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1088)) FROM ContratoServicio WHERE id_sede = 1088 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45447');
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), '62978');

-- ==================================================
-- CLIENTE: IDENTICAL PRODUCTOS Y SERVICIOS ODONTOLOGICOS S.A.C. (RUC: 20563077531) | Sede ID: 447 | Hoja: S-  IDENTICAL PRODUCTOS Y SERV
-- ==================================================

-- ==================================================
-- CLIENTE: IDENTICAL PRODUCTOS Y SERVICIOS ODONTOLOGICOS S.A.C. (RUC: 20563077531) | Sede ID: 447 | Hoja: VES- IDENTICAL PRODUCTOS Y SER
-- ==================================================

-- ==================================================
-- CLIENTE: Pekitas Dent E.I.R.L (RUC: 20611773367) | Sede ID: 831 | Hoja: Pekitas Dent E.I.R.L     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (831, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 831)) FROM ContratoServicio WHERE id_sede = 831 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 55.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62583', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Susan Diana Tipe De La Vega (RUC: 10444301509) | Sede ID: 301 | Hoja: Susan Diana Tipe De La Vega    
-- ==================================================

-- ==================================================
-- CLIENTE: My Dentiss SAC (RUC: 20562730771) | Sede ID: 1337 | Hoja: My Dentiss SAC      (2)
-- ==================================================

-- ==================================================
-- CLIENTE: My Dentiss SAC (RUC: 20562730771) | Sede ID: 297 | Hoja: My Dentiss SAC     
-- ==================================================

-- ==================================================
-- CLIENTE: RELUZ ORELLANA VICTOR MARTIN (RUC: 10081374703) | Sede ID: 1193 | Hoja: RELUZ ORELLANA VICTOR MARTIN   
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1193, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1193)) FROM ContratoServicio WHERE id_sede = 1193 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2025-09-29', 'transferencia', 'BCP', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '38092');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62992', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1193, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1193)) FROM ContratoServicio WHERE id_sede = 1193 AND activo = 1), 'JULIO', '2026-07-17', 'completado', 'pagado', '2025-09-29', 'transferencia', 'BCP', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '38092');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1193, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1193)) FROM ContratoServicio WHERE id_sede = 1193 AND activo = 1), 'AGOSTO', '2026-08-17', 'completado', 'pagado', '2025-09-29', 'transferencia', 'BCP', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '38092');

-- ==================================================
-- CLIENTE: CORPORACION ODONTOLOGICO SAN GABRIEL SAC (RUC: 20608423011) | Sede ID: 1102 | Hoja: CORPORACION ODONTOLOGICO SAN GA
-- ==================================================

-- ==================================================
-- CLIENTE: SAYRITUPAC RIOS ALICIA (RUC: 10215740710) | Sede ID: 872 | Hoja: SAYRITUPAC RIOS ALICIA     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (872, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 872)) FROM ContratoServicio WHERE id_sede = 872 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45469');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63010', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JAC DENTAL CENTER. S.A.C (RUC: 20610683941) | Sede ID: 1079 | Hoja: JAC DENTAL CENTER. S.A.C     
-- ==================================================

-- ==================================================
-- CLIENTE: MEDENT SALUD EIRL (RUC: 20607005371) | Sede ID: 1457 | Hoja: MEDENT SALUD EIRL     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1457, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1457)) FROM ContratoServicio WHERE id_sede = 1457 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45258');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62994', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: vetSpizan eirl (RUC: 20606290951) | Sede ID: 334 | Hoja: vetSpizan eirl     
-- ==================================================

-- ==================================================
-- CLIENTE: Centro Odontológico Biomedix sac (RUC: 20608719033) | Sede ID: 1435 | Hoja: CENTRO ODONTOLOGICO BIOMEDIX SA
-- ==================================================

-- ==================================================
-- CLIENTE: PIZARRO PRADA ANTHONY MARTIN (RUC: 10721943114) | Sede ID: 310 | Hoja: PIZARRO PRADA ANTHONY MARTIN   
-- ==================================================

-- ==================================================
-- CLIENTE: D & L MARTINEZ S.A.C. (RUC: 20611411660) | Sede ID: 1159 | Hoja: D&L MARTINEZ SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1159, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1159)) FROM ContratoServicio WHERE id_sede = 1159 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63438', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ONCOLOGIA S.A.C. (RUC: 20428674201) | Sede ID: 833 | Hoja: ONCOLOGIA SAC     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (833, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 833)) FROM ContratoServicio WHERE id_sede = 833 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62709', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (833, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 833)) FROM ContratoServicio WHERE id_sede = 833 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62830', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (833, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 833)) FROM ContratoServicio WHERE id_sede = 833 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63052', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (833, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 833)) FROM ContratoServicio WHERE id_sede = 833 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63113', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (833, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 833)) FROM ContratoServicio WHERE id_sede = 833 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63356', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Andrea Contreras Consultorio Odontológico SAC (RUC: 20611285974) | Sede ID: 1196 | Hoja: Andrea Contreras Consultorio Od
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1196, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1196)) FROM ContratoServicio WHERE id_sede = 1196 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63318', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Veterinaria Sanivet SAC (RUC: 20612144223) | Sede ID: 351 | Hoja: Veterinaria Sanivet SAC     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (351, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 351)) FROM ContratoServicio WHERE id_sede = 351 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-24', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45398');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63228', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ASENDENT PERU S.A.C. (RUC: 20611786582) | Sede ID: 896 | Hoja: ASEN DENT     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (896, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 896)) FROM ContratoServicio WHERE id_sede = 896 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63146', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GABRIELA AQUINO HILARES (RUC: 10100796801) | Sede ID: 353 | Hoja: GABRIELA AQUINO HILARES     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (353, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 353)) FROM ContratoServicio WHERE id_sede = 353 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45401');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62867', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: OPERADORES ODONTOLOGICOS WALFER S.A.C. (RUC: 20556748684) | Sede ID: 1406 | Hoja: OPERADORES ODONTOLOGICOS WA (2)
-- ==================================================

-- ==================================================
-- CLIENTE: OPERADORES ODONTOLOGICOS WALFER S.A.C. (RUC: 20556748684) | Sede ID: 889 | Hoja: OPERADORES ODONTOLOGICOS WALFER
-- ==================================================

-- ==================================================
-- CLIENTE: Rosse Mery Vilchez Maravi (RUC: 10453900865) | Sede ID: 345 | Hoja: Rosse Mery Vilchez Maravi      
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (345, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 345)) FROM ContratoServicio WHERE id_sede = 345 AND activo = 1), 'JUNIO', '2026-06-28', 'completado', 'pagado', '2026-06-26', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45494');

-- ==================================================
-- CLIENTE: ESPINOZA ATENCIO FABIOLA CATHERINE (RUC: 10705051807) | Sede ID: 1210 | Hoja: ESPINOZA ATENCIO FABIOLA CATHER
-- ==================================================

-- ==================================================
-- CLIENTE: CEMIVET SAC (RUC: 20612314510) | Sede ID: 360 | Hoja: CEMIVET SAC     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (360, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 360)) FROM ContratoServicio WHERE id_sede = 360 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45068');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62778', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (360, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 360)) FROM ContratoServicio WHERE id_sede = 360 AND activo = 1), 'JULIO', '2026-07-12', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45068');

-- ==================================================
-- CLIENTE: GUIDENT EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA (RUC: 20557299212) | Sede ID: 681 | Hoja: S GUIDENT EMPRESA INDIVIDUAL
-- ==================================================

-- ==================================================
-- CLIENTE: AJA MEDINA HERMANOS S.A.C. (RUC: 20612142221) | Sede ID: 372 | Hoja: AJA MEDINA HERMANOS S.A.C.     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (372, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 372)) FROM ContratoServicio WHERE id_sede = 372 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45460');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (372, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 372)) FROM ContratoServicio WHERE id_sede = 372 AND activo = 1), 'JULIO', '2026-07-18', 'completado', 'pendiente', NULL, NULL, NULL, 65.00, NULL);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (372, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 372)) FROM ContratoServicio WHERE id_sede = 372 AND activo = 1), 'AGOSTO', '2026-08-18', 'completado', 'pendiente', NULL, NULL, NULL, 65.00, NULL);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (372, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 372)) FROM ContratoServicio WHERE id_sede = 372 AND activo = 1), 'SEPTIEMBRE', '2026-09-18', 'completado', 'pendiente', NULL, NULL, NULL, 65.00, NULL);

-- ==================================================
-- CLIENTE: Susan Leroy Garro Bedriñana (RUC: 10098796491) | Sede ID: 637 | Hoja: Susan Leroy Garro Bedriñana    
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (637, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 637)) FROM ContratoServicio WHERE id_sede = 637 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45109');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62783', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: María Betzabe Acuña cusma (RUC: 10272822072) | Sede ID: 376 | Hoja: María Betzabe Acuña cusma     
-- ==================================================

-- ==================================================
-- CLIENTE: Any Johana Vasquez Ramirez (RUC: 10457775763) | Sede ID: 1235 | Hoja: Any Johana Vasquez Ramirez     
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA FELINA JACOBITA S.A.C. (RUC: 20609688913) | Sede ID: 1174 | Hoja: CLINICA FELINA JACOBITA S.A (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1174, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1174)) FROM ContratoServicio WHERE id_sede = 1174 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45410');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62877', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA FELINA JACOBITA S.A.C. (RUC: 20609688913) | Sede ID: 1174 | Hoja: CLINICA FELINA JACOBITA S.A.C. 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1174, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1174)) FROM ContratoServicio WHERE id_sede = 1174 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45286');

-- ==================================================
-- CLIENTE: MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CERRADA (RUC: 20511018553) | Sede ID: 381 | Hoja: MEDICAL AND ODONTOLOGY ESPECIAL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (381, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 381)) FROM ContratoServicio WHERE id_sede = 381 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45425');

-- ==================================================
-- CLIENTE: MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CERRADA (RUC: 20511018553) | Sede ID: 381 | Hoja: MEDICAL AND ODONTOLOGY SERVICE 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (381, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 381)) FROM ContratoServicio WHERE id_sede = 381 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45425');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62942', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Feel Vet SAC (RUC: 20612328456) | Sede ID: 379 | Hoja: Feel  Vet SAC     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (379, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 379)) FROM ContratoServicio WHERE id_sede = 379 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45058');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62699', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Christina Inga Villanueva (RUC: 10445138318) | Sede ID: 384 | Hoja: Christina Inga Villanueva      
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (384, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 384)) FROM ContratoServicio WHERE id_sede = 384 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63229', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Dávila Gutiérrez Davis Clint (RUC: 10455206371) | Sede ID: 1200 | Hoja: Dávila Gutiérrez Davis Clint 
-- ==================================================

-- ==================================================
-- CLIENTE: MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A.C (RUC: 20608420933) | Sede ID: 1128 | Hoja: MASKOTOPIA CLINICAS
-- ==================================================

-- ==================================================
-- CLIENTE: SOTO ENCISO ROSA LUCY ANGELICA (RUC: 10101197552) | Sede ID: 402 | Hoja: SOTO ENCISO ROSA LUCY ANGELICA 
-- ==================================================

-- ==================================================
-- CLIENTE: LOURDES KARINA PAREDES CAIHUACAS (RUC: 10408752162) | Sede ID: 403 | Hoja: LOURDES KARINA PAREDES CAIHUACA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (403, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 403)) FROM ContratoServicio WHERE id_sede = 403 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-13', 'transferencia', 'BBVA', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45142');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62717', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica odontológica Feijoo Eirl (RUC: 20602434916) | Sede ID: 417 | Hoja: Clínica odontológica Feijoo Eir
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (417, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 417)) FROM ContratoServicio WHERE id_sede = 417 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63305', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: FLORES CARBAJAL LENIN WALTER (RUC: 10459123500) | Sede ID: 1419 | Hoja: FLORES CARBAJAL LENIN WALTE (3)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1419, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1419)) FROM ContratoServicio WHERE id_sede = 1419 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63353', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: FLORES CARBAJAL LENIN WALTER (RUC: 10459123500) | Sede ID: 1420 | Hoja: FLORES CARBAJAL LENIN WALTE (2)
-- ==================================================

-- ==================================================
-- CLIENTE: FLORES CARBAJAL LENIN WALTER (RUC: 10459123500) | Sede ID: 1420 | Hoja: FLORES CARBAJAL LENIN WALTER   
-- ==================================================

-- ==================================================
-- CLIENTE: MANUEL ALEJANDRO VIDAL FLORES (RUC: 10410038523) | Sede ID: 425 | Hoja: MANUEL ALEJANDRO VIDAL FLORES
-- ==================================================

-- ==================================================
-- CLIENTE: Díaz Manco Tiffany Betsabe (RUC: 10431798927) | Sede ID: 426 | Hoja: Díaz Manco Tiffany Betsabe     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (426, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 426)) FROM ContratoServicio WHERE id_sede = 426 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63135', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: AIDA YENI CRISTOBAL JAUNI (RUC: 10479926897) | Sede ID: 433 | Hoja: AIDA YENI CRISTOBAL JAUNI 
-- ==================================================

-- ==================================================
-- CLIENTE: VIA ODONTOLOGICA ESECIALIZADA S.A.C (RUC: 20611762462) | Sede ID: 428 | Hoja: VIA ODONTOLOGICA ESECIALIZADA 
-- ==================================================

-- ==================================================
-- CLIENTE: Cosmetic Dent EIRL (RUC: 20548390908) | Sede ID: 439 | Hoja: Cosmetic Dent EIRL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (439, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 439)) FROM ContratoServicio WHERE id_sede = 439 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-23', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45362');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62779', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Centro de terapia física y rehabilitación AVS SAC (RUC: 20612275409) | Sede ID: 431 | Hoja: Centro de terapia física y reha
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (431, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 431)) FROM ContratoServicio WHERE id_sede = 431 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-10', 'efectivo', 'CANCELADO', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45309');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62700', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CHAVEZ VEREAU NATALI (RUC: 10425189021) | Sede ID: 1222 | Hoja: CHAVEZ VEREAU NATALI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1222, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1222)) FROM ContratoServicio WHERE id_sede = 1222 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45249');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62980', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ADMINISTRADORA DE SERVICIOS INTEGRALES DE SALUD S.A.C. - ADSERINSA (RUC: 20555957808) | Sede ID: 446 | Hoja: ADMINISTRADORA DE SERVICIOS (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (446, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 446)) FROM ContratoServicio WHERE id_sede = 446 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-22', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45346');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63158', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ADMINISTRADORA DE SERVICIOS INTEGRALES DE SALUD S.A.C. - ADSERINSA (RUC: 20555957808) | Sede ID: 446 | Hoja: ADMINISTRADORA DE SERVICIOS INT
-- ==================================================

-- ==================================================
-- CLIENTE: F.S.Q. COMPANY S.A.C. (RUC: 20556252981) | Sede ID: 450 | Hoja: F.S.Q. COMPANY S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: JOCYAL & SERVICIOS SAC (RUC: 20492108848) | Sede ID: 449 | Hoja: JOCYAL & SERVICIOS SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: grupo Trujillo & asociados SAC (RUC: 20544979389) | Sede ID: 442 | Hoja: grupo Trujillo & asociados SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (442, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 442)) FROM ContratoServicio WHERE id_sede = 442 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63136', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HUAMANI VILLANUEVA KATIA KARINA (RUC: 10427788399) | Sede ID: 444 | Hoja: HUAMANI VILLANUEVA KATIA KARINA
-- ==================================================

-- ==================================================
-- CLIENTE: Veterinaria central traverso eirl (RUC: 20609375575) | Sede ID: 453 | Hoja: Veterinaria central traverso ei
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (453, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 453)) FROM ContratoServicio WHERE id_sede = 453 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '1903-08-03', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45112');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62780', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET SAN PATRICIO SAC (RUC: 20613529897) | Sede ID: 686 | Hoja: VET SAN PATRICIO SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (686, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 686)) FROM ContratoServicio WHERE id_sede = 686 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45330');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62800', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VANEDENT EIRL (RUC: 20603826273) | Sede ID: 475 | Hoja: VANEDENT EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES EL HURON AZUL EIRL (RUC: 20602159826) | Sede ID: 1349 | Hoja: O-CENTRODEDIAGNOSTICOYESPECIA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1349, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1349)) FROM ContratoServicio WHERE id_sede = 1349 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63339', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: IED INVERSIONES SAC (RUC: 20608615611) | Sede ID: 479 | Hoja: IED INVERSIONES SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Odonto Shine B&E (RUC: 20604055327) | Sede ID: 1060 | Hoja: Odonto Shine B&E
-- ==================================================

-- ==================================================
-- CLIENTE: Centro Shama Niños de la Calle (RUC: 20456378758) | Sede ID: 824 | Hoja: Centro Shama Niños de la Callle
-- ==================================================

-- ==================================================
-- CLIENTE: ECOGRAPET SAC (RUC: 20543895157) | Sede ID: 1259 | Hoja: ECOGRAPET SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1259, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1259)) FROM ContratoServicio WHERE id_sede = 1259 AND activo = 1), 'MAYO', '2026-06-16', 'completado', 'pagado', '2026-05-20', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44538');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62932', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1259, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1259)) FROM ContratoServicio WHERE id_sede = 1259 AND activo = 1), 'JUNIO', '2026-07-16', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45442');

-- ==================================================
-- CLIENTE: OMONTE GUTIERREZ JOHAN ROLANDO (RUC: 10437752911) | Sede ID: 441 | Hoja: VES OMONTE GUTIERREZ JOHAN R
-- ==================================================

-- ==================================================
-- CLIENTE: Multiservicios Advance SAC (RUC: 20612191116) | Sede ID: 456 | Hoja: Multiservicios Advance SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (456, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 456)) FROM ContratoServicio WHERE id_sede = 456 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63431', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LESCANO AGUIRRE JESUS ENRIQUE (RUC: 10075482570) | Sede ID: 1121 | Hoja: LESCANO AGUIIRE
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO MEDICO DEL SUEÑO Y RESPIRACION SAC (RUC: 20610886958) | Sede ID: 1214 | Hoja: CONSULTORIO MEDICO DEL SUEÑO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1214, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1214)) FROM ContratoServicio WHERE id_sede = 1214 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-25', 'transferencia', 'BCP', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45448');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62979', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QUEZADA HUERTA GROUP SAC (RUC: 20610904859) | Sede ID: 492 | Hoja: QUEZADA HUERTA GROUP SAC)
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA PREVEDENT S.A.C. (RUC: 20609250870) | Sede ID: 404 | Hoja: CLINICA PREVEDENT SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA AMERICANO DENTAL CADE E.I.R.L. (RUC: 20600820690) | Sede ID: 489 | Hoja: CLINICA AMERICANO DENTAL CADE E
-- ==================================================

-- ==================================================
-- CLIENTE: 4G integral sac (RUC: 20601016274) | Sede ID: 1212 | Hoja: 4G INTEGRAL SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1212, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1212)) FROM ContratoServicio WHERE id_sede = 1212 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62747', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1212, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1212)) FROM ContratoServicio WHERE id_sede = 1212 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63050', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1212, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1212)) FROM ContratoServicio WHERE id_sede = 1212 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63456', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: UCAL S.A.C (RUC: 20537886618) | Sede ID: 1288 | Hoja: UCAL SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.PACHACUTEC 403 VES
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.INDUSTRIAL 3733
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.NICOLAS AYLLON 816  (2)
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.PRIMAVERA 970 
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.PRIMAVERA 1016
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62812', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.av. argentina 2430
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.PIRAMIDE DEL SOL 810
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.JAV. PRADO OESTE 980 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63167', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1283 | Hoja: D. EDU.SANTIAGO DE SURCO 4717
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1283, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1283)) FROM ContratoServicio WHERE id_sede = 1283 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62793', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Karen Ilse Ploog Cortes (RUC: 10409273586) | Sede ID: 504 | Hoja: KAREN ILSE PLOOG CORTES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (504, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 504)) FROM ContratoServicio WHERE id_sede = 504 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-19', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45318');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62719', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VIDAMEDIC INVERSIONES SAC (RUC: 20611971495) | Sede ID: 483 | Hoja: VIDAMEDIC INVERSIONES SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Dental Medical Group H & M E.I.R.L. (RUC: 20612478440) | Sede ID: 1247 | Hoja: Dental Medical Group H & M E.I
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1247, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1247)) FROM ContratoServicio WHERE id_sede = 1247 AND activo = 1), 'JUNIO', '2026-06-27', 'completado', 'pagado', '2026-06-26', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45497');

-- ==================================================
-- CLIENTE: Velazco Arias Sofia Carolina (RUC: 10728839401) | Sede ID: 507 | Hoja: Velazco Arias Sofia Carolin
-- ==================================================

-- ==================================================
-- CLIENTE: Ivonne Geraldine Montes Valenzuela (RUC: 10481649515) | Sede ID: 1205 | Hoja: Ivonne Geraldine Montes Valenzu
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1205, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1205)) FROM ContratoServicio WHERE id_sede = 1205 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-13', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45157');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62586', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: BRIDENT DENTAL SAC (RUC: 20606413352) | Sede ID: 512 | Hoja: BRIDENT DENTAL SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Servicios Veterinarios Pets Sites SAC (RUC: 20612298832) | Sede ID: 522 | Hoja: Servicios Veterinarios Pets (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (522, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 522)) FROM ContratoServicio WHERE id_sede = 522 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63308', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: KEIRAN SRL (RUC: 20342043730) | Sede ID: 524 | Hoja: KERIAN SRL
-- ==================================================

-- ==================================================
-- CLIENTE: Karen Katherine Hernández Caba (RUC: 10467128171) | Sede ID: 525 | Hoja: Karen Katherine Hernández Caba
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (525, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 525)) FROM ContratoServicio WHERE id_sede = 525 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-06-24', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45391');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63328', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CUBASALUD E.I.R.L. (RUC: 20612269051) | Sede ID: 526 | Hoja: CUBASALUD E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (526, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 526)) FROM ContratoServicio WHERE id_sede = 526 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'yAPE', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45363');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62781', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: REHTO SALUD SAC (RUC: 20612105473) | Sede ID: 508 | Hoja: REHTO SALUD SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (508, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 508)) FROM ContratoServicio WHERE id_sede = 508 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'BBVA', 75.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45263');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63027', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO VETERINARIO Y DIAGNOSTICO SONOVET S.A.C. (RUC: 20613064231) | Sede ID: 1274 | Hoja: Centro ecográfico Camilo Roldán
-- ==================================================

-- ==================================================
-- CLIENTE: CCORI SUMAQ SRL (RUC: 20608165623) | Sede ID: 528 | Hoja: CCORI SUMAQ SRL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (528, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 528)) FROM ContratoServicio WHERE id_sede = 528 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63329', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Emily Liliana Llacza Arellano (RUC: 10739542885) | Sede ID: 814 | Hoja: Emily Liliana Llacza Arellano  
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (814, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 814)) FROM ContratoServicio WHERE id_sede = 814 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63234', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Servicios Veterinarios Sebasmedic EIRL (RUC: 20613400002) | Sede ID: 537 | Hoja: Servicios Veterinarios Sebasmed
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (537, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 537)) FROM ContratoServicio WHERE id_sede = 537 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45283');

-- ==================================================
-- CLIENTE: HEALTHY PETS HERMANOS SAC (RUC: 20612705951) | Sede ID: 541 | Hoja: HEALTHY PETS HERMANOS SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (541, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 541)) FROM ContratoServicio WHERE id_sede = 541 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63309', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Corporativo Veterinario SAC (RUC: 20546435432) | Sede ID: 515 | Hoja: Corporativo Veterinario SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLÓGICO BENJAMÍN DOIG SAC (RUC: 20607006335) | Sede ID: 631 | Hoja: CENTRO ODONTOLÓGICO BENJAMÍN DO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (631, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 631)) FROM ContratoServicio WHERE id_sede = 631 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63268', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO VETERINARIO OASIS DE LIMA SUR S.A.C. (RUC: 20610844929) | Sede ID: 548 | Hoja: CENTRO VETERINARIO OASIS DE LIM
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (548, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 548)) FROM ContratoServicio WHERE id_sede = 548 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45276');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62627', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Lourdes Juliana Mathias López (RUC: 10076457382) | Sede ID: 1218 | Hoja: Lourdes Juliana Mathias López  
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1218, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1218)) FROM ContratoServicio WHERE id_sede = 1218 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63106', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1256 | Hoja: SRGlow Inversiones SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1256, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1256)) FROM ContratoServicio WHERE id_sede = 1256 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62811', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1256 | Hoja: ESPSRGlow Inversiones SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1256, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1256)) FROM ContratoServicio WHERE id_sede = 1256 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62818', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1257 | Hoja: BRGlow Inversiones SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1257, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1257)) FROM ContratoServicio WHERE id_sede = 1257 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, 60.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62711', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1257, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1257)) FROM ContratoServicio WHERE id_sede = 1257 AND activo = 1), 'JULIO', '2026-07-10', 'completado', 'pendiente', NULL, NULL, NULL, 60.00, NULL);

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1257 | Hoja: ESPBRGlow Inversiones SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1257, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1257)) FROM ContratoServicio WHERE id_sede = 1257 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62704', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1256 | Hoja: CHGlow Inversiones SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1256, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1256)) FROM ContratoServicio WHERE id_sede = 1256 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62691', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1258 | Hoja: ESPCHGlow Inversiones SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1258, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1258)) FROM ContratoServicio WHERE id_sede = 1258 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62696', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: Juan Francisco Murrugarra Sánchez (RUC: 10415827330) | Sede ID: 317 | Hoja: JUAN FRANCISCO MURRUGARRA SANCH
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (317, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 317)) FROM ContratoServicio WHERE id_sede = 317 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45224');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62576', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HIJAR VELASQUEZ MERLING KARINA (RUC: 10430336946) | Sede ID: 556 | Hoja: HIJAR VELASQUEZ MERLING KARINA
-- ==================================================

-- ==================================================
-- CLIENTE: Canales Larrea, Angela María (RUC: 10403783019) | Sede ID: 619 | Hoja: Canales Larrea, Angela María 
-- ==================================================

-- ==================================================
-- CLIENTE: JC REHAB EIRL (RUC: 20603575718) | Sede ID: 557 | Hoja: JC REHAB EIRL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (557, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 557)) FROM ContratoServicio WHERE id_sede = 557 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-11', 'transferencia', 'YAPE', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45319');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62720', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MEDICINA EXTERNA S.A (RUC: 20100339936) | Sede ID: 1251 | Hoja: MEDICINA EXTERNA SA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62295', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00021656');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62498', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00021725');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62499', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00021750');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62756', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00021851');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62757', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00021865');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62758', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00021918');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62759', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00021973');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62760', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00022020');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62761', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00022076');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-19', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63072', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00022099');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62500', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'N° EG03 - 00022155');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63073', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63075', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63074', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica Veterinaria Eovet sac (RUC: 20612475408) | Sede ID: 1219 | Hoja: Clínica Veterinaria Eovet sac
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1219, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1219)) FROM ContratoServicio WHERE id_sede = 1219 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63107', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ACVET PERU E.I.R.L (RUC: 20605441077) | Sede ID: 610 | Hoja: 3 DE OCTUBREACVET PERU E.I 
-- ==================================================

-- ==================================================
-- CLIENTE: ACVET PERU E.I.R.L (RUC: 20605441077) | Sede ID: 610 | Hoja: SIMONBOLIVAR.ACVET PERU E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: ACVET PERU E.I.R.L (RUC: 20605441077) | Sede ID: 610 | Hoja: SMPACVET PERU E.I.R.L
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (610, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 610)) FROM ContratoServicio WHERE id_sede = 610 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, 'transferencia', NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63232', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica Veterinaria Ámbar EIRL (RUC: 20602702805) | Sede ID: 639 | Hoja: Clínica Veterinaria Ámbar EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (639, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 639)) FROM ContratoServicio WHERE id_sede = 639 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45245');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62637', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica Veterinaria Ámbar EIRL (RUC: 20602702805) | Sede ID: 639 | Hoja: CORPORACIÓN AMBAR E.I.R.L
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (639, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 639)) FROM ContratoServicio WHERE id_sede = 639 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45245');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62639', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica Veterinaria Ámbar EIRL (RUC: 20602702805) | Sede ID: 639 | Hoja: PACHAClínica Veterinaria Ámbar 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (639, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 639)) FROM ContratoServicio WHERE id_sede = 639 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45245');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62638', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA TRINYVET E.I.R.L. (RUC: 20605946527) | Sede ID: 635 | Hoja: CLINICA VETERINARIA TRINYVET E.
-- ==================================================

-- ==================================================
-- CLIENTE: ACVET PERU E.I.R.L (RUC: 20605441077) | Sede ID: 610 | Hoja: RetabloACVET PERU E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: JANAMPA CLEMENTE VICTOR ALBERTO (RUC: 10730485714) | Sede ID: 670 | Hoja: JANAMPA CLEMENTE VICTOR ALBERTO
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO SAN BERNARDO S.A.C. (RUC: 20610776117) | Sede ID: 705 | Hoja: GRUPO SAN BERNARDO S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: Cristian Alciviades Tafur Guerrero (RUC: 10455023187) | Sede ID: 4 | Hoja: Cristian Alciviades Tafur Guerr
-- ==================================================

-- ==================================================
-- CLIENTE: Arvet Sacs (RUC: 20613649213) | Sede ID: 170 | Hoja: ARVET ASOCIADOS S.A.C.S. (2)
-- ==================================================

-- ==================================================
-- CLIENTE: Arvet Sacs (RUC: 20613649213) | Sede ID: 170 | Hoja: ARVET ASOCIADOS S.A.C.S.
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE TERAPIA ALTERNATIVA Y ANTIENVEJECIMIENTO S.A.C (RUC: 20511051682) | Sede ID: 617 | Hoja: CENTRO DE TERAPIA ALTERNATIVA Y
-- ==================================================

-- ==================================================
-- CLIENTE: SILVA HUAMANI ROSIO RAQUEL (RUC: 10099762263) | Sede ID: 714 | Hoja: SILVA HUAMANI ROSIO RAQUEL     
-- ==================================================

-- ==================================================
-- CLIENTE: ESTHETICDENT SAC (RUC: 20513473665) | Sede ID: 609 | Hoja: ESTHETICDENT SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (609, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 609)) FROM ContratoServicio WHERE id_sede = 609 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', '2026-06-20', NULL, 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45334');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63138', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RAMOS GUERRERO LIZETH ARACELY (RUC: 10727044774) | Sede ID: 734 | Hoja: RAMOS GUERRERO LIZETH ARACELY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (734, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 734)) FROM ContratoServicio WHERE id_sede = 734 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-06-20', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45295');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62688', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: BRAÑEZ VIVAS LEONIDAS CERILO (RUC: 10162969868) | Sede ID: 733 | Hoja: BRAÑEZ VIVAS LEONIDAS CERILO
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica dental el Remanso Sac (RUC: 20545628377) | Sede ID: 739 | Hoja: Clínica dental el Remanso SAC
-- ==================================================

-- ==================================================
-- CLIENTE: INSTITUTO DE EDUCACIÓN SUPERIOR RICARDO PALMA S.A (RUC: 20338856955) | Sede ID: 634 | Hoja: INSTITUTO DE EDUCACION SUPE (2)
-- ==================================================

-- ==================================================
-- CLIENTE: INSTITUTO DE EDUCACIÓN SUPERIOR RICARDO PALMA S.A (RUC: 20338856955) | Sede ID: 634 | Hoja: INSTITUTO DE EDUCACION SUPERIO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (634, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 634)) FROM ContratoServicio WHERE id_sede = 634 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 200.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45446');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62975', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Miriam Rocio Gamarra López (RUC: 10090813434) | Sede ID: 760 | Hoja: Miriam Rocio Gamarra López     
-- ==================================================

-- ==================================================
-- CLIENTE: Veterinaria vida animal e.i.r.l. (RUC: 20613580051) | Sede ID: 690 | Hoja: Veterinaria vida animal e.i.r.l
-- ==================================================

-- ==================================================
-- CLIENTE: QUALAB S.A.C (RUC: 20603175558) | Sede ID: 695 | Hoja: QUALAB S.A.C      
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (695, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 695)) FROM ContratoServicio WHERE id_sede = 695 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62666', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (695, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 695)) FROM ContratoServicio WHERE id_sede = 695 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62745', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (695, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 695)) FROM ContratoServicio WHERE id_sede = 695 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62919', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (695, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 695)) FROM ContratoServicio WHERE id_sede = 695 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63042', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (695, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 695)) FROM ContratoServicio WHERE id_sede = 695 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63214', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (695, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 695)) FROM ContratoServicio WHERE id_sede = 695 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63448', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO MEDICO DENTAL SANTA INES S.A. (RUC: 20331894789) | Sede ID: 810 | Hoja: CENTRO MEDICO DENTAL SANTA INES
-- ==================================================

-- ==================================================
-- CLIENTE: Jhonny Marcelo Astete Torrejón (RUC: 10211338640) | Sede ID: 823 | Hoja: JHONNY MARCELO ASTETE TORREJON
-- ==================================================

-- ==================================================
-- CLIENTE: EDUARDO SALAS ZORRILLA (RUC: 10421021363) | Sede ID: 832 | Hoja: EDUARDO SALAS ZORRILLA       
-- ==================================================

-- ==================================================
-- CLIENTE: Angelica ivett Guevara Jara (RUC: 10096304728) | Sede ID: 822 | Hoja: Angelica ivett Guevara Jara    
-- ==================================================

-- ==================================================
-- CLIENTE: Dental specialists SAC (RUC: 20548900361) | Sede ID: 850 | Hoja: Dental specialists SAC       
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (850, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 850)) FROM ContratoServicio WHERE id_sede = 850 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45323');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62728', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Lilia Rosa Esquivel Rodriguez (RUC: 10752706765) | Sede ID: 844 | Hoja: Lilia Rosa Esquivel Rodriguez
-- ==================================================

-- ==================================================
-- CLIENTE: ELENA COTRINA LLANOS (RUC: 10423970672) | Sede ID: 849 | Hoja: ELENA COTRINA LLANOS       
-- ==================================================

-- ==================================================
-- CLIENTE: LIDER DENT INVERSIONES MEDICAS SAC (RUC: 20603720670) | Sede ID: 852 | Hoja: LIDER DENT INVERSIONES MEDICAS 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (852, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 852)) FROM ContratoServicio WHERE id_sede = 852 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45352');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62806', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INVERSIONES DE SALUD Y BELLEZA MORALES S.A.C. (RUC: 20603504284) | Sede ID: 400 | Hoja: INVERSIONES DE SALUD Y BELLEZA 
-- ==================================================

-- ==================================================
-- CLIENTE: Jhonny Marcelo Astete Torrejón (RUC: 10211338640) | Sede ID: 875 | Hoja: Jhonny Marcelo Astete Torrejón 
-- ==================================================

-- ==================================================
-- CLIENTE: Wilmer Vasquez Ramirez (RUC: 10103985191) | Sede ID: 1403 | Hoja: WILMAR VASQUEZ REMIREZ       
-- ==================================================

-- ==================================================
-- CLIENTE: SMILE EXPERTS S.A.C. (RUC: 20611289201) | Sede ID: 877 | Hoja: SMILE EXPERTS S.A.C.       
-- ==================================================

-- ==================================================
-- CLIENTE: Ruth Karina De la cruz Huaman (RUC: 10708061749) | Sede ID: 882 | Hoja: Ruth Karina De la cruz Huaman  
-- ==================================================

-- ==================================================
-- CLIENTE: Grupo consorcio veterinario sac (RUC: 20607299944) | Sede ID: 78 | Hoja: ANCONGrupo consorcio vet
-- ==================================================

-- ==================================================
-- CLIENTE: stephanie llantoy cosio (RUC: 10472168105) | Sede ID: 900 | Hoja: stephanie llantoy cosio        
-- ==================================================

-- ==================================================
-- CLIENTE: Galaxy pets SAC (RUC: 20613952153) | Sede ID: 908 | Hoja: Galaxy pets SAC       
-- ==================================================

-- ==================================================
-- CLIENTE: Consultorio Odontológico Dentios E.I.R.L (RUC: 20613838385) | Sede ID: 905 | Hoja: Consultorio Odontológico Dentio
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (905, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 905)) FROM ContratoServicio WHERE id_sede = 905 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-05-22', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44649');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63199', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (905, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 905)) FROM ContratoServicio WHERE id_sede = 905 AND activo = 1), 'JULIO', '2026-07-22', 'completado', 'pagado', '2026-05-22', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44649');

-- ==================================================
-- CLIENTE: DENTALMANS E.I.R.L. (RUC: 20601130506) | Sede ID: 913 | Hoja: DENTALMANS EIRL       
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (913, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 913)) FROM ContratoServicio WHERE id_sede = 913 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45470');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63011', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VERAMENDI MEDIC SACS (RUC: 20613628101) | Sede ID: 1297 | Hoja: VERAMENDI MEDIC SAC       
-- ==================================================

-- ==================================================
-- CLIENTE: Arnaldo Nique Medrano Verastegui (RUC: 10106058208) | Sede ID: 920 | Hoja: Arnaldo Nique Medrano Verastegu
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (920, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 920)) FROM ContratoServicio WHERE id_sede = 920 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-25', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45431');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62948', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Corporación HKS EIRL (RUC: 20609205947) | Sede ID: 916 | Hoja: Corporación HKS EIRL       
-- ==================================================

-- ==================================================
-- CLIENTE: PAREDES NAVARRO PATRICIA (RUC: 10106193091) | Sede ID: 1295 | Hoja: PAREDES NAVARRO PATRICIA       
-- ==================================================

-- ==================================================
-- CLIENTE: Oda Rios melgar (RUC: 10419707371) | Sede ID: 1296 | Hoja: Oda Rios melgar       
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1296, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1296)) FROM ContratoServicio WHERE id_sede = 1296 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45233');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62590', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETCARE S.A.C. (RUC: 20614046172) | Sede ID: 1302 | Hoja: VETCARE S.A.C.            
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1302, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1302)) FROM ContratoServicio WHERE id_sede = 1302 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', '2026-05-22', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63148', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVSALUD SAC (RUC: 20609251141) | Sede ID: 1301 | Hoja:  SERVSALUD SAC       
-- ==================================================

-- ==================================================
-- CLIENTE: Ayllu Dent S.A.C (RUC: 20604651043) | Sede ID: 938 | Hoja: Ayllu Dent S.A.C       
-- ==================================================

-- ==================================================
-- CLIENTE: Anngie Gissella Villar Calderón (RUC: 10413081667) | Sede ID: 940 | Hoja: Anngie Gissella Villar Calderón
-- ==================================================

-- ==================================================
-- CLIENTE: Pedro Luis Carlos Ávalos Sánchez (RUC: 10435868474) | Sede ID: 931 | Hoja: Pedro Luis Carlos Ávalos Sánche
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (931, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 931)) FROM ContratoServicio WHERE id_sede = 931 AND activo = 1), 'JUNIO', '2026-06-27', 'completado', 'pendiente', NULL, NULL, NULL, 65.00, NULL);

-- ==================================================
-- CLIENTE: Denthalix E.I.R.L. (RUC: 20613766295) | Sede ID: 939 | Hoja: Denthalix E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (939, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 939)) FROM ContratoServicio WHERE id_sede = 939 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-25', 'transferencia', 'BBVA', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45477');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63286', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: W&M CORPORACION SALUD S.A.C (RUC: 20613941577) | Sede ID: 1308 | Hoja: W&M CORPORACION SALUD S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1308, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1308)) FROM ContratoServicio WHERE id_sede = 1308 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pagado', '2026-06-13', 'efectivo', 'cANCELADO', 112.25, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45203');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62819', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1308, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1308)) FROM ContratoServicio WHERE id_sede = 1308 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63112', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Centro Odontológico Fritz EIRL (RUC: 20507230033) | Sede ID: 1312 | Hoja: Centro Odontológico Fritz EIRL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1312, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1312)) FROM ContratoServicio WHERE id_sede = 1312 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45130');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62813', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS ODONTOLOGICOS INTEGRALES VAMDENT E.I.R.L. (RUC: 20549566228) | Sede ID: 1313 | Hoja:  SERVICIOS ODONTOLOGICOS INTEGR
-- ==================================================

-- ==================================================
-- CLIENTE: C & F ODONTOLOGIA INTEGRAL S.A.C. (RUC: 20612208825) | Sede ID: 1315 | Hoja: C & F ODONTOLOGIA INTEGRAL S.A.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45288');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62654', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: THE GROOMING PLACE-VETERINARIA & PET SHOP S.A.C. (RUC: 20613113721) | Sede ID: 987 | Hoja: THE GROOMING PLACE-VETERINARIA 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (987, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 987)) FROM ContratoServicio WHERE id_sede = 987 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63272', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INVERSIONES MEFANE SAC (RUC: 20606393521) | Sede ID: 1318 | Hoja: INVERSIONES MEFANE SAC       
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES MEFANE SAC (RUC: 20606393521) | Sede ID: 1316 | Hoja: INVERSIONES MEFANE SAC}
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica veterinaria Dr.JhonD'vet (RUC: 20612962198) | Sede ID: 1003 | Hoja: CLINICA VETERINARIA DR JHONDVET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1003, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1003)) FROM ContratoServicio WHERE id_sede = 1003 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63434', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: TECSIHUA CASTILLO PERLA FABIOLA (RUC: 10479315995) | Sede ID: 1021 | Hoja: TECSIHUA CASTILLO PERLA FABIOLA
-- ==================================================

-- ==================================================
-- CLIENTE: EJERCITO PERUANO Escuela Militar de Chorrillos (RUC: 20131369124) | Sede ID: 1320 | Hoja: EJERCITO PERUANO - ESCUELA MILI
-- ==================================================

-- ==================================================
-- CLIENTE: Martha Sofía Zanabria Montoya (RUC: 10484766539) | Sede ID: 1324 | Hoja: Martha Sofía Zanabria Montoya  
-- ==================================================

-- ==================================================
-- CLIENTE: PETS FARMA VETERINARIA EIRL (RUC: 20602556736) | Sede ID: 1322 | Hoja: PETS FARMA VETERINARIA EIRL    
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1322, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1322)) FROM ContratoServicio WHERE id_sede = 1322 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45313');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62705', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: sonrisas 360 EIRL (RUC: 20613077147) | Sede ID: 1326 | Hoja: SONRISAS 360
-- ==================================================

-- ==================================================
-- CLIENTE: GAMARRA HEALTHCARE CENTER SAC (RUC: 20600994302) | Sede ID: 1328 | Hoja: GAMARRA HEALTHCARE CENTER SAC  
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62570', 'ESPECIAL', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62564', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62565', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62566', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62567', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62568', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-19', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62569', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63060', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63061', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RYM SERVICIOS DE ESPECIALIDAD S.A.C. (RUC: 20613514229) | Sede ID: 1330 | Hoja: RYM SERVICIOS DE ESPECIALIDAD S
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1330, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1330)) FROM ContratoServicio WHERE id_sede = 1330 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45266');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62655', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MÁS QUE PATAZAS S. A. C. (RUC: 20613817663) | Sede ID: 1331 | Hoja: MÁS QUE PATAZAS S. A. C.       
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1331, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1331)) FROM ContratoServicio WHERE id_sede = 1331 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45261');

-- ==================================================
-- CLIENTE: Linda Huarancca Chumbe (RUC: 10407791091) | Sede ID: 1332 | Hoja: Linda Huarancca Chumbe
-- ==================================================

-- ==================================================
-- CLIENTE: ROJAS DURAND OSCAR AMADEO (RUC: 10329712945) | Sede ID: 1333 | Hoja: ROJAS DURAND OSCAR AMADEO      
-- ==================================================

-- ==================================================
-- CLIENTE: Alessandra Patricia Villena Cumpa (RUC: 10470044743) | Sede ID: 1334 | Hoja: Alessandra Patricia Villena Cum
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1334, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1334)) FROM ContratoServicio WHERE id_sede = 1334 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45280');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63037', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Jesús kiyoshi haramura glave (RUC: 10468277307) | Sede ID: 1335 | Hoja: Jesús kiyoshi haramura glave   
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1335, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1335)) FROM ContratoServicio WHERE id_sede = 1335 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45267');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62656', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LEOPOLDO MENESES ENTERPRISES E.I.R.L. (RUC: 20607524760) | Sede ID: 1339 | Hoja: LEOPOLDO MENESES ENTERPRISES E.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1339, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1339)) FROM ContratoServicio WHERE id_sede = 1339 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-04-16', 'transferencia', 'BCP', 63.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43595');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62815', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1339, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1339)) FROM ContratoServicio WHERE id_sede = 1339 AND activo = 1), 'JULIO', '2026-07-12', 'completado', 'pagado', '2026-04-16', 'transferencia', 'BCP', 63.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43595');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1339, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1339)) FROM ContratoServicio WHERE id_sede = 1339 AND activo = 1), 'AGOSTO', '2026-08-12', 'completado', 'pagado', '2026-04-16', 'transferencia', 'BCP', 63.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43595');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1339, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1339)) FROM ContratoServicio WHERE id_sede = 1339 AND activo = 1), 'SEPTIEMBRE', '2026-09-12', 'completado', 'pagado', '2026-04-16', 'transferencia', 'BCP', 63.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43595');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1339, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1339)) FROM ContratoServicio WHERE id_sede = 1339 AND activo = 1), 'OCTUBRE', '2026-10-12', 'completado', 'pagado', '2026-04-16', 'transferencia', 'BCP', 63.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43595');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1339, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1339)) FROM ContratoServicio WHERE id_sede = 1339 AND activo = 1), 'NOVIEMBRE', '2026-11-12', 'completado', 'pagado', '2026-04-16', 'transferencia', 'BCP', 63.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43595');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1339, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1339)) FROM ContratoServicio WHERE id_sede = 1339 AND activo = 1), 'DICIEMBRE', '2026-12-12', 'completado', 'pagado', '2026-04-16', 'transferencia', 'BCP', 63.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43595');

-- ==================================================
-- CLIENTE: MOREANO VEGA BRENDA LUCERO (RUC: 10479890205) | Sede ID: 1340 | Hoja: MOREANO VEGA BRENDA LUCERO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1340, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1340)) FROM ContratoServicio WHERE id_sede = 1340 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45074');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62657', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: King vet S.A.C (RUC: 20609560844) | Sede ID: 1343 | Hoja: King vet S.A.C  (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1343, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1343)) FROM ContratoServicio WHERE id_sede = 1343 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45305');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62693', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: King vet S.A.C (RUC: 20609560844) | Sede ID: 1342 | Hoja: King vet S.A.C 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1342, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1342)) FROM ContratoServicio WHERE id_sede = 1342 AND activo = 1), 'MAYO', '2026-06-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45306');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62707', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Grupo inversiones J&J asociados sac (RUC: 20614036002) | Sede ID: 1344 | Hoja: GRUPO INVERSIONES J&J ASOCIADOS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1344, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1344)) FROM ContratoServicio WHERE id_sede = 1344 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63149', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Luz pilar solis javier (RUC: 10258012599) | Sede ID: 1164 | Hoja: Luz pilar solis javier
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1164, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1164)) FROM ContratoServicio WHERE id_sede = 1164 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2025-09-08', 'transferencia', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '37681');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63277', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica Veterinaria & Pet Shop SERVICAN EIRL (RUC: 20609283174) | Sede ID: 1346 | Hoja: Clínica Veterinaria & Pet Shop 
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO PRE-NATAL VIDA NUEVA (RUC: 20429156883) | Sede ID: 1351 | Hoja: CENTRO PRE-NATAL VIDA NUEVA
-- ==================================================

-- ==================================================
-- CLIENTE: SIALER GONZALES DORA MAYRA (RUC: 10732106711) | Sede ID: 1352 | Hoja: SIALER GONZALES DORA MAYRA 
-- ==================================================

-- ==================================================
-- CLIENTE: PARIS PET SAC (RUC: 20613775430) | Sede ID: 1353 | Hoja: PARIS PET SAC
-- ==================================================

-- ==================================================
-- CLIENTE: TREE DENT PERU E.I.R.L. (RUC: 20614486121) | Sede ID: 1354 | Hoja: TREE DENT PERU E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO SONRIE PERU SAC (RUC: 20601286158) | Sede ID: 1358 | Hoja: VESGRUPO SONRIE PERU SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1358, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1358)) FROM ContratoServicio WHERE id_sede = 1358 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45268');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62658', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1358, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1358)) FROM ContratoServicio WHERE id_sede = 1358 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 80.00, 'ESPECIAL');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45268');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62669', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: CORPORACION SONRISA SEGURA SAC (RUC: 20603143788) | Sede ID: 1359 | Hoja: SURCOCORPORACION SONRISA 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1359, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1359)) FROM ContratoServicio WHERE id_sede = 1359 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45247');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62816', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1359, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1359)) FROM ContratoServicio WHERE id_sede = 1359 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 80.00, 'ESPECIAL');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45247');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62817', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: CORPORACION DENTAL PERUANA SONRISA SEGURA SAC (RUC: 20606650346) | Sede ID: 1360 | Hoja: MOLINACORPORACION SONRISA  
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION SONRISA 3D SAC (RUC: 20606610557) | Sede ID: 1361 | Hoja: CHORRCORPORACION SONRISA 3D SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1361, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1361)) FROM ContratoServicio WHERE id_sede = 1361 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 85.01, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45397');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62857', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CORPORACION PERUANA DE FRANQUICIAS DENTALES (RUC: 20606688823) | Sede ID: 1362 | Hoja: SJMCORPORACION PERUANA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1362, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1362)) FROM ContratoServicio WHERE id_sede = 1362 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45234');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62592', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1362, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1362)) FROM ContratoServicio WHERE id_sede = 1362 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', 80.00, 'ESPECIAL');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45234');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62619', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: GRUPO SALUD DENTAL SAC (RUC: 20609199823) | Sede ID: 1363 | Hoja: OLIVOSGRUPO SALUD DENTAL SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1363, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1363)) FROM ContratoServicio WHERE id_sede = 1363 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63340', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1363, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1363)) FROM ContratoServicio WHERE id_sede = 1363 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63341', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CORPORACION EMPRESARIAL SEGURA SAC (RUC: 20608245414) | Sede ID: 1364 | Hoja: SMPCORPORACION EMPRESARIAL SEGU
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1364, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1364)) FROM ContratoServicio WHERE id_sede = 1364 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, 'transferencia', NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63248', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1364, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1364)) FROM ContratoServicio WHERE id_sede = 1364 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63288', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: LA BARATISIMA SAC (RUC: 20601353041) | Sede ID: 1365 | Hoja: SANMIGUELLA BARATISIMA SA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1365, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1365)) FROM ContratoServicio WHERE id_sede = 1365 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63322', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1365, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1365)) FROM ContratoServicio WHERE id_sede = 1365 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63360', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO 3D SAC (RUC: 20610058648) | Sede ID: 1366 | Hoja: MIRAFLOCENTRO DE DIAGNOSTICO 3D
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1366, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1366)) FROM ContratoServicio WHERE id_sede = 1366 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45219');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62733', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1366, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1366)) FROM ContratoServicio WHERE id_sede = 1366 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 80.00, 'ESPECIAL');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45219');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62735', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: CORPORACION DE FRANQUICIAS ODONTOLOGICAS SAC (RUC: 20613473255) | Sede ID: 1367 | Hoja: VMTCORPORACION DE FRANQUICIAS
-- ==================================================

-- ==================================================
-- CLIENTE: FRANQUICIAS DE INNOVACION DENTAL SAC (RUC: 20613275810) | Sede ID: 1356 | Hoja: ATEFRANQUICIAS DE INNOVACION
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION SONRISA 3D SAC (RUC: 20606610557) | Sede ID: 1361 | Hoja: INDPCORPORACION SONRISA 3D SAC
-- ==================================================

-- ==================================================
-- CLIENTE: FRANQUICIAS DE INNOVACION DENTAL SAC (RUC: 20613275810) | Sede ID: 1356 | Hoja: SJL2FRANQUICIAS DE INNOVACION
-- ==================================================

-- ==================================================
-- CLIENTE: DETECTA CENTRO ONCOLOGICO S.A.C. (RUC: 20515468499) | Sede ID: 1369 | Hoja: SURQUIDETECTA CENTRO ONCOLOGICO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62491', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62492', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62493', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61494', 'ESPECIAL', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62750', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-13', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62751', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62752', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62753', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62754', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61495', 'ESPECIAL', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62755', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-19', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63078', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-20', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63079', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63080', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63082', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63081', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DETECTA CENTRO ONCOLOGICO S.A.C. (RUC: 20515468499) | Sede ID: 1370 | Hoja: SANBORDETECTA CENTRO ONCOLOGICO
-- ==================================================

-- ==================================================
-- CLIENTE: DOWAVA EIRL (RUC: 20612006564) | Sede ID: 1371 | Hoja: DOWAVA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1371, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1371)) FROM ContratoServicio WHERE id_sede = 1371 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45504');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63038', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Jorge Luis Chavez Jara (RUC: 10704322521) | Sede ID: 1373 | Hoja: Jorge Luis Chavez Jara
-- ==================================================

-- ==================================================
-- CLIENTE: Medical center G.A SAC (RUC: 20614657678) | Sede ID: 1374 | Hoja: MEDICAL CENTER G.A SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1374, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1374)) FROM ContratoServicio WHERE id_sede = 1374 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45269');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62659', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Panoral Sac (RUC: 20478196106) | Sede ID: 1372 | Hoja: PANORAL SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1372, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1372)) FROM ContratoServicio WHERE id_sede = 1372 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-06-22', 'transferencia', 'BBVA', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45340');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63323', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: FIORELA NUÑEZ ROSAS (RUC: 10752476883) | Sede ID: 1378 | Hoja: Fiorela Nuñez Rosas
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1378, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1378)) FROM ContratoServicio WHERE id_sede = 1378 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45235');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62593', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Cristiam Roger Ayma Cusma (RUC: 10421409566) | Sede ID: 1380 | Hoja: Cristiam Roger Ayma Cusma
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica dental happy faces (RUC: 20609097061) | Sede ID: 1382 | Hoja: Clínica dental happy faces 
-- ==================================================

-- ==================================================
-- CLIENTE: HUATUCO GONZALES GINA MIRIAM (RUC: 10107142458) | Sede ID: 1384 | Hoja: HUATUCO GONZALES GINA MIRIAM
-- ==================================================

-- ==================================================
-- CLIENTE: DIAGNODENT S.A.C. (RUC: 20547256639) | Sede ID: 1385 | Hoja: DIAGNODENT SAC 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1385, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1385)) FROM ContratoServicio WHERE id_sede = 1385 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45444');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62935', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: COAC MIRAFLORES E.I.R.L (RUC: 20614823021) | Sede ID: 1386 | Hoja: COAC MIRAFLORES EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1386, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1386)) FROM ContratoServicio WHERE id_sede = 1386 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pagado', '2026-06-16', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45226');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62734', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MUNICIPALIDAD DISTRITAL DE SURQUILLO (RUC: 20131372346) | Sede ID: 1383 | Hoja: MUNICIPALIAD DISTRITAL DE SURQU
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1383, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1383)) FROM ContratoServicio WHERE id_sede = 1383 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45375');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62934', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Marisol Gaona Valderrama (RUC: 10754878253) | Sede ID: 1387 | Hoja: Marisol Gaona Valderrama
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1387, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1387)) FROM ContratoServicio WHERE id_sede = 1387 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63287', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Hipólity MEDICAL Group EIRL (RUC: 20614742101) | Sede ID: 1390 | Hoja: HIPOLITY MEDICAL GROUP EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: ACERO PULIDO ESTHER JEANETTE (RUC: 10424571330) | Sede ID: 1391 | Hoja: ACERO PULIDO ESTHER JEANETTE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1391, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1391)) FROM ContratoServicio WHERE id_sede = 1391 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63259', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HUAMAN ZARATE HENRY WALTER (RUC: 10107652634) | Sede ID: 1392 | Hoja: HUAMAN ZARATE HENRY WALTER2
-- ==================================================

-- ==================================================
-- CLIENTE: ELVIS OBLITAS TARRILLO (RUC: 10709139652) | Sede ID: 1393 | Hoja: Elvis Oblitas Tarrillo 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1393, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1393)) FROM ContratoServicio WHERE id_sede = 1393 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63445', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Beauty Touch Estética Orofacial & Odontologia (RUC: 20608795074) | Sede ID: 1394 | Hoja: Beauty Touch Estética Orofacial
-- ==================================================

-- ==================================================
-- CLIENTE: MUNICIPALIDAD DISTRITAL DE JESUS MARIA (RUC: 20131366290) | Sede ID: 1407 | Hoja: MUNICIPALIDAD DISTRITAL DE JESU
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1407, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1407)) FROM ContratoServicio WHERE id_sede = 1407 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', NULL, 65.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63039', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LACVET CLINICA VETERINARIA E.I.R.L. (RUC: 20615227481) | Sede ID: 1423 | Hoja: SILVA CAMPOS ARMANDO RAFAEL
-- ==================================================

-- ==================================================
-- CLIENTE: Club Sonrisa Perú S.A.C (RUC: 20608397192) | Sede ID: 1396 | Hoja: Club Sonrisa Perú S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1396, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1396)) FROM ContratoServicio WHERE id_sede = 1396 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-06-15', 'transferencia', 'BCP', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45220');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62878', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: WENCESLAO QUISPE SORIA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1400, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1400)) FROM ContratoServicio WHERE id_sede = 1400 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63281', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: WENCESLAO QUISPE SORIA2
-- ==================================================

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: AD CENTRO DE INNOVACION DEN (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1400, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1400)) FROM ContratoServicio WHERE id_sede = 1400 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-05-27', 'transferencia', 'YAPE', 60.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44722');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63282', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: AD CENTRO DE INNOVACION DENTAL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1400, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1400)) FROM ContratoServicio WHERE id_sede = 1400 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63252', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: QUICENTRODENTAL EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1400, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1400)) FROM ContratoServicio WHERE id_sede = 1400 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63283', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO VETERINARIO LAS VIÑAS SAC (RUC: 20549914951) | Sede ID: 1402 | Hoja: GRUPO VETERINARIO LAS VIÑAS (2)
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO VETERINARIO LAS VIÑAS SAC (RUC: 20549914951) | Sede ID: 1402 | Hoja: GRUPO VETERINARIO LAS VIÑAS SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Wilmer Vasquez Ramirez (RUC: 10103985191) | Sede ID: 1403 | Hoja: WILMER VASQUEZ RAMIREZ
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1403, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1403)) FROM ContratoServicio WHERE id_sede = 1403 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-06-22', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45345');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63208', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Karina Esthefania Espinal Melgarejo (RUC: 10712395619) | Sede ID: 1415 | Hoja: Karina Esthefania Espinal Melga
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1415, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1415)) FROM ContratoServicio WHERE id_sede = 1415 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45271');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62660', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1415, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1415)) FROM ContratoServicio WHERE id_sede = 1415 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'efectivo', 'CANCELADO', 80.00, 'ESPECIAL');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45271');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62668', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: Karina Esthefania Espinal Melgarejo (RUC: 10712395619) | Sede ID: 1415 | Hoja: HOJA(4)
-- ==================================================

-- ==================================================
-- CLIENTE: TELLO CHUNGA NORMA JANNET (RUC: 10423855946) | Sede ID: 1405 | Hoja: TELLO CHUNGA NORMA JANNET
-- ==================================================

-- ==================================================
-- CLIENTE: DERMATOLÓGICA PERÚ E.I.R.L. (RUC: 20601483701) | Sede ID: 1412 | Hoja: DERMATOLÓGICA PERÚ E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62557', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62558', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62559', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62561', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62560', 'ESPECIAL', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62562', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-19', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62563', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63066', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63067', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Veterinaria Elías Mendoza Cerna (RUC: 10267189442) | Sede ID: 1408 | Hoja: Veterinaria Elías Mendoza Cerna
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA DEL NORTE S.A.C. (RUC: 20613146149) | Sede ID: 818 | Hoja: CLINICA VETERINARIA DEL NORTE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (818, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 818)) FROM ContratoServicio WHERE id_sede = 818 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63352', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL DR. CUADROS E.I.R.L. (RUC: 20615187322) | Sede ID: 1414 | Hoja: CONSULTORIO DENTAL DR. CUADROS 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1414, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1414)) FROM ContratoServicio WHERE id_sede = 1414 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pagado', '2026-06-18', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45270');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63040', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Brenda del Pilar Durango Hernández (RUC: 10106346793) | Sede ID: 1416 | Hoja: Brenda del Pilar Durango Hernán
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1416, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1416)) FROM ContratoServicio WHERE id_sede = 1416 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-13', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45170');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62794', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS VETERINARIOS CASTRO SOLUTION SAC (RUC: 20605393994) | Sede ID: 1418 | Hoja: SERVICIOS VETERINARIOS CASTRO S
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1418, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1418)) FROM ContratoServicio WHERE id_sede = 1418 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45360');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62773', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ATM SERVET SAC (RUC: 20603611579) | Sede ID: 1422 | Hoja: ATM SERVET SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1422, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1422)) FROM ContratoServicio WHERE id_sede = 1422 AND activo = 1), 'JULIO', '2026-07-16', 'completado', 'pagado', '2026-06-16', 'transferencia', 'BCP', 65.00, NULL);

-- ==================================================
-- CLIENTE: GARCIA RAMIREZ WASHINGTON (RUC: 10061555418) | Sede ID: 1424 | Hoja: GARCIA RAMIREZ WASHINGTON
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1424, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1424)) FROM ContratoServicio WHERE id_sede = 1424 AND activo = 1), 'MAYO', '2026-06-16', 'completado', 'pagado', '2026-06-16', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45433');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62950', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Augusto Donayre Casas (RUC: 10705486048) | Sede ID: 1426 | Hoja: Augusto Donayre Casas 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1426, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1426)) FROM ContratoServicio WHERE id_sede = 1426 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45307');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62694', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VitalPro SAC (RUC: 20614280639) | Sede ID: 1427 | Hoja: VitalPro SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1427, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1427)) FROM ContratoServicio WHERE id_sede = 1427 AND activo = 1), 'ABRIL', '2026-05-18', 'completado', 'pagado', '2026-05-20', 'transferencia', 'BBVA', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43837');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '60581', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1427, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1427)) FROM ContratoServicio WHERE id_sede = 1427 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45505');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63041', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SANTOS MERA CINDY STHEFANY (RUC: 10472383952) | Sede ID: 1417 | Hoja: SANTOS MERA CINDY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1417, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1417)) FROM ContratoServicio WHERE id_sede = 1417 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63249', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DENTALISTA S.A.C. (RUC: 20611537698) | Sede ID: 1430 | Hoja: DENTALISTA S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1430, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1430)) FROM ContratoServicio WHERE id_sede = 1430 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45411');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62879', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: consultorio médico pulso & vida (RUC: 20610407171) | Sede ID: 1432 | Hoja: consultorio médico pulso & vida
-- ==================================================

-- ==================================================
-- CLIENTE: Torres Paxi Keyla Jeaneth (RUC: 10460421514) | Sede ID: 1434 | Hoja: Torres Paxi Keyla Jeaneth 
-- ==================================================

-- ==================================================
-- CLIENTE: Juan Diego Flores Rodas (RUC: 10707743081) | Sede ID: 1436 | Hoja: Juan Diego Flores Rodas
-- ==================================================

-- ==================================================
-- CLIENTE: FRANCE VET PERÚ EIRL (RUC: 20612029891) | Sede ID: 1438 | Hoja: FRANCE VET PERÚ EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1438, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1438)) FROM ContratoServicio WHERE id_sede = 1438 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-06-17', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45449');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62981', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Olivia Paola Carmona Quispe (RUC: 10704450996) | Sede ID: 1439 | Hoja: Olivia Paola Carmona Quispe
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1439, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1439)) FROM ContratoServicio WHERE id_sede = 1439 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-02-10', 'transferencia', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '41800');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63209', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1439, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1439)) FROM ContratoServicio WHERE id_sede = 1439 AND activo = 1), 'JULIO', '2026-07-22', 'completado', 'pendiente', NULL, 'transferencia', NULL, 65.00, NULL);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1439, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1439)) FROM ContratoServicio WHERE id_sede = 1439 AND activo = 1), 'AGOSTO', '2026-08-22', 'completado', 'pendiente', NULL, 'transferencia', NULL, 65.00, NULL);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1439, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1439)) FROM ContratoServicio WHERE id_sede = 1439 AND activo = 1), 'SEPTIEMBRE', '2026-09-22', 'completado', 'pendiente', NULL, 'transferencia', NULL, 65.00, NULL);

-- ==================================================
-- CLIENTE: MAILLET VET EIRL (RUC: 20613318233) | Sede ID: 1440 | Hoja: MAILLET VET EIRL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1440, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1440)) FROM ContratoServicio WHERE id_sede = 1440 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45315');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62708', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MANRIQUE CHUQUISPUMA DARIO CRISANTO (RUC: 10439236219) | Sede ID: 1443 | Hoja: MANRIQUE CHUQUISPUMA DARIO CRIS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1443, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1443)) FROM ContratoServicio WHERE id_sede = 1443 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63354', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: jessica landa andia (RUC: 10106468589) | Sede ID: 1445 | Hoja: LANDA ANDIA JESSICA NIEVES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1445, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1445)) FROM ContratoServicio WHERE id_sede = 1445 AND activo = 1), 'JUNIO', '2026-06-09', 'completado', 'pagado', '2026-06-09', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45272');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62662', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: AR DENTAL ESTUDIO EIRL (RUC: 20611759739) | Sede ID: 1446 | Hoja: AR DENTAL ESTUDIO EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: DR. JOSE LUIS VET S.A.C. (RUC: 20609067137) | Sede ID: 1447 | Hoja: DR. JOSE LUIS VET S.A.C. 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1447, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1447)) FROM ContratoServicio WHERE id_sede = 1447 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-13', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45171');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62774', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726,2728,2728-A,2730,2738,2740 AREA 1,379.26 M2. PUEBLO LIBRE (RUC: 20612164984) | Sede ID: 1461 | Hoja: SEGUNDA ETAPA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1461, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1461)) FROM ContratoServicio WHERE id_sede = 1461 AND activo = 1), 'JUNIO', '2026-06-11', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62713', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1461, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1461)) FROM ContratoServicio WHERE id_sede = 1461 AND activo = 1), 'JUNIO', '2026-06-18', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62502', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Aldo Enrique Gabriel Flores (RUC: 10099131166) | Sede ID: 1452 | Hoja: Aldo Enrique Gabriel Flores
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1452, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1452)) FROM ContratoServicio WHERE id_sede = 1452 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63250', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ENDODONCIARTE EIRL (RUC: 20614306131) | Sede ID: 1453 | Hoja: ENDODONCIARTE  EIRL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1453, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1453)) FROM ContratoServicio WHERE id_sede = 1453 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pagado', '2026-06-12', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45110');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62775', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GALLO CABALLERO ANGELO JULIO GUILLERMO (RUC: 10099525661) | Sede ID: 1454 | Hoja: GALLO CABALLERO ANGELO JULIO GU
-- ==================================================

-- ==================================================
-- CLIENTE: NICASIO SILVA CESAR FORTUNATO (RUC: 10437153723) | Sede ID: 1455 | Hoja: NICASIO SILVA CESAR FORTUNAT
-- ==================================================

-- ==================================================
-- CLIENTE: PONCE URBINA CARLOS ALBERTO (RUC: 10704388913) | Sede ID: 1456 | Hoja: PONCE URBINA CARLOS ALBERTO
-- ==================================================

-- ==================================================
-- CLIENTE: Empresa de servicios veterinarios y comerciales Puppy Center SAC (RUC: 20611103540) | Sede ID: 1460 | Hoja: Empresa de servicios veterinari
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1460, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1460)) FROM ContratoServicio WHERE id_sede = 1460 AND activo = 1), 'JUNIO', '2026-06-16', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45445');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62937', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ICBSAS (RUC: 20613697447) | Sede ID: 1462 | Hoja: ICBSAS SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1462, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1462)) FROM ContratoServicio WHERE id_sede = 1462 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-03-11', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43541');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62982', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1462, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1462)) FROM ContratoServicio WHERE id_sede = 1462 AND activo = 1), 'JULIO', '2026-07-17', 'completado', 'pagado', '2026-05-21', 'transferencia', 'YAPE', 70.00, NULL);

-- ==================================================
-- CLIENTE: Luis Estiv Goyas Blancas (RUC: 10409294613) | Sede ID: 1463 | Hoja: Luis Estiv Goyas Blancas 
-- ==================================================

-- ==================================================
-- CLIENTE: Luiggi Orlando Cornejo Peralta (RUC: 10103292811) | Sede ID: 1481 | Hoja: Luiggi Orlando Cornejo Peralta
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1481, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1481)) FROM ContratoServicio WHERE id_sede = 1481 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pagado', '2026-03-26', 'transferencia', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44427');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62695', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1481, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1481)) FROM ContratoServicio WHERE id_sede = 1481 AND activo = 1), 'JULIO', '2026-07-10', 'completado', 'pagado', '2026-03-26', 'transferencia', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44427');

-- ==================================================
-- CLIENTE: G&R House SAC (RUC: 20615032965) | Sede ID: 1464 | Hoja: G&R House SAC 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1464, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1464)) FROM ContratoServicio WHERE id_sede = 1464 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-03-24', 'transferencia', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '42909');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63324', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ENTRE MOTAS EIRL (RUC: 20609377764) | Sede ID: 1465 | Hoja: ENTRE MOTAS EIRL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1465, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1465)) FROM ContratoServicio WHERE id_sede = 1465 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45236');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62595', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ROMERO OBREGON ANDREA BELEN (RUC: 10451242526) | Sede ID: 1467 | Hoja: ROMERO OBREGON ANDREA BELEN
-- ==================================================

-- ==================================================
-- CLIENTE: MIKADENT S.A.C (RUC: 20600344707) | Sede ID: 1466 | Hoja: MIKADENT S.A.C 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1466, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1466)) FROM ContratoServicio WHERE id_sede = 1466 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pagado', '2026-03-30', 'transferencia', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43539');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62995', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica dental Snowdent eirl (RUC: 20607657077) | Sede ID: 1469 | Hoja: Clínica dental Snowdent eirl
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1469, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1469)) FROM ContratoServicio WHERE id_sede = 1469 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45412');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62880', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Amara inversiones S.A.C (RUC: 20615198324) | Sede ID: 1470 | Hoja: Amara inversiones S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1470, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1470)) FROM ContratoServicio WHERE id_sede = 1470 AND activo = 1), 'JUNIO', '2026-06-25', 'completado', 'pagado', '2026-06-25', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45462');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63460', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Alorella Dent Sac (RUC: 20615481654) | Sede ID: 1472 | Hoja: Alorella Dent Sac
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1472, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1472)) FROM ContratoServicio WHERE id_sede = 1472 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pagado', '2026-06-13', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45165');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63285', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET PRIME - DIAGNÓSTICO ECOGRÁFICO SOCIEDAD ANÓNIMA CERRADA (RUC: 20615600572) | Sede ID: 1476 | Hoja: VET PRIME - DIAGNÓSTICO ECOGRÁF
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1476, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1476)) FROM ContratoServicio WHERE id_sede = 1476 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pagado', '2026-04-17', 'transferencia', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44024');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62883', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1476, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1476)) FROM ContratoServicio WHERE id_sede = 1476 AND activo = 1), 'JULIO', '2026-07-15', 'completado', 'pagado', '2026-04-17', 'transferencia', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44024');

-- ==================================================
-- CLIENTE: SOTO ABARCA EDGARD ANTENOR (RUC: 10086344772) | Sede ID: 1477 | Hoja: SOTO ABARCA EDGARD ANTENOR
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1477, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1477)) FROM ContratoServicio WHERE id_sede = 1477 AND activo = 1), 'JUNIO', '2026-06-24', 'completado', 'pagado', '2026-04-14', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44022');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63355', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EMPRESA GVET GESTIONES VETERINARIAS EIRL (RUC: 20608516434) | Sede ID: 1479 | Hoja: EMPRESA GVET GESTIONES VETERINA
-- ==================================================

-- ==================================================
-- CLIENTE: HOSPITAL VETERINARIO HUELLAS Y MAS HUELLAS SAC (RUC: 20566086566) | Sede ID: 342 | Hoja: CLINICA VETERINARIA HUELLAS Y 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (342, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 342)) FROM ContratoServicio WHERE id_sede = 342 AND activo = 1), 'JUNIO', '2026-06-22', 'completado', 'pagado', '2026-05-21', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '63172', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CORPORACION MEDICA D´NORA SAC (RUC: 20604975736) | Sede ID: 762 | Hoja: MEDICA D NORA
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS ESPECIALIZADO CERVANTES EIRL (RUC: 20607975087) | Sede ID: 487 | Hoja: SERV MEDICOS ESPECIALIZADO CERV
-- ==================================================

-- ==================================================
-- CLIENTE: MATOS CHAUPIN MARIBEL (RUC: 10409465663) | Sede ID: 8 | Hoja: MARIBEL MATOS
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS INTEGRALES FAMISALUD SAC (RUC: 20508181796) | Sede ID: 158 | Hoja: serv med integ famisalud chinch
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS INTEGRALES FAMISALUD SAC (RUC: 20508181796) | Sede ID: 158 | Hoja: SERV MED INTEG FAMISALUD PISCO
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DIGESTIVO FERREL SAC (RUC: 20606160926) | Sede ID: 785 | Hoja: CENTRO DIGESTIVI FERREL
-- ==================================================

-- ==================================================
-- CLIENTE: Centro de Diagnostico Bioquim Laboratorio SCRL (RUC: 20495102255) | Sede ID: 107 | Hoja: centro de diag bioquim
-- ==================================================

-- ==================================================
-- CLIENTE: POLICLINICO ESPECIALIZADO SAN JOSE EIRL (RUC: 20606364319) | Sede ID: 787 | Hoja: poli espe san jose
-- ==================================================

-- ==================================================
-- CLIENTE: NAPURI REJAS FERNANDO ISIDORO (RUC: 10410545573) | Sede ID: 73 | Hoja: NAPURI FERNANDO
-- ==================================================

-- ==================================================
-- CLIENTE: SARAVIA HUAMAN LUIS ALBERTO (RUC: 10445899548) | Sede ID: 27 | Hoja: LUIS SARAVIA HUAMAN
-- ==================================================

-- ==================================================
-- CLIENTE: DAYSI IVETT DIAZ SANCHEZ (RUC: 10478360041) | Sede ID: 66 | Hoja: DAYSI DIAZ
-- ==================================================

-- ==================================================
-- CLIENTE: ANIMAL CENTER GUERRERO SAC (RUC: 20602844332) | Sede ID: 784 | Hoja: Animal Center
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA SAN MARTIN DE PORRES EIRL (RUC: 20534783010) | Sede ID: 371 | Hoja: CLINVET SMP
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA PRADO SAC (RUC: 20600507258) | Sede ID: 786 | Hoja: clin vet Prado 
-- ==================================================

-- ==================================================
-- CLIENTE: WF VETERINARIOS SAC (RUC: 20605041834) | Sede ID: 789 | Hoja: wf vet
-- ==================================================

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: A-CINTHIA CABEZAS
-- ==================================================

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: JOSE SALAS-CINTHIA CABEZAS (3)
-- ==================================================

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: NU-CINTHIA CABEZAS (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: JFK-CINTHIA CABEZAS (3)
-- ==================================================

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: CI-CINTHIA CABEZAS (4)
-- ==================================================

-- ==================================================
-- CLIENTE: NASCA VET SERVICIOS VETERINARIOS S.A.C. (RUC: 20601823307) | Sede ID: 843 | Hoja: NASCA VET SERV VET
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA FARM VETERINARIA PTE BLANCO EIRL (RUC: 20410478529) | Sede ID: 842 | Hoja: CLIN FARM VET PTE BLANCO
-- ==================================================

-- ==================================================
-- CLIENTE: VET SERVICE & CIA E.I.R.L (RUC: 20602683169) | Sede ID: 803 | Hoja: VET SERVICE
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO ESPECIALIZADO INTEGRALAB E.I.R.L. (RUC: 20609032180) | Sede ID: 788 | Hoja: CENTRO DE DIAGN. ESP.INTEGRALAB
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION EMPRESARIAL SEÑOR DE LUREN SAC (RUC: 20605036512) | Sede ID: 1069 | Hoja: CORPORACION EMPRESARIAL SEÑOR D
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1069, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1069)) FROM ContratoServicio WHERE id_sede = 1069 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62099', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clinica Dental Señor Nazareno EIRL (RUC: 20452838011) | Sede ID: 135 | Hoja: Clinica Dental Señor Nazareno E
-- ==================================================

-- ==================================================
-- CLIENTE: ZELAYA JULIAN SHARON ABIGAIL (RUC: 10703582856) | Sede ID: 1138 | Hoja: ZELAYA JULIAN SHARON ABIGAIL
-- ==================================================

-- ==================================================
-- CLIENTE: CARDENAS FIGUEROA ALEXANDER WILFREDO (RUC: 10446544522) | Sede ID: 226 | Hoja: CARDENAS FIGUEROA ALEXANDER WIL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (226, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 226)) FROM ContratoServicio WHERE id_sede = 226 AND activo = 1), 'JUNIO', '2026-06-28', 'completado', 'pagado', '2026-06-25', 'transferencia', NULL, 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45427');
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'YAPE');

-- ==================================================
-- CLIENTE: VIDAMEDIC INVERSIONES SAC (RUC: 20611971495) | Sede ID: 483 | Hoja: VIVAMEDIC
-- ==================================================

-- ==================================================
-- CLIENTE: ROJAS MOLLAPAZA VIOLETA (RUC: 10408266896) | Sede ID: 1223 | Hoja: ROJAS MOLLAPAZA VIOLETA     
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Veterinaria Martinez E.I.R.L (RUC: 20494351855) | Sede ID: 292 | Hoja: Clínica Veterinaria Martinez E.
-- ==================================================

-- ==================================================
-- CLIENTE: ROSA MERCEDES DONAYRE CAYO (RUC: 10414097729) | Sede ID: 418 | Hoja: "ROSA MERCEDES DONAYRE CAYO
-- ==================================================

-- ==================================================
-- CLIENTE: clinica veterinaria brown e.i.r.l (RUC: 20603070462) | Sede ID: 465 | Hoja: CLINICA VETERINARIA BROWN EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: Asociación Civil San Martin de Porres Perú ONG (RUC: 20609198801) | Sede ID: 484 | Hoja: Asociación Civil San Martin de 
-- ==================================================

-- ==================================================
-- CLIENTE: LEXMI QUINTANILLA TAMBRA (RUC: 10410633391) | Sede ID: 505 | Hoja: LEXMI QUINTANILLA TAMBRA
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICOS SOLIDARIOS SMG SAC (RUC: 20543542157) | Sede ID: 513 | Hoja: MEDICOS SOLIDARIOS SMG SAC
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICOS SOLIDARIOS SMG SAC (RUC: 20543542157) | Sede ID: 513 | Hoja: CHMEDICOS SOLIDARIOS SMG 
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DIAGNOSTICO ECOFETAL SOCIEDAD ANONIMA CERRADA (RUC: 20608833766) | Sede ID: 765 | Hoja: CENTRO DIAGNOSTICO ECOFETAL SOC
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA HERNANI S.A.C (RUC: 20608647709) | Sede ID: 853 | Hoja: CLINICA HERNANI SAC       
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (853, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 853)) FROM ContratoServicio WHERE id_sede = 853 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '59772', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PRINCIPAL VET SAC (RUC: 20607987441) | Sede ID: 886 | Hoja: PRINCIPAL VET SAC     
-- ==================================================

-- ==================================================
-- CLIENTE: Gonzales Elias Claudio Jesus (RUC: 10768018044) | Sede ID: 921 | Hoja: GONZALES ELIAS CLAUDIO JESUS   
-- ==================================================

-- ==================================================
-- CLIENTE: Dr. Francisco Roman M. EIRL (RUC: 20604590371) | Sede ID: 932 | Hoja: Dr. Francisco Roman M. EIRL    
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA ALONZO SAC (RUC: 20611374799) | Sede ID: 949 | Hoja: CLINICA VETERINARIA ALONZO SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: Zuly Geraldine Ayón Cayo (RUC: 10469256621) | Sede ID: 1144 | Hoja: Zuly Geraldine Ayón Cayo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1144, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1144)) FROM ContratoServicio WHERE id_sede = 1144 AND activo = 1), 'JUNIO', '2026-06-28', 'completado', 'pagado', '2026-06-25', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45473');

-- ==================================================
-- CLIENTE: LOZA AYBAR YULY KATHERINE (RUC: 10705649796) | Sede ID: 988 | Hoja: LOZA AYBAR YULY KATHERINE      
-- ==================================================

-- ==================================================
-- CLIENTE: KELY BURGA GONZALES (RUC: 10430226059) | Sede ID: 951 | Hoja: KELY BURGA GONZALES     
-- ==================================================

-- ==================================================
-- CLIENTE: Emerson Escriba Palomino (RUC: 10215605880) | Sede ID: 946 | Hoja: Emerson Escriba Palomino     
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DENTAL PERUDENT EIRL (RUC: 20600279581) | Sede ID: 1345 | Hoja: CLINICA DENTAL PERU DENT EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: clinica veterinaria faccevet sac (RUC: 20601805741) | Sede ID: 1279 | Hoja: clinica veterinaria faccevet sa
-- ==================================================

-- ==================================================
-- CLIENTE: RRGASTROCENTER SAC (RUC: 20614114682) | Sede ID: 1388 | Hoja: RR GASTROCENTER SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: Centro Nefrologico Señor de la.Misericordia SAC (RUC: 20554908641) | Sede ID: 1404 | Hoja: CENTRO NEFROLOGICO SEÑOR DE LA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'JUNIO', '2026-06-15', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62835', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'JUNIO', '2026-06-03', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61967', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'JUNIO', '2026-06-17', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62836', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'JUNIO', '2026-06-12', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61970', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'JUNIO', '2026-06-10', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61969', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61966', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'JUNIO', '2026-06-23', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61965', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61964', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: POLICLINICO BIOQUIM E.I.R.L (RUC: 20604003335) | Sede ID: 1468 | Hoja: POLICLINICO BIOQUIIM 
-- ==================================================

-- ==================================================
-- CLIENTE: URIBE DOMINGUEZ ROSEMARY MARLENY (RUC: 10703063352) | Sede ID: 1437 | Hoja: ROSEMARY MARLENY URIBE DOMINGUE
-- ==================================================

SET FOREIGN_KEY_CHECKS = 1;