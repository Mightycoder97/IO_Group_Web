-- MIGRACIÓN MASIVA DE SERVICIOS (LIMA Y SUR) - 2024 a 2026
-- Generado el: 2026-06-10 10:39:29
SET FOREIGN_KEY_CHECKS = 0;

-- ==================================================
-- CLIENTE: VERSE BIEN CENTRO DE CIRUGIA ESTETICA INTEGRAL SAC (RUC: 20553898294) | Sede ID: 919 | Hoja: verse bien
-- ==================================================

-- ==================================================
-- CLIENTE: PILLACA GONZALES JAIME WALTER (RUC: 10068481860) | Sede ID: 1215 | Hoja: jaime pillaca
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICINA ESTETICA Y BELLEZA INTEGRAL EIRL (RUC: 20603627581) | Sede ID: 834 | Hoja: Med est y belle int ZI medica
-- ==================================================

-- ==================================================
-- CLIENTE: BELLEZA Y CIENCIA SAC (RUC: 20548548625) | Sede ID: 280 | Hoja: belleza y ciencia
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO QP E.I.R.L. (RUC: 20603297289) | Sede ID: 783 | Hoja: grupo qp 
-- ==================================================

-- ==================================================
-- CLIENTE: ONCOLOGIA S.A.C. (RUC: 20428674201) | Sede ID: 833 | Hoja: oncologia 
-- ==================================================

-- ==================================================
-- CLIENTE: ONCOLOGIA S.A.C. (RUC: 20428674201) | Sede ID: 833 | Hoja: ONCOLOGIA ESP.
-- ==================================================

-- ==================================================
-- CLIENTE: INSTITUTO INTEGRAL VIDA PLENA SAC (RUC: 20477940642) | Sede ID: 1171 | Hoja: inst integral vida plena
-- ==================================================

-- ==================================================
-- CLIENTE: INSTITUTO INTEGRAL VIDA PLENA SAC (RUC: 20477940642) | Sede ID: 1171 | Hoja: INST INTEG VIDA PLENA
-- ==================================================

-- ==================================================
-- CLIENTE: MAXI MEDIC EIRL (RUC: 20544253094) | Sede ID: 20 | Hoja: maxi medic
-- ==================================================

-- ==================================================
-- CLIENTE: HAMPI WASI SAC (RUC: 20603053037) | Sede ID: 1178 | Hoja: HAMPI WASI
-- ==================================================

-- ==================================================
-- CLIENTE: ASOCIACION DE DESARROLLO DE LA EDUCACION Y LA SALUD (RUC: 20136458923) | Sede ID: 878 | Hoja: ASOC DE DESARROLLO D LA EDUC Y 
-- ==================================================

-- ==================================================
-- CLIENTE: Cesmed Lima Norte SAC (RUC: 20605857613) | Sede ID: 962 | Hoja: Cesmed Lima Norte
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO MEDICO DE APOYO LOS ANGELES SRL (RUC: 20607248380) | Sede ID: 520 | Hoja: centro med de apoyo
-- ==================================================

-- ==================================================
-- CLIENTE: SANITAS CORPUS EIRL (RUC: 20549009884) | Sede ID: 497 | Hoja: sanitas corpus
-- ==================================================

-- ==================================================
-- CLIENTE: LU LEON VDA DE PEREZ ANA MARIA (RUC: 10091760547) | Sede ID: 543 | Hoja: ANA MARIA LU
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (543, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 543)) FROM ContratoServicio WHERE id_sede = 543 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pagado', '2026-05-30', 'transferencia', 'BBVA', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45054');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62526', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INSTITUTO ESPECIALIZADO EN SERVICIO DE SALUD SAC (RUC: 20600385411) | Sede ID: 902 | Hoja: INSTITUTO ESPECIALIZADO 
-- ==================================================

-- ==================================================
-- CLIENTE: OFTALMO MEDICAL CENTER S.A.C. (RUC: 20607132454) | Sede ID: 549 | Hoja: OFTALMO MEDICAL CENTER
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICHECK SALUD SAC. (RUC: 20603710658) | Sede ID: 377 | Hoja: SERVICHECK SALUD
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO GINECO OBSTETRICO CONCEBIR EIRL (RUC: 20608547780) | Sede ID: 344 | Hoja: CONCEBIR
-- ==================================================

-- ==================================================
-- CLIENTE: DIAGNODENT S.A.C. (RUC: 20547256639) | Sede ID: 1057 | Hoja: CA- DIAGNODENT
-- ==================================================

-- ==================================================
-- CLIENTE: DIAGNODENT S.A.C. (RUC: 20547256639) | Sede ID: 1067 | Hoja: CO- DIAGNODENT
-- ==================================================

-- ==================================================
-- CLIENTE: LABORATORIO CLÍNICO SAMA S.A.C. (RUC: 20606759178) | Sede ID: 482 | Hoja: LAB CLIN SAMA
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS ESPECIALIZADOS SAN AGUSTIN SAC (RUC: 20554923527) | Sede ID: 348 | Hoja: SERV MED ESP SAN AGUSTIN
-- ==================================================

-- ==================================================
-- CLIENTE: Hernandez Campoverde Zoila (RUC: 10167611341) | Sede ID: 69 | Hoja: ZOILA HERNANDEZ
-- ==================================================

-- ==================================================
-- CLIENTE: MEGAMEDIC L Y A SERVICIOS SAC (RUC: 20515275771) | Sede ID: 971 | Hoja: MeGAMEDIC L Y A SERV
-- ==================================================

-- ==================================================
-- CLIENTE: TELLO ROMANI YURI ROXANA (RUC: 10703453061) | Sede ID: 555 | Hoja: YURI TELLO
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL SALCEDO SAC (RUC: 20615633683) | Sede ID: 954 | Hoja: SALCEDO
-- ==================================================

-- ==================================================
-- CLIENTE: ODONTHO ESPECIALISTAS S.A.C (RUC: 20535640468) | Sede ID: 24 | Hoja: Odontho 
-- ==================================================

-- ==================================================
-- CLIENTE: DIAZ CHAVEZ MARIA ELEANA (RUC: 10077624924) | Sede ID: 1167 | Hoja: DIAZ CHAVEZ MARIA ELEANA 
-- ==================================================

-- ==================================================
-- CLIENTE: PALOMINO CARREÑO MARIELA RUTH (RUC: 10432639971) | Sede ID: 893 | Hoja: PALOMINO CARREÑO MARIELA RUTH 
-- ==================================================

-- ==================================================
-- CLIENTE: FEBRES GARCIA CARLOS AUGUSTO (RUC: 10075417441) | Sede ID: 194 | Hoja: Carlos Febres
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA AMERICANO DENTAL CADE E.I.R.L. (RUC: 20600820690) | Sede ID: 489 | Hoja: CLin Americano dental
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICAS OCLUDENT SAC (RUC: 20513753862) | Sede ID: 993 | Hoja: OCLUDENT
-- ==================================================

-- ==================================================
-- CLIENTE: K Y M ESTHETIC DENT SAC (RUC: 20600723571) | Sede ID: 265 | Hoja: K Y M ESTHETICDENET
-- ==================================================

-- ==================================================
-- CLIENTE: TUNY GALLARDO MARIO VLADIMIR (RUC: 10413218158) | Sede ID: 212 | Hoja: MARIO TUNY
-- ==================================================

-- ==================================================
-- CLIENTE: ASMAT FAJARDO KARINA CECILIA (RUC: 10103432052) | Sede ID: 608 | Hoja: KARINA ASMAT
-- ==================================================

-- ==================================================
-- CLIENTE: MORALES TEODORO ROSA NADIA (RUC: 10403378611) | Sede ID: 928 | Hoja: Rosa Morale
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (928, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 928)) FROM ContratoServicio WHERE id_sede = 928 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62324', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RABANAL FERNANDEZ CESAR RUBEN (RUC: 10267293754) | Sede ID: 797 | Hoja: cesar Rabanal
-- ==================================================

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

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (380, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 380)) FROM ContratoServicio WHERE id_sede = 380 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62599', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RIOS AREVALO JUAN CARLOS (RUC: 10093831123) | Sede ID: 630 | Hoja: JUAN CARLOS RIOS
-- ==================================================

-- ==================================================
-- CLIENTE: VEGA SANCHEZ SILVIA MARIBEL (RUC: 10411402113) | Sede ID: 333 | Hoja: SILVIA VEGA
-- ==================================================

-- ==================================================
-- CLIENTE: PRAIMDENT SOCIEDAD ANONIMA CERRADA (RUC: 20512898387) | Sede ID: 173 | Hoja: PRAIMDENT
-- ==================================================

-- ==================================================
-- CLIENTE: PRESTACIONES ODONTOLOGICAS FRIMAJ DENT E.I.R.L. (RUC: 20601081866) | Sede ID: 519 | Hoja: PRESTACIONES ODONTOLOGICAS
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL CLASS S.A.C. (RUC: 20510975210) | Sede ID: 1179 | Hoja: dental class
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL BELO SORRISO SAC (RUC: 20601192153) | Sede ID: 393 | Hoja: DENTAL BELO SORRISO
-- ==================================================

-- ==================================================
-- CLIENTE: QUISPE MANCO BETTY (RUC: 10409776677) | Sede ID: 248 | Hoja: BETTY QUISPE 
-- ==================================================

-- ==================================================
-- CLIENTE: HUAMAN REYES ALESSANDRA ISABEL (RUC: 10704348563) | Sede ID: 358 | Hoja: ALESSANDRA HUAMAN
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (358, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 358)) FROM ContratoServicio WHERE id_sede = 358 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62598', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO DENTAL GNJ S.A.C. (RUC: 20600453123) | Sede ID: 863 | Hoja: Grupo dental gnj
-- ==================================================

-- ==================================================
-- CLIENTE: SALAZAR BRAVO CLAUDIO MARLON (RUC: 10067700967) | Sede ID: 356 | Hoja: CLAUDIO SALAZAR
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (356, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 356)) FROM ContratoServicio WHERE id_sede = 356 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62462', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: UNIDOS MI PRIMERA SONRISA SAC (RUC: 20604309621) | Sede ID: 790 | Hoja: UNIDOS MI PRIMERA SONRISA
-- ==================================================

-- ==================================================
-- CLIENTE: DENTOLUX SAC (RUC: 20600592654) | Sede ID: 1189 | Hoja: DENTOLUX
-- ==================================================

-- ==================================================
-- CLIENTE: ODONTOLOGIA GOYAS E.I.R.L. (RUC: 20548159211) | Sede ID: 1264 | Hoja: FERNANDO GOYAS 
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL FULLSONRISAS S.A.C. (RUC: 20613766546) | Sede ID: 903 | Hoja:  DENTAL FULLSONRISAS S.A.C.    
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (903, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 903)) FROM ContratoServicio WHERE id_sede = 903 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62466', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: QHALI KAY DENTAL EIRL (RUC: 20604537003) | Sede ID: 1268 | Hoja: QHALI KAY DENTAL
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES DE SALUD Y BELLEZA MORALES S.A.C. (RUC: 20603504284) | Sede ID: 400 | Hoja: INVERS DE SALUD Y BELLEZA MORAL
-- ==================================================

-- ==================================================
-- CLIENTE: RAMOS HERNANDEZ MARIA ELENA (RUC: 10214574123) | Sede ID: 240 | Hoja: MARIA ELENA RAMOS
-- ==================================================

-- ==================================================
-- CLIENTE: CHAVEZ ROSALES ROSA MARIA (RUC: 10410499911) | Sede ID: 213 | Hoja: ROSA CHAVEZ ROSALES
-- ==================================================

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

-- ==================================================
-- CLIENTE: JOSUE BOCANEGRA GAMERO (RUC: 10486192599) | Sede ID: 774 | Hoja: JOSUE BOCANEGRA
-- ==================================================

-- ==================================================
-- CLIENTE: GONZALES GAVIDIA DORA (RUC: 10108681875) | Sede ID: 580 | Hoja: DORA GONZALES
-- ==================================================

-- ==================================================
-- CLIENTE: Intervención Especializada en Neurodesarrollo SAC (RUC: 20605132562) | Sede ID: 331 | Hoja: INTERVENCION ESPECIALIZADA EN N
-- ==================================================

-- ==================================================
-- CLIENTE: MAURA SANCHEZ PACHECO DE HUAMAN (RUC: 10442802306) | Sede ID: 620 | Hoja: MAURA SANCHEZ
-- ==================================================

-- ==================================================
-- CLIENTE: ELIANA MARIA AGUIRRE ALVARADO (RUC: 10200778851) | Sede ID: 1047 | Hoja: ELIANA AGUIRRE
-- ==================================================

-- ==================================================
-- CLIENTE: SAKURA MARU DENTAL SAC (RUC: 20606421339) | Sede ID: 727 | Hoja: SAKURA MARU DENTAL
-- ==================================================

-- ==================================================
-- CLIENTE: LEON VENTOCILLA FREDDY RICARDO (RUC: 10103587692) | Sede ID: 1266 | Hoja: freddy leon
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1266, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1266)) FROM ContratoServicio WHERE id_sede = 1266 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62340', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SURICHAQUI QUISPE PATRICIA (RUC: 10201030574) | Sede ID: 676 | Hoja: patricia surichaqui
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (676, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 676)) FROM ContratoServicio WHERE id_sede = 676 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62607', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HUAPAYA PANDO VICTOR ANDRES (RUC: 10100649620) | Sede ID: 593 | Hoja: victor huapaya
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (593, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 593)) FROM ContratoServicio WHERE id_sede = 593 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62536', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HUAPAYA EGOAVIL MILAGROS ELENA (RUC: 10704331598) | Sede ID: 1271 | Hoja: MILAGROS HUAPAYA 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1271, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1271)) FROM ContratoServicio WHERE id_sede = 1271 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62545', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA ODONTOLOGICA ACSADENT EIRL (RUC: 20515719327) | Sede ID: 370 | Hoja: CLIN ODONT ACSADENT
-- ==================================================

-- ==================================================
-- CLIENTE: Johanna Patricia Gonzales Medina (RUC: 10402491685) | Sede ID: 722 | Hoja: JOHANNA PATRICIA GONZALES MEDIN
-- ==================================================

-- ==================================================
-- CLIENTE: Tsukamoto Vilchez Luis (RUC: 10067253871) | Sede ID: 47 | Hoja: LUIS TSUKAMOTO
-- ==================================================

-- ==================================================
-- CLIENTE: CREART SALUD SAC (RUC: 20601663041) | Sede ID: 389 | Hoja: CREART SALUD
-- ==================================================

-- ==================================================
-- CLIENTE: JESUS WILFREDO DE LA ROCA GARIBAY (RUC: 10104448751) | Sede ID: 673 | Hoja: JESUS DE LA ROCA
-- ==================================================

-- ==================================================
-- CLIENTE: VICTORIO VELASQUEZ YAQUELIN ROCIO (RUC: 10412601845) | Sede ID: 531 | Hoja: YAQUELIN VICTORIO
-- ==================================================

-- ==================================================
-- CLIENTE: RAMIREZ DEZA HENRY WILMAN (RUC: 10103447025) | Sede ID: 373 | Hoja: HENRY RAMIREZ
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (373, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 373)) FROM ContratoServicio WHERE id_sede = 373 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62319', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HUANCA GARCIA BENNY DAVID (RUC: 10107979081) | Sede ID: 491 | Hoja: BENNY HUANCA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (491, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 491)) FROM ContratoServicio WHERE id_sede = 491 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62334', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: N Y L SERVICE DENT SAC (RUC: 20513940891) | Sede ID: 338 | Hoja: N Y L SERVICE
-- ==================================================

-- ==================================================
-- CLIENTE: HBL S.R.L. (RUC: 20548396850) | Sede ID: 50 | Hoja: HBL 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (50, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 50)) FROM ContratoServicio WHERE id_sede = 50 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62522', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GASTRO ENDOSCOPY E.I.R.L. (RUC: 20602289649) | Sede ID: 1357 | Hoja: GASTRO ENDOSCOPY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1357, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1357)) FROM ContratoServicio WHERE id_sede = 1357 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);

-- ==================================================
-- CLIENTE: VERGARA FELICES LUIS ALBERTO (RUC: 10077371864) | Sede ID: 51 | Hoja: luis vergara
-- ==================================================

-- ==================================================
-- CLIENTE: CECILIA ROSARIO HOSPINA MEZA (RUC: 10091776460) | Sede ID: 1130 | Hoja: CECILIA HOSPINA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1130, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1130)) FROM ContratoServicio WHERE id_sede = 1130 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62553', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Tacuche Mesia Carlos (RUC: 10097385888) | Sede ID: 1186 | Hoja: carlos tacuche
-- ==================================================

-- ==================================================
-- CLIENTE: LIVIAC ANICAMA ERIKA YANETH (RUC: 10422988276) | Sede ID: 52 | Hoja: LIVIAC ANICAMA  ERIKA YANETH
-- ==================================================

-- ==================================================
-- CLIENTE: CUELLAR VELAOCHAGA GABRIELA INES (RUC: 10724242451) | Sede ID: 1023 | Hoja: GABRIELA CUELLAR
-- ==================================================

-- ==================================================
-- CLIENTE: C. D. Romodent EIRL (RUC: 20518558171) | Sede ID: 589 | Hoja: CLIN DENTAL ROMODENT
-- ==================================================

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

-- ==================================================
-- CLIENTE: JOE RAMIREZ GUZMAN (RUC: 10101934638) | Sede ID: 53 | Hoja: JOE RAMIREZ
-- ==================================================

-- ==================================================
-- CLIENTE: Hernandez Roman Gabriela Noemi (RUC: 10458499620) | Sede ID: 298 | Hoja: GABRIELA HERNANDEZ
-- ==================================================

-- ==================================================
-- CLIENTE: YVONNE OLIVIA OLIVARES TAIPE (RUC: 10218571871) | Sede ID: 206 | Hoja: YVONNE OLIVARES
-- ==================================================

-- ==================================================
-- CLIENTE: TAML ODONTOLOGOS SAC (RUC: 20514310654) | Sede ID: 693 | Hoja: TAML ODONTOLOGOS
-- ==================================================

-- ==================================================
-- CLIENTE: SALLO QUISPE CARMEN ABIGAIL (RUC: 10459779430) | Sede ID: 1275 | Hoja: CARMEN SALLO
-- ==================================================

-- ==================================================
-- CLIENTE: ARHUIS VELASQUEZ WILLIAM (RUC: 10431625461) | Sede ID: 60 | Hoja: WILLIAM ARHUIS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (60, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 60)) FROM ContratoServicio WHERE id_sede = 60 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pagado', '2026-06-05', 'transferencia', 'YAPE', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45034');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62523', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO DE NUEVA GENERACION SONRIE S.A.C. (RUC: 20605325727) | Sede ID: 229 | Hoja: CENTR ODONT NUEVA GEN SONRIE
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL LITTLE KIDS E.I.R.L. (RUC: 20535905780) | Sede ID: 1270 | Hoja: DENTAL LITTLE KIDS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1270, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1270)) FROM ContratoServicio WHERE id_sede = 1270 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62322', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CORPORACION HIDALGO S.A.C. (RUC: 20538101525) | Sede ID: 941 | Hoja: CORPORACION HIDALGO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (941, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 941)) FROM ContratoServicio WHERE id_sede = 941 AND activo = 1), 'MAYO', '2026-06-16', 'completado', 'pagado', '2026-06-08', 'transferencia', 'YAPE', 10.00, NULL);

-- ==================================================
-- CLIENTE: GRUPO SALUD SOLIS DÁVILA S.A.C. (RUC: 20603671288) | Sede ID: 927 | Hoja: GRUPO SALUD SOLIS
-- ==================================================

-- ==================================================
-- CLIENTE: N Y A ALERTA VET S.A.C (RUC: 20563786265) | Sede ID: 1231 | Hoja: N Y A ALERTA VET SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Mayorca Perez Sandro Oliver (RUC: 10076375742) | Sede ID: 374 | Hoja: SANDRO MAYORCA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (374, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 374)) FROM ContratoServicio WHERE id_sede = 374 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62320', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: FAMILIA MUELITAS SAC (RUC: 20615598349) | Sede ID: 1475 | Hoja: FAMILIA MUELITAS SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE ORTODONCIA Y REHABILITACION ESPECIALIZADA S.A.C. (RUC: 20606350610) | Sede ID: 737 | Hoja: CENTRO DE ORTODONCIA Y REHAB
-- ==================================================

-- ==================================================
-- CLIENTE: JOSELYN CASTRO ZAMBRANO (RUC: 10744650319) | Sede ID: 1126 | Hoja: JOSELYN CASTRO
-- ==================================================

-- ==================================================
-- CLIENTE: ILLUMINANCE DENTAL E.I.R.L. (RUC: 20610637591) | Sede ID: 838 | Hoja: MILAGROS LIZ DEL AGUILA
-- ==================================================

-- ==================================================
-- CLIENTE: TREMOLADAS E.I.R.L. (RUC: 20607117544) | Sede ID: 1100 | Hoja: TREMOLADAS
-- ==================================================

-- ==================================================
-- CLIENTE: RG ODONTOLOGOS EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - RGO E.I.R.L. (RUC: 20605128191) | Sede ID: 1206 | Hoja: CERRADO5
-- ==================================================

-- ==================================================
-- CLIENTE: RG ODONTOLOGOS EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - RGO E.I.R.L. (RUC: 20605128191) | Sede ID: 1206 | Hoja: RG ODONTOLOGOS
-- ==================================================

-- ==================================================
-- CLIENTE: CADEL SONRISAS S.A.C. (RUC: 20608025945) | Sede ID: 72 | Hoja: CADEL SONRISAS
-- ==================================================

-- ==================================================
-- CLIENTE: RICHARD QUISPE CANGAHUALA (RUC: 10471130732) | Sede ID: 339 | Hoja: RICHARD QUISPE
-- ==================================================

-- ==================================================
-- CLIENTE: YESIKA YUDITH SOLIS YNOUYE (RUC: 10096362451) | Sede ID: 952 | Hoja: YESIKA SOLIS
-- ==================================================

-- ==================================================
-- CLIENTE: Arturo Kobayashi Shinya (RUC: 10066296461) | Sede ID: 1262 | Hoja: ARTURO KOBAYASHI
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DENTAL TROY DENT EIRL (RUC: 20602928137) | Sede ID: 963 | Hoja: CENTRO DENTAL TROY DENT
-- ==================================================

-- ==================================================
-- CLIENTE: DENTICARE ODONTOLOGIA E.I.R.L. (RUC: 20607058742) | Sede ID: 521 | Hoja: DENTICARE
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL RADIANTE DENT EIRL (RUC: 20606610875) | Sede ID: 287 | Hoja: CONS DENT RADIANTE
-- ==================================================

-- ==================================================
-- CLIENTE: PETS SHOP LA MOLINA SOCIEDAD ANONIMA CERRADA (RUC: 20509844357) | Sede ID: 1139 | Hoja: Pets Shop La Molina
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1139, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1139)) FROM ContratoServicio WHERE id_sede = 1139 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pagado', '2025-08-12', 'transferencia', 'BCP', 83.30, 'BIOCONTAMINADO');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36638');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62542', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1139, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1139)) FROM ContratoServicio WHERE id_sede = 1139 AND activo = 1), 'JULIO', '2026-07-05', 'completado', 'pagado', '2025-08-12', 'transferencia', 'BCP', 83.30, 'BIOCONTAMINADO');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36638');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1139, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1139)) FROM ContratoServicio WHERE id_sede = 1139 AND activo = 1), 'AGOSTO', '2026-08-05', 'completado', 'pagado', '2025-08-12', 'transferencia', 'BCP', 83.30, 'BIOCONTAMINADO');
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36638');

-- ==================================================
-- CLIENTE: DOCTOR MASCOTA S.A.C. (RUC: 20606028581) | Sede ID: 330 | Hoja: SM-DOCTORMASCOTA
-- ==================================================

-- ==================================================
-- CLIENTE: ZEGARRA ALVA TEOFILO (RUC: 10102510246) | Sede ID: 1036 | Hoja: A-Teofilo Zegarra 
-- ==================================================

-- ==================================================
-- CLIENTE: ZEGARRA ALVA TEOFILO (RUC: 10102510246) | Sede ID: 1036 | Hoja: J-Teofilo Zegarra
-- ==================================================

-- ==================================================
-- CLIENTE: UCIVET SAC (RUC: 20601498902) | Sede ID: 1140 | Hoja: Ucivet
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1140, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1140)) FROM ContratoServicio WHERE id_sede = 1140 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62506', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: UCIVET SAC (RUC: 20601498902) | Sede ID: 1140 | Hoja: Ucivetesp
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA SAN GABRIEL SAC (RUC: 20600539699) | Sede ID: 628 | Hoja: san gabriel
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (628, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 628)) FROM ContratoServicio WHERE id_sede = 628 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62602', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: FAMONT PETS SAC (RUC: 20523984447) | Sede ID: 587 | Hoja: Famont pets
-- ==================================================

-- ==================================================
-- CLIENTE: CLUB MASCOTA VETERINARIA S.A.C. (RUC: 20600496132) | Sede ID: 422 | Hoja: Club Mascota
-- ==================================================

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: SMP-EL HURON AZUL E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: MONTOYA GRANDA LOURDES LERIDA (RUC: 10084195648) | Sede ID: 864 | Hoja: Lourdes Montoya
-- ==================================================

-- ==================================================
-- CLIENTE: ODONTOTRENDS SAC (RUC: 20607572713) | Sede ID: 1136 | Hoja: ODONTOTRENDS SAC
-- ==================================================

-- ==================================================
-- CLIENTE: ANIMAL CLINIC PERU E.I.R.L. (RUC: 20602364128) | Sede ID: 183 | Hoja:  Animal Clinic Peru Chorrilo
-- ==================================================

-- ==================================================
-- CLIENTE: GALINDO TIPISMANA ALVARO (RUC: 10717902888) | Sede ID: 35 | Hoja: Alvaro Galindo
-- ==================================================

-- ==================================================
-- CLIENTE: AGUIRRE BELLIDO DE JARA CARLA SANDRIA AMALIA (RUC: 10099314058) | Sede ID: 1137 | Hoja: Aguirre Carla vet san miguel
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA SATELITE EIRL (RUC: 20601313872) | Sede ID: 911 | Hoja: VET Satelite
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA FELIVET EIRL (RUC: 20556644471) | Sede ID: 867 | Hoja: VETERINARIA FELIVET
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA BASTET SALUKI EIRL (RUC: 20605875352) | Sede ID: 188 | Hoja: Bastet Saluki
-- ==================================================

-- ==================================================
-- CLIENTE: Veterinaria el gran danés SAC (RUC: 20603630689) | Sede ID: 1131 | Hoja: CA-vet el Gran Danes 
-- ==================================================

-- ==================================================
-- CLIENTE: Veterinaria el gran danés SAC (RUC: 20603630689) | Sede ID: 48 | Hoja: CO-vet el Gran Danes
-- ==================================================

-- ==================================================
-- CLIENTE: LAVANDA PACHECO JUAN CARLOS (RUC: 10218633434) | Sede ID: 1185 | Hoja: juan carlos lavanda
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION VETERINARIA G&S SAC (RUC: 20603775016) | Sede ID: 645 | Hoja: CORP vet g y s
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (645, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 645)) FROM ContratoServicio WHERE id_sede = 645 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62604', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET D MASCOTA SAC (RUC: 20547105185) | Sede ID: 1187 | Hoja: vet d mascota
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES ARIAS LEGUA S.A.C. (RUC: 20604586501) | Sede ID: 740 | Hoja: inver arias 
-- ==================================================

-- ==================================================
-- CLIENTE: GOMEZ HIDALGO MARGARITA BEATRIZ (RUC: 10098642701) | Sede ID: 1244 | Hoja: Margarita Gomez
-- ==================================================

-- ==================================================
-- CLIENTE: LORD PETS E.I.R.L. (RUC: 20549113436) | Sede ID: 1122 | Hoja: LORD PETS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1122, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1122)) FROM ContratoServicio WHERE id_sede = 1122 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62321', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VETERINARIA UNIDAS SJL E.I.R.L. (RUC: 20605127909) | Sede ID: 305 | Hoja: vet unidas
-- ==================================================

-- ==================================================
-- CLIENTE: ESPECIALIDADES MEDICAS VETERINARIAS S.A.C. - ESMEVET (RUC: 20608063936) | Sede ID: 1091 | Hoja: ESPECIALIDADES MEDICAS VETERINA
-- ==================================================

-- ==================================================
-- CLIENTE: VET CORP SAC (RUC: 20514178527) | Sede ID: 367 | Hoja: vetcorp
-- ==================================================

-- ==================================================
-- CLIENTE: PRIVET EIRL (RUC: 20603012411) | Sede ID: 563 | Hoja: PRIVET SAC
-- ==================================================

-- ==================================================
-- CLIENTE: ESTACION VETERINARIA S.A.C. (RUC: 20602600301) | Sede ID: 554 | Hoja: estacion vet 
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA SASH SA (RUC: 20601150205) | Sede ID: 969 | Hoja: clin vet SASH
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (969, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 969)) FROM ContratoServicio WHERE id_sede = 969 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62469', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CANALES PEREZ CLAUDIA CECILIA (RUC: 10421439929) | Sede ID: 16 | Hoja: CLAUDIA CANALES
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA DEL RIO EIRL (RUC: 20614180952) | Sede ID: 1327 | Hoja: VETERINARIA DEL RIO EIR
-- ==================================================

-- ==================================================
-- CLIENTE: ELGUERA DELGADO SANDRA (RUC: 10474020440) | Sede ID: 687 | Hoja: sandra elguera
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES BORE SAC (RUC: 20602673678) | Sede ID: 1234 | Hoja: INV BORE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1234, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1234)) FROM ContratoServicio WHERE id_sede = 1234 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62544', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS VETERINARIOS FIOREVET E.I.R.L. (RUC: 20600604105) | Sede ID: 366 | Hoja: VET FIOREVET
-- ==================================================

-- ==================================================
-- CLIENTE: IPROVET EIRL (RUC: 20604354146) | Sede ID: 288 | Hoja: iprovet
-- ==================================================

-- ==================================================
-- CLIENTE: RAYMUNDO TINTAYO FERNANDO JULIAN (RUC: 10101974567) | Sede ID: 290 | Hoja: FERNANDO RAYMUNDO
-- ==================================================

-- ==================================================
-- CLIENTE: UZURIAGA ALVARADO ELIZABETH EMILIA (RUC: 10225152069) | Sede ID: 1175 | Hoja: elizabeth uzuriaga
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1175, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1175)) FROM ContratoServicio WHERE id_sede = 1175 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62476', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CELI ARELLANO ROXANA OLENKA (RUC: 10418272355) | Sede ID: 1194 | Hoja: ROXANA CELI
-- ==================================================

-- ==================================================
-- CLIENTE: QS VET SAC (RUC: 20602371515) | Sede ID: 890 | Hoja: QS VET 
-- ==================================================

-- ==================================================
-- CLIENTE: PET SHOP PERU SERVICIOS CANINO SAC (RUC: 20604435847) | Sede ID: 1078 | Hoja: PET SHOP PERU SERV CANINNO
-- ==================================================

-- ==================================================
-- CLIENTE: GOCO SPET SAC (RUC: 20605402578) | Sede ID: 318 | Hoja: GOCOSPET
-- ==================================================

-- ==================================================
-- CLIENTE: PINCHI HILDEBRANDT JAVIER (RUC: 10079452209) | Sede ID: 1045 | Hoja: JAVIER PINCHI
-- ==================================================

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 1162 | Hoja: PET MAX SAC magdalena
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1162, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1162)) FROM ContratoServicio WHERE id_sede = 1162 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62453', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 792 | Hoja: PET MAX - BENAVIDES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (792, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 792)) FROM ContratoServicio WHERE id_sede = 792 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62448', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 795 | Hoja: PETMAX SAC san borja
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (795, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 795)) FROM ContratoServicio WHERE id_sede = 795 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, 'transferencia', NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62449', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MONTES DIAZ MONICA LISSETH (RUC: 10407511617) | Sede ID: 854 | Hoja: MONICA MONTES
-- ==================================================

-- ==================================================
-- CLIENTE: NOW PET FOOD DELIVERY S.A.C. (RUC: 20602550771) | Sede ID: 660 | Hoja: NOW PET FOOD DELIVERY
-- ==================================================

-- ==================================================
-- CLIENTE: LEVANO PACHAS RACIEL ANTONIO (RUC: 10218813009) | Sede ID: 741 | Hoja: RACIEL LEVANO
-- ==================================================

-- ==================================================
-- CLIENTE: GUTIERREZ DEL VALLE CLAUDIA ISABEL (RUC: 10107106869) | Sede ID: 320 | Hoja: SERV VET INTEGRALES
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES JL TASAYCO E.I.R.L. (RUC: 20607028606) | Sede ID: 1198 | Hoja: INVERSIONES JL TASAYCO E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: IBARRA YUPANQUI PAUL JHON (RUC: 10428015164) | Sede ID: 976 | Hoja: PAUL IBARRA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (976, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 976)) FROM ContratoServicio WHERE id_sede = 976 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62470', 'BIOCONTAMINADO', 0.00);

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

-- ==================================================
-- CLIENTE: SERVICIOS VETERINARIOS ESPECIALIZADOS S.A.C. (RUC: 20551542280) | Sede ID: 1132 | Hoja: BORJA PETS PLACE 
-- ==================================================

-- ==================================================
-- CLIENTE: ZUAZO CORTEZ MILAGRITOS ADRIANA (RUC: 10222999869) | Sede ID: 575 | Hoja: MILAGRITOS ZUAZO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (575, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 575)) FROM ContratoServicio WHERE id_sede = 575 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pagado', '2026-06-05', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45036');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62531', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIAS S.A.C. (RUC: 20604685126) | Sede ID: 1348 | Hoja: CF-EL DORADO
-- ==================================================

-- ==================================================
-- CLIENTE: CUATRO PATAS S.A.C. (RUC: 20506759715) | Sede ID: 576 | Hoja: CUATRO PATAS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (576, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 576)) FROM ContratoServicio WHERE id_sede = 576 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62532', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ESPECIALIDADES VETERINARIAS EIRL (RUC: 20493029241) | Sede ID: 859 | Hoja: ESPECIALIDADES VETERINARIAS 
-- ==================================================

-- ==================================================
-- CLIENTE: MARCO DIAZ SERVICIOS VETERINARIOS EIRL (RUC: 20606290498) | Sede ID: 811 | Hoja: marco diaz serv
-- ==================================================

-- ==================================================
-- CLIENTE: PET ID SAC (RUC: 20602765041) | Sede ID: 30 | Hoja: PET ID 
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA EL PALMAR EIRL (RUC: 20544039173) | Sede ID: 559 | Hoja: VET EL PALMAR
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES EL HURON AZUL EIRL (RUC: 20602159826) | Sede ID: 473 | Hoja: SM-REPRESENTACIONESELHURONAZUL 
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES EL HURON AZUL EIRL (RUC: 20602159826) | Sede ID: 463 | Hoja: C-REPRESENTACIONESELHURONAZUL
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES EL HURON AZUL EIRL (RUC: 20602159826) | Sede ID: 463 | Hoja: CERRADO2
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIAS SAC (RUC: 20601401038) | Sede ID: 459 | Hoja: C-INVERSIONES EL HURON AZUL
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO GRESE EIRL (RUC: 20609318709) | Sede ID: 1347 | Hoja: GRUPO GRESE EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: MI PATAZA EIRL (RUC: 20600890957) | Sede ID: 751 | Hoja: MI PATAZA
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA MATUTE SAC (RUC: 20614380188) | Sede ID: 1377 | Hoja: MARIA ELENA MATUTE
-- ==================================================

-- ==================================================
-- CLIENTE: GABUS VET SAC (RUC: 20548058610) | Sede ID: 196 | Hoja: GABUS VET
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA ORBEGOSO EIRL (RUC: 20338615915) | Sede ID: 925 | Hoja: VETERINARIA ORBEGOSO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (925, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 925)) FROM ContratoServicio WHERE id_sede = 925 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62456', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET SERVICE & CIA E.I.R.L (RUC: 20602683169) | Sede ID: 803 | Hoja: health y medical vet
-- ==================================================

-- ==================================================
-- CLIENTE: CLIVET PANDA SAC (RUC: 20602340962) | Sede ID: 1165 | Hoja: CLIVET PANDA
-- ==================================================

-- ==================================================
-- CLIENTE: MASTER IN PETS EIRL (RUC: 20544713354) | Sede ID: 286 | Hoja: MASTER IN PETS
-- ==================================================

-- ==================================================
-- CLIENTE: LOVE & PETS VETERINARIAS SAC (RUC: 20610706747) | Sede ID: 1221 | Hoja: LOVE & PETS VETERINARIAS
-- ==================================================

-- ==================================================
-- CLIENTE: JOSE WILFREDO MARTINES MONTAÑEZ (RUC: 10257786001) | Sede ID: 1106 | Hoja: jose martinez
-- ==================================================

-- ==================================================
-- CLIENTE: HOSPITAL VETERINARIO HUELLAS Y MAS HUELLAS SAC (RUC: 20566086566) | Sede ID: 342 | Hoja: HOSPITAL VET HUELLAS Y MAS HUE
-- ==================================================

-- ==================================================
-- CLIENTE: CARLOS RAMIRO POLO RAMIREZ (RUC: 10257259078) | Sede ID: 285 | Hoja: CARLOS POLO
-- ==================================================

-- ==================================================
-- CLIENTE: AMELIA SOLIS CHAVEZ (RUC: 10409151880) | Sede ID: 267 | Hoja: AMELIA SOLIS
-- ==================================================

-- ==================================================
-- CLIENTE: GOGIN ARMAS ERIKA ROSA (RUC: 10104774500) | Sede ID: 201 | Hoja: ERIKA GOGIN
-- ==================================================

-- ==================================================
-- CLIENTE: CAMILO´S VET SAC (RUC: 20548927995) | Sede ID: 1152 | Hoja: CAMILOS VET
-- ==================================================

-- ==================================================
-- CLIENTE: DANIELA DEL ROSARIO PALACIOS BARBA (RUC: 10734263708) | Sede ID: 36 | Hoja: DANIELA DEL ROSARIO PALACIOS
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA UNIVERSAL PETS SAC (RUC: 20524244293) | Sede ID: 278 | Hoja: CLIN VET UNIV
-- ==================================================

-- ==================================================
-- CLIENTE: RUBEN ANTONIO GALINDO ROCA (RUC: 10417525357) | Sede ID: 39 | Hoja: RUBEN GALINDO
-- ==================================================

-- ==================================================
-- CLIENTE: CESAR PHOL CASAVILCA SIMON (RUC: 10722058181) | Sede ID: 215 | Hoja: P-CESAR CASALVICA
-- ==================================================

-- ==================================================
-- CLIENTE: Fredy Daniel Vilca Ninaja (RUC: 10012965635) | Sede ID: 291 | Hoja: FREDY VILCA
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS Y NEGOCIOS VETERINARIOS EL ALISO E.I.R.L. (RUC: 20600957300) | Sede ID: 157 | Hoja: serv y neg el aliso
-- ==================================================

-- ==================================================
-- CLIENTE: PET FRIENDLY SAC (RUC: 20601084628) | Sede ID: 455 | Hoja: PET FRIENDLY
-- ==================================================

-- ==================================================
-- CLIENTE: MARIA VALDEZ CARPIO (RUC: 10100626646) | Sede ID: 336 | Hoja: María Valdez
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (336, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 336)) FROM ContratoServicio WHERE id_sede = 336 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62461', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Roberto Antonio Prieto Santos (RUC: 10401376254) | Sede ID: 421 | Hoja: roberto prieto
-- ==================================================

-- ==================================================
-- CLIENTE: MARISA NINAHUANCA PALOMINO (RUC: 10215484063) | Sede ID: 1226 | Hoja: MARIsA NINAHUANCA
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA SAN JUDAS TADEO E. I. R. L. (RUC: 20612088731) | Sede ID: 1471 | Hoja: KARINA CABELLO
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA MI CACHORRITO SAC (RUC: 20545373441) | Sede ID: 994 | Hoja: vet mi cachorrito
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA MI CACHORRITO SAC (RUC: 20545373441) | Sede ID: 994 | Hoja: VET MI CACHORRITO COM
-- ==================================================

-- ==================================================
-- CLIENTE: INTEGRAL VET SAC (RUC: 20508507730) | Sede ID: 984 | Hoja: INTEGRAL VET
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA SAN MARCOS SAC (RUC: 20554422072) | Sede ID: 230 | Hoja: VET SAN MARCOS
-- ==================================================

-- ==================================================
-- CLIENTE: Zavala Carlos Magali Inés (RUC: 10420138241) | Sede ID: 368 | Hoja: MAGALI ZAVALA
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA ACEVEDO EIRL (RUC: 20601872227) | Sede ID: 284 | Hoja: clin vet ACEVEDO (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA ACEVEDO EIRL (RUC: 20601872227) | Sede ID: 284 | Hoja: clin vet ACEVEDO
-- ==================================================

-- ==================================================
-- CLIENTE: Laura Elizabeth Acuña Alvarez (RUC: 10714468222) | Sede ID: 300 | Hoja: LAURA ACUÑA
-- ==================================================

-- ==================================================
-- CLIENTE: CESAR PHOL CASAVILCA SIMON (RUC: 10722058181) | Sede ID: 215 | Hoja: A-CESAR CASAVILCA SIMON
-- ==================================================

-- ==================================================
-- CLIENTE: Silva Neyra Celia Rocio (RUC: 10061447003) | Sede ID: 953 | Hoja: SILVIA NEYRA
-- ==================================================

-- ==================================================
-- CLIENTE: LEONARDO GALINDO JURADO (RUC: 10700301686) | Sede ID: 41 | Hoja: LEONARDO GALINDO
-- ==================================================

-- ==================================================
-- CLIENTE: Silva Neyra Celia Rocio (RUC: 10061447003) | Sede ID: 953 | Hoja: CERRADO9
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Diagnostico Veterinario SAC (RUC: 20604188688) | Sede ID: 1306 | Hoja: CLIN DIAGNOSTICO VET
-- ==================================================

-- ==================================================
-- CLIENTE: WALAC SAC (RUC: 20536780506) | Sede ID: 719 | Hoja: WALAC
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA D´MASKOTAS S.A.C. (RUC: 20605942742) | Sede ID: 346 | Hoja: COMAS-MASKOTAS
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES JMRI SAC (RUC: 20607354856) | Sede ID: 1338 | Hoja: INV JMRI
-- ==================================================

-- ==================================================
-- CLIENTE: ZOO MEDIC VETERINARIA SAC (RUC: 20605826629) | Sede ID: 46 | Hoja: ZOO MEDIC VET
-- ==================================================

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

-- ==================================================
-- CLIENTE: JOSE FERNANDO NUÑEZ VICAÑA (RUC: 10098519781) | Sede ID: 887 | Hoja: JOSE NUÑEZ
-- ==================================================

-- ==================================================
-- CLIENTE: ERNESTO EUDALDO SAAVEDRA MEZONES (RUC: 10067484083) | Sede ID: 571 | Hoja: ERNESTO SAAVEDRA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (571, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 571)) FROM ContratoServicio WHERE id_sede = 571 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62529', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CACEDA MARQUINA VICTOR OSWALDO (RUC: 10188640015) | Sede ID: 1272 | Hoja: victor caceda
-- ==================================================

-- ==================================================
-- CLIENTE: JULIA ALICIA ASLLA ESPINOZA (RUC: 10436041620) | Sede ID: 643 | Hoja: JULIA ASLLA
-- ==================================================

-- ==================================================
-- CLIENTE: VICENTELO ALVAN JOSE VICTOR (RUC: 10066449594) | Sede ID: 642 | Hoja: JOSE VICENTELO
-- ==================================================

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

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (980, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 980)) FROM ContratoServicio WHERE id_sede = 980 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62473', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: BIOSERVET SRL (RUC: 20509303194) | Sede ID: 1110 | Hoja: BIOSERVET
-- ==================================================

-- ==================================================
-- CLIENTE: BIOSERVET SRL (RUC: 20509303194) | Sede ID: 1110 | Hoja: BIOSERVET 
-- ==================================================

-- ==================================================
-- CLIENTE: Marinazoo EIRL (RUC: 20554278443) | Sede ID: 49 | Hoja: MARINAZOO
-- ==================================================

-- ==================================================
-- CLIENTE: Inversiones Glory SAC (RUC: 20609885999) | Sede ID: 747 | Hoja: JUAN CARLOS CESPEDES
-- ==================================================

-- ==================================================
-- CLIENTE: SALAZAR GUTIERREZ MIGUEL ANGEL (RUC: 10100259546) | Sede ID: 83 | Hoja: MIGUEL SALAZAR
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA WASY VET E.I.R.L (RUC: 20604020931) | Sede ID: 965 | Hoja: VET WASY VET
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA SAN JUAN MACIAS SRL (RUC: 20605479546) | Sede ID: 1133 | Hoja: CLIN VET SAN JUAN MACIAS
-- ==================================================

-- ==================================================
-- CLIENTE: EDUARDO PAREDES MUÑOZ (RUC: 10257759038) | Sede ID: 972 | Hoja: EDUARDO PAREDES
-- ==================================================

-- ==================================================
-- CLIENTE: CLINIVET LASSY EIRL (RUC: 20514715808) | Sede ID: 271 | Hoja: CLINIVET LASSY
-- ==================================================

-- ==================================================
-- CLIENTE: MARILU PANTOJA AQUINO (RUC: 10102144487) | Sede ID: 55 | Hoja: MARILU PANTOJA
-- ==================================================

-- ==================================================
-- CLIENTE: CLINIVET LASSY EIRL (RUC: 20514715808) | Sede ID: 271 | Hoja: CERRADO10
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA ANIMAL LIFE S.A.C. (RUC: 20506975680) | Sede ID: 573 | Hoja: VET ANIMAL LIFE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (573, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 573)) FROM ContratoServicio WHERE id_sede = 573 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62555', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: AYBAR VASQUEZ MIXI GRISELDA (RUC: 10215616920) | Sede ID: 534 | Hoja: MIXI AYBAR
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO OFTALMOLOGICO DR. GERONIMO EIRL (RUC: 20609329298) | Sede ID: 1141 | Hoja: CENTRO OFTALMOLOGICO DR. GERONI
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1141, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1141)) FROM ContratoServicio WHERE id_sede = 1141 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62329', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CASTRO WHU MIRKO ALEXIS (RUC: 10103490249) | Sede ID: 1108 | Hoja: MIRKO CASTRO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1108, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1108)) FROM ContratoServicio WHERE id_sede = 1108 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pagado', '2026-06-02', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45032');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62327', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ANIMAL LIFE EXTRA CARE S.A.C. (RUC: 20517811557) | Sede ID: 566 | Hoja: ANIMAL LIFE EXTRA CARE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (566, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 566)) FROM ContratoServicio WHERE id_sede = 566 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62528', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: TOCON VALDIVIEZO LIZET VANESSA (RUC: 10422645514) | Sede ID: 65 | Hoja: LISET TOCON
-- ==================================================

-- ==================================================
-- CLIENTE: EVERPETS SAC (RUC: 20554613412) | Sede ID: 1245 | Hoja: EVERPETS
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA SOLO PATAS S.A.C. (RUC: 20607644960) | Sede ID: 857 | Hoja: veterinaria solo patas
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO MEDICO VETERINARIO SURCO S.A.C. (RUC: 20604139121) | Sede ID: 411 | Hoja: CENTRO MED VET SURCO (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO MEDICO VETERINARIO SURCO S.A.C. (RUC: 20604139121) | Sede ID: 411 | Hoja: CENTRO MED VET SURCO
-- ==================================================

-- ==================================================
-- CLIENTE: DERMIVET S.A.C. (RUC: 20603880421) | Sede ID: 764 | Hoja: DERMIVET
-- ==================================================

-- ==================================================
-- CLIENTE: MATIAS VET E.I.R.L (RUC: 20557975366) | Sede ID: 74 | Hoja: MATIAS VET (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (74, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 74)) FROM ContratoServicio WHERE id_sede = 74 AND activo = 1), 'MAYO', '2024-05-02', 'completado', 'pendiente', NULL, NULL, NULL, 69.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '23567');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (74, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 74)) FROM ContratoServicio WHERE id_sede = 74 AND activo = 1), 'JUNIO', '2024-06-02', 'completado', 'pagado', NULL, 'efectivo', 'CANCELADO 1CONT. ADIC.', 69.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '25207');

-- ==================================================
-- CLIENTE: MATIAS VET E.I.R.L (RUC: 20557975366) | Sede ID: 74 | Hoja: MATIAS VET
-- ==================================================

-- ==================================================
-- CLIENTE: PAWS & TAILS E.I.R.L. (RUC: 20600836855) | Sede ID: 855 | Hoja: PAWS & TAILS E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: ORTIZ PEÑA DE MARQUINA ROSA MARIA ANDREA (RUC: 10099778313) | Sede ID: 968 | Hoja: ORTIZ PEÑA DE MARQUINA ROSA MAR
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO MEDICO VETERINARIO MEDIC VET E.I.R.L (RUC: 20543825612) | Sede ID: 866 | Hoja: CENTRO MEDICO VETERINARIO MEDIC
-- ==================================================

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
VALUES (440, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 440)) FROM ContratoServicio WHERE id_sede = 440 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62454', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: HAPPY TOOTH E.I.R.L (RUC: 20546685897) | Sede ID: 214 | Hoja: HAPPY TOOTH EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: TORRES LIZAMA CLAUDIA PATRICIA (RUC: 10455032607) | Sede ID: 209 | Hoja: TORRES LIZAMA CLAUDIA PATRICIA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (209, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 209)) FROM ContratoServicio WHERE id_sede = 209 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pagado', '2026-06-05', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45035');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62459', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: APONTE SOLANO CLAUDIA HERLINDA (RUC: 10423137563) | Sede ID: 225 | Hoja: CLAUDIA HERLINDA APONTE SOLANO
-- ==================================================

-- ==================================================
-- CLIENTE: DANI PETS & VET S.A.C. (RUC: 20503481309) | Sede ID: 796 | Hoja: DANI PETS & VET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: DR. ALPACA S.A.C. (RUC: 20602297218) | Sede ID: 1228 | Hoja: DR. ALPACA S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: RAQUEL REBECA ALIAGA HERMOZA (RUC: 10405920498) | Sede ID: 644 | Hoja: RAQUEL REBECA ALIAGA HERMOZA
-- ==================================================

-- ==================================================
-- CLIENTE: DENTASHOP YOCHAVEL S.A.C. (RUC: 20603046294) | Sede ID: 675 | Hoja: DENTASHOP YOCHAVEL S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CHILENO CORDOVA FERNANDO JAVIER (RUC: 10103058398) | Sede ID: 220 | Hoja: CHILENO CORDOVA FERNANDO JAVIER
-- ==================================================

-- ==================================================
-- CLIENTE: Grupo consorcio veterinario sac (RUC: 20607299944) | Sede ID: 78 | Hoja: Grupo consorcio veterinario sac
-- ==================================================

-- ==================================================
-- CLIENTE: G & G VETS FAMILY E.I.R.L. (RUC: 20607102288) | Sede ID: 263 | Hoja: G & G VETS FAMILY E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: GUZMAN SOLIS CARLOS SANDRO (RUC: 10416495497) | Sede ID: 650 | Hoja: GUZMAN SOLIS CARLOS SANDRO
-- ==================================================

-- ==================================================
-- CLIENTE: PRESTACIONES INNOVADORAS DENTALES SRL (RUC: 20554678620) | Sede ID: 726 | Hoja: PRESTACIONES INNOVADORAS DENTAL
-- ==================================================

-- ==================================================
-- CLIENTE: ACHANCARAY ROJAS WILFREDO (RUC: 10094084089) | Sede ID: 210 | Hoja: ACHANCARAY ROJAS WILFREDO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (210, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 210)) FROM ContratoServicio WHERE id_sede = 210 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62460', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: C & F SALUD S.A.C. (RUC: 20600980875) | Sede ID: 496 | Hoja: ESPC & F SALUD S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: C & F SALUD S.A.C. (RUC: 20600980875) | Sede ID: 496 | Hoja: C & F SALUD S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA NORTH SAC (RUC: 20606899298) | Sede ID: 502 | Hoja: VETERINARIA NORTH SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: CUIDADOS VETERINARIOS G & M S.A.C. (RUC: 20608239406) | Sede ID: 243 | Hoja: CUIDADOS VETERINARIOS G & M S.A
-- ==================================================

-- ==================================================
-- CLIENTE: ELIZABETH RICALDI CAFFO (RUC: 10759045144) | Sede ID: 415 | Hoja: ELIZABETH RICALDI CAFFO
-- ==================================================

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

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIAS SAC (RUC: 20601401038) | Sede ID: 461 | Hoja: PL-INVERSIONESELHURON
-- ==================================================

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: M-ELHURONAZULE.I.R.L 
-- ==================================================

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: CERRADO
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIAS RUNA LUNA E.I.R.L. (RUC: 20607091669) | Sede ID: 711 | Hoja: VETERINARIAS RUNA LUNA E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: Grupos Sanitovet SAC (RUC: 20566337402) | Sede ID: 518 | Hoja: GRUPO SANITOVET SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CACERES GUTIERREZ JESUS FREDY (RUC: 10441796990) | Sede ID: 769 | Hoja: CACERES GUTIERREZ JESUS FREDY
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (769, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 769)) FROM ContratoServicio WHERE id_sede = 769 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pagado', '2026-06-01', 'transferencia', 'YAPE', 59.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44874');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62323', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GARIBAY CARHUAMACA LUIS ALBERTO (RUC: 10417691281) | Sede ID: 81 | Hoja: GARIBAY CARHUAMACA LUIS ALB (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (81, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 81)) FROM ContratoServicio WHERE id_sede = 81 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62457', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GARIBAY CARHUAMACA LUIS ALBERTO (RUC: 10417691281) | Sede ID: 81 | Hoja: CERRADO20
-- ==================================================

-- ==================================================
-- CLIENTE: CASTELLANOS VELAZCO MIGUEL ANGEL (RUC: 10087805170) | Sede ID: 457 | Hoja: CASTELLANOS VELAZCO MIGUELANGEL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (457, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 457)) FROM ContratoServicio WHERE id_sede = 457 AND activo = 1), 'MAYO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, 65.00, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62464', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PALI INVERSIONES E.I.R.L. (RUC: 20554975918) | Sede ID: 1083 | Hoja: PALI INVERSIONES E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1083, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1083)) FROM ContratoServicio WHERE id_sede = 1083 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62326', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VALENTIN BELLEZA APOLAYA (RUC: 10481301985) | Sede ID: 1089 | Hoja: VALENTIN BELLEZA APOLAYA
-- ==================================================

-- ==================================================
-- CLIENTE: CRUZ GARCIA BRENDA DORILA (RUC: 10107649412) | Sede ID: 552 | Hoja: BRENDA DORILA CRUZ GARCIA
-- ==================================================

-- ==================================================
-- CLIENTE: YUREMMA SERRANO CHOQUE (RUC: 10427011904) | Sede ID: 80 | Hoja: YUREMMA SERRANO CHOQUE
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA PRANA S.R.L. (RUC: 20546186467) | Sede ID: 799 | Hoja: CLINICA VETERINARIA PRANA SRL
-- ==================================================

-- ==================================================
-- CLIENTE: MEGA MASCOTA S.A.C. (RUC: 20608308912) | Sede ID: 1199 | Hoja: MEGA MASCOTA SAC
-- ==================================================

-- ==================================================
-- CLIENTE: IMPLANTODENTAL E.I.R.L. (RUC: 20604276161) | Sede ID: 651 | Hoja: IMPLANTODENTAL E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: ATAUSUPA OCROS NELLY MARIA (RUC: 10414475065) | Sede ID: 1229 | Hoja: NELLY MARIA ATAUSUPA OCROS
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO ESPECIALIZADO PROVIDENCE S.A.C. (RUC: 20602272011) | Sede ID: 1201 | Hoja: CENTRO ODONT ESPEC PROVIDENCE 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1201, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1201)) FROM ContratoServicio WHERE id_sede = 1201 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62543', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PRINCIPE ROMERO JORGE ARMANDO (RUC: 10801472619) | Sede ID: 1123 | Hoja: JORGE ARMANDO PRINCIPE ROMERO 
-- ==================================================

-- ==================================================
-- CLIENTE: ESCOBAR VASQUEZ MERY ROSARIO (RUC: 10411613696) | Sede ID: 1236 | Hoja: MERY ROSARIO ESCOBAR VASQUEZ
-- ==================================================

-- ==================================================
-- CLIENTE: ROSAS ALVA HUAMAN NANCY (RUC: 10099997228) | Sede ID: 43 | Hoja: ROSAS ALVA HUAMAN NANCY
-- ==================================================

-- ==================================================
-- CLIENTE: CASTAÑEDA SUAREZ MIGUEL ANGEL (RUC: 10468184546) | Sede ID: 596 | Hoja: CASTAÑEDA SUAREZ MIGUEL ANGEL
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO ESPECIALIZADO VMT S.A.C. (RUC: 20601969646) | Sede ID: 1341 | Hoja: CENTRO ODONT. ESPECIALIZADO VMT
-- ==================================================

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

-- ==================================================
-- CLIENTE: QUISPE VALLE EDUARDO JOSUE (RUC: 10429863606) | Sede ID: 99 | Hoja:  QUISPE VALLE EDUARDO JOSUE
-- ==================================================

-- ==================================================
-- CLIENTE: EL LABRADOR SRL (RUC: 20479799785) | Sede ID: 445 | Hoja: EL LABRADOR SRL
-- ==================================================

-- ==================================================
-- CLIENTE: HKH Reumatologia EIRL (RUC: 20514423262) | Sede ID: 1143 | Hoja: HKH Reumatologia EIRL 
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES BUEN DOCTOR S.R.L. - IBUEND S.R.L. (RUC: 20603524315) | Sede ID: 756 | Hoja: INVERSIONES BUEN DOCTOR S.R.L. 
-- ==================================================

-- ==================================================
-- CLIENTE: THANI DENT S.A.C. (RUC: 20608386468) | Sede ID: 1254 | Hoja: THANI DENT S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: TIERRA ANIMAL SOCIEDAD ANONIMA CERRADA (RUC: 20607610151) | Sede ID: 759 | Hoja: TIERRA ANIMAL SOCIEDAD ANONIMA 
-- ==================================================

-- ==================================================
-- CLIENTE: MUÑIZ ZAMORA RUBEN LUCIO (RUC: 10214843183) | Sede ID: 97 | Hoja: RUBEN LUCIO MUÑIZ ZAMORA
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967) | Sede ID: 369 | Hoja: B-JHON DENT 
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA BLAS VET LINCE (RUC: 20609931559) | Sede ID: 851 | Hoja:  BLAS VET E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: HELAR MARTIN HERNANDEZ MUÑANTE (RUC: 10214625658) | Sede ID: 1112 | Hoja: HELAR MARTIN HERNANDEZ MUÑANTE
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA D´PELOS S.A.C (RUC: 20606732610) | Sede ID: 600 | Hoja: VETERINARIA D´PELOS S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA PANDA EIRL (RUC: 20506738807) | Sede ID: 208 | Hoja: VETERINARIA PANDA EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: SOMMEDICS GRAM S.A.C. (RUC: 20607922153) | Sede ID: 599 | Hoja: SOMMEDICS GRAM S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CALDERON MOYA CHRISTIAN VICTOR (RUC: 10700148527) | Sede ID: 1278 | Hoja: Christian Victor Calderon M (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CALDERON MOYA CHRISTIAN VICTOR (RUC: 10700148527) | Sede ID: 1278 | Hoja: Christian Victor Calderon Moya
-- ==================================================

-- ==================================================
-- CLIENTE: MARCOS OSCAR CARHUAHUANCA CORTEZ (RUC: 10106196805) | Sede ID: 337 | Hoja: MARCOS OSCAR CARHUAHUANCA CORTE
-- ==================================================

-- ==================================================
-- CLIENTE: ANDRES EDUARDO CASTRO CABALLERO (RUC: 10470127797) | Sede ID: 561 | Hoja: ANDRES EDUARDO CASTRO CABALLERO
-- ==================================================

-- ==================================================
-- CLIENTE: SANCHEZ CUETO JOHNSTON BREAN (RUC: 10467628173) | Sede ID: 947 | Hoja: SANCHEZ CUETO JOHNSTON BREAN
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA BLASVET SURCO E.I.R.L. (RUC: 20609943158) | Sede ID: 840 | Hoja: BLASVET E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DENTAL DIGITAL E.I.R.L. (RUC: 20614272792) | Sede ID: 1163 | Hoja: CLINICA DENTAL DIGITAL EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: VELASQUEZ VIZCARRA LUZ NATALY (RUC: 10444220592) | Sede ID: 307 | Hoja: LUZ NATALY VELASQUEZ VIZCARRA
-- ==================================================

-- ==================================================
-- CLIENTE: G & S ODONTOLOGIA S.A.C. (RUC: 20601488117) | Sede ID: 328 | Hoja: GyS Odontologia Sac
-- ==================================================

-- ==================================================
-- CLIENTE: OMONTE GUTIERREZ JOHAN ROLANDO (RUC: 10437752911) | Sede ID: 441 | Hoja: CH OMONTE GUTIERREZ JOHAN R
-- ==================================================

-- ==================================================
-- CLIENTE: ROES DERMA WELLNESS IMPORTACIONES Y EXPORTACIONES S.A.C. (RUC: 20603961499) | Sede ID: 569 | Hoja: ROES DERMA WELLNESS IMPORTACION
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA DOGTORAS S.R.L. (RUC: 20548219648) | Sede ID: 1080 | Hoja: CLINICA VETERINARIA DOGTORAS S.
-- ==================================================

-- ==================================================
-- CLIENTE: DEL AGUILA TRINIDAD MARINEYLLY (RUC: 10420710564) | Sede ID: 1273 | Hoja: DEL AGUILA TRINIDAD MARINEY (2)
-- ==================================================

-- ==================================================
-- CLIENTE: DEL AGUILA TRINIDAD MARINEYLLY (RUC: 10420710564) | Sede ID: 1273 | Hoja: DEL AGUILA TRINIDAD MARINEYLLY
-- ==================================================

-- ==================================================
-- CLIENTE: Dentaurus Clínica Dental EIRL (RUC: 20538730816) | Sede ID: 174 | Hoja: DENTAURUS CLINICA DENTAL E.I.R.
-- ==================================================

-- ==================================================
-- CLIENTE: CITYPETS E.I.R.L. (RUC: 20552375905) | Sede ID: 550 | Hoja: CITYPETS E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: CMO SEÑORA DE GUADALUPE E.I.R.L. (RUC: 20606512598) | Sede ID: 1135 | Hoja: CMO SEÑORA DE GUADALUPE E.I (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CMO SEÑORA DE GUADALUPE E.I.R.L. (RUC: 20606512598) | Sede ID: 1135 | Hoja: CERRADO6
-- ==================================================

-- ==================================================
-- CLIENTE: PROPET SR S.A.C (RUC: 20608794191) | Sede ID: 258 | Hoja: PROPET SR S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: PETMAX S.A.C. (RUC: 20610289321) | Sede ID: 562 | Hoja: PET MAX SAC  la molina
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (562, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 562)) FROM ContratoServicio WHERE id_sede = 562 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62554', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GIOVANNI MAXIMO SOTELO CASAFRANCA (RUC: 10094945726) | Sede ID: 680 | Hoja: GIOVANNI MAXIMO SOTELO CASAFRAN
-- ==================================================

-- ==================================================
-- CLIENTE: AMIPET VETERINARIA E.I.R.L. (RUC: 20556501794) | Sede ID: 398 | Hoja: AMIPET VETERINARIA E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: JOLICAHE S.A.C. (RUC: 20600499042) | Sede ID: 1093 | Hoja: O-JOLICAHE S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: JOLICAHE S.A.C. (RUC: 20600499042) | Sede ID: 1093 | Hoja: SMP-JOLICAHE S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES Y SERVICIOS VETERINARIOS S.A. (RUC: 20603293313) | Sede ID: 671 | Hoja: INVERSIONES Y SERV VETERINARIOS
-- ==================================================

-- ==================================================
-- CLIENTE: LABORATORIO CLINICO PERU LABS E.I.R.L. (RUC: 20607902268) | Sede ID: 577 | Hoja: PERULABS EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (577, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 577)) FROM ContratoServicio WHERE id_sede = 577 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62533', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO ESPECIALIZADO BIODENTAMERICA S.A.C (RUC: 20609073129) | Sede ID: 1413 | Hoja: CENTRO ODONTOLOGICO ESPECIALIZA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1413, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1413)) FROM ContratoServicio WHERE id_sede = 1413 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62552', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SANTHOME BERNALES VICTOR MANUEL (RUC: 10088051993) | Sede ID: 802 | Hoja: SANTHOME BERNALES VICTOR MANUEL
-- ==================================================

-- ==================================================
-- CLIENTE: MAPEVAS SOCIEDAD ANONIMA CERRADA (RUC: 20602841899) | Sede ID: 509 | Hoja: MAPEVAS ESP
-- ==================================================

-- ==================================================
-- CLIENTE: MAPEVAS SOCIEDAD ANONIMA CERRADA (RUC: 20602841899) | Sede ID: 509 | Hoja: MAPEVAS S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Casvi SAC (RUC: 20553444773) | Sede ID: 1237 | Hoja: Casvi SAC
-- ==================================================

-- ==================================================
-- CLIENTE: IMAGEN DENTAL CENTER E.I.R.L. (RUC: 20604816352) | Sede ID: 738 | Hoja: IMAGEN DENTAL CENTER E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: IMAGEN DENTAL CENTER E.I.R.L. (RUC: 20604816352) | Sede ID: 738 | Hoja: IMAGEN DENTAL CENTER E.I.R. (2)
-- ==================================================

-- ==================================================
-- CLIENTE: NAKURA S.A.C. (RUC: 20605223983) | Sede ID: 304 | Hoja: NAKURA S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: MM Y ASSOCIATED SAC (RUC: 20609706814) | Sede ID: 923 | Hoja: MM & ASSOCIATED S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Anngie Gissella Villar Calderón (RUC: 10413081667) | Sede ID: 940 | Hoja: ANNGIE GISSELLA VILLAR CALDERON
-- ==================================================

-- ==================================================
-- CLIENTE: RUBIO VALDIVIESO ALICIA MARIA (RUC: 10077531829) | Sede ID: 1025 | Hoja: RUBIO VALDIVIESO ALICIA MARIA
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967) | Sede ID: 369 | Hoja: C5-JHON DENT
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967) | Sede ID: 369 | Hoja: V3-JHON DENT
-- ==================================================

-- ==================================================
-- CLIENTE: JUAN CARLOS ASTONITAS ASTONITAS (RUC: 10087438282) | Sede ID: 341 | Hoja: JUAN CARLOS ASTONITAS ASTONITAS
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica spce e.i.r.l (RUC: 20605797190) | Sede ID: 986 | Hoja: Clinica spce e.i.r.l
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (986, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 986)) FROM ContratoServicio WHERE id_sede = 986 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62451', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ADNMEDICAL E.I.R.L. (RUC: 20603372191) | Sede ID: 527 | Hoja:  ADNMEDICAL E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: RIVERA REYES RONY RANDALL (RUC: 10432543515) | Sede ID: 1169 | Hoja: PL RIVERA REYES RONY
-- ==================================================

-- ==================================================
-- CLIENTE: RIVERA REYES RONY RANDALL (RUC: 10432543515) | Sede ID: 1168 | Hoja: SM -RIVERA REYES RONY RANDALL
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967) | Sede ID: 369 | Hoja: CERRADO7
-- ==================================================

-- ==================================================
-- CLIENTE: MORALES MONTEJO LUIS ABELARDO (RUC: 10084704861) | Sede ID: 293 | Hoja: MORALES MONTEJO LUIS ABELARDO
-- ==================================================

-- ==================================================
-- CLIENTE: DIENTE FELIZ S.A.C. (RUC: 20602675921) | Sede ID: 703 | Hoja: DIENTE FELIZ S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Veterinaria Cabrera J y P S.A.C. (RUC: 20608642570) | Sede ID: 1197 | Hoja: Veterinaria cabrera j y p sac
-- ==================================================

-- ==================================================
-- CLIENTE: ALLQUSERVICIOS S.A.C. (RUC: 20608628666) | Sede ID: 700 | Hoja: ALLQUSERVICIOS S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: WALDEMAR DAVILA MELGAREJO (RUC: 10060022963) | Sede ID: 223 | Hoja: WALDEMAR DAVILA MELGAREJO 
-- ==================================================

-- ==================================================
-- CLIENTE: RANILLA VALENTE GUISSELLA IVETTE (RUC: 10408896334) | Sede ID: 218 | Hoja: RANILLA VALENTE GUISSELLA IVETT
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA MARINAPETS E.I.R.L. (RUC: 20523351754) | Sede ID: 103 | Hoja: VETERINARIA MARINAPETS E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: JOSÉ LUIS GONZALES UCHUYPOMA (RUC: 10106898664) | Sede ID: 1153 | Hoja: JOSÉ LUIS GONZALES UCHUYPOMA
-- ==================================================

-- ==================================================
-- CLIENTE: SIMPET SAC (RUC: 20610344489) | Sede ID: 1176 | Hoja: IMVERSIONES SIMPET (2)
-- ==================================================

-- ==================================================
-- CLIENTE: SIMPET SAC (RUC: 20610344489) | Sede ID: 1176 | Hoja: IMVERSIONES SIMPET
-- ==================================================

-- ==================================================
-- CLIENTE: PALOMINO SERVICIOS VETERINARIOS S.A.C. (RUC: 20605942637) | Sede ID: 100 | Hoja: PALOMINO SERVICIOS VETERINARIOS
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA REAL LOS LAURELES SAC (RUC: 20220832016) | Sede ID: 406 | Hoja: CLINICA REAL LOS LAURELES SAC
-- ==================================================

-- ==================================================
-- CLIENTE: ERIKA BERNARDINA ROJAS DIAZ (RUC: 10098342911) | Sede ID: 652 | Hoja: ERIKA BERNARDINA ROJAS DIAZ
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE ESPECIALIDADES MEDICAS CORAZÓN DE JESÚS E.I.R.L. (RUC: 20609000881) | Sede ID: 1181 | Hoja: ESPECIALI.MED.CORAZON DE JESUS
-- ==================================================

-- ==================================================
-- CLIENTE: MEDAVAC- LAB SAC (RUC: 20606809086) | Sede ID: 558 | Hoja: MEDAVAC- LAB SAC
-- ==================================================

-- ==================================================
-- CLIENTE: RENACER, SALUD Y BELLEZA S.A.C. (RUC: 20609118343) | Sede ID: 891 | Hoja: RENACER, SALUD Y BELLEZA S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: SILVA MEZZICH PEDRO JOSE (RUC: 10094547003) | Sede ID: 876 | Hoja: SILVA MEZZICH PEDRO JOSE
-- ==================================================

-- ==================================================
-- CLIENTE: CLAUDIO ALBERTO ACCO NOA (RUC: 10106448154) | Sede ID: 654 | Hoja: CLAUDIO ALBERTO ACCO NOA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (654, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 654)) FROM ContratoServicio WHERE id_sede = 654 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62605', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: SERVICIOS GENERALES DE SALUD SANTA FE DEL SUR E.I.R.L. (RUC: 20606479311) | Sede ID: 106 | Hoja: serv generales santa fe del sur
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA ANIMALANDIA M & S S.A.C. (RUC: 20609260140) | Sede ID: 892 | Hoja: CLINICA VETERINARIA ANIMALANDIA
-- ==================================================

-- ==================================================
-- CLIENTE: Animal Garden sac (RUC: 20607053287) | Sede ID: 385 | Hoja: C-ANIMAL GARDEN S.A.C. 
-- ==================================================

-- ==================================================
-- CLIENTE: Animal Garden sac (RUC: 20607053287) | Sede ID: 392 | Hoja: JM-ANIMAL GARDEN S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: POLICLINICO FAMILIAR SANTA ROSA E.I.R.L. (RUC: 20602032516) | Sede ID: 270 | Hoja: POLICLINICO FAMILIAR SANTA ROSA
-- ==================================================

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

-- ==================================================
-- CLIENTE: ESTRELLA APARICIO MELISSA GABRIELA (RUC: 10446650624) | Sede ID: 742 | Hoja: ESTRELLA APARICIO MELISSA GABRI
-- ==================================================

-- ==================================================
-- CLIENTE: PEREDO ARENAS FRANK ALEXANDER (RUC: 10417192463) | Sede ID: 691 | Hoja: PEREDO ARENAS FRANK ALEXANDER
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO LA MAR E.I.R.L. (RUC: 20609374331) | Sede ID: 266 | Hoja: CENTRO ODONTOLOGICO LA MAR E.I.
-- ==================================================

-- ==================================================
-- CLIENTE: SANCHEZ SANCHEZ DE ROJAS LUCY EMPERATRIZ (RUC: 10153854853) | Sede ID: 1068 | Hoja:  SANCHEZ DE ROJAS LUCY EMPERATR
-- ==================================================

-- ==================================================
-- CLIENTE: DILAS DENT E.I.R.L. (RUC: 20609344246) | Sede ID: 862 | Hoja: DILAS DENT E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: VET BELLAVISTA SAC (RUC: 20615213331) | Sede ID: 1444 | Hoja: VET BELLAVISTA S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: KRISTALDENT S.A.C. (RUC: 20549948775) | Sede ID: 661 | Hoja: KRISTALDENT SAC
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS ODONTOLOGICOS FLORES S.A.C. (RUC: 20609057450) | Sede ID: 601 | Hoja: SERVICIOS MEDICOS Y ODONTOLOGIC
-- ==================================================

-- ==================================================
-- CLIENTE: King vet S.A.C (RUC: 20609560844) | Sede ID: 1342 | Hoja: KING VET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Lissett stefany Cordova Cordova (RUC: 10473515313) | Sede ID: 347 | Hoja: Lissett  stefany Cordova Cordov
-- ==================================================

-- ==================================================
-- CLIENTE: CASTILLO ARCE JORMAN AARON (RUC: 10483985377) | Sede ID: 110 | Hoja: CASTILLO ARCE JORMAN AARON
-- ==================================================

-- ==================================================
-- CLIENTE: Peluditos Petshop EIRL (RUC: 20611797843) | Sede ID: 244 | Hoja: PELUDITOS PETSHOP
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA GAVET PERU S.A.C. (RUC: 20609660831) | Sede ID: 231 | Hoja: CLINICA VETERINARIA GAVET PERU 
-- ==================================================

-- ==================================================
-- CLIENTE: AGROVETERINARIA MARTINEZ EIRL (RUC: 20135664538) | Sede ID: 1105 | Hoja: AGROVETERINARIA MARTINEZ EMPRES
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLOGICO UNITY S.A.C. (RUC: 20608683446) | Sede ID: 704 | Hoja: CENTRO ODONTOLOGICO UNITY S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: CELESTINO APOLINARIO ACENCIO BEKER (RUC: 10414166127) | Sede ID: 1113 | Hoja: CELESTINO APOLINARIO ACENCIO BE
-- ==================================================

-- ==================================================
-- CLIENTE: QUESQUEN CUYUBAMBA DHARIANA JUANA (RUC: 10457921824) | Sede ID: 978 | Hoja: QUESQUEN CUYUBAMBA DHARIANA JUA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (978, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 978)) FROM ContratoServicio WHERE id_sede = 978 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62471', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PROSEVAR S.A.C. (RUC: 20428962177) | Sede ID: 618 | Hoja: PROSEVAR S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: Lizeth Magaly Marcatinco Cuba (RUC: 10487931921) | Sede ID: 277 | Hoja: Lizeth Magaly Marcatinco Cuba
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACIÓN VETERINARIA SAN PÍO S.A.C. (RUC: 20606054832) | Sede ID: 407 | Hoja: CORPORACIÓN VETERINARIA SAN PÍO
-- ==================================================

-- ==================================================
-- CLIENTE: SANTOS SOTO LISSETTE LOURDES (RUC: 10107486491) | Sede ID: 295 | Hoja: SANTOS SOTO LISSETTE LOURDES
-- ==================================================

-- ==================================================
-- CLIENTE: OLIVIA VIOLETA CERACIO PANDURO (RUC: 10418529984) | Sede ID: 1010 | Hoja: OLIVIA VIOLETA CERACIO PANDURO 
-- ==================================================

-- ==================================================
-- CLIENTE: PET INDUSTRY SAC (RUC: 20609956659) | Sede ID: 486 | Hoja: PET INDUSTRY S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: TANAKA BUSTAMANTE ANGELA YOSHY (RUC: 10728758177) | Sede ID: 948 | Hoja: TANAKA BUSTAMANTE ANGELA YOSHY
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES ENCANTHADA S.A.C (RUC: 20613727052) | Sede ID: 1209 | Hoja: INVERSIONES ENCANTHADA SAC
-- ==================================================

-- ==================================================
-- CLIENTE: 6GDENT S.A.C. (RUC: 20609724791) | Sede ID: 1276 | Hoja: 6GDENT S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORATIVO GALARSAN S.A.C. (RUC: 20608967941) | Sede ID: 116 | Hoja: CORPORATIVO GALARSAN S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO SALVAS PERU S.A.C (RUC: 20609182815) | Sede ID: 766 | Hoja: GRUPO SALVAS PERU S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES VETERINARIAS EL DORADO S.A.C. (RUC: 20604600597) | Sede ID: 460 | Hoja: L- EL DORADO
-- ==================================================

-- ==================================================
-- CLIENTE: CIMEVET S.A.C. (RUC: 20609984474) | Sede ID: 299 | Hoja: O- CIMEVET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CIMEVET S.A.C. (RUC: 20609984474) | Sede ID: 299 | Hoja: C-CIMEVET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES Y SERVICIOS GENERALES ANIMALAND S.A.C. (RUC: 20610005501) | Sede ID: 746 | Hoja: INVERSIONES Y SERVICIOS GENERAL
-- ==================================================

-- ==================================================
-- CLIENTE: MILAGROS BRIONES LAU LI (RUC: 10472000336) | Sede ID: 283 | Hoja: Milagros Briones Lau Li
-- ==================================================

-- ==================================================
-- CLIENTE: Los Peluches 24 hrs SAC (RUC: 20609651769) | Sede ID: 224 | Hoja: Los Peluches 24 hrs SAC
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS DE CIRUGIA VETERINARIA E IMAGENES DR. LUIS RAMOS E.I.R.L (RUC: 20611878282) | Sede ID: 1213 | Hoja: CIRUVET E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: Lia cárdenas Alcazar (RUC: 10425712409) | Sede ID: 1158 | Hoja: Lia cárdenas Alcazar
-- ==================================================

-- ==================================================
-- CLIENTE: Becodent sacs (RUC: 20608989863) | Sede ID: 895 | Hoja: Becodent sacs
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Dental Brisa SAC (RUC: 20545590205) | Sede ID: 956 | Hoja: Clínica Dental Brisa SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C. (RUC: 20609381834) | Sede ID: 1145 | Hoja: CLÍNICA VETERINARIA Y GROOM (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C. (RUC: 20609381834) | Sede ID: 1145 | Hoja: CLÍNICA VETERINARIA Y GROOMING 
-- ==================================================

-- ==================================================
-- CLIENTE: GORDILLO MALDONADO CARLA ROSA EMILIA (RUC: 10078621643) | Sede ID: 117 | Hoja: GORDILLO MALDONADO CARLA ROSA E
-- ==================================================

-- ==================================================
-- CLIENTE: NATURAL PETS SERVICIOS VETERINARIOS S.A.C. (RUC: 20606847093) | Sede ID: 326 | Hoja: NATURAL PETS SERVICIOS VETERINA
-- ==================================================

-- ==================================================
-- CLIENTE: MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A.C (RUC: 20608420933) | Sede ID: 1128 | Hoja: SJL-MASKOTOPIA 
-- ==================================================

-- ==================================================
-- CLIENTE: Milagros Mitma Ramírez (RUC: 10700511494) | Sede ID: 655 | Hoja: Milagros Mitma Ramírez     
-- ==================================================

-- ==================================================
-- CLIENTE: ESCORZA VILLEGAS BLANCA JAKELINE (RUC: 10476115375) | Sede ID: 602 | Hoja: ESCORZA VILLEGAS BLANCA JAKELIN
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA VENTURA E.I.R.L. (RUC: 20602267599) | Sede ID: 697 | Hoja: VETERINARIA VENTURA E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: JARA VENTURA JOSE GIAN CARLO (RUC: 10421127269) | Sede ID: 1184 | Hoja: JARA VENTURA JOSE GIAN CARLO
-- ==================================================

-- ==================================================
-- CLIENTE: SALUD DENTAL ODONTOLOGIA INTEGRAL (RUC: 20602353240) | Sede ID: 603 | Hoja: SALUD DENTAL ODONTOLOGÍA INTEGR
-- ==================================================

-- ==================================================
-- CLIENTE: EL HURON AZUL EIRL (RUC: 20545766842) | Sede ID: 466 | Hoja: SM-ELHURONAZUL E.I.R.L 
-- ==================================================

-- ==================================================
-- CLIENTE: CABALLERO NUÑEZ GUILLERMO ENRIQUE (RUC: 10033804364) | Sede ID: 119 | Hoja: CABALLERO NUÑEZ GUILLERMO E (2)
-- ==================================================

-- ==================================================
-- CLIENTE: URBINA ANTICONA EUGENIA YRIS (RUC: 10068030116) | Sede ID: 1246 | Hoja: URBINA ANTICONA EUGENIA YRIS
-- ==================================================

-- ==================================================
-- CLIENTE: DOCTOR MASCOTA S.A.C. (RUC: 20606028581) | Sede ID: 329 | Hoja: M-DOCTOR MASCOTA S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: ODONTOCRED E.I.R.L (RUC: 20545995795) | Sede ID: 1227 | Hoja: ODONTOCRED E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: ASTUCURI YAURI JOSE ANTONIO (RUC: 10105985954) | Sede ID: 918 | Hoja: C-ASTUCURI YAURI JOSE ANTONIO
-- ==================================================

-- ==================================================
-- CLIENTE: ASTUCURI YAURI JOSE ANTONIO (RUC: 10105985954) | Sede ID: 918 | Hoja: A-ASTUCURI YAURI JOSE ANTONIO
-- ==================================================

-- ==================================================
-- CLIENTE: Inversiones ceofam sac (RUC: 20510055897) | Sede ID: 1002 | Hoja: Inversiones ceofam sac
-- ==================================================

-- ==================================================
-- CLIENTE: Emily Vasquez Muñoz (RUC: 10430410488) | Sede ID: 363 | Hoja: Emily Vasquez Muñoz
-- ==================================================

-- ==================================================
-- CLIENTE: Bastidas Benites Alejandro Jaime Leonardo (RUC: 10731763416) | Sede ID: 120 | Hoja: Bastidas Benites Alejandro Jaim
-- ==================================================

-- ==================================================
-- CLIENTE: KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C. (RUC: 20518247761) | Sede ID: 1114 | Hoja: KAVELG ESPECIALES
-- ==================================================

-- ==================================================
-- CLIENTE: KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C. (RUC: 20518247761) | Sede ID: 1114 | Hoja: KAVELG
-- ==================================================

-- ==================================================
-- CLIENTE: MELYSALUD S.A.C (RUC: 20553512281) | Sede ID: 957 | Hoja: MELYSALUD (2)
-- ==================================================

-- ==================================================
-- CLIENTE: MELYSALUD S.A.C (RUC: 20553512281) | Sede ID: 957 | Hoja: MELYSALUD
-- ==================================================

-- ==================================================
-- CLIENTE: margarita martell martinez (RUC: 10087226480) | Sede ID: 883 | Hoja: margarita martell martinez
-- ==================================================

-- ==================================================
-- CLIENTE: ANIMEDICA VET S.A.C. (RUC: 20601722098) | Sede ID: 1103 | Hoja: CL-ANIMEDICA VET SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DENTAL LIMA NORTE (RUC: 20605177302) | Sede ID: 187 | Hoja: CENTRO DENTAL LIMA NORTE
-- ==================================================

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
VALUES (410, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 410)) FROM ContratoServicio WHERE id_sede = 410 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62355', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Asociados Ganoza & Camac SAC (RUC: 20609904292) | Sede ID: 1260 | Hoja: Asociados Ganoza & Camac SAC
-- ==================================================

-- ==================================================
-- CLIENTE: PET SOUND SERVICIOS S.A.C (RUC: 20609944898) | Sede ID: 1111 | Hoja: PET SOUND SERVICIOS S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: Abigail Marcelina Cáceres Saldaña (RUC: 10101937726) | Sede ID: 1224 | Hoja: Abigail Marcelina Cáceres Salda
-- ==================================================

-- ==================================================
-- CLIENTE: SIETE GUTIERREZ VDA DE ALVARADO YOLANDA (RUC: 10086605517) | Sede ID: 860 | Hoja: SIETE GUTIERREZ VDA DE ALVARADO
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICVET INTEGRATIVA SAC (RUC: 20612548430) | Sede ID: 122 | Hoja: JM-MEDICVET
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICVET INTEGRATIVA SAC (RUC: 20612548430) | Sede ID: 122 | Hoja: O-MEDICVET
-- ==================================================

-- ==================================================
-- CLIENTE: SILVANA KATHERINE ALVAREZ SOTELO (RUC: 10734554664) | Sede ID: 124 | Hoja: SILVANA KATHERINE ALVAREZ SOTEL
-- ==================================================

-- ==================================================
-- CLIENTE: Centro Odontológico Biomedix sac (RUC: 20608719033) | Sede ID: 1435 | Hoja: Centro Odontológico Biomedix sa
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DENTAL KUSI DENT EIRL (RUC: 20537043360) | Sede ID: 128 | Hoja: PTP279 CLINICA DENTAL KUSI DENT
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DENTAL KUSI DENT EIRL (RUC: 20537043360) | Sede ID: 128 | Hoja: PTP275 CLINICA DENTAL KUSI DENT
-- ==================================================

-- ==================================================
-- CLIENTE: Carla Elena Ramirez Reyes (RUC: 10741677151) | Sede ID: 885 | Hoja: Carla Elena Ramirez Reyes 
-- ==================================================

-- ==================================================
-- CLIENTE: Grupo Masias Perú sac (RUC: 20609097281) | Sede ID: 139 | Hoja: Grupo Masias Perú sac
-- ==================================================

-- ==================================================
-- CLIENTE: Jesus Rafael Gamarra Trujillo (RUC: 10081638875) | Sede ID: 141 | Hoja: Jesus Rafael Gamarra Trujillo
-- ==================================================

-- ==================================================
-- CLIENTE: VEVET S.A.C. (RUC: 20609951525) | Sede ID: 582 | Hoja: VEVET S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (582, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 582)) FROM ContratoServicio WHERE id_sede = 582 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62535', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Gino Antero Gambini Cercado (RUC: 10722267791) | Sede ID: 958 | Hoja: Gino Antero Gambini Cercado
-- ==================================================

-- ==================================================
-- CLIENTE: Malu Fernandez Rodriguez (RUC: 10418172890) | Sede ID: 961 | Hoja: Malu Fernandez Rodriguez
-- ==================================================

-- ==================================================
-- CLIENTE: CEO CENTRO ESTETICO ODONTOLOGICO ESPECIALIZADO E.I.R.L. (RUC: 20557521411) | Sede ID: 718 | Hoja:  CEO ESPECIALIZADO E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: Rosario Aurora Zegarra Medina (RUC: 10088218987) | Sede ID: 745 | Hoja: Rosario Aurora Zegarra Medina
-- ==================================================

-- ==================================================
-- CLIENTE: ROMERO MORALES ROCIO AURORA (RUC: 10417772559) | Sede ID: 761 | Hoja: ROMERO MORALES ROCIO AURORA
-- ==================================================

-- ==================================================
-- CLIENTE: Omar Antonio Cedeño Zegarra (RUC: 10407027235) | Sede ID: 1240 | Hoja: Omar Antonio Cedeño Zegarra 2
-- ==================================================

-- ==================================================
-- CLIENTE: Omar Antonio Cedeño Zegarra (RUC: 10407027235) | Sede ID: 1240 | Hoja: CERRADO3
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES TCQ S.A.C. (RUC: 20605043021) | Sede ID: 757 | Hoja: INVERSIONES TCQ S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: ARAVET CLINICA VETERINARIA S.A.C. (RUC: 20614821575) | Sede ID: 1429 | Hoja: JESSICA  CARTAGENA MEZA
-- ==================================================

-- ==================================================
-- CLIENTE: consultorio dental Incisdent (RUC: 20610065717) | Sede ID: 1035 | Hoja: consultorio dental Incisdent
-- ==================================================

-- ==================================================
-- CLIENTE: SuDentist EIRL (RUC: 20601410495) | Sede ID: 752 | Hoja: SuDentist EIRL
-- ==================================================

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

-- ==================================================
-- CLIENTE: QUISPE PEÑA DARIO ODILON (RUC: 10469878606) | Sede ID: 712 | Hoja: QUISPE PEÑA DARIO ODILON
-- ==================================================

-- ==================================================
-- CLIENTE: HUARACA DELGADO FLOR DE MARIA (RUC: 10208874476) | Sede ID: 966 | Hoja: HUARACA DELGADO FLOR DE MARIA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (966, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 966)) FROM ContratoServicio WHERE id_sede = 966 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62468', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Claritydent E.I.R.L. (RUC: 20600894529) | Sede ID: 821 | Hoja: Claritydent E.I.R.L. 
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO QUIRURGICO VETERINARIO E.I.R.L. (RUC: 20607826146) | Sede ID: 767 | Hoja: CENTRO QUIRURGICO VETERINARIO
-- ==================================================

-- ==================================================
-- CLIENTE: VELASCO GUERRERO MERCEDES JAQUELIN (RUC: 10469015608) | Sede ID: 1116 | Hoja: VELASCO GUERRERO MERCEDES JAQUE
-- ==================================================

-- ==================================================
-- CLIENTE: ASISTENCIA ODONTOLOGICA ESPECIALIZADA SOCIEDAD ANONIMA CERRADA S.A.C. (RUC: 20538031993) | Sede ID: 142 | Hoja: ASISTENCIA ODONTOLOGICA ESPECIA
-- ==================================================

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

-- ==================================================
-- CLIENTE: CHAVEZ MORE MAYRA VERONICA (RUC: 10489937773) | Sede ID: 1154 | Hoja: CHAVEZ MORE MAYRA VERONICA
-- ==================================================

-- ==================================================
-- CLIENTE: MULTISERVICIOS DE SALUD CHR S.A.C (RUC: 20546143733) | Sede ID: 731 | Hoja: MULTISERVICIOS  DE SALUD CHR S.
-- ==================================================

-- ==================================================
-- CLIENTE: ADVANCE DENTAL S.A.C. (RUC: 20609368129) | Sede ID: 211 | Hoja: ADVANCE DENTAL
-- ==================================================

-- ==================================================
-- CLIENTE: ADVANCE SALUD S.A.C. (RUC: 20553692246) | Sede ID: 396 | Hoja: ADVANCE SALUD S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (396, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 396)) FROM ContratoServicio WHERE id_sede = 396 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62600', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Francisco Choque Huaman (RUC: 10409070910) | Sede ID: 869 | Hoja: Francisco Choque Huaman
-- ==================================================

-- ==================================================
-- CLIENTE: ESPINOZA GARCIA MILTON (RUC: 10229966931) | Sede ID: 606 | Hoja: ESPINOZA GARCIA MILTON
-- ==================================================

-- ==================================================
-- CLIENTE: OFTALMO MEDICAL CENTER S.A.C. (RUC: 20607132454) | Sede ID: 549 | Hoja: OFTALMO MEDICAL CENTER S.A. (4)
-- ==================================================

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

-- ==================================================
-- CLIENTE: ELAM SALUD SAC (RUC: 20610311891) | Sede ID: 624 | Hoja: ELAM SALUD SAC
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA & SPA HAPPY CAN S.A.C. (RUC: 20602429106) | Sede ID: 973 | Hoja: TA-VETERINARIA & SPA HAPPY CAN
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA & SPA HAPPY CAN S.A.C. (RUC: 20602429106) | Sede ID: 146 | Hoja: MS-VETERINARIA & SPA HAPPY CAN
-- ==================================================

-- ==================================================
-- CLIENTE: VILLAGOMEZ MORALES CAROLINA ISABEL (RUC: 10731254309) | Sede ID: 148 | Hoja: VILLAGOMEZ MORALES CAROLINA ISA
-- ==================================================

-- ==================================================
-- CLIENTE: mendoza gonzales Diana Katterine (RUC: 10419266286) | Sede ID: 763 | Hoja: mendoza gonzales Diana Katterin
-- ==================================================

-- ==================================================
-- CLIENTE: GUIDENT EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA (RUC: 20557299212) | Sede ID: 681 | Hoja: CH GUIDENT EMPRESA INDIVIDUAL
-- ==================================================

-- ==================================================
-- CLIENTE: CACERES PASTOR RAUL EFRAIN (RUC: 10405249290) | Sede ID: 950 | Hoja: CACERES PASTOR RAUL EFRAIN
-- ==================================================

-- ==================================================
-- CLIENTE: JMK SERVICIOS INFANTILES S.A.C. (RUC: 20601505763) | Sede ID: 481 | Hoja: JMK SERVICIOS INFANTILES S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES ANTARA S.A.C. (RUC: 20610149147) | Sede ID: 684 | Hoja: INVERSIONES ANTARA S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: ANIMEDICA VET S.A.C. (RUC: 20601722098) | Sede ID: 1103 | Hoja: PL-ANIMEDICA VET S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: RAMIREZ LEGONIA SILVIA JESUS (RUC: 10100074236) | Sede ID: 744 | Hoja: silvia ramirez
-- ==================================================

-- ==================================================
-- CLIENTE: Veterinaria Animal Land SAC (RUC: 20609090171) | Sede ID: 1051 | Hoja: Veterinaria Animal Land SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Milagros Felicia Anicama Carranza (RUC: 10434524739) | Sede ID: 121 | Hoja: Milagros Felicia Anicama Carran
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA (RUC: 20384463470) | Sede ID: 435 | Hoja: REPRESENTACIONES MAGDA`S SJM
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA (RUC: 20384463470) | Sede ID: 438 | Hoja: REPRESENTACIONES MAGDA`S CHORRI
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA (RUC: 20384463470) | Sede ID: 435 | Hoja: REPRESENTACIONES MAGDA`S VES
-- ==================================================

-- ==================================================
-- CLIENTE: PRIVET EIRL (RUC: 20603012411) | Sede ID: 563 | Hoja: PRIVET S.A.C.     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (563, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 563)) FROM ContratoServicio WHERE id_sede = 563 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pagado', '2026-06-05', 'transferencia', 'YAPE', 98.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44983');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62527', 'BIOCONTAMINADO', 0.00);

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
VALUES (898, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 898)) FROM ContratoServicio WHERE id_sede = 898 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pagado', '2026-06-01', 'transferencia', 'BCP', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44876');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62450', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (898, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 898)) FROM ContratoServicio WHERE id_sede = 898 AND activo = 1), 'JUNIO', '2026-07-04', 'completado', 'pagado', '2026-06-01', 'transferencia', 'BCP', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44876');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (898, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 898)) FROM ContratoServicio WHERE id_sede = 898 AND activo = 1), 'JUNIO', '2026-08-04', 'completado', 'pagado', '2026-06-01', 'transferencia', 'BCP', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44876');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (898, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 898)) FROM ContratoServicio WHERE id_sede = 898 AND activo = 1), 'JUNIO', '2026-09-04', 'completado', 'pagado', '2026-06-01', 'transferencia', 'BCP', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44876');

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
VALUES (792, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 792)) FROM ContratoServicio WHERE id_sede = 792 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62452', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CARES MEDICAL GROUP S.A.C. (RUC: 20605355324) | Sede ID: 591 | Hoja: CARES MEDICAL GROUP S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: HEALTHY PETS E.I.R.L. (RUC: 20551879837) | Sede ID: 184 | Hoja: HEALTHY PETS E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: PERU CARM S.A.C. (RUC: 20524233330) | Sede ID: 1125 | Hoja: PERU CARM S.A.C.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1125, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1125)) FROM ContratoServicio WHERE id_sede = 1125 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62475', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JMP SERVICE S.A.C. (RUC: 20609968533) | Sede ID: 1012 | Hoja: JMP SERVICE S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRADA (RUC: 20518132947) | Sede ID: 546 | Hoja:  SERVICIOS MEDICOS EL TREBO (2)
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRADA (RUC: 20518132947) | Sede ID: 1232 | Hoja:  SERVICIOS MEDICOS EL TREBOL
-- ==================================================

-- ==================================================
-- CLIENTE: DIAZ ANTAURCO FLOR VERONICA (RUC: 10441448681) | Sede ID: 656 | Hoja: DIAZ ANTAURCO FLOR VERONICA
-- ==================================================

-- ==================================================
-- CLIENTE: YURIZ SALUD E.I.R.L. (RUC: 20610795201) | Sede ID: 1267 | Hoja: YURIZ SALUD E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: VILLAVERDE MOSCOL ROCIO ISABEL (RUC: 10480123943) | Sede ID: 1147 | Hoja: VILLAVERDE MOSCOL ROCIO ISABEL
-- ==================================================

-- ==================================================
-- CLIENTE: VET LOVE PETS E.I.R.L. (RUC: 20610928219) | Sede ID: 150 | Hoja: VET LOVE PETS E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES VETERINARIAS EL DORADO S.A.C. (RUC: 20604600597) | Sede ID: 460 | Hoja: CT-EL DORADO
-- ==================================================

-- ==================================================
-- CLIENTE: HONORIO CERNA ELENA ELIZABETH (RUC: 10419702094) | Sede ID: 361 | Hoja: HONORIO CERNA ELENA ELIZABETH
-- ==================================================

-- ==================================================
-- CLIENTE: Milagros del Rosario Mora Marquina (RUC: 10459641829) | Sede ID: 1107 | Hoja:  Milagros del Rosario Mora Marq
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO SANAR S.A.C. (RUC: 20601470412) | Sede ID: 530 | Hoja: GRUPO SANAR
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DENTAL SYACDENT S.A.C (RUC: 20600604717) | Sede ID: 1191 | Hoja: Clínica dental SYACDENT 
-- ==================================================

-- ==================================================
-- CLIENTE: EMPRESA MUNICIPAL DE CHORRILLOS S.A.. (RUC: 20556621188) | Sede ID: 410 | Hoja: SJ EMPRESA MUN CHO
-- ==================================================

-- ==================================================
-- CLIENTE: VETMED S.A.C (RUC: 20545864771) | Sede ID: 539 | Hoja: VETMED S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: STUDIO DENTAL 3M S.A.C (RUC: 20610815481) | Sede ID: 153 | Hoja: STUDIO DENTAL 3M S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: Rafael Ricardo Benito Quispe (RUC: 10406142391) | Sede ID: 865 | Hoja:  Rafael Ricardo Benito Quispe 
-- ==================================================

-- ==================================================
-- CLIENTE: Javier Casas Luyo (RUC: 10707886019) | Sede ID: 451 | Hoja: Javier Casas Luyo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (451, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 451)) FROM ContratoServicio WHERE id_sede = 451 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62525', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Katherine Sanchez Valdez (RUC: 10456262754) | Sede ID: 1216 | Hoja: Katherine Sanchez Valdez     
-- ==================================================

-- ==================================================
-- CLIENTE: Vega Villanueva, Hernan (RUC: 10423834990) | Sede ID: 154 | Hoja: Vega Villanueva, Hernan
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DE LA SONRISA PERU S.A.C. (RUC: 20609243661) | Sede ID: 662 | Hoja: CLINICA DE LA SONRISA PERU  (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA DE LA SONRISA PERU S.A.C. (RUC: 20609243661) | Sede ID: 662 | Hoja: CLINICA DE LA SONRISA PERU S.A.
-- ==================================================

-- ==================================================
-- CLIENTE: Plural Medical SAC (RUC: 20538228860) | Sede ID: 1150 | Hoja: Plural Medical SAC
-- ==================================================

-- ==================================================
-- CLIENTE: V&V Pets and Foods SAC (RUC: 20606195908) | Sede ID: 975 | Hoja: V&V Pets and Foods SAC
-- ==================================================

-- ==================================================
-- CLIENTE: C & F ODONTOLOGIA INTEGRAL S.A.C. (RUC: 20612208825) | Sede ID: 1315 | Hoja: VARGAS SOR SERVICIOS INTEGRALES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'ENERO', '2024-01-08', 'completado', 'pagado', '2024-01-09', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '21569');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '35749', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'FEBRERO', '2024-02-08', 'completado', 'pagado', '2024-02-09', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '22300');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '33710', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'MARZO', '2024-03-08', 'completado', 'pagado', '2024-03-08', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '22951');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '33711', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'ABRIL', '2024-04-08', 'completado', 'pagado', '2024-04-08', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '23645');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '36709', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'MAYO', '2024-04-08', 'completado', 'pagado', '2024-04-08', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '24376');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '37672', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'JUNIO', '2024-06-08', 'completado', 'pagado', '2024-06-08', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '25102');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '38622', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'JULIO', '2024-07-06', 'completado', 'pagado', '2024-07-08', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '25861');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '39566', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'AGOSTO', '2024-08-08', 'completado', 'pagado', '2024-08-07', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '26930');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '40584', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'SEPTIEMBRE', '2024-09-11', 'completado', 'pagado', '2024-09-11', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '27683');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '41673', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'OCTUBRE', '2024-10-11', 'completado', 'pagado', '2024-10-11', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '28374');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '42715', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'NOVIEMBRE', '2024-11-08', 'completado', 'pagado', '2024-11-08', 'transferencia', 'BBVA', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '29148');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '43694', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'DICIEMBRE', '2024-12-07', 'completado', 'pagado', '2024-12-06', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '29959');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '44752', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'ENERO', '2025-01-08', 'completado', 'pagado', '2024-01-08', 'transferencia', 'CANCELADO', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '30762');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '43588', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'FEBRERO', '2025-02-08', 'completado', 'pagado', '2025-02-08', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '31686');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '44761', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'MARZO', '2025-03-10', 'completado', 'pagado', '2025-03-10', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '32521');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '45865', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'ABRIL', '2025-04-09', 'completado', 'pagado', '2025-04-09', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '33413');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '46956', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'MAYO', '2025-05-09', 'completado', 'pagado', '2025-05-09', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '34186');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '48185', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'JUNIO', '2025-06-10', 'completado', 'pagado', '2025-06-10', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '35047');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '49154', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1315, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1315)) FROM ContratoServicio WHERE id_sede = 1315 AND activo = 1), 'AGOSTO', '2025-08-09', 'completado', 'pagado', '2025-08-11', 'transferencia', 'BCP', 55.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36645');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '50624', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CEV BUSTAMANTE E.I.R.L. (RUC: 20610248706) | Sede ID: 1323 | Hoja: CEV BUSTAMANTE E.I.R.L. (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CEV BUSTAMANTE E.I.R.L. (RUC: 20610248706) | Sede ID: 155 | Hoja: CEV BUSTAMANTE E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: Santos Collantes Alva (RUC: 10427871814) | Sede ID: 929 | Hoja: Santos Collantes Alva
-- ==================================================

-- ==================================================
-- CLIENTE: SANCHEZ PEREZ JORGE ANDRES (RUC: 10731723244) | Sede ID: 1048 | Hoja: SANCHEZ PEREZ JORGE ANDRES
-- ==================================================

-- ==================================================
-- CLIENTE: GOMEZ ALARCO JOSSEP MAURO (RUC: 10406806818) | Sede ID: 1252 | Hoja: GOMEZ ALARCO JOSSEP MAURO
-- ==================================================

-- ==================================================
-- CLIENTE: DIGITAL DENT ODONTOLOGIA ESPECIALIZADA E.I.R.L. (RUC: 20610927972) | Sede ID: 1294 | Hoja: DIGITAL DENT ODONTOLOGIA ESPECI
-- ==================================================

-- ==================================================
-- CLIENTE: CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C. (RUC: 20607342441) | Sede ID: 166 | Hoja: 1483CASTILLA & GASPAR ODONTOLOG
-- ==================================================

-- ==================================================
-- CLIENTE: CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C. (RUC: 20607342441) | Sede ID: 166 | Hoja: 1425CASTILLA & GASPAR ODONTOLOG
-- ==================================================

-- ==================================================
-- CLIENTE: DENTAL VEGADENT EIRL (RUC: 20600736397) | Sede ID: 881 | Hoja: Hubert Vega Toledo
-- ==================================================

-- ==================================================
-- CLIENTE: ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C (RUC: 20601427193) | Sede ID: 912 | Hoja: ODONTOP ODONTOLOGIA ESPECIA (2)
-- ==================================================

-- ==================================================
-- CLIENTE: ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C (RUC: 20601427193) | Sede ID: 912 | Hoja: ODONTOP ODONTOLOGIA ESPECIALIZA
-- ==================================================

-- ==================================================
-- CLIENTE: Jessica Karina Cano Gonzalo (RUC: 10413543130) | Sede ID: 1217 | Hoja: Jessica Karina Cano Gonzalo
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1217, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1217)) FROM ContratoServicio WHERE id_sede = 1217 AND activo = 1), 'OCTUBRE', '2024-10-26', 'completado', 'pendiente', NULL, NULL, 'NO UBICO', NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '41067', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO MEDICO SAN CARLOS PEREZ E.I.R.L. (RUC: 20606659246) | Sede ID: 1220 | Hoja: CENTRO MEDICO SAN CARLOS PEREZ 
-- ==================================================

-- ==================================================
-- CLIENTE: El Milagro de tu Sonrisa EIRL (RUC: 20601583551) | Sede ID: 169 | Hoja: El Milagro de tu Sonrisa EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS VETERINARIOS INGE S.A.C. (RUC: 20473466148) | Sede ID: 511 | Hoja: SERVICIOS VETERINARIOS INGE S.A
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO VETERINARIO LAS VIÑAS SAC (RUC: 20549914951) | Sede ID: 1402 | Hoja:  Grupo veterinario las viñas sa
-- ==================================================

-- ==================================================
-- CLIENTE: Pet lover Perú sac (RUC: 20517114597) | Sede ID: 565 | Hoja: Pet lover Perú sac
-- ==================================================

-- ==================================================
-- CLIENTE: CAVA ODONTOLOGIA ESPECIALIZADA S.A.C. (RUC: 20609132010) | Sede ID: 1304 | Hoja: CAVA ODONTOLOGIA ESPECIALIZADA 
-- ==================================================

-- ==================================================
-- CLIENTE: FLORES VELASQUEZ LUIS RENATO (RUC: 10081507193) | Sede ID: 1305 | Hoja: FLORES VELASQUEZ LUIS RENATO   
-- ==================================================

-- ==================================================
-- CLIENTE: LIMA DEL MAR ESPECIALISTAS MEDICOS S.A.C. (RUC: 20603274084) | Sede ID: 1055 | Hoja: LIMA DEL MAR ESPECIALISTAS MEDI
-- ==================================================

-- ==================================================
-- CLIENTE: Ursula Lidia Pérez Benito (RUC: 10106357477) | Sede ID: 172 | Hoja: Ursula Lidia Pérez Benito
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA NORTH SAC (RUC: 20606899298) | Sede ID: 499 | Hoja: VETERINARIA NORTH SAC
-- ==================================================

-- ==================================================
-- CLIENTE: LOVE & PETS VETERINARIAS SAC (RUC: 20610706747) | Sede ID: 1221 | Hoja: LOVE & PETS VETERINARIAS S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CITYPETS E.I.R.L. (RUC: 20552375905) | Sede ID: 550 | Hoja: CITYPETS E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: SOPIEST S.A.C. (RUC: 20600642023) | Sede ID: 1086 | Hoja: SOPIEST S.A.C.     
-- ==================================================

-- ==================================================
-- CLIENTE: EVET LIMA S.A.C. (RUC: 20602939864) | Sede ID: 1109 | Hoja: EVET LIMA S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: ONLY PETS S.A.C. (RUC: 20565843665) | Sede ID: 909 | Hoja: ONLY PETS S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA LOS FLAMENCOS E.I.R.L. (RUC: 20611282291) | Sede ID: 532 | Hoja: VETERINARIA LOS FLAMENCOS E.I.R
-- ==================================================

-- ==================================================
-- CLIENTE: WORLD ENTERPRICE PETS & VETS S.A.C. (RUC: 20604497559) | Sede ID: 578 | Hoja: WORLD ENTERPRICE PETS & VETS S.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (578, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 578)) FROM ContratoServicio WHERE id_sede = 578 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62534', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Grupo consorcio veterinario sac (RUC: 20607299944) | Sede ID: 78 | Hoja: CERRADO12
-- ==================================================

-- ==================================================
-- CLIENTE: Servicios veterinarios Pet's Medic sac (RUC: 20603950578) | Sede ID: 523 | Hoja: Servicios veterinarios Pet's Me
-- ==================================================

-- ==================================================
-- CLIENTE: CANDIDO VET PET SHOP SPA E.I.R.L - CANDIDO E.I.R.L (RUC: 20603933061) | Sede ID: 979 | Hoja: CANDIDO VET PET SHOP SPA EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (979, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 979)) FROM ContratoServicio WHERE id_sede = 979 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62472', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ROSALES SILVA RAQUEL (RUC: 10425407495) | Sede ID: 930 | Hoja: ROSALES SILVA RAQUEL (2)
-- ==================================================

-- ==================================================
-- CLIENTE: ROSALES SILVA RAQUEL (RUC: 10425407495) | Sede ID: 930 | Hoja: ROSALES SILVA RAQUEL
-- ==================================================

-- ==================================================
-- CLIENTE: VET PLUS EIRL (RUC: 20109724778) | Sede ID: 1253 | Hoja: VET PLUS E.I.R.L.)
-- ==================================================

-- ==================================================
-- CLIENTE: VIRGEN DE LA ASUNCION M Y O S.A.C. (RUC: 20600024150) | Sede ID: 658 | Hoja: VIRGEN DE LA ASUNCION M Y O S.A
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (658, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 658)) FROM ContratoServicio WHERE id_sede = 658 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62615', 'ESPECIAL', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA GONZALEZ S.A.C. (RUC: 20553542431) | Sede ID: 904 | Hoja: CLINICA VETERINARIA GONZALEZ S.
-- ==================================================

-- ==================================================
-- CLIENTE: GONVET PERU S.A.C. (RUC: 20602258328) | Sede ID: 189 | Hoja: GONVET PERU S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIA RADIOLOGICA S.A.C. (RUC: 20607382795) | Sede ID: 730 | Hoja: CONSULTORIA RADIOLOGICA S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: HOSPITAL CLINICO VETERINARIO DEL SUR EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA - HOSPIVETSUR E. (RUC: 20538599175) | Sede ID: 1161 | Hoja: HOSPITAL CLINICO VETERINARIO DE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1161, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1161)) FROM ContratoServicio WHERE id_sede = 1161 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62609', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO MEDICO VETERINARIO & REHABILITACION REHAVET S.A.C. (RUC: 20607942871) | Sede ID: 868 | Hoja: CENTRO MEDICO VETERINARIO & REH
-- ==================================================

-- ==================================================
-- CLIENTE: Fiorella Quineche Andrade (RUC: 10417554691) | Sede ID: 179 | Hoja: Fiorella Quineche Andrade
-- ==================================================

-- ==================================================
-- CLIENTE: Gilberto Arturo Huapaya Marcos (RUC: 10258111473) | Sede ID: 1041 | Hoja: Gilberto Arturo Huapaya Marcos 
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO MULTISERVICIOS Y SALUD M & K E.I.R.L. (RUC: 20611538457) | Sede ID: 1233 | Hoja: GRUPO MULTISERVICIOS Y SALUD M 
-- ==================================================

-- ==================================================
-- CLIENTE: CHAVEZ VILLANUEVA SUSAN SHIRLEY (RUC: 10425174733) | Sede ID: 847 | Hoja: CHAVEZ VILLANUEVA SUSAN SHIRLEY
-- ==================================================

-- ==================================================
-- CLIENTE: J & R DENTAL E.I.R.L (RUC: 20608460722) | Sede ID: 777 | Hoja: J & R DENTAL E.I.R.L
-- ==================================================

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

-- ==================================================
-- CLIENTE: XIMAR SERVICIOS VETERINARIOS S.A.C. (RUC: 20608353187) | Sede ID: 1026 | Hoja: XIMAR SERVICIOS VETERINARIOS S.
-- ==================================================

-- ==================================================
-- CLIENTE: DE LA CRUZ DEUDOR JOSE LUIS (RUC: 10408260031) | Sede ID: 688 | Hoja: DE LA CRUZ DEUDOR JOSE LUIS    
-- ==================================================

-- ==================================================
-- CLIENTE: AntoFabri VS SAC (RUC: 20611638931) | Sede ID: 221 | Hoja:  AntoFabri VS SAC     
-- ==================================================

-- ==================================================
-- CLIENTE: MULTISERVICIOS DE SALUD CHR S.A.C (RUC: 20546143733) | Sede ID: 731 | Hoja: MULTISERVICIOS DE SALUD CHR S.A
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES SALASCORNEJO S.A.C. (RUC: 20611737506) | Sede ID: 848 | Hoja: INVERSIONES SALASCORNEJO S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: ZOOLO MASCOTAS VETERINARIAS S.A.C. (RUC: 20607760561) | Sede ID: 228 | Hoja: ZOOLO MASCOTAS VETERINARIAS S.A
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (228, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 228)) FROM ContratoServicio WHERE id_sede = 228 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62318', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: M & E TRAUMATOLOGIA S.A.C. (RUC: 20611155639) | Sede ID: 768 | Hoja: M & E TRAUMATOLOGIA S.A.C.     
-- ==================================================

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

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (794, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 794)) FROM ContratoServicio WHERE id_sede = 794 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62538', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRACE JESY ALARCON GUTIERREZ (RUC: 10488439281) | Sede ID: 590 | Hoja: GRACE JESY ALARCON GUTIERREZ   
-- ==================================================

-- ==================================================
-- CLIENTE: DAMIAN OSCCO MARI LUZ (RUC: 10480513458) | Sede ID: 234 | Hoja: DAMIAN OSCCO MARI LUZ
-- ==================================================

-- ==================================================
-- CLIENTE: ENJOY DENTAL GROUP S.A.C. (RUC: 20609564416) | Sede ID: 907 | Hoja: ENJOY DENTAL GROUP S.A.C.     
-- ==================================================

-- ==================================================
-- CLIENTE: RIVERA CASTRO PAMELA LISSET (RUC: 10467049599) | Sede ID: 235 | Hoja: RIVERA CASTRO PAMELA LISSET    
-- ==================================================

-- ==================================================
-- CLIENTE: servicios veterinarios Gallardo SAC (RUC: 20602356532) | Sede ID: 1480 | Hoja: servicios veterinarios Gallardo
-- ==================================================

-- ==================================================
-- CLIENTE: INSTITUTO VETERINARIO DE ESPECIALIDADES MEDICAS S.A.C. (RUC: 20563289636) | Sede ID: 669 | Hoja: INSTITUTO VETERINARIO DE ESPECI
-- ==================================================

-- ==================================================
-- CLIENTE: IRIS MEDICINA FELINA E.I.R.L. (RUC: 20611828820) | Sede ID: 1024 | Hoja: IRIS MEDICINA FELINA E.I.R.L.  
-- ==================================================

-- ==================================================
-- CLIENTE: LOKIPET S.A.C (RUC: 20608486888) | Sede ID: 247 | Hoja: LOKIPET S.A.C     
-- ==================================================

-- ==================================================
-- CLIENTE: M&S DENTAL ATELIER SOCIEDAD ANÓNIMA CERRADA - M&S DENTAL ATELIER S.A.C. (RUC: 20600375335) | Sede ID: 754 | Hoja: M&S DENTAL ATELIER SOCIEDAD ANÓ
-- ==================================================

-- ==================================================
-- CLIENTE: Mareli's odontología especializada eirl (RUC: 20600239075) | Sede ID: 1207 | Hoja: Mareli's odontología especializ
-- ==================================================

-- ==================================================
-- CLIENTE: LA JARA HERNANDEZ VICTOR JUAN CARLOS (RUC: 10448686456) | Sede ID: 1149 | Hoja: LA JARA HERNANDEZ VICTOR JUAN C
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIA 4PATAS SOCIEDAD ANONIMA CERRADA (RUC: 20609482231) | Sede ID: 237 | Hoja: VETERINARIA 4PATAS SOCIEDAD ANO
-- ==================================================

-- ==================================================
-- CLIENTE: ROSARIO FARIAS SERVICIOS VETERINARIOS E.I.R.L. (RUC: 20504596754) | Sede ID: 242 | Hoja: ROSARIO FARIAS SERVICIOS VETERI
-- ==================================================

-- ==================================================
-- CLIENTE: YAURI HUIZA ROGER JHOSEF (RUC: 10422960304) | Sede ID: 1190 | Hoja: YAURI HUIZA ROGER JHOSEF     
-- ==================================================

-- ==================================================
-- CLIENTE: Vargas quispe Hugo Martin (RUC: 10422673241) | Sede ID: 251 | Hoja: Vargas quispe Hugo Martin     
-- ==================================================

-- ==================================================
-- CLIENTE: BERROSPI GROUP SAC (RUC: 20606846356) | Sede ID: 1030 | Hoja: BERROSPI GROUP SAC     
-- ==================================================

-- ==================================================
-- CLIENTE: Miguel valencia delgado (RUC: 10167494027) | Sede ID: 249 | Hoja: Miguel valencia delgado     
-- ==================================================

-- ==================================================
-- CLIENTE: MEDIC DENTAL SMILE E.I.R.L. (RUC: 20512338322) | Sede ID: 1277 | Hoja: MEDIC DENTAL SMILE E.I.R.L.    
-- ==================================================

-- ==================================================
-- CLIENTE: JCM SERVICIOS ODONTOLOGICO E.I.R.L (RUC: 20611241411) | Sede ID: 250 | Hoja: JCM SERVICIOS ODONTOLOGICO E.I.
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO ODONTOLOGICO CASAL S.A.C. (RUC: 20565355199) | Sede ID: 1127 | Hoja: GRUPO ODONTOLOGICO CASAL S.A.C.
-- ==================================================

-- ==================================================
-- CLIENTE: VETERINARIOS PET+PERU S.A.C. (RUC: 20611970332) | Sede ID: 1255 | Hoja: VETERINARIOS PET+PERU S.A.C.   
-- ==================================================

-- ==================================================
-- CLIENTE: Odontología especializada Smile Plus E.I.R.L (RUC: 20607074802) | Sede ID: 257 | Hoja: ODONTOLOGIA ESPECIALIZADA SMILE
-- ==================================================

-- ==================================================
-- CLIENTE: PRUDENCIO MAU EDGARD ENRIQUE (RUC: 10098543860) | Sede ID: 1239 | Hoja: PRUDENCIO MAU EDGARD ENRIQUE   
-- ==================================================

-- ==================================================
-- CLIENTE: DRAS VALVERDE SAC (RUC: 20609785412) | Sede ID: 1033 | Hoja: DRAS VALVERDE S.A.C      
-- ==================================================

-- ==================================================
-- CLIENTE: GOICOCHEA ARAUJO SYLVIA ALESANDRA (RUC: 10483191907) | Sede ID: 255 | Hoja: GOICOCHEA ARAUJO SYLVIA ALESAND
-- ==================================================

-- ==================================================
-- CLIENTE: DENTILUXE BOUTIQUE DENTAL S.A.C. (RUC: 20611865253) | Sede ID: 748 | Hoja: DENTILUXE BOUTIQUE DENTAL S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: CHRISTIAN FELIX LUYO AVILA (RUC: 10471530188) | Sede ID: 1007 | Hoja: CHRISTIAN FELIX LUYO AVILA     
-- ==================================================

-- ==================================================
-- CLIENTE: MARÍA ÚRSULA DEL PILAR FLÓREZ CALDERÓN DE CARMEN (RUC: 10096755355) | Sede ID: 274 | Hoja: MARÍA ÚRSULA DEL PILAR FLÓREZ C
-- ==================================================

-- ==================================================
-- CLIENTE: REVISI COMPANY E.I.R.L. (RUC: 20392922203) | Sede ID: 1088 | Hoja: REVISI COMPANY E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: IDENTICAL PRODUCTOS Y SERVICIOS ODONTOLOGICOS S.A.C. (RUC: 20563077531) | Sede ID: 447 | Hoja: S-  IDENTICAL PRODUCTOS Y SERV
-- ==================================================

-- ==================================================
-- CLIENTE: IDENTICAL PRODUCTOS Y SERVICIOS ODONTOLOGICOS S.A.C. (RUC: 20563077531) | Sede ID: 447 | Hoja: VES- IDENTICAL PRODUCTOS Y SER
-- ==================================================

-- ==================================================
-- CLIENTE: Pekitas Dent E.I.R.L (RUC: 20611773367) | Sede ID: 831 | Hoja: Pekitas Dent E.I.R.L     
-- ==================================================

-- ==================================================
-- CLIENTE: Susan Diana Tipe De La Vega (RUC: 10444301509) | Sede ID: 301 | Hoja: Susan Diana Tipe De La Vega    
-- ==================================================

-- ==================================================
-- CLIENTE: My Dentiss SAC (RUC: 20562730771) | Sede ID: 1337 | Hoja: My Dentiss SAC      (2)
-- ==================================================

-- ==================================================
-- CLIENTE: My Dentiss SAC (RUC: 20562730771) | Sede ID: 297 | Hoja: My Dentiss SAC     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (297, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 297)) FROM ContratoServicio WHERE id_sede = 297 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62524', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RELUZ ORELLANA VICTOR MARTIN (RUC: 10081374703) | Sede ID: 1193 | Hoja: RELUZ ORELLANA VICTOR MARTIN   
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION ODONTOLOGICO SAN GABRIEL SAC (RUC: 20608423011) | Sede ID: 1102 | Hoja: CORPORACION ODONTOLOGICO SAN GA
-- ==================================================

-- ==================================================
-- CLIENTE: SAYRITUPAC RIOS ALICIA (RUC: 10215740710) | Sede ID: 872 | Hoja: SAYRITUPAC RIOS ALICIA     
-- ==================================================

-- ==================================================
-- CLIENTE: JAC DENTAL CENTER. S.A.C (RUC: 20610683941) | Sede ID: 1079 | Hoja: JAC DENTAL CENTER. S.A.C     
-- ==================================================

-- ==================================================
-- CLIENTE: MEDENT SALUD EIRL (RUC: 20607005371) | Sede ID: 1457 | Hoja: MEDENT SALUD EIRL     
-- ==================================================

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

-- ==================================================
-- CLIENTE: ONCOLOGIA S.A.C. (RUC: 20428674201) | Sede ID: 833 | Hoja: ONCOLOGIA SAC     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (833, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 833)) FROM ContratoServicio WHERE id_sede = 833 AND activo = 1), 'JUNIO', '2026-06-06', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62572', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Andrea Contreras Consultorio Odontológico SAC (RUC: 20611285974) | Sede ID: 1196 | Hoja: Andrea Contreras Consultorio Od
-- ==================================================

-- ==================================================
-- CLIENTE: Veterinaria Sanivet SAC (RUC: 20612144223) | Sede ID: 351 | Hoja: Veterinaria Sanivet SAC     
-- ==================================================

-- ==================================================
-- CLIENTE: ASENDENT PERU S.A.C. (RUC: 20611786582) | Sede ID: 896 | Hoja: ASEN DENT     
-- ==================================================

-- ==================================================
-- CLIENTE: GABRIELA AQUINO HILARES (RUC: 10100796801) | Sede ID: 353 | Hoja: GABRIELA AQUINO HILARES     
-- ==================================================

-- ==================================================
-- CLIENTE: OPERADORES ODONTOLOGICOS WALFER S.A.C. (RUC: 20556748684) | Sede ID: 1406 | Hoja: OPERADORES ODONTOLOGICOS WA (2)
-- ==================================================

-- ==================================================
-- CLIENTE: OPERADORES ODONTOLOGICOS WALFER S.A.C. (RUC: 20556748684) | Sede ID: 889 | Hoja: OPERADORES ODONTOLOGICOS WALFER
-- ==================================================

-- ==================================================
-- CLIENTE: Rosse Mery Vilchez Maravi (RUC: 10453900865) | Sede ID: 345 | Hoja: Rosse Mery Vilchez Maravi      
-- ==================================================

-- ==================================================
-- CLIENTE: ESPINOZA ATENCIO FABIOLA CATHERINE (RUC: 10705051807) | Sede ID: 1210 | Hoja: ESPINOZA ATENCIO FABIOLA CATHER
-- ==================================================

-- ==================================================
-- CLIENTE: CEMIVET SAC (RUC: 20612314510) | Sede ID: 360 | Hoja: CEMIVET SAC     
-- ==================================================

-- ==================================================
-- CLIENTE: GUIDENT EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA (RUC: 20557299212) | Sede ID: 681 | Hoja: S GUIDENT EMPRESA INDIVIDUAL
-- ==================================================

-- ==================================================
-- CLIENTE: AJA MEDINA HERMANOS S.A.C. (RUC: 20612142221) | Sede ID: 372 | Hoja: AJA MEDINA HERMANOS S.A.C.     
-- ==================================================

-- ==================================================
-- CLIENTE: Susan Leroy Garro Bedriñana (RUC: 10098796491) | Sede ID: 637 | Hoja: Susan Leroy Garro Bedriñana    
-- ==================================================

-- ==================================================
-- CLIENTE: María Betzabe Acuña cusma (RUC: 10272822072) | Sede ID: 376 | Hoja: María Betzabe Acuña cusma     
-- ==================================================

-- ==================================================
-- CLIENTE: Any Johana Vasquez Ramirez (RUC: 10457775763) | Sede ID: 1235 | Hoja: Any Johana Vasquez Ramirez     
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA FELINA JACOBITA S.A.C. (RUC: 20609688913) | Sede ID: 1174 | Hoja: CLINICA FELINA JACOBITA S.A (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA FELINA JACOBITA S.A.C. (RUC: 20609688913) | Sede ID: 1174 | Hoja: CLINICA FELINA JACOBITA S.A.C. 
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CERRADA (RUC: 20511018553) | Sede ID: 381 | Hoja: MEDICAL AND ODONTOLOGY ESPECIAL
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CERRADA (RUC: 20511018553) | Sede ID: 381 | Hoja: MEDICAL AND ODONTOLOGY SERVICE 
-- ==================================================

-- ==================================================
-- CLIENTE: Feel Vet SAC (RUC: 20612328456) | Sede ID: 379 | Hoja: Feel  Vet SAC     
-- ==================================================

-- ==================================================
-- CLIENTE: Christina Inga Villanueva (RUC: 10445138318) | Sede ID: 384 | Hoja: Christina Inga Villanueva      
-- ==================================================

-- ==================================================
-- CLIENTE: Dávila Gutiérrez Davis Clint (RUC: 10455206371) | Sede ID: 1200 | Hoja: Dávila Gutiérrez Davis Clint 
-- ==================================================

-- ==================================================
-- CLIENTE: MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A.C (RUC: 20608420933) | Sede ID: 1128 | Hoja: MASKOTOPIA CLINICAS
-- ==================================================

-- ==================================================
-- CLIENTE: SOTO ENCISO ROSA LUCY ANGELICA (RUC: 10101197552) | Sede ID: 402 | Hoja: SOTO ENCISO ROSA LUCY ANGELICA 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (402, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 402)) FROM ContratoServicio WHERE id_sede = 402 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62601', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: LOURDES KARINA PAREDES CAIHUACAS (RUC: 10408752162) | Sede ID: 403 | Hoja: LOURDES KARINA PAREDES CAIHUACA
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica odontológica Feijoo Eirl (RUC: 20602434916) | Sede ID: 417 | Hoja: Clínica odontológica Feijoo Eir
-- ==================================================

-- ==================================================
-- CLIENTE: FLORES CARBAJAL LENIN WALTER (RUC: 10459123500) | Sede ID: 1419 | Hoja: FLORES CARBAJAL LENIN WALTE (3)
-- ==================================================

-- ==================================================
-- CLIENTE: FLORES CARBAJAL LENIN WALTER (RUC: 10459123500) | Sede ID: 1420 | Hoja: FLORES CARBAJAL LENIN WALTE (2)
-- ==================================================

-- ==================================================
-- CLIENTE: FLORES CARBAJAL LENIN WALTER (RUC: 10459123500) | Sede ID: 1420 | Hoja: FLORES CARBAJAL LENIN WALTER   
-- ==================================================

-- ==================================================
-- CLIENTE: MANUEL ALEJANDRO VIDAL FLORES (RUC: 10410038523) | Sede ID: 425 | Hoja: MANUEL ALEJANDRO VIDAL FLORES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (425, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 425)) FROM ContratoServicio WHERE id_sede = 425 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62463', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Díaz Manco Tiffany Betsabe (RUC: 10431798927) | Sede ID: 426 | Hoja: Díaz Manco Tiffany Betsabe     
-- ==================================================

-- ==================================================
-- CLIENTE: AIDA YENI CRISTOBAL JAUNI (RUC: 10479926897) | Sede ID: 433 | Hoja: AIDA YENI CRISTOBAL JAUNI 
-- ==================================================

-- ==================================================
-- CLIENTE: VIA ODONTOLOGICA ESECIALIZADA S.A.C (RUC: 20611762462) | Sede ID: 428 | Hoja: VIA ODONTOLOGICA ESECIALIZADA 
-- ==================================================

-- ==================================================
-- CLIENTE: Cosmetic Dent EIRL (RUC: 20548390908) | Sede ID: 439 | Hoja: Cosmetic Dent EIRL 
-- ==================================================

-- ==================================================
-- CLIENTE: Centro de terapia física y rehabilitación AVS SAC (RUC: 20612275409) | Sede ID: 431 | Hoja: Centro de terapia física y reha
-- ==================================================

-- ==================================================
-- CLIENTE: CHAVEZ VEREAU NATALI (RUC: 10425189021) | Sede ID: 1222 | Hoja: CHAVEZ VEREAU NATALI
-- ==================================================

-- ==================================================
-- CLIENTE: ADMINISTRADORA DE SERVICIOS INTEGRALES DE SALUD S.A.C. - ADSERINSA (RUC: 20555957808) | Sede ID: 446 | Hoja: ADMINISTRADORA DE SERVICIOS (2)
-- ==================================================

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

-- ==================================================
-- CLIENTE: HUAMANI VILLANUEVA KATIA KARINA (RUC: 10427788399) | Sede ID: 444 | Hoja: HUAMANI VILLANUEVA KATIA KARINA
-- ==================================================

-- ==================================================
-- CLIENTE: Veterinaria central traverso eirl (RUC: 20609375575) | Sede ID: 453 | Hoja: Veterinaria central traverso ei
-- ==================================================

-- ==================================================
-- CLIENTE: VET SAN PATRICIO SAC (RUC: 20613529897) | Sede ID: 686 | Hoja: VET SAN PATRICIO SAC
-- ==================================================

-- ==================================================
-- CLIENTE: VANEDENT EIRL (RUC: 20603826273) | Sede ID: 475 | Hoja: VANEDENT EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: REPRESENTACIONES EL HURON AZUL EIRL (RUC: 20602159826) | Sede ID: 1349 | Hoja: O-CENTRODEDIAGNOSTICOYESPECIA
-- ==================================================

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

-- ==================================================
-- CLIENTE: OMONTE GUTIERREZ JOHAN ROLANDO (RUC: 10437752911) | Sede ID: 441 | Hoja: VES OMONTE GUTIERREZ JOHAN R
-- ==================================================

-- ==================================================
-- CLIENTE: Multiservicios Advance SAC (RUC: 20612191116) | Sede ID: 456 | Hoja: Multiservicios Advance SAC
-- ==================================================

-- ==================================================
-- CLIENTE: LESCANO AGUIRRE JESUS ENRIQUE (RUC: 10075482570) | Sede ID: 1121 | Hoja: LESCANO AGUIIRE
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO MEDICO DEL SUEÑO Y RESPIRACION SAC (RUC: 20610886958) | Sede ID: 1214 | Hoja: CONSULTORIO MEDICO DEL SUEÑO
-- ==================================================

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
VALUES (1212, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1212)) FROM ContratoServicio WHERE id_sede = 1212 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62455', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: UCAL S.A.C (RUC: 20537886618) | Sede ID: 1288 | Hoja: UCAL SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1288, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1288)) FROM ContratoServicio WHERE id_sede = 1288 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62546', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.PACHACUTEC 403 VES
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.INDUSTRIAL 3733
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.NICOLAS AYLLON 816  (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62477', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.PRIMAVERA 970 
-- ==================================================

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1280 | Hoja: D. EDU.PRIMAVERA 1016
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'FEBRERO', '2025-02-14', 'completado', 'pagado', '2025-09-30', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36517');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '44862', 'BIOCONTAMINADO', 0.00);

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
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'OCTUBRE', '2024-10-22', 'completado', 'pagado', '2025-03-12', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '40901', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), '43075');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'NOVIEMBRE', '2024-11-21', 'completado', 'pagado', '2025-03-12', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '41961', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), '44005');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'FEBRERO', '2025-02-20', 'completado', 'pagado', '2025-09-30', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36513');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '45163', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'MARZO', '2025-03-21', 'completado', 'pagado', '2025-09-30', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36513');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '46289', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'ABRIL', '2025-04-24', 'completado', 'pagado', '2025-09-30', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36513');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '47393', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'MAYO', '2025-05-21', 'completado', 'pagado', '2025-09-30', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36513');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '48492', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'JUNIO', '2025-06-20', 'completado', 'pagado', '2025-09-30', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36513');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '48765', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'JULIO', '2025-07-17', 'completado', 'pagado', '2025-09-30', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '36513');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '49674', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'SEPTIEMBRE', '2025-09-19', 'completado', 'pagado', '2025-12-18', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), 'F-38926');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '51770', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'OCTUBRE', '2025-10-20', 'completado', 'pagado', '2025-12-18', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), 'F-39224');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '52939', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'NOVIEMBRE', '2025-11-19', 'completado', 'pagado', '2026-03-03', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), 'F-40778');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '54060', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'MARZO', '2026-03-26', 'completado', 'pagado', '2026-05-12', 'transferencia', 'CANCELADO', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43312');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '59428', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1280, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1280)) FROM ContratoServicio WHERE id_sede = 1280 AND activo = 1), 'MAYO', '2026-05-21', 'completado', 'pendiente', NULL, NULL, 'POR PAGAR', NULL, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44994');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61831', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Desarrollo Educativo S.A (RUC: 20603817185) | Sede ID: 1283 | Hoja: D. EDU.SANTIAGO DE SURCO 4717
-- ==================================================

-- ==================================================
-- CLIENTE: Karen Ilse Ploog Cortes (RUC: 10409273586) | Sede ID: 504 | Hoja: KAREN ILSE PLOOG CORTES
-- ==================================================

-- ==================================================
-- CLIENTE: VIDAMEDIC INVERSIONES SAC (RUC: 20611971495) | Sede ID: 483 | Hoja: VIDAMEDIC INVERSIONES SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Dental Medical Group H & M E.I.R.L. (RUC: 20612478440) | Sede ID: 1247 | Hoja: Dental Medical Group H & M E.I
-- ==================================================

-- ==================================================
-- CLIENTE: Velazco Arias Sofia Carolina (RUC: 10728839401) | Sede ID: 507 | Hoja: Velazco Arias Sofia Carolin
-- ==================================================

-- ==================================================
-- CLIENTE: Ivonne Geraldine Montes Valenzuela (RUC: 10481649515) | Sede ID: 1205 | Hoja: Ivonne Geraldine Montes Valenzu
-- ==================================================

-- ==================================================
-- CLIENTE: BRIDENT DENTAL SAC (RUC: 20606413352) | Sede ID: 512 | Hoja: BRIDENT DENTAL SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Servicios Veterinarios Pets Sites SAC (RUC: 20612298832) | Sede ID: 522 | Hoja: Servicios Veterinarios Pets (2)
-- ==================================================

-- ==================================================
-- CLIENTE: KEIRAN SRL (RUC: 20342043730) | Sede ID: 524 | Hoja: KERIAN SRL
-- ==================================================

-- ==================================================
-- CLIENTE: Karen Katherine Hernández Caba (RUC: 10467128171) | Sede ID: 525 | Hoja: Karen Katherine Hernández Caba
-- ==================================================

-- ==================================================
-- CLIENTE: CUBASALUD E.I.R.L. (RUC: 20612269051) | Sede ID: 526 | Hoja: CUBASALUD E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: REHTO SALUD SAC (RUC: 20612105473) | Sede ID: 508 | Hoja: REHTO SALUD SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO VETERINARIO Y DIAGNOSTICO SONOVET S.A.C. (RUC: 20613064231) | Sede ID: 1274 | Hoja: Centro ecográfico Camilo Roldán
-- ==================================================

-- ==================================================
-- CLIENTE: CCORI SUMAQ SRL (RUC: 20608165623) | Sede ID: 528 | Hoja: CCORI SUMAQ SRL 
-- ==================================================

-- ==================================================
-- CLIENTE: Emily Liliana Llacza Arellano (RUC: 10739542885) | Sede ID: 814 | Hoja: Emily Liliana Llacza Arellano  
-- ==================================================

-- ==================================================
-- CLIENTE: Servicios Veterinarios Sebasmedic EIRL (RUC: 20613400002) | Sede ID: 537 | Hoja: Servicios Veterinarios Sebasmed
-- ==================================================

-- ==================================================
-- CLIENTE: HEALTHY PETS HERMANOS SAC (RUC: 20612705951) | Sede ID: 541 | Hoja: HEALTHY PETS HERMANOS SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Corporativo Veterinario SAC (RUC: 20546435432) | Sede ID: 515 | Hoja: Corporativo Veterinario SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO ODONTOLÓGICO BENJAMÍN DOIG SAC (RUC: 20607006335) | Sede ID: 631 | Hoja: CENTRO ODONTOLÓGICO BENJAMÍN DO
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO VETERINARIO OASIS DE LIMA SUR S.A.C. (RUC: 20610844929) | Sede ID: 548 | Hoja: CENTRO VETERINARIO OASIS DE LIM
-- ==================================================

-- ==================================================
-- CLIENTE: Lourdes Juliana Mathias López (RUC: 10076457382) | Sede ID: 1218 | Hoja: Lourdes Juliana Mathias López  
-- ==================================================

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1256 | Hoja: SRGlow Inversiones SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1256 | Hoja: ESPSRGlow Inversiones SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1257 | Hoja: BRGlow Inversiones SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1257 | Hoja: ESPBRGlow Inversiones SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1256 | Hoja: CHGlow Inversiones SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Glow Inversiones SAC (RUC: 20600575733) | Sede ID: 1258 | Hoja: ESPCHGlow Inversiones SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Juan Francisco Murrugarra Sánchez (RUC: 10415827330) | Sede ID: 317 | Hoja: JUAN FRANCISCO MURRUGARRA SANCH
-- ==================================================

-- ==================================================
-- CLIENTE: HIJAR VELASQUEZ MERLING KARINA (RUC: 10430336946) | Sede ID: 556 | Hoja: HIJAR VELASQUEZ MERLING KARINA
-- ==================================================

-- ==================================================
-- CLIENTE: Canales Larrea, Angela María (RUC: 10403783019) | Sede ID: 619 | Hoja: Canales Larrea, Angela María 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (619, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 619)) FROM ContratoServicio WHERE id_sede = 619 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pagado', '2026-06-05', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45037');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62537', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: JC REHAB EIRL (RUC: 20603575718) | Sede ID: 557 | Hoja: JC REHAB EIRL 
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICINA EXTERNA S.A (RUC: 20100339936) | Sede ID: 1251 | Hoja: MEDICINA EXTERNA SA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62294', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62495', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-06', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62496', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1251, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1251)) FROM ContratoServicio WHERE id_sede = 1251 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62497', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clínica Veterinaria Eovet sac (RUC: 20612475408) | Sede ID: 1219 | Hoja: Clínica Veterinaria Eovet sac
-- ==================================================

-- ==================================================
-- CLIENTE: ACVET PERU E.I.R.L (RUC: 20605441077) | Sede ID: 610 | Hoja: 3 DE OCTUBREACVET PERU E.I 
-- ==================================================

-- ==================================================
-- CLIENTE: ACVET PERU E.I.R.L (RUC: 20605441077) | Sede ID: 610 | Hoja: SIMONBOLIVAR.ACVET PERU E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: ACVET PERU E.I.R.L (RUC: 20605441077) | Sede ID: 610 | Hoja: SMPACVET PERU E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Veterinaria Ámbar EIRL (RUC: 20602702805) | Sede ID: 639 | Hoja: Clínica Veterinaria Ámbar EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Veterinaria Ámbar EIRL (RUC: 20602702805) | Sede ID: 639 | Hoja: CORPORACIÓN AMBAR E.I.R.L
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Veterinaria Ámbar EIRL (RUC: 20602702805) | Sede ID: 639 | Hoja: PACHAClínica Veterinaria Ámbar 
-- ==================================================

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA TRINYVET E.I.R.L. (RUC: 20605946527) | Sede ID: 635 | Hoja: CLINICA VETERINARIA TRINYVET E.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (635, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 635)) FROM ContratoServicio WHERE id_sede = 635 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62603', 'BIOCONTAMINADO', 0.00);

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

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (170, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 170)) FROM ContratoServicio WHERE id_sede = 170 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62325', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Arvet Sacs (RUC: 20613649213) | Sede ID: 170 | Hoja: ARVET ASOCIADOS S.A.C.S.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (170, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 170)) FROM ContratoServicio WHERE id_sede = 170 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pagado', '2026-06-01', 'efectivo', 'CANCELADO', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45028');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62317', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO DE TERAPIA ALTERNATIVA Y ANTIENVEJECIMIENTO S.A.C (RUC: 20511051682) | Sede ID: 617 | Hoja: CENTRO DE TERAPIA ALTERNATIVA Y
-- ==================================================

-- ==================================================
-- CLIENTE: SILVA HUAMANI ROSIO RAQUEL (RUC: 10099762263) | Sede ID: 714 | Hoja: SILVA HUAMANI ROSIO RAQUEL     
-- ==================================================

-- ==================================================
-- CLIENTE: ESTHETICDENT SAC (RUC: 20513473665) | Sede ID: 609 | Hoja: ESTHETICDENT SAC
-- ==================================================

-- ==================================================
-- CLIENTE: RAMOS GUERRERO LIZETH ARACELY (RUC: 10727044774) | Sede ID: 734 | Hoja: RAMOS GUERRERO LIZETH ARACELY
-- ==================================================

-- ==================================================
-- CLIENTE: BRAÑEZ VIVAS LEONIDAS CERILO (RUC: 10162969868) | Sede ID: 733 | Hoja: BRAÑEZ VIVAS LEONIDAS CERILO
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica dental el Remanso Sac (RUC: 20545628377) | Sede ID: 739 | Hoja: Clínica dental el Remanso SAC
-- ==================================================

-- ==================================================
-- CLIENTE: INSTITUTO DE EDUCACIÓN SUPERIOR RICARDO PALMA S.A (RUC: 20338856955) | Sede ID: 634 | Hoja: INSTITUTO DE EDUCACION SUPE (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (634, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 634)) FROM ContratoServicio WHERE id_sede = 634 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62480', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: INSTITUTO DE EDUCACIÓN SUPERIOR RICARDO PALMA S.A (RUC: 20338856955) | Sede ID: 634 | Hoja: INSTITUTO DE EDUCACION SUPERIO
-- ==================================================

-- ==================================================
-- CLIENTE: Miriam Rocio Gamarra López (RUC: 10090813434) | Sede ID: 760 | Hoja: Miriam Rocio Gamarra López     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (760, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 760)) FROM ContratoServicio WHERE id_sede = 760 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62608', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Veterinaria vida animal e.i.r.l. (RUC: 20613580051) | Sede ID: 690 | Hoja: Veterinaria vida animal e.i.r.l
-- ==================================================

-- ==================================================
-- CLIENTE: QUALAB S.A.C (RUC: 20603175558) | Sede ID: 695 | Hoja: QUALAB S.A.C      
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (695, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 695)) FROM ContratoServicio WHERE id_sede = 695 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62447', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO MEDICO DENTAL SANTA INES S.A. (RUC: 20331894789) | Sede ID: 810 | Hoja: CENTRO MEDICO DENTAL SANTA INES
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (810, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 810)) FROM ContratoServicio WHERE id_sede = 810 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62539', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Jhonny Marcelo Astete Torrejón (RUC: 10211338640) | Sede ID: 823 | Hoja: JHONNY MARCELO ASTETE TORREJON
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (823, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 823)) FROM ContratoServicio WHERE id_sede = 823 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62465', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: EDUARDO SALAS ZORRILLA (RUC: 10421021363) | Sede ID: 832 | Hoja: EDUARDO SALAS ZORRILLA       
-- ==================================================

-- ==================================================
-- CLIENTE: Angelica ivett Guevara Jara (RUC: 10096304728) | Sede ID: 822 | Hoja: Angelica ivett Guevara Jara    
-- ==================================================

-- ==================================================
-- CLIENTE: Dental specialists SAC (RUC: 20548900361) | Sede ID: 850 | Hoja: Dental specialists SAC       
-- ==================================================

-- ==================================================
-- CLIENTE: Lilia Rosa Esquivel Rodriguez (RUC: 10752706765) | Sede ID: 844 | Hoja: Lilia Rosa Esquivel Rodriguez
-- ==================================================

-- ==================================================
-- CLIENTE: ELENA COTRINA LLANOS (RUC: 10423970672) | Sede ID: 849 | Hoja: ELENA COTRINA LLANOS       
-- ==================================================

-- ==================================================
-- CLIENTE: LIDER DENT INVERSIONES MEDICAS SAC (RUC: 20603720670) | Sede ID: 852 | Hoja: LIDER DENT INVERSIONES MEDICAS 
-- ==================================================

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

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (908, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 908)) FROM ContratoServicio WHERE id_sede = 908 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62467', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Consultorio Odontológico Dentios E.I.R.L (RUC: 20613838385) | Sede ID: 905 | Hoja: Consultorio Odontológico Dentio
-- ==================================================

-- ==================================================
-- CLIENTE: DENTALMANS E.I.R.L. (RUC: 20601130506) | Sede ID: 913 | Hoja: DENTALMANS EIRL       
-- ==================================================

-- ==================================================
-- CLIENTE: VERAMENDI MEDIC SACS (RUC: 20613628101) | Sede ID: 1297 | Hoja: VERAMENDI MEDIC SAC       
-- ==================================================

-- ==================================================
-- CLIENTE: Arnaldo Nique Medrano Verastegui (RUC: 10106058208) | Sede ID: 920 | Hoja: Arnaldo Nique Medrano Verastegu
-- ==================================================

-- ==================================================
-- CLIENTE: Corporación HKS EIRL (RUC: 20609205947) | Sede ID: 916 | Hoja: Corporación HKS EIRL       
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (916, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 916)) FROM ContratoServicio WHERE id_sede = 916 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62540', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: PAREDES NAVARRO PATRICIA (RUC: 10106193091) | Sede ID: 1295 | Hoja: PAREDES NAVARRO PATRICIA       
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1295, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1295)) FROM ContratoServicio WHERE id_sede = 1295 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62610', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Oda Rios melgar (RUC: 10419707371) | Sede ID: 1296 | Hoja: Oda Rios melgar       
-- ==================================================

-- ==================================================
-- CLIENTE: VETCARE S.A.C. (RUC: 20614046172) | Sede ID: 1302 | Hoja: VETCARE S.A.C.            
-- ==================================================

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

-- ==================================================
-- CLIENTE: Denthalix E.I.R.L. (RUC: 20613766295) | Sede ID: 939 | Hoja: Denthalix E.I.R.L.
-- ==================================================

-- ==================================================
-- CLIENTE: W&M CORPORACION SALUD S.A.C (RUC: 20613941577) | Sede ID: 1308 | Hoja: W&M CORPORACION SALUD S.A.C
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1308, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1308)) FROM ContratoServicio WHERE id_sede = 1308 AND activo = 1), 'JUNIO', '2026-06-06', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62571', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Centro Odontológico Fritz EIRL (RUC: 20507230033) | Sede ID: 1312 | Hoja: Centro Odontológico Fritz EIRL 
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS ODONTOLOGICOS INTEGRALES VAMDENT E.I.R.L. (RUC: 20549566228) | Sede ID: 1313 | Hoja:  SERVICIOS ODONTOLOGICOS INTEGR
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1313, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1313)) FROM ContratoServicio WHERE id_sede = 1313 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62611', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: C & F ODONTOLOGIA INTEGRAL S.A.C. (RUC: 20612208825) | Sede ID: 1315 | Hoja: C & F ODONTOLOGIA INTEGRAL S.A.
-- ==================================================

-- ==================================================
-- CLIENTE: THE GROOMING PLACE-VETERINARIA & PET SHOP S.A.C. (RUC: 20613113721) | Sede ID: 987 | Hoja: THE GROOMING PLACE-VETERINARIA 
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES MEFANE SAC (RUC: 20606393521) | Sede ID: 1318 | Hoja: INVERSIONES MEFANE SAC       
-- ==================================================

-- ==================================================
-- CLIENTE: INVERSIONES MEFANE SAC (RUC: 20606393521) | Sede ID: 1316 | Hoja: INVERSIONES MEFANE SAC}
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica veterinaria Dr.JhonD'vet (RUC: 20612962198) | Sede ID: 1003 | Hoja: CLINICA VETERINARIA DR JHONDVET
-- ==================================================

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

-- ==================================================
-- CLIENTE: sonrisas 360 EIRL (RUC: 20613077147) | Sede ID: 1326 | Hoja: SONRISAS 360
-- ==================================================

-- ==================================================
-- CLIENTE: GAMARRA HEALTHCARE CENTER SAC (RUC: 20600994302) | Sede ID: 1328 | Hoja: GAMARRA HEALTHCARE CENTER SAC  
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62445', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1328, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1328)) FROM ContratoServicio WHERE id_sede = 1328 AND activo = 1), 'JUNIO', '2026-06-03', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62444', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RYM SERVICIOS DE ESPECIALIDAD S.A.C. (RUC: 20613514229) | Sede ID: 1330 | Hoja: RYM SERVICIOS DE ESPECIALIDAD S
-- ==================================================

-- ==================================================
-- CLIENTE: MÁS QUE PATAZAS S. A. C. (RUC: 20613817663) | Sede ID: 1331 | Hoja: MÁS QUE PATAZAS S. A. C.       
-- ==================================================

-- ==================================================
-- CLIENTE: Linda Huarancca Chumbe (RUC: 10407791091) | Sede ID: 1332 | Hoja: Linda Huarancca Chumbe
-- ==================================================

-- ==================================================
-- CLIENTE: ROJAS DURAND OSCAR AMADEO (RUC: 10329712945) | Sede ID: 1333 | Hoja: ROJAS DURAND OSCAR AMADEO      
-- ==================================================

-- ==================================================
-- CLIENTE: Alessandra Patricia Villena Cumpa (RUC: 10470044743) | Sede ID: 1334 | Hoja: Alessandra Patricia Villena Cum
-- ==================================================

-- ==================================================
-- CLIENTE: Jesús kiyoshi haramura glave (RUC: 10468277307) | Sede ID: 1335 | Hoja: Jesús kiyoshi haramura glave   
-- ==================================================

-- ==================================================
-- CLIENTE: LEOPOLDO MENESES ENTERPRISES E.I.R.L. (RUC: 20607524760) | Sede ID: 1339 | Hoja: LEOPOLDO MENESES ENTERPRISES E.
-- ==================================================

-- ==================================================
-- CLIENTE: MOREANO VEGA BRENDA LUCERO (RUC: 10479890205) | Sede ID: 1340 | Hoja: MOREANO VEGA BRENDA LUCERO
-- ==================================================

-- ==================================================
-- CLIENTE: King vet S.A.C (RUC: 20609560844) | Sede ID: 1343 | Hoja: King vet S.A.C  (2)
-- ==================================================

-- ==================================================
-- CLIENTE: King vet S.A.C (RUC: 20609560844) | Sede ID: 1342 | Hoja: King vet S.A.C 
-- ==================================================

-- ==================================================
-- CLIENTE: Grupo inversiones J&J asociados sac (RUC: 20614036002) | Sede ID: 1344 | Hoja: GRUPO INVERSIONES J&J ASOCIADOS
-- ==================================================

-- ==================================================
-- CLIENTE: Luz pilar solis javier (RUC: 10258012599) | Sede ID: 1164 | Hoja: Luz pilar solis javier
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Veterinaria & Pet Shop SERVICAN EIRL (RUC: 20609283174) | Sede ID: 1346 | Hoja: Clínica Veterinaria & Pet Shop 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1346, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1346)) FROM ContratoServicio WHERE id_sede = 1346 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62591', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CENTRO PRE-NATAL VIDA NUEVA (RUC: 20429156883) | Sede ID: 1351 | Hoja: CENTRO PRE-NATAL VIDA NUEVA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1351, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1351)) FROM ContratoServicio WHERE id_sede = 1351 AND activo = 1), 'MARZO', '2026-03-06', 'completado', 'pagado', '2026-04-07', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '43289');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1351, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1351)) FROM ContratoServicio WHERE id_sede = 1351 AND activo = 1), 'ABRIL', '2026-04-06', 'completado', 'pagado', '2026-06-06', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45025');

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1351, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1351)) FROM ContratoServicio WHERE id_sede = 1351 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pagado', '2026-06-06', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45025');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62547', 'BIOCONTAMINADO', 0.00);

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

-- ==================================================
-- CLIENTE: CORPORACION SONRISA SEGURA SAC (RUC: 20603143788) | Sede ID: 1359 | Hoja: SURCOCORPORACION SONRISA 
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION DENTAL PERUANA SONRISA SEGURA SAC (RUC: 20606650346) | Sede ID: 1360 | Hoja: MOLINACORPORACION SONRISA  
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1360, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1360)) FROM ContratoServicio WHERE id_sede = 1360 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62556', 'ESPECIAL', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1360, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1360)) FROM ContratoServicio WHERE id_sede = 1360 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62549', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CORPORACION SONRISA 3D SAC (RUC: 20606610557) | Sede ID: 1361 | Hoja: CHORRCORPORACION SONRISA 3D SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION PERUANA DE FRANQUICIAS DENTALES (RUC: 20606688823) | Sede ID: 1362 | Hoja: SJMCORPORACION PERUANA
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO SALUD DENTAL SAC (RUC: 20609199823) | Sede ID: 1363 | Hoja: OLIVOSGRUPO SALUD DENTAL SAC
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION EMPRESARIAL SEGURA SAC (RUC: 20608245414) | Sede ID: 1364 | Hoja: SMPCORPORACION EMPRESARIAL SEGU
-- ==================================================

-- ==================================================
-- CLIENTE: LA BARATISIMA SAC (RUC: 20601353041) | Sede ID: 1365 | Hoja: SANMIGUELLA BARATISIMA SA
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO 3D SAC (RUC: 20610058648) | Sede ID: 1366 | Hoja: MIRAFLOCENTRO DE DIAGNOSTICO 3D
-- ==================================================

-- ==================================================
-- CLIENTE: CORPORACION DE FRANQUICIAS ODONTOLOGICAS SAC (RUC: 20613473255) | Sede ID: 1367 | Hoja: VMTCORPORACION DE FRANQUICIAS
-- ==================================================

-- ==================================================
-- CLIENTE: FRANQUICIAS DE INNOVACION DENTAL SAC (RUC: 20613275810) | Sede ID: 1356 | Hoja: ATEFRANQUICIAS DE INNOVACION
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1356, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1356)) FROM ContratoServicio WHERE id_sede = 1356 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62478', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1356, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1356)) FROM ContratoServicio WHERE id_sede = 1356 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62481', 'ESPECIAL', 0.00);

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
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62411', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-06', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62489', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62488', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, 'ESPECIAL');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61493', 'ESPECIAL', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1369, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1369)) FROM ContratoServicio WHERE id_sede = 1369 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62490', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DETECTA CENTRO ONCOLOGICO S.A.C. (RUC: 20515468499) | Sede ID: 1370 | Hoja: SANBORDETECTA CENTRO ONCOLOGICO
-- ==================================================

-- ==================================================
-- CLIENTE: DOWAVA EIRL (RUC: 20612006564) | Sede ID: 1371 | Hoja: DOWAVA
-- ==================================================

-- ==================================================
-- CLIENTE: Jorge Luis Chavez Jara (RUC: 10704322521) | Sede ID: 1373 | Hoja: Jorge Luis Chavez Jara
-- ==================================================

-- ==================================================
-- CLIENTE: Medical center G.A SAC (RUC: 20614657678) | Sede ID: 1374 | Hoja: MEDICAL CENTER G.A SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Panoral Sac (RUC: 20478196106) | Sede ID: 1372 | Hoja: PANORAL SAC
-- ==================================================

-- ==================================================
-- CLIENTE: FIORELA NUÑEZ ROSAS (RUC: 10752476883) | Sede ID: 1378 | Hoja: Fiorela Nuñez Rosas
-- ==================================================

-- ==================================================
-- CLIENTE: Cristiam Roger Ayma Cusma (RUC: 10421409566) | Sede ID: 1380 | Hoja: Cristiam Roger Ayma Cusma
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1380, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1380)) FROM ContratoServicio WHERE id_sede = 1380 AND activo = 1), 'JUNIO', '2026-06-08', 'completado', 'pagado', '2026-06-08', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45038');

-- ==================================================
-- CLIENTE: Clínica dental happy faces (RUC: 20609097061) | Sede ID: 1382 | Hoja: Clínica dental happy faces 
-- ==================================================

-- ==================================================
-- CLIENTE: HUATUCO GONZALES GINA MIRIAM (RUC: 10107142458) | Sede ID: 1384 | Hoja: HUATUCO GONZALES GINA MIRIAM
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1384, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1384)) FROM ContratoServicio WHERE id_sede = 1384 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pagado', '2026-06-06', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45039');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62479', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DIAGNODENT S.A.C. (RUC: 20547256639) | Sede ID: 1385 | Hoja: DIAGNODENT SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: COAC MIRAFLORES E.I.R.L (RUC: 20614823021) | Sede ID: 1386 | Hoja: COAC MIRAFLORES EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: MUNICIPALIDAD DISTRITAL DE SURQUILLO (RUC: 20131372346) | Sede ID: 1383 | Hoja: MUNICIPALIAD DISTRITAL DE SURQU
-- ==================================================

-- ==================================================
-- CLIENTE: Marisol Gaona Valderrama (RUC: 10754878253) | Sede ID: 1387 | Hoja: Marisol Gaona Valderrama
-- ==================================================

-- ==================================================
-- CLIENTE: Hipólity MEDICAL Group EIRL (RUC: 20614742101) | Sede ID: 1390 | Hoja: HIPOLITY MEDICAL GROUP EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: ACERO PULIDO ESTHER JEANETTE (RUC: 10424571330) | Sede ID: 1391 | Hoja: ACERO PULIDO ESTHER JEANETTE
-- ==================================================

-- ==================================================
-- CLIENTE: HUAMAN ZARATE HENRY WALTER (RUC: 10107652634) | Sede ID: 1392 | Hoja: HUAMAN ZARATE HENRY WALTER2
-- ==================================================

-- ==================================================
-- CLIENTE: ELVIS OBLITAS TARRILLO (RUC: 10709139652) | Sede ID: 1393 | Hoja: Elvis Oblitas Tarrillo 
-- ==================================================

-- ==================================================
-- CLIENTE: Beauty Touch Estética Orofacial & Odontologia (RUC: 20608795074) | Sede ID: 1394 | Hoja: Beauty Touch Estética Orofacial
-- ==================================================

-- ==================================================
-- CLIENTE: MUNICIPALIDAD DISTRITAL DE JESUS MARIA (RUC: 20131366290) | Sede ID: 1407 | Hoja: MUNICIPALIDAD DISTRITAL DE JESU
-- ==================================================

-- ==================================================
-- CLIENTE: LACVET CLINICA VETERINARIA E.I.R.L. (RUC: 20615227481) | Sede ID: 1423 | Hoja: SILVA CAMPOS ARMANDO RAFAEL
-- ==================================================

-- ==================================================
-- CLIENTE: Club Sonrisa Perú S.A.C (RUC: 20608397192) | Sede ID: 1396 | Hoja: Club Sonrisa Perú S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: WENCESLAO QUISPE SORIA
-- ==================================================

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: WENCESLAO QUISPE SORIA2
-- ==================================================

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: AD CENTRO DE INNOVACION DEN (2)
-- ==================================================

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: AD CENTRO DE INNOVACION DENTAL 
-- ==================================================

-- ==================================================
-- CLIENTE: QUICENTRODENTAL EIRL (RUC: 20604167320) | Sede ID: 1400 | Hoja: QUICENTRODENTAL EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: GRUPO VETERINARIO LAS VIÑAS SAC (RUC: 20549914951) | Sede ID: 1402 | Hoja: GRUPO VETERINARIO LAS VIÑAS (2)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1402, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1402)) FROM ContratoServicio WHERE id_sede = 1402 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62551', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: GRUPO VETERINARIO LAS VIÑAS SAC (RUC: 20549914951) | Sede ID: 1402 | Hoja: GRUPO VETERINARIO LAS VIÑAS SAC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1402, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1402)) FROM ContratoServicio WHERE id_sede = 1402 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62550', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Wilmer Vasquez Ramirez (RUC: 10103985191) | Sede ID: 1403 | Hoja: WILMER VASQUEZ RAMIREZ
-- ==================================================

-- ==================================================
-- CLIENTE: Karina Esthefania Espinal Melgarejo (RUC: 10712395619) | Sede ID: 1415 | Hoja: Karina Esthefania Espinal Melga
-- ==================================================

-- ==================================================
-- CLIENTE: Karina Esthefania Espinal Melgarejo (RUC: 10712395619) | Sede ID: 1415 | Hoja: HOJA(4)
-- ==================================================

-- ==================================================
-- CLIENTE: TELLO CHUNGA NORMA JANNET (RUC: 10423855946) | Sede ID: 1405 | Hoja: TELLO CHUNGA NORMA JANNET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1405, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1405)) FROM ContratoServicio WHERE id_sede = 1405 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62332', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DERMATOLÓGICA PERÚ E.I.R.L. (RUC: 20601483701) | Sede ID: 1412 | Hoja: DERMATOLÓGICA PERÚ E.I.R.L.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-03', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62442', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1412, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1412)) FROM ContratoServicio WHERE id_sede = 1412 AND activo = 1), 'JUNIO', '2026-06-05', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62443', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Veterinaria Elías Mendoza Cerna (RUC: 10267189442) | Sede ID: 1408 | Hoja: Veterinaria Elías Mendoza Cerna
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1408, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1408)) FROM ContratoServicio WHERE id_sede = 1408 AND activo = 1), 'JUNIO', '2026-06-01', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62333', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA DEL NORTE S.A.C. (RUC: 20613146149) | Sede ID: 818 | Hoja: CLINICA VETERINARIA DEL NORTE
-- ==================================================

-- ==================================================
-- CLIENTE: CONSULTORIO DENTAL DR. CUADROS E.I.R.L. (RUC: 20615187322) | Sede ID: 1414 | Hoja: CONSULTORIO DENTAL DR. CUADROS 
-- ==================================================

-- ==================================================
-- CLIENTE: Brenda del Pilar Durango Hernández (RUC: 10106346793) | Sede ID: 1416 | Hoja: Brenda del Pilar Durango Hernán
-- ==================================================

-- ==================================================
-- CLIENTE: SERVICIOS VETERINARIOS CASTRO SOLUTION SAC (RUC: 20605393994) | Sede ID: 1418 | Hoja: SERVICIOS VETERINARIOS CASTRO S
-- ==================================================

-- ==================================================
-- CLIENTE: ATM SERVET SAC (RUC: 20603611579) | Sede ID: 1422 | Hoja: ATM SERVET SAC
-- ==================================================

-- ==================================================
-- CLIENTE: GARCIA RAMIREZ WASHINGTON (RUC: 10061555418) | Sede ID: 1424 | Hoja: GARCIA RAMIREZ WASHINGTON
-- ==================================================

-- ==================================================
-- CLIENTE: Augusto Donayre Casas (RUC: 10705486048) | Sede ID: 1426 | Hoja: Augusto Donayre Casas 
-- ==================================================

-- ==================================================
-- CLIENTE: VitalPro SAC (RUC: 20614280639) | Sede ID: 1427 | Hoja: VitalPro SAC
-- ==================================================

-- ==================================================
-- CLIENTE: SANTOS MERA CINDY STHEFANY (RUC: 10472383952) | Sede ID: 1417 | Hoja: SANTOS MERA CINDY
-- ==================================================

-- ==================================================
-- CLIENTE: DENTALISTA S.A.C. (RUC: 20611537698) | Sede ID: 1430 | Hoja: DENTALISTA S.A.C.
-- ==================================================

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

-- ==================================================
-- CLIENTE: Olivia Paola Carmona Quispe (RUC: 10704450996) | Sede ID: 1439 | Hoja: Olivia Paola Carmona Quispe
-- ==================================================

-- ==================================================
-- CLIENTE: MAILLET VET EIRL (RUC: 20613318233) | Sede ID: 1440 | Hoja: MAILLET VET EIRL 
-- ==================================================

-- ==================================================
-- CLIENTE: MANRIQUE CHUQUISPUMA DARIO CRISANTO (RUC: 10439236219) | Sede ID: 1443 | Hoja: MANRIQUE CHUQUISPUMA DARIO CRIS
-- ==================================================

-- ==================================================
-- CLIENTE: jessica landa andia (RUC: 10106468589) | Sede ID: 1445 | Hoja: LANDA ANDIA JESSICA NIEVES
-- ==================================================

-- ==================================================
-- CLIENTE: AR DENTAL ESTUDIO EIRL (RUC: 20611759739) | Sede ID: 1446 | Hoja: AR DENTAL ESTUDIO EIRL
-- ==================================================

-- ==================================================
-- CLIENTE: DR. JOSE LUIS VET S.A.C. (RUC: 20609067137) | Sede ID: 1447 | Hoja: DR. JOSE LUIS VET S.A.C. 
-- ==================================================

-- ==================================================
-- CLIENTE: SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726,2728,2728-A,2730,2738,2740 AREA 1,379.26 M2. PUEBLO LIBRE (RUC: 20612164984) | Sede ID: 1461 | Hoja: SEGUNDA ETAPA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1461, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1461)) FROM ContratoServicio WHERE id_sede = 1461 AND activo = 1), 'JUNIO', '2026-06-04', 'completado', 'pendiente', NULL, 'transferencia', NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62501', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Aldo Enrique Gabriel Flores (RUC: 10099131166) | Sede ID: 1452 | Hoja: Aldo Enrique Gabriel Flores
-- ==================================================

-- ==================================================
-- CLIENTE: ENDODONCIARTE EIRL (RUC: 20614306131) | Sede ID: 1453 | Hoja: ENDODONCIARTE  EIRL 
-- ==================================================

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

-- ==================================================
-- CLIENTE: ICBSAS (RUC: 20613697447) | Sede ID: 1462 | Hoja: ICBSAS SAC
-- ==================================================

-- ==================================================
-- CLIENTE: Luis Estiv Goyas Blancas (RUC: 10409294613) | Sede ID: 1463 | Hoja: Luis Estiv Goyas Blancas 
-- ==================================================

-- ==================================================
-- CLIENTE: Luiggi Orlando Cornejo Peralta (RUC: 10103292811) | Sede ID: 1481 | Hoja: Luiggi Orlando Cornejo Peralta
-- ==================================================

-- ==================================================
-- CLIENTE: G&R House SAC (RUC: 20615032965) | Sede ID: 1464 | Hoja: G&R House SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: ENTRE MOTAS EIRL (RUC: 20609377764) | Sede ID: 1465 | Hoja: ENTRE MOTAS EIRL 
-- ==================================================

-- ==================================================
-- CLIENTE: ROMERO OBREGON ANDREA BELEN (RUC: 10451242526) | Sede ID: 1467 | Hoja: ROMERO OBREGON ANDREA BELEN
-- ==================================================

-- ==================================================
-- CLIENTE: MIKADENT S.A.C (RUC: 20600344707) | Sede ID: 1466 | Hoja: MIKADENT S.A.C 
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica dental Snowdent eirl (RUC: 20607657077) | Sede ID: 1469 | Hoja: Clínica dental Snowdent eirl
-- ==================================================

-- ==================================================
-- CLIENTE: Amara inversiones S.A.C (RUC: 20615198324) | Sede ID: 1470 | Hoja: Amara inversiones S.A.C
-- ==================================================

-- ==================================================
-- CLIENTE: Alorella Dent Sac (RUC: 20615481654) | Sede ID: 1472 | Hoja: Alorella Dent Sac
-- ==================================================

-- ==================================================
-- CLIENTE: VET PRIME - DIAGNÓSTICO ECOGRÁFICO SOCIEDAD ANÓNIMA CERRADA (RUC: 20615600572) | Sede ID: 1476 | Hoja: VET PRIME - DIAGNÓSTICO ECOGRÁF
-- ==================================================

-- ==================================================
-- CLIENTE: SOTO ABARCA EDGARD ANTENOR (RUC: 10086344772) | Sede ID: 1477 | Hoja: SOTO ABARCA EDGARD ANTENOR
-- ==================================================

-- ==================================================
-- CLIENTE: EMPRESA GVET GESTIONES VETERINARIAS EIRL (RUC: 20608516434) | Sede ID: 1479 | Hoja: EMPRESA GVET GESTIONES VETERINA
-- ==================================================

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

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (785, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 785)) FROM ContratoServicio WHERE id_sede = 785 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 268.20, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45007');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62084', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Centro de Diagnostico Bioquim Laboratorio SCRL (RUC: 20495102255) | Sede ID: 107 | Hoja: centro de diag bioquim
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (107, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 107)) FROM ContratoServicio WHERE id_sede = 107 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', 'YAPE', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44859');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62083', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: POLICLINICO ESPECIALIZADO SAN JOSE EIRL (RUC: 20606364319) | Sede ID: 787 | Hoja: poli espe san jose
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (787, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 787)) FROM ContratoServicio WHERE id_sede = 787 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', 'YAPE', 200.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44968');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62089', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: NAPURI REJAS FERNANDO ISIDORO (RUC: 10410545573) | Sede ID: 73 | Hoja: NAPURI FERNANDO
-- ==================================================

-- ==================================================
-- CLIENTE: SARAVIA HUAMAN LUIS ALBERTO (RUC: 10445899548) | Sede ID: 27 | Hoja: LUIS SARAVIA HUAMAN
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (27, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 27)) FROM ContratoServicio WHERE id_sede = 27 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', 'YAPE', 65.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44969');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62090', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: DAYSI IVETT DIAZ SANCHEZ (RUC: 10478360041) | Sede ID: 66 | Hoja: DAYSI DIAZ
-- ==================================================

-- ==================================================
-- CLIENTE: ANIMAL CENTER GUERRERO SAC (RUC: 20602844332) | Sede ID: 784 | Hoja: Animal Center
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (784, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 784)) FROM ContratoServicio WHERE id_sede = 784 AND activo = 1), 'MAYO', '2026-05-28', 'completado', 'pagado', '2026-05-30', 'efectivo', 'CANCELADO', 80.00, NULL);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA SAN MARTIN DE PORRES EIRL (RUC: 20534783010) | Sede ID: 371 | Hoja: CLINVET SMP
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (371, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 371)) FROM ContratoServicio WHERE id_sede = 371 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 94.40, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45008');
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), '62086');

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA PRADO SAC (RUC: 20600507258) | Sede ID: 786 | Hoja: clin vet Prado 
-- ==================================================

-- ==================================================
-- CLIENTE: WF VETERINARIOS SAC (RUC: 20605041834) | Sede ID: 789 | Hoja: wf vet
-- ==================================================

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: A-CINTHIA CABEZAS
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1155, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1155)) FROM ContratoServicio WHERE id_sede = 1155 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-06-04', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44971');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62096', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: JOSE SALAS-CINTHIA CABEZAS (3)
-- ==================================================

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: NU-CINTHIA CABEZAS (2)
-- ==================================================

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: JFK-CINTHIA CABEZAS (3)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1155, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1155)) FROM ContratoServicio WHERE id_sede = 1155 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-06-04', 'transferencia', NULL, 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44971');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62098', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820) | Sede ID: 1155 | Hoja: CI-CINTHIA CABEZAS (4)
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1155, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1155)) FROM ContratoServicio WHERE id_sede = 1155 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-06-04', 'transferencia', NULL, 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44971');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62097', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: NASCA VET SERVICIOS VETERINARIOS S.A.C. (RUC: 20601823307) | Sede ID: 843 | Hoja: NASCA VET SERV VET
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (843, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 843)) FROM ContratoServicio WHERE id_sede = 843 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-07', 'transferencia', 'BCP', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44158');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62088', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA FARM VETERINARIA PTE BLANCO EIRL (RUC: 20410478529) | Sede ID: 842 | Hoja: CLIN FARM VET PTE BLANCO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (842, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 842)) FROM ContratoServicio WHERE id_sede = 842 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-07', 'transferencia', 'BCP', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44156');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62085', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: VET SERVICE & CIA E.I.R.L (RUC: 20602683169) | Sede ID: 803 | Hoja: VET SERVICE
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DE DIAGNOSTICO ESPECIALIZADO INTEGRALAB E.I.R.L. (RUC: 20609032180) | Sede ID: 788 | Hoja: CENTRO DE DIAGN. ESP.INTEGRALAB
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (788, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 788)) FROM ContratoServicio WHERE id_sede = 788 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', NULL, 150.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44923');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62091', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'YAPE');

-- ==================================================
-- CLIENTE: CORPORACION EMPRESARIAL SEÑOR DE LUREN SAC (RUC: 20605036512) | Sede ID: 1069 | Hoja: CORPORACION EMPRESARIAL SEÑOR D
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1069, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1069)) FROM ContratoServicio WHERE id_sede = 1069 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pendiente', NULL, 'transferencia', NULL, 306.93, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45013');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '60999', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Clinica Dental Señor Nazareno EIRL (RUC: 20452838011) | Sede ID: 135 | Hoja: Clinica Dental Señor Nazareno E
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (135, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 135)) FROM ContratoServicio WHERE id_sede = 135 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'efectivo', NULL, 80.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45009');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62092', 'BIOCONTAMINADO', 0.00);
INSERT INTO Guia (id_servicio, numero_guia) VALUES (LAST_INSERT_ID(), 'CANCELADO');

-- ==================================================
-- CLIENTE: ZELAYA JULIAN SHARON ABIGAIL (RUC: 10703582856) | Sede ID: 1138 | Hoja: ZELAYA JULIAN SHARON ABIGAIL
-- ==================================================

-- ==================================================
-- CLIENTE: CARDENAS FIGUEROA ALEXANDER WILFREDO (RUC: 10446544522) | Sede ID: 226 | Hoja: CARDENAS FIGUEROA ALEXANDER WIL
-- ==================================================

-- ==================================================
-- CLIENTE: VIDAMEDIC INVERSIONES SAC (RUC: 20611971495) | Sede ID: 483 | Hoja: VIVAMEDIC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (483, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 483)) FROM ContratoServicio WHERE id_sede = 483 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 118.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45014');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62201', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ROJAS MOLLAPAZA VIOLETA (RUC: 10408266896) | Sede ID: 1223 | Hoja: ROJAS MOLLAPAZA VIOLETA     
-- ==================================================

-- ==================================================
-- CLIENTE: Clínica Veterinaria Martinez E.I.R.L (RUC: 20494351855) | Sede ID: 292 | Hoja: Clínica Veterinaria Martinez E.
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (292, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 292)) FROM ContratoServicio WHERE id_sede = 292 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'efectivo', 'CANCELADO', 128.35, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45010');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62093', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: ROSA MERCEDES DONAYRE CAYO (RUC: 10414097729) | Sede ID: 418 | Hoja: "ROSA MERCEDES DONAYRE CAYO
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (418, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 418)) FROM ContratoServicio WHERE id_sede = 418 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pendiente', NULL, 'transferencia', 'POR PAGAR', 118.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45011');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62094', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: clinica veterinaria brown e.i.r.l (RUC: 20603070462) | Sede ID: 465 | Hoja: CLINICA VETERINARIA BROWN EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (465, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 465)) FROM ContratoServicio WHERE id_sede = 465 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'efectivo', 'CANCELADO', 118.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45012');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62095', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Asociación Civil San Martin de Porres Perú ONG (RUC: 20609198801) | Sede ID: 484 | Hoja: Asociación Civil San Martin de 
-- ==================================================

-- ==================================================
-- CLIENTE: LEXMI QUINTANILLA TAMBRA (RUC: 10410633391) | Sede ID: 505 | Hoja: LEXMI QUINTANILLA TAMBRA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (505, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 505)) FROM ContratoServicio WHERE id_sede = 505 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-06-05', 'transferencia', 'YAPE', 118.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45015');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61002', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: MEDICOS SOLIDARIOS SMG SAC (RUC: 20543542157) | Sede ID: 513 | Hoja: MEDICOS SOLIDARIOS SMG SAC
-- ==================================================

-- ==================================================
-- CLIENTE: MEDICOS SOLIDARIOS SMG SAC (RUC: 20543542157) | Sede ID: 513 | Hoja: CHMEDICOS SOLIDARIOS SMG 
-- ==================================================

-- ==================================================
-- CLIENTE: CENTRO DIAGNOSTICO ECOFETAL SOCIEDAD ANONIMA CERRADA (RUC: 20608833766) | Sede ID: 765 | Hoja: CENTRO DIAGNOSTICO ECOFETAL SOC
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (765, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 765)) FROM ContratoServicio WHERE id_sede = 765 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', 'YAPE', 120.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44858');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62205', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA HERNANI S.A.C (RUC: 20608647709) | Sede ID: 853 | Hoja: CLINICA HERNANI SAC       
-- ==================================================

-- ==================================================
-- CLIENTE: PRINCIPAL VET SAC (RUC: 20607987441) | Sede ID: 886 | Hoja: PRINCIPAL VET SAC     
-- ==================================================

-- ==================================================
-- CLIENTE: Gonzales Elias Claudio Jesus (RUC: 10768018044) | Sede ID: 921 | Hoja: GONZALES ELIAS CLAUDIO JESUS   
-- ==================================================

-- ==================================================
-- CLIENTE: Dr. Francisco Roman M. EIRL (RUC: 20604590371) | Sede ID: 932 | Hoja: Dr. Francisco Roman M. EIRL    
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (932, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 932)) FROM ContratoServicio WHERE id_sede = 932 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', 'YAPE', 120.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44861');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62206', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA VETERINARIA ALONZO SAC (RUC: 20611374799) | Sede ID: 949 | Hoja: CLINICA VETERINARIA ALONZO SAC 
-- ==================================================

-- ==================================================
-- CLIENTE: Zuly Geraldine Ayón Cayo (RUC: 10469256621) | Sede ID: 1144 | Hoja: Zuly Geraldine Ayón Cayo
-- ==================================================

-- ==================================================
-- CLIENTE: LOZA AYBAR YULY KATHERINE (RUC: 10705649796) | Sede ID: 988 | Hoja: LOZA AYBAR YULY KATHERINE      
-- ==================================================

-- ==================================================
-- CLIENTE: KELY BURGA GONZALES (RUC: 10430226059) | Sede ID: 951 | Hoja: KELY BURGA GONZALES     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (951, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 951)) FROM ContratoServicio WHERE id_sede = 951 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pendiente', NULL, 'transferencia', 'por pagar', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45016');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62208', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Emerson Escriba Palomino (RUC: 10215605880) | Sede ID: 946 | Hoja: Emerson Escriba Palomino     
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (946, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 946)) FROM ContratoServicio WHERE id_sede = 946 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44967');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62207', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: CLINICA DENTAL PERUDENT EIRL (RUC: 20600279581) | Sede ID: 1345 | Hoja: CLINICA DENTAL PERU DENT EIRL
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1345, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1345)) FROM ContratoServicio WHERE id_sede = 1345 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', 'YAPE', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44970');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62209', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: clinica veterinaria faccevet sac (RUC: 20601805741) | Sede ID: 1279 | Hoja: clinica veterinaria faccevet sa
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1279, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1279)) FROM ContratoServicio WHERE id_sede = 1279 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'efectivo', 'CANCELADO', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45018');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62210', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: RRGASTROCENTER SAC (RUC: 20614114682) | Sede ID: 1388 | Hoja: RR GASTROCENTER SAC 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1388, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1388)) FROM ContratoServicio WHERE id_sede = 1388 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-06-05', 'transferencia', 'YAPE', 100.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45019');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62211', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: Centro Nefrologico Señor de la.Misericordia SAC (RUC: 20554908641) | Sede ID: 1404 | Hoja: CENTRO NEFROLOGICO SEÑOR DE LA
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'MAYO', '2026-05-22', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61191', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'MAYO', '2026-05-25', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61961', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'MAYO', '2026-05-27', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61962', 'BIOCONTAMINADO', 0.00);

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1404, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1404)) FROM ContratoServicio WHERE id_sede = 1404 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pendiente', NULL, NULL, NULL, NULL, NULL);
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '61963', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: POLICLINICO BIOQUIM E.I.R.L (RUC: 20604003335) | Sede ID: 1468 | Hoja: POLICLINICO BIOQUIIM 
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1468, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1468)) FROM ContratoServicio WHERE id_sede = 1468 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'transferencia', 'YAPE', 90.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '44860');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62213', 'BIOCONTAMINADO', 0.00);

-- ==================================================
-- CLIENTE: URIBE DOMINGUEZ ROSEMARY MARLENY (RUC: 10703063352) | Sede ID: 1437 | Hoja: ROSEMARY MARLENY URIBE DOMINGUE
-- ==================================================

INSERT INTO Servicio (id_sede, id_planta, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, fecha_pago, forma_pago, observaciones, monto_cobrado, residuo)
VALUES (1437, 1, (SELECT COALESCE(MAX(id_contrato), (SELECT MAX(id_contrato) FROM ContratoServicio WHERE id_sede = 1437)) FROM ContratoServicio WHERE id_sede = 1437 AND activo = 1), 'MAYO', '2026-05-29', 'completado', 'pagado', '2026-05-29', 'efectivo', 'CANCELADO', 70.00, NULL);
INSERT INTO Factura (id_servicio, numero_factura) VALUES (LAST_INSERT_ID(), '45020');
INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, peso_kg) VALUES (LAST_INSERT_ID(), '62212', 'BIOCONTAMINADO', 0.00);

SET FOREIGN_KEY_CHECKS = 1;