-- ========================================================
-- DATABASE SYNC: MASTER DATA FROM BASE DE DATOS 2026.xlsx
-- Generated on: 2026-07-09 10:54:58
-- ========================================================

START TRANSACTION;

-- --------------------------------------------------------
-- SECTION 1: DEACTIVATE SEDES NOT IN EXCEL (HISTORICAL DATA PRESERVED)
-- --------------------------------------------------------

-- Deactivating historical Sede: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 99900000001)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 31;
-- Deactivating parent Empresa ID: 16 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 16;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 16;

-- Deactivating historical Sede: Sede S/N (RUC: 99900000002)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 594;
-- Deactivating parent Empresa ID: 259 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 259;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1772;

-- Deactivating historical Sede: Linares Veterinaria & Spa (RUC: 99900000003)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 1241;
-- Deactivating parent Empresa ID: 519 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 519;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 518;

-- Deactivating historical Sede: Luz de vida (RUC: 99900000004)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3092;
-- Deactivating parent Empresa ID: 1325 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1325;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1322;

-- Deactivating historical Sede: POLIDENTO (RUC: 99900000005)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3140;
-- Deactivating parent Empresa ID: 1349 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1349;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1346;

-- Deactivating historical Sede: JAVIER ARNULFO DIAZ PERA (RUC: 10091999817)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3146;
-- Deactivating parent Empresa ID: 1353 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1353;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1349;

-- Deactivating historical Sede: CONSULTORIO PEDIATRICO JAVIER DIAZ (RUC: 10091999817)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3147;

-- Deactivating historical Sede: HIDALGO VERA MILAGRITOS DEL ROSARIO (RUC: 10102678686)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3148;
-- Deactivating parent Empresa ID: 1354 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1354;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1350;

-- Deactivating historical Sede: Econodent (RUC: 10102678686)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3149;

-- Deactivating historical Sede: PATO VET SAC (RUC: 20516583020)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3150;
-- Deactivating parent Empresa ID: 1355 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1355;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1351;

-- Deactivating historical Sede: PATOVET (RUC: 20516583020)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3151;

-- Deactivating historical Sede: SALCEDO RIOJA OMAR HUMBERTO (RUC: 10094659863)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3152;
-- Deactivating parent Empresa ID: 1356 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1356;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1352;

-- Deactivating historical Sede: veterinaria Salcedo (RUC: 10094659863)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3153;

-- Deactivating historical Sede: YARICE QUIÑA MARIBEL (RUC: 10432628855)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3154;
-- Deactivating parent Empresa ID: 1357 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1357;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1353;

-- Deactivating historical Sede: Dental CareYarice (RUC: 10432628855)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3155;

-- Deactivating historical Sede: VANESSA PAOLA FRANCO CABRERA (RUC: 10433700053)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3156;
-- Deactivating parent Empresa ID: 1358 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1358;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1354;

-- Deactivating historical Sede: CRONEX VET (RUC: 10433700053)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3157;

-- Deactivating historical Sede: NEUROSALUD PERU S.A.C. (RUC: 20601951607)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3158;
-- Deactivating parent Empresa ID: 1359 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1359;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1355;

-- Deactivating historical Sede: Neurosalud (RUC: 20601951607)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3159;

-- Deactivating historical Sede: HUELLA VERDE CLINICA VETERINARIA S.A.C. (RUC: 20608539621)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3160;
-- Deactivating parent Empresa ID: 1360 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1360;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1356;

-- Deactivating historical Sede: Veterinaria huella verde (RUC: 20608539621)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3161;

-- Deactivating historical Sede: COHAILA CALATAYUD SANDRA KATHERINE (RUC: 10423920063)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3162;
-- Deactivating parent Empresa ID: 1361 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1361;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1357;

-- Deactivating historical Sede: COHAILA CALATAYUD SANDRA KATHERINE (RUC: 10423920063)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3163;

-- Deactivating historical Sede: INSTITUTO GUESTALT DE LIMA S.A.C. (RUC: 20502688881)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3164;
-- Deactivating parent Empresa ID: 1362 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1362;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1358;

-- Deactivating historical Sede: INSTITUTO GUESTALT DE LIMA (RUC: 20502688881)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3165;

-- Deactivating historical Sede: A & K ODONTOLOGOS ASOCIADOS S.A.C. (RUC: 20603701756)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3166;
-- Deactivating parent Empresa ID: 1363 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1363;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1359;

-- Deactivating historical Sede: CENTRO ODONTOLOGIVO SAN RAFEL (RUC: 20603701756)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3167;

-- Deactivating historical Sede: Andrea Estefania Vicente Villanueva (RUC: 10468960929)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3168;
-- Deactivating parent Empresa ID: 1364 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1364;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1360;

-- Deactivating historical Sede: Angeles Bonelli Gianella Solange (RUC: 10762319093)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3169;
-- Deactivating parent Empresa ID: 1365 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1365;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1361;

-- Deactivating historical Sede: GIANELLA ANGELES (RUC: 10762319093)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3170;

-- Deactivating historical Sede: ARADENT E.I.R.L. (RUC: 20399036446)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3171;
-- Deactivating parent Empresa ID: 1366 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1366;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1362;

-- Deactivating historical Sede: clínica dental Aradent (RUC: 20399036446)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3172;

-- Deactivating historical Sede: BEAUTYMED S.A.C. (RUC: 20607592366)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3173;
-- Deactivating parent Empresa ID: 1367 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1367;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1363;

-- Deactivating historical Sede: EMY SPA (RUC: 20607592366)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3174;

-- Deactivating historical Sede: Bolívar chumbe walter (RUC: 10104484935)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3175;
-- Deactivating parent Empresa ID: 1368 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1368;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1364;

-- Deactivating historical Sede: mi salud (RUC: 10104484935)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3176;

-- Deactivating historical Sede: BRAMOSIO HERRER ALEJANDRO (RUC: 10703774330)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3177;
-- Deactivating parent Empresa ID: 1369 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1369;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1365;

-- Deactivating historical Sede: ZOONA ANIMAL (RUC: 10703774330)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3178;

-- Deactivating historical Sede: BRENDA MONICA ROMERO CIEZA (RUC: 10765877291)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3179;
-- Deactivating parent Empresa ID: 1370 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1370;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1366;

-- Deactivating historical Sede: NOVADENTAL (RUC: 10765877291)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3180;

-- Deactivating historical Sede: CENTRO MEDICO PREVEMEDIC S.A.C. (RUC: 20562703293)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3181;
-- Deactivating parent Empresa ID: 1371 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1371;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1367;

-- Deactivating historical Sede: CLINICA VETERINARIA AURIS S.A.C. (RUC: 20550330564)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3182;
-- Deactivating parent Empresa ID: 1372 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1372;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1368;

-- Deactivating historical Sede: CLINICA VETERINARIA AURIS (RUC: 20550330564)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3183;

-- Deactivating historical Sede: CLINICA VETERINARIA BENDEZU S.A.C. (RUC: 20551878199)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3184;
-- Deactivating parent Empresa ID: 1373 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1373;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1369;

-- Deactivating historical Sede: CANIS MENOR (RUC: 20551878199)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3185;

-- Deactivating historical Sede: CONTRERAS QUINTERO GERALDINE YOSEPH (RUC: 15604220499)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3186;
-- Deactivating parent Empresa ID: 1374 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1374;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1370;

-- Deactivating historical Sede: Menos pelos (RUC: 15604220499)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3187;

-- Deactivating historical Sede: Corporación 3T S.A.C. (RUC: 20606313188)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3188;
-- Deactivating parent Empresa ID: 1375 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1375;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1371;

-- Deactivating historical Sede: TIME DENTAL STUDIO (RUC: 20606313188)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3189;

-- Deactivating historical Sede: DIAZ CASTAÑEDA MIGUEL ANGEL (RUC: 10103402471)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3190;
-- Deactivating parent Empresa ID: 1376 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1376;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1372;

-- Deactivating historical Sede: COLLAR ROJO (RUC: 10103402471)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3191;

-- Deactivating historical Sede: FLORES EGOCHEAGA NELLY SEVELYN (RUC: 10764628824)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3192;
-- Deactivating parent Empresa ID: 1377 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1377;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1373;

-- Deactivating historical Sede: ODONTOLOGIA SEVELYN FLORES (RUC: 10764628824)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3193;

-- Deactivating historical Sede: GABRIELA RAMOS MANCILLA (RUC: 10472186618)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3194;
-- Deactivating parent Empresa ID: 1378 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1378;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1374;

-- Deactivating historical Sede: VILLAFEM (RUC: 10472186618)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3195;

-- Deactivating historical Sede: GRIN DENTAL E.I.R.L. (RUC: 20608726536)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3196;
-- Deactivating parent Empresa ID: 1379 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1379;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1375;

-- Deactivating historical Sede: GRIN DENTAL (RUC: 20608726536)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3197;

-- Deactivating historical Sede: IDCO SAC (RUC: 20512926186)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3198;
-- Deactivating parent Empresa ID: 1380 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1380;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1376;

-- Deactivating historical Sede: INYECTO SALUD SAC (RUC: 20606187115)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3199;
-- Deactivating parent Empresa ID: 1381 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1381;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1377;

-- Deactivating historical Sede: INYECTOSALUD (RUC: 20606187115)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3200;

-- Deactivating historical Sede: LA NOIRE CAMPOS MICHELLE TATIANA (RUC: 10098553229)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3201;
-- Deactivating parent Empresa ID: 1382 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1382;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1378;

-- Deactivating historical Sede: Lidaly Consultorios Dentales SAC (RUC: 20553119601)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3202;
-- Deactivating parent Empresa ID: 1383 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1383;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1379;

-- Deactivating historical Sede: CENTRO ODONTOLOGICO DENTSUR (RUC: 20553119601)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3203;

-- Deactivating historical Sede: LILIAN GIOVANNA SANCHEZ ROSALES (RUC: 10434222821)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3204;
-- Deactivating parent Empresa ID: 1384 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1384;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1380;

-- Deactivating historical Sede: ZOO PE & SPA (RUC: 10434222821)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3205;

-- Deactivating historical Sede: LUIS ALBERTO CARBAJAL ALTAMIRANO (RUC: 10224652980)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3206;
-- Deactivating parent Empresa ID: 1385 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1385;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1381;

-- Deactivating historical Sede: BASSET HOUND (RUC: 10224652980)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3207;

-- Deactivating historical Sede: LYON SECURE LAB E.I.R.L. (RUC: 20608117491)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3208;
-- Deactivating parent Empresa ID: 1386 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1386;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1382;

-- Deactivating historical Sede: MAMANI YUCRA MARIA ROSA (RUC: 10805298958)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3209;
-- Deactivating parent Empresa ID: 1387 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1387;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1383;

-- Deactivating historical Sede: CLINICA SAMARIA PIE (RUC: 10805298958)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3210;

-- Deactivating historical Sede: MARIA FATIMA PORTOCARRERO NIETO DE JIBAJA (RUC: 10456603471)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3211;
-- Deactivating parent Empresa ID: 1388 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1388;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1384;

-- Deactivating historical Sede: DRA MARIA FATIMA PORTOCARRERO (RUC: 10456603471)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3212;

-- Deactivating historical Sede: MARINKOVICH Y ASOCIADOS S.A.C. (RUC: 20506138281)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3213;
-- Deactivating parent Empresa ID: 1389 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1389;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1385;

-- Deactivating historical Sede: MARINKOVICH Y ASOCIADOS (RUC: 20506138281)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3214;

-- Deactivating historical Sede: VICTOR BARRANTES (RUC: 20506138281)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3215;

-- Deactivating historical Sede: MARITZA ROSARIO CASTILLA YATACO (RUC: 10100222057)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3216;
-- Deactivating parent Empresa ID: 1390 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1390;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1386;

-- Deactivating historical Sede: PET DAYS (RUC: 10100222057)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3217;

-- Deactivating historical Sede: MATE INVERSIONES E.I.R.L. (RUC: 20603182872)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3218;
-- Deactivating parent Empresa ID: 1391 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1391;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1387;

-- Deactivating historical Sede: DENTALFLEX (RUC: 20603182872)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3219;

-- Deactivating historical Sede: MI MEDIK CENTRO CLINICO AVANZADO S.A.C. (RUC: 20602468497)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3220;
-- Deactivating parent Empresa ID: 1392 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1392;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1388;

-- Deactivating historical Sede: Mi Medik (RUC: 20602468497)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3221;

-- Deactivating historical Sede: MORI ROJAS MELISSA CRISTINA (RUC: 10453038136)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3222;
-- Deactivating parent Empresa ID: 1393 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1393;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1389;

-- Deactivating historical Sede: Dental Care by Melissa Morí (RUC: 10453038136)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3223;

-- Deactivating historical Sede: ODONTOCREA SAC (RUC: 20604331901)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3224;
-- Deactivating parent Empresa ID: 1394 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1394;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1390;

-- Deactivating historical Sede: ODONTOCREA (RUC: 20604331901)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3225;

-- Deactivating historical Sede: OMEGA ODONTOLOGIA ESPECIALIZADA S.A.C. (RUC: 20608413562)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3226;
-- Deactivating parent Empresa ID: 1395 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1395;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1391;

-- Deactivating historical Sede: OMEGA ODONTOLOGIA ESPECIALIZADA (RUC: 20608413562)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3227;

-- Deactivating historical Sede: PARAMEDICOS SIN FRONTERAS S.A.C (RUC: 20602374476)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3228;
-- Deactivating parent Empresa ID: 1396 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1396;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1392;

-- Deactivating historical Sede: PARAMEDICOS SIN FRONTERAS (RUC: 20602374476)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3229;

-- Deactivating historical Sede: PATSY EUGENI LOAYZA PARRAGA (RUC: 10427020784)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3230;
-- Deactivating parent Empresa ID: 1397 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1397;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1393;

-- Deactivating historical Sede: Snowdent (RUC: 10427020784)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3231;

-- Deactivating historical Sede: PETMED S.A.C. (RUC: 20555450495)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3232;
-- Deactivating parent Empresa ID: 1398 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1398;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1394;

-- Deactivating historical Sede: PETMED (RUC: 20555450495)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3233;

-- Deactivating historical Sede: PRIMERA LAB PERU S.A.C. (RUC: 20608059564)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3234;
-- Deactivating parent Empresa ID: 1399 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1399;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1395;

-- Deactivating historical Sede: PRIMERA LAB (RUC: 20608059564)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3235;

-- Deactivating historical Sede: REYVET S.A.C. (RUC: 20520540874)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3236;
-- Deactivating parent Empresa ID: 1400 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1400;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1396;

-- Deactivating historical Sede: VILLAVET (RUC: 20520540874)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3237;

-- Deactivating historical Sede: ROBLES SOTO DARWIN ANDRES (RUC: 10096927423)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3238;
-- Deactivating parent Empresa ID: 1401 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1401;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1397;

-- Deactivating historical Sede: DENTAL SAN JOSE (RUC: 10096927423)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3239;

-- Deactivating historical Sede: ROSA MILAGRITOS MARTINEZ BRAVO (RUC: 10426753613)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3240;
-- Deactivating parent Empresa ID: 1402 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1402;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1398;

-- Deactivating historical Sede: WAPEALO PETS (RUC: 10426753613)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3241;

-- Deactivating historical Sede: SACO CIFUENTES LUIS GUILLERMO (RUC: 10452670556)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3242;
-- Deactivating parent Empresa ID: 1403 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1403;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1399;

-- Deactivating historical Sede: S & M DENT (RUC: 10452670556)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3243;

-- Deactivating historical Sede: SALUS LABORIS S.A.C. (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3244;
-- Deactivating parent Empresa ID: 1404 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1404;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1400;

-- Deactivating historical Sede: SAN FERNANDO ATE (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3245;

-- Deactivating historical Sede: CLINICA SALUD LABORIS (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3246;

-- Deactivating historical Sede: SAN FERNANDO SURQUILLO (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3247;

-- Deactivating historical Sede: SAN FERNANDO CHORRILLOS (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3248;

-- Deactivating historical Sede: SAN FERNANDO LURIN (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3249;

-- Deactivating historical Sede: KIMBERLY SANTA CLARA (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3250;

-- Deactivating historical Sede: SAN FERNANDO CHANCAY (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3251;

-- Deactivating historical Sede: SAN FERNANDO HUARAL (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3252;

-- Deactivating historical Sede: HUACHIPA AJEPER (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3253;

-- Deactivating historical Sede: KIMBERLY PUENTE PIEDRA (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3254;

-- Deactivating historical Sede: SAN FERNANDO CHINCHA (RUC: 20512609458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3255;

-- Deactivating historical Sede: SERGIO HUGO DELGADO LUJAN (RUC: 10101013206)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3256;
-- Deactivating parent Empresa ID: 1405 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1405;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1401;

-- Deactivating historical Sede: RAPID SALUD (RUC: 10101013206)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3257;

-- Deactivating historical Sede: SKRABONJA SIMON JUAN MARCOS (RUC: 10076098030)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3258;
-- Deactivating parent Empresa ID: 1406 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1406;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1402;

-- Deactivating historical Sede: VILLA DENT (RUC: 10076098030)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3259;

-- Deactivating historical Sede: Staff odontologico & Dental Studios EIRL (RUC: 20600314221)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3260;
-- Deactivating parent Empresa ID: 1407 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1407;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1403;

-- Deactivating historical Sede: STAFF ODONTOLOGICO (RUC: 20600314221)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3261;

-- Deactivating historical Sede: TRUEDENT CORP S.A.C. (RUC: 20600988949)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3262;
-- Deactivating parent Empresa ID: 1408 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1408;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1404;

-- Deactivating historical Sede: VARGAS YALICO MIRIAM VANESSA (RUC: 10471711531)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3263;
-- Deactivating parent Empresa ID: 1409 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1409;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1405;

-- Deactivating historical Sede: DENTAL VARGAS (RUC: 10471711531)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3264;

-- Deactivating historical Sede: DENTAL VARGAS SEDE LOMAS (RUC: 10471711531)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3265;

-- Deactivating historical Sede: VET SANTA LUCIA SAC (RUC: 20601751136)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3266;
-- Deactivating parent Empresa ID: 1410 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1410;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1406;

-- Deactivating historical Sede: VET SANTA LUCIA SAC (RUC: 20601751136)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3267;

-- Deactivating historical Sede: VITA DENTIS S.A.C. (RUC: 20608310836)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3268;
-- Deactivating parent Empresa ID: 1411 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1411;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1407;

-- Deactivating historical Sede: VITA DENTIS (RUC: 20608310836)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3269;

-- Deactivating historical Sede: WILMER GUSTAVO ANTIALON MARCOS (RUC: 10214650792)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3270;
-- Deactivating parent Empresa ID: 1412 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1412;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1408;

-- Deactivating historical Sede: CONSULTORIO ODONTOLOGICO SEÑOR DE LUREN (RUC: 10214650792)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3271;

-- Deactivating historical Sede: INVERSIONES BASHAR S.A.C. (RUC: 20609741971)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3272;
-- Deactivating parent Empresa ID: 1413 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1413;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1409;

-- Deactivating historical Sede: Oh My Dog! Veterinaria & Boutique (RUC: 20609741971)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3273;

-- Deactivating historical Sede: CARSEC SAC (RUC: 20557819313)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3274;
-- Deactivating parent Empresa ID: 1414 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1414;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1410;

-- Deactivating historical Sede: DENTIMED (RUC: 20557819313)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3275;

-- Deactivating historical Sede: RAMIREZ VALLEJOS IGNACIO ANTONIO (RUC: 10099982379)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3276;
-- Deactivating parent Empresa ID: 1415 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1415;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1411;

-- Deactivating historical Sede: LIDERVET LAB (RUC: 10099982379)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3277;

-- Deactivating historical Sede: Sonia Veronica Berrospi Ccama (RUC: 10100846786)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3278;
-- Deactivating parent Empresa ID: 1416 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1416;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1412;

-- Deactivating historical Sede: Sonia Veronica Berrospi Ccama (RUC: 10100846786)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3279;

-- Deactivating historical Sede: veterinaria vera berrospi (RUC: 10100846786)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3280;

-- Deactivating historical Sede: MARTINEZ YARANGA CLAUDIO GUIDO (RUC: 10463184980)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3281;
-- Deactivating parent Empresa ID: 1417 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1417;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1413;

-- Deactivating historical Sede: VETERINARIA PET HEALING (RUC: 10463184980)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3282;

-- Deactivating historical Sede: HADA DENTAL ODONTOPEDIATRIA SAC (RUC: 20601085691)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3283;
-- Deactivating parent Empresa ID: 1418 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1418;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1414;

-- Deactivating historical Sede: POLICLINICO ESCULAPIO E.I.R.L. (RUC: 20603577591)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3284;
-- Deactivating parent Empresa ID: 1419 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1419;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1415;

-- Deactivating historical Sede: POLICLÍNICO ESCULAPIO (RUC: 20603577591)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3285;

-- Deactivating historical Sede: ACADEMIA DE NATACION TRITON E.I.R.L. (RUC: 20602155979)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3286;
-- Deactivating parent Empresa ID: 1420 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1420;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1416;

-- Deactivating historical Sede: Academia de Natación TRITÓN (RUC: 20602155979)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3287;

-- Deactivating historical Sede: CLINICAS & DIAGNOSTICOS BAZAN S.A.C. (RUC: 20604797498)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3288;
-- Deactivating parent Empresa ID: 1421 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1421;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1417;

-- Deactivating historical Sede: POLICLINICO CLINISALUD (RUC: 20604797498)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3289;

-- Deactivating historical Sede: CIRUVET E.I.R.L. (RUC: 20557064096)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3290;
-- Deactivating parent Empresa ID: 1422 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1422;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1418;

-- Deactivating historical Sede: BACA CONDORE JAVIER ARTURO (RUC: 10401368804)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3291;
-- Deactivating parent Empresa ID: 1423 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1423;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1419;

-- Deactivating historical Sede: Odontoimagen (RUC: 10401368804)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3292;

-- Deactivating historical Sede: ONCOLOGIA INTEGRAL E.I.R.L. (RUC: 20604471738)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3293;
-- Deactivating parent Empresa ID: 1424 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1424;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1420;

-- Deactivating historical Sede: ONCOMEDIC (RUC: 20604471738)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3294;

-- Deactivating historical Sede: SALIS SANTIAGO LESLY NORA (RUC: 10612162617)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3295;
-- Deactivating parent Empresa ID: 1425 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1425;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1421;

-- Deactivating historical Sede: MIL MASCOTAS (RUC: 10612162617)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3296;

-- Deactivating historical Sede: CLINICA DENTAL LUREN S.A.C. (RUC: 20554503749)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3297;
-- Deactivating parent Empresa ID: 1426 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1426;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1422;

-- Deactivating historical Sede: Ceol Dent (RUC: 20554503749)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3298;

-- Deactivating historical Sede: KARLA BERRIOS MAMULA (RUC: 10470673198)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3299;
-- Deactivating parent Empresa ID: 1427 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1427;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1423;

-- Deactivating historical Sede: Consultorio Odontoló gico Dra. Karla Berrios - Odontología Especializada (RUC: 10470673198)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3300;

-- Deactivating historical Sede: INSTITUTO MEDICO ESPECIALIZADO EN DIABETES SOY DIABETICO E.I.R.L. (RUC: 20526036922)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3301;
-- Deactivating parent Empresa ID: 1428 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1428;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1424;

-- Deactivating historical Sede: SOY DIABETICO (RUC: 20526036922)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3302;

-- Deactivating historical Sede: MOSCOSO & URIBE ODONTOLOGOS SOCIEDAD ANONIMA CERRADA (RUC: 20606882603)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3303;
-- Deactivating parent Empresa ID: 1429 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1429;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1425;

-- Deactivating historical Sede: MOSCOSO & URIBE ODONTÓLOGOS (RUC: 20606882603)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3304;

-- Deactivating historical Sede: FLORES BERNARDO ANDREW STUART GARDEL (RUC: 10717843300)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3305;
-- Deactivating parent Empresa ID: 1430 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1430;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1426;

-- Deactivating historical Sede: CHAMPIONS VET (RUC: 10717843300)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3306;

-- Deactivating historical Sede: CHUMBE PIÑA JUAN ENRIQUE (RUC: 10102371793)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3307;
-- Deactivating parent Empresa ID: 1431 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1431;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1427;

-- Deactivating historical Sede: Consultorio dental FRESH (RUC: 10102371793)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3308;

-- Deactivating historical Sede: REHABLIMA E.I.R.L. (RUC: 20609096315)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3309;
-- Deactivating parent Empresa ID: 1432 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1432;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1428;

-- Deactivating historical Sede: REHABLIMA (RUC: 20609096315)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3310;

-- Deactivating historical Sede: ORAL ESTHETIC CLASS EIRL (RUC: 20548230960)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3311;
-- Deactivating parent Empresa ID: 1433 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1433;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1429;

-- Deactivating historical Sede: Dental White (RUC: 20548230960)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3312;

-- Deactivating historical Sede: Aristocat 24 horas EIRL (RUC: 20600466179)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3313;
-- Deactivating parent Empresa ID: 1434 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1434;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1430;

-- Deactivating historical Sede: CONSULTORIO DENTAL GUIDOTTI GONZALEZ E.I.R.L. (RUC: 20609239370)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3314;
-- Deactivating parent Empresa ID: 1435 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1435;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1431;

-- Deactivating historical Sede: Capolavoro Dental (RUC: 20609239370)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3315;

-- Deactivating historical Sede: CENTRO DE REHABILITACION ORAL Y ESTETICA SOCIEDAD COMERCIAL DE RESPONSABILIDAD LIMITADA-CROE S.R.L. (RUC: 20474012086)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3316;
-- Deactivating parent Empresa ID: 1436 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1436;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1432;

-- Deactivating historical Sede: vivos (RUC: 20474012086)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3317;

-- Deactivating historical Sede: NATUVET E.I.R.L. (RUC: 20610534725)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3318;
-- Deactivating parent Empresa ID: 1437 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1437;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1433;

-- Deactivating historical Sede: NATUVET (RUC: 20610534725)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3319;

-- Deactivating historical Sede: BORJA PORRAS KARLA MICHELLE (RUC: 10700543761)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3320;
-- Deactivating parent Empresa ID: 1438 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1438;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1434;

-- Deactivating historical Sede: Nobu Dental Studio (RUC: 10700543761)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3321;

-- Deactivating historical Sede: Robert Villegas Asencios (RUC: 10423987346)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3322;
-- Deactivating parent Empresa ID: 1439 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1439;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1435;

-- Deactivating historical Sede: Clìnica Veterinaria Esperanza (RUC: 10423987346)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3323;

-- Deactivating historical Sede: SERVICIOS VETERINARIOS MASTER VETS E.I.R.L. (RUC: 20607974200)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3324;
-- Deactivating parent Empresa ID: 1440 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1440;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1436;

-- Deactivating historical Sede: Master Vets (RUC: 20607974200)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3325;

-- Deactivating historical Sede: CLINICA DENTAL SALCEDO SRL (RUC: 20507522328)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3326;
-- Deactivating parent Empresa ID: 1441 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1441;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1437;

-- Deactivating historical Sede: AO LEGENDS S.A.C. (RUC: 20606953845)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3327;
-- Deactivating parent Empresa ID: 1442 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1442;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1438;

-- Deactivating historical Sede: ROMANI GAMIÓN MARGARITA GLADYS (RUC: 10199259682)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3328;
-- Deactivating parent Empresa ID: 1443 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1443;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1439;

-- Deactivating historical Sede: VETERINARIA DEL NORTE (RUC: 10199259682)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3329;

-- Deactivating historical Sede: SANTILLANA VASQUEZ EDITH JOVANA (RUC: 10418716385)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3330;
-- Deactivating parent Empresa ID: 1444 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1444;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1440;

-- Deactivating historical Sede: CONSULTORIO SONRI- SALUD (RUC: 10418716385)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3331;

-- Deactivating historical Sede: SERVICIOS VETERINARIOS INTEGRALES SAC (RUC: 20392983768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3332;
-- Deactivating parent Empresa ID: 1445 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1445;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1441;

-- Deactivating historical Sede: KITTY LOVERS E.I.R.L. (RUC: 20608953044)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3333;
-- Deactivating parent Empresa ID: 1446 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1446;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1442;

-- Deactivating historical Sede: LOVE&PETS (RUC: 20608953044)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3334;

-- Deactivating historical Sede: TANIA ISABEL GARCÍA RIOS (RUC: 10106110153)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3335;
-- Deactivating parent Empresa ID: 1447 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1447;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1443;

-- Deactivating historical Sede: VITTA ORAL (RUC: 10106110153)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3336;

-- Deactivating historical Sede: CF VETLINE SAC (RUC: 20607625051)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3337;
-- Deactivating parent Empresa ID: 1448 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1448;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1444;

-- Deactivating historical Sede: MARIA PATRICIA NAVAS CORDERO (RUC: 15605005983)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3338;
-- Deactivating parent Empresa ID: 1449 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1449;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 451;

-- Deactivating historical Sede: MARIA PATRICIA NAVAS CORDERO (RUC: 15605005983)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3339;

-- Deactivating historical Sede: ECOSSALUD E.I.R.L. (RUC: 20605746544)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3340;
-- Deactivating parent Empresa ID: 1450 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1450;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1445;

-- Deactivating historical Sede: Ecosalud (RUC: 20605746544)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3341;

-- Deactivating historical Sede: Noura salud SAC (RUC: 20613507851)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3342;
-- Deactivating parent Empresa ID: 1451 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1451;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1446;

-- Deactivating historical Sede: CUBAS LEON JUANITA CLARISA (RUC: 10484766538)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3343;
-- Deactivating parent Empresa ID: 1452 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1452;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 177;

-- Deactivating historical Sede: DIONISIO QUISPE, DANNY PAUL (RUC: 10074787822)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3344;
-- Deactivating parent Empresa ID: 1453 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1453;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1447;

-- Deactivating historical Sede: euqor (RUC: 20515139835)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3345;
-- Deactivating parent Empresa ID: 1454 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1454;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1448;

-- Deactivating historical Sede: RIMEN MEDIC SRL (RUC: 10097219210)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3346;
-- Deactivating parent Empresa ID: 1455 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1455;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1449;

-- Deactivating historical Sede: Wendy Cruz Salazar (RUC: 10453892412)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3347;
-- Deactivating parent Empresa ID: 1456 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1456;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1450;

-- Deactivating historical Sede: CENTRO MEDICO JAVIER PRADO (RUC: 10418275184)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3348;
-- Deactivating parent Empresa ID: 1457 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1457;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1451;

-- Deactivating historical Sede: Consultorio Obstétrico "Santa María " (RUC: 20601286638)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3349;
-- Deactivating parent Empresa ID: 1458 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1458;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1452;

-- Deactivating historical Sede: EDIFICA CONSTRUCTORES (RUC: 20522164781)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3350;
-- Deactivating parent Empresa ID: 1459 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1459;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1453;

-- Deactivating historical Sede: BAJA (RUC: 20563567547)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3351;
-- Deactivating parent Empresa ID: 1460 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1460;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1454;

-- Deactivating historical Sede: Consultorio obstétrico Virgen Natividad (RUC: 20605295933)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3352;
-- Deactivating parent Empresa ID: 1461 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1461;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1455;

-- Deactivating historical Sede: CLINICAEUROFISIO@GMAIL.COM (RUC: 20555458801)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3353;
-- Deactivating parent Empresa ID: 1462 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1462;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1456;

-- Deactivating historical Sede: Dra. Segovia Medicina Estética Anti-Aging (RUC: 15603692451)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3354;
-- Deactivating parent Empresa ID: 1463 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1463;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1457;

-- Deactivating historical Sede: ANULADO (RUC: 20605795022)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3355;
-- Deactivating parent Empresa ID: 1464 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1464;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1458;

-- Deactivating historical Sede: Promedicine red de servicios médicos especializados (RUC: 20600053761)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3356;
-- Deactivating parent Empresa ID: 1465 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1465;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1459;

-- Deactivating historical Sede: CAMBIO TARIFA Y FREC RENOVACION (RUC: 99900000007)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3357;
-- Deactivating parent Empresa ID: 1466 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1466;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1460;

-- Deactivating historical Sede: ÁNGEL CUIDADOR (RUC: 10418676529)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3358;
-- Deactivating parent Empresa ID: 1467 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1467;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1461;

-- Deactivating historical Sede: POLICLINICO DR. CHRISTIAN (RUC: 20607447722)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3359;
-- Deactivating parent Empresa ID: 1468 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1468;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 547;

-- Deactivating historical Sede: SERVICIOS MEDICOS LA INMACULADA (RUC: 10062461646)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3360;
-- Deactivating parent Empresa ID: 1469 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1469;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1462;

-- Deactivating historical Sede: CONSULTORIO SAN MARTIN (RUC: 10102341428)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3361;
-- Deactivating parent Empresa ID: 1470 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1470;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1463;

-- Deactivating historical Sede: Centro médico Villasalud (RUC: 10453262761)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3362;
-- Deactivating parent Empresa ID: 1471 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1471;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1464;

-- Deactivating historical Sede: qim- far-lab (RUC: 20607271896)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3363;
-- Deactivating parent Empresa ID: 1472 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1472;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1465;

-- Deactivating historical Sede: Divergenteink (RUC: 10402237835)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3364;
-- Deactivating parent Empresa ID: 1473 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1473;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1466;

-- Deactivating historical Sede: CENTRO DEMARTOLOGICO MOLIDERMA (RUC: 20566581907)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3365;
-- Deactivating parent Empresa ID: 1474 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1474;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1467;

-- Deactivating historical Sede: Criminart (RUC: 10462128385)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3366;
-- Deactivating parent Empresa ID: 1475 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1475;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1468;

-- Deactivating historical Sede: CENTRO MEDICO LOS OLIVOS (RUC: 10717222682)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3367;
-- Deactivating parent Empresa ID: 1476 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1476;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1469;

-- Deactivating historical Sede: LABORATORIO TECNOLAB (RUC: 10421138627)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3368;
-- Deactivating parent Empresa ID: 1477 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1477;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1470;

-- Deactivating historical Sede: SERVICIOS MEDICOS SAN ANTONIO DE PADUA (RUC: 20606384484)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3369;
-- Deactivating parent Empresa ID: 1478 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1478;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1471;

-- Deactivating historical Sede: CENTRO LA CAPILLA (RUC: 10406638664)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3370;
-- Deactivating parent Empresa ID: 1479 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1479;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1472;

-- Deactivating historical Sede: CENTRO MEDICO RAPIBREVETES (RUC: 20606385201)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3371;
-- Deactivating parent Empresa ID: 1480 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1480;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1473;

-- Deactivating historical Sede: ODONTOLOGÍA INTEGRAL UBIDENT (RUC: 10074875438)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3372;
-- Deactivating parent Empresa ID: 1481 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1481;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1474;

-- Deactivating historical Sede: SERVI SALUD (RUC: 10423917607)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3373;
-- Deactivating parent Empresa ID: 1482 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1482;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1475;

-- Deactivating historical Sede: CENTRO MEDICO SAN LORENZO (RUC: 20555101300)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3374;
-- Deactivating parent Empresa ID: 1483 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1483;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1476;

-- Deactivating historical Sede: D'liras (RUC: 10086567445)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3375;
-- Deactivating parent Empresa ID: 1484 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1484;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1477;

-- Deactivating historical Sede: Mylan (RUC: 10416726626)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3376;
-- Deactivating parent Empresa ID: 1485 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1485;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1478;

-- Deactivating historical Sede: Consultorio Médico y Dental (RUC: 10078551114)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3377;
-- Deactivating parent Empresa ID: 1486 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1486;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1479;

-- Deactivating historical Sede: Policlínicos Honorio Delgado (RUC: 20604536601)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3378;
-- Deactivating parent Empresa ID: 1487 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1487;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1480;

-- Deactivating historical Sede: Consultorio Ginecologico GYOMED (RUC: 10468225463)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3379;
-- Deactivating parent Empresa ID: 1488 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1488;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1481;

-- Deactivating historical Sede: CADIDENT (RUC: 10410797581)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3380;
-- Deactivating parent Empresa ID: 1489 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1489;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1482;

-- Deactivating historical Sede: Dentysonrisas (RUC: 10405632344)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3381;
-- Deactivating parent Empresa ID: 1490 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1490;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1483;

-- Deactivating historical Sede: DENTAL CLINIK (RUC: 10477330971)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3382;
-- Deactivating parent Empresa ID: 1491 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1491;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1484;

-- Deactivating historical Sede: consultorio dental vivanco (RUC: 10403872038)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3383;
-- Deactivating parent Empresa ID: 1492 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1492;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1485;

-- Deactivating historical Sede: CLARDENT (RUC: 20609943611)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3384;
-- Deactivating parent Empresa ID: 1493 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1493;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1486;

-- Deactivating historical Sede: DENTAL SAN ANDRES (RUC: 99900000008)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3385;
-- Deactivating parent Empresa ID: 1494 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1494;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1397;

-- Deactivating historical Sede: Coe Dental (RUC: 20605769013)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3386;
-- Deactivating parent Empresa ID: 1495 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1495;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1487;

-- Deactivating historical Sede: ENDODENT (RUC: 10429712012)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3387;
-- Deactivating parent Empresa ID: 1496 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1496;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1488;

-- Deactivating historical Sede: Consultorio Dental Model Dent (RUC: 20522991105)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3388;
-- Deactivating parent Empresa ID: 1497 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1497;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1489;

-- Deactivating historical Sede: IDENT GROUP (RUC: 10447327843)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3389;
-- Deactivating parent Empresa ID: 1498 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1498;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1490;

-- Deactivating historical Sede: ODONTOSOTO (RUC: 20524921732)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3390;
-- Deactivating parent Empresa ID: 1499 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1499;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1491;

-- Deactivating historical Sede: YEAT DENT (RUC: 20513890266)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3391;
-- Deactivating parent Empresa ID: 1500 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1500;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1492;

-- Deactivating historical Sede: CONSIGIO OTRA EMPRESA PORQUE LLAMABA A SOLICITAR RECOJO Y NADIE LO ATENDIA (RUC: 10415611248)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3392;
-- Deactivating parent Empresa ID: 1501 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1501;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1493;

-- Deactivating historical Sede: AM Arte Odontológico (RUC: 10467571007)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3393;
-- Deactivating parent Empresa ID: 1502 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1502;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1494;

-- Deactivating historical Sede: no quiere servicio anulo (RUC: 10416733240)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3394;
-- Deactivating parent Empresa ID: 1503 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1503;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1495;

-- Deactivating historical Sede: Artdental (RUC: 10106887379)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3395;
-- Deactivating parent Empresa ID: 1504 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1504;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1496;

-- Deactivating historical Sede: ANULO CONTRATO (RUC: 10453004835)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3396;
-- Deactivating parent Empresa ID: 1505 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1505;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1497;

-- Deactivating historical Sede: Rovaldent (RUC: 10407393380)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3397;
-- Deactivating parent Empresa ID: 1506 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1506;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1498;

-- Deactivating historical Sede: DENTAL STUDIOS (RUC: 10108664521)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3398;
-- Deactivating parent Empresa ID: 1507 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1507;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1499;

-- Deactivating historical Sede: MADILENE ASCONA SALAZAR (RUC: 10218587289)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3399;
-- Deactivating parent Empresa ID: 1508 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1508;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1500;

-- Deactivating historical Sede: TARIFA SUBIO A 70 SOLES PORQUE AHORA ES BIMENSUAL (RUC: 10098791405)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3400;
-- Deactivating parent Empresa ID: 1509 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1509;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1501;

-- Deactivating historical Sede: Ayni Dental Center (RUC: 20605811508)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3401;
-- Deactivating parent Empresa ID: 1510 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1510;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1502;

-- Deactivating historical Sede: CERRADO (RUC: 10295395597)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3402;
-- Deactivating parent Empresa ID: 1511 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1511;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1503;

-- Deactivating historical Sede: consultorio odontológico del pueblo (RUC: 10447875514)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3403;
-- Deactivating parent Empresa ID: 1512 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1512;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1504;

-- Deactivating historical Sede: CONSULTORIO ODONTOLOGICO OCHOA (RUC: 15457825061)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3404;
-- Deactivating parent Empresa ID: 1513 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1513;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1505;

-- Deactivating historical Sede: KALI DENTS (RUC: 20556146447)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3405;
-- Deactivating parent Empresa ID: 1514 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1514;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1506;

-- Deactivating historical Sede: DC ORTHODONTIC (RUC: 20600196341)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3406;
-- Deactivating parent Empresa ID: 1515 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1515;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1507;

-- Deactivating historical Sede: HEVELYNE CARDENAS (RUC: 10403832681)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3407;
-- Deactivating parent Empresa ID: 1516 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1516;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1508;

-- Deactivating historical Sede: MARROQUIN CLINICA DENTAL (RUC: 10107405483)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3408;
-- Deactivating parent Empresa ID: 1517 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1517;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1509;

-- Deactivating historical Sede: CONSULTORIO DENTAL MANIAS ORTHODONTIC (RUC: 20607722961)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3409;
-- Deactivating parent Empresa ID: 1518 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1518;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1510;

-- Deactivating historical Sede: Clínica dental SYACDENT (RUC: 99900000009)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3410;
-- Deactivating parent Empresa ID: 1519 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1519;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1511;

-- Deactivating historical Sede: CLINICA DENTAL SAUDE (RUC: 20606633719)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3411;
-- Deactivating parent Empresa ID: 1520 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1520;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1512;

-- Deactivating historical Sede: consultorio dental Odontolook (RUC: 10466559364)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3412;
-- Deactivating parent Empresa ID: 1521 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1521;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1513;

-- Deactivating historical Sede: ORAL CARE (RUC: 20606740922)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3413;
-- Deactivating parent Empresa ID: 1522 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1522;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1514;

-- Deactivating historical Sede: GIO DENTAL (RUC: 10444024106)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3414;
-- Deactivating parent Empresa ID: 1523 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1523;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1515;

-- Deactivating historical Sede: CONSULTORIOS MEDICOS OFTALMOLOGICO Y ODONTOLOGICO SONRIEMAS (RUC: 20602577032)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3415;
-- Deactivating parent Empresa ID: 1524 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1524;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1516;

-- Deactivating historical Sede: Corporacion Odontólogico Oral Dent (RUC: 20492775470)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3416;
-- Deactivating parent Empresa ID: 1525 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1525;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1517;

-- Deactivating historical Sede: Centro Odontológico La Mar (RUC: 10703122812)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3417;
-- Deactivating parent Empresa ID: 1526 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1526;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1518;

-- Deactivating historical Sede: UBIDENT (RUC: 10107892503)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3418;
-- Deactivating parent Empresa ID: 1527 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1527;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1519;

-- Deactivating historical Sede: LEGACY DENT (RUC: 10451568332)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3419;
-- Deactivating parent Empresa ID: 1528 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1528;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1520;

-- Deactivating historical Sede: CONSULTORIOS MÉDICOS GALVEZ (RUC: 20604756830)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3420;
-- Deactivating parent Empresa ID: 1529 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1529;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1521;

-- Deactivating historical Sede: Mi doc Perú (RUC: 10421802471)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3421;
-- Deactivating parent Empresa ID: 1530 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1530;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1522;

-- Deactivating historical Sede: Warident (RUC: 10445720611)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3422;
-- Deactivating parent Empresa ID: 1531 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1531;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1523;

-- Deactivating historical Sede: CLINICA DENTAL EL ARCA (RUC: 10469086670)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3423;
-- Deactivating parent Empresa ID: 1532 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1532;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1524;

-- Deactivating historical Sede: TREE DENT (RUC: 10446136025)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3424;
-- Deactivating parent Empresa ID: 1533 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1533;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1525;

-- Deactivating historical Sede: SUMAC DENT R&M (RUC: 20603421087)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3425;
-- Deactivating parent Empresa ID: 1534 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1534;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1526;

-- Deactivating historical Sede: ODONTO-K BRACKETS SEDE COMAS (RUC: 20606794917)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3426;
-- Deactivating parent Empresa ID: 1535 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1535;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1527;

-- Deactivating historical Sede: ODONTO- K BRACKETS CLINICA ESPECIALIZADA (RUC: 20606016001)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3427;
-- Deactivating parent Empresa ID: 1536 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1536;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1528;

-- Deactivating historical Sede: DENTAL PERFECTION (RUC: 10407658936)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3428;
-- Deactivating parent Empresa ID: 1537 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1537;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1529;

-- Deactivating historical Sede: CLINICA DENTAL CARITAS FELICES (RUC: 10425157189)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3429;
-- Deactivating parent Empresa ID: 1538 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1538;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1530;

-- Deactivating historical Sede: BELLEZA DENTALE (RUC: 10428009644)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3430;
-- Deactivating parent Empresa ID: 1539 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1539;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1531;

-- Deactivating historical Sede: New smile (RUC: 10417840775)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3431;
-- Deactivating parent Empresa ID: 1540 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1540;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1532;

-- Deactivating historical Sede: H&M CLINICA DENTAL (RUC: 20606114533)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3432;
-- Deactivating parent Empresa ID: 1541 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1541;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1533;

-- Deactivating historical Sede: ILUMINITY DENT (RUC: 10444945031)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3433;
-- Deactivating parent Empresa ID: 1542 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1542;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1534;

-- Deactivating historical Sede: SKYDENTAL (RUC: 20607974072)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3434;
-- Deactivating parent Empresa ID: 1543 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1543;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1535;

-- Deactivating historical Sede: Dental Kids Perú (RUC: 20608086227)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3435;
-- Deactivating parent Empresa ID: 1544 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1544;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1536;

-- Deactivating historical Sede: CONSULTORIO ODONTOLOGICO (RUC: 10103515501)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3436;
-- Deactivating parent Empresa ID: 1545 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1545;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1537;

-- Deactivating historical Sede: LUDENT (RUC: 10409705028)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3437;
-- Deactivating parent Empresa ID: 1546 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1546;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1538;

-- Deactivating historical Sede: Multimedic (RUC: 20601817153)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3438;
-- Deactivating parent Empresa ID: 1547 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1547;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1539;

-- Deactivating historical Sede: LUIS TOLENTINO (RUC: 10102746487)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3439;
-- Deactivating parent Empresa ID: 1548 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1548;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1540;

-- Deactivating historical Sede: INNOVA DENT (RUC: 20603169426)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3440;
-- Deactivating parent Empresa ID: 1549 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1549;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1541;

-- Deactivating historical Sede: FIORELA URCOS (RUC: 10708729995)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3441;
-- Deactivating parent Empresa ID: 1550 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1550;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1542;

-- Deactivating historical Sede: Mueca (RUC: 20607723568)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3442;
-- Deactivating parent Empresa ID: 1551 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1551;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1543;

-- Deactivating historical Sede: SALUD DENTAL (RUC: 20452607981)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3443;
-- Deactivating parent Empresa ID: 1552 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1552;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1544;

-- Deactivating historical Sede: CONSULTORIO DENTAL TECSE (RUC: 10099294227)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3444;
-- Deactivating parent Empresa ID: 1553 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1553;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1545;

-- Deactivating historical Sede: CLARDENT (RUC: 20524337208)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3445;
-- Deactivating parent Empresa ID: 1554 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1554;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1486;

-- Deactivating historical Sede: ODONTO ESKOOL (RUC: 20607178608)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3446;
-- Deactivating parent Empresa ID: 1555 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1555;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1546;

-- Deactivating historical Sede: DENTAL JORDY (RUC: 10101628111)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3447;
-- Deactivating parent Empresa ID: 1556 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1556;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1547;

-- Deactivating historical Sede: DENTAL JORDY (RUC: 10101628111)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3448;

-- Deactivating historical Sede: ODONTOFAMILIA (RUC: 10418316786)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3449;
-- Deactivating parent Empresa ID: 1557 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1557;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1548;

-- Deactivating historical Sede: QUALYDENT (RUC: 10478300862)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3450;
-- Deactivating parent Empresa ID: 1558 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1558;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1549;

-- Deactivating historical Sede: POSTA VETERINARIA RUMP (RUC: 20603922990)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3451;
-- Deactivating parent Empresa ID: 1559 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1559;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1550;

-- Deactivating historical Sede: CIRE (RUC: 20545570433)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3452;
-- Deactivating parent Empresa ID: 1560 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1560;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1551;

-- Deactivating historical Sede: CONSULTORIO ODONTOLOGICO SANTA MARIA (RUC: 10447764551)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3453;
-- Deactivating parent Empresa ID: 1561 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1561;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1552;

-- Deactivating historical Sede: vet san luis (RUC: 20466004953)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3454;
-- Deactivating parent Empresa ID: 1562 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1562;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1553;

-- Deactivating historical Sede: ariels clinic (RUC: 20608396528)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3455;
-- Deactivating parent Empresa ID: 1563 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1563;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 18;

-- Deactivating historical Sede: PULGUITAS VETERINARIA (RUC: 20536010735)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3456;
-- Deactivating parent Empresa ID: 1564 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1564;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1554;

-- Deactivating historical Sede: Vet home emergencias veterinarias (RUC: 20602672167)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3457;
-- Deactivating parent Empresa ID: 1565 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1565;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1555;

-- Deactivating historical Sede: Veterinaria Central Pets (RUC: 20513250526)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3458;
-- Deactivating parent Empresa ID: 1566 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1566;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1556;

-- Deactivating historical Sede: finalizo contrato (RUC: 20555087986)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3459;
-- Deactivating parent Empresa ID: 1567 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1567;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1557;

-- Deactivating historical Sede: Veterinaria Villa Ramirez (RUC: 10408808265)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3460;
-- Deactivating parent Empresa ID: 1568 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1568;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1558;

-- Deactivating historical Sede: DERMAPET (RUC: 10258549843)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3461;
-- Deactivating parent Empresa ID: 1569 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1569;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 244;

-- Deactivating historical Sede: Veterinaria Húsares de Junín (RUC: 10072540463)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3462;
-- Deactivating parent Empresa ID: 1570 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1570;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1559;

-- Deactivating historical Sede: GROOMERS (RUC: 20537317591)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3463;
-- Deactivating parent Empresa ID: 1571 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1571;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1560;

-- Deactivating historical Sede: VET. SAN JOSE (RUC: 10266028097)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3464;
-- Deactivating parent Empresa ID: 1572 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1572;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1561;

-- Deactivating historical Sede: Sonrisas Brillantes (RUC: 20608184822)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3465;
-- Deactivating parent Empresa ID: 1573 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1573;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1562;

-- Deactivating historical Sede: pets place - CERRADO (RUC: 99900000010)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3466;
-- Deactivating parent Empresa ID: 1574 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1574;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 140;

-- Deactivating historical Sede: clinica veterinaria sana sana colita (RUC: 10422476895)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3467;
-- Deactivating parent Empresa ID: 1575 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1575;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1563;

-- Deactivating historical Sede: FALLECIDO (RUC: 99900000011)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3468;
-- Deactivating parent Empresa ID: 1576 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1576;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1564;

-- Deactivating historical Sede: NOR ENOVO (RUC: 20547780311)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3469;
-- Deactivating parent Empresa ID: 1577 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1577;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1565;

-- Deactivating historical Sede: Veterinaria Mi Rey Patitas (RUC: 10099992323)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3470;
-- Deactivating parent Empresa ID: 1578 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1578;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1566;

-- Deactivating historical Sede: ANULO (RUC: 10467131562)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3471;
-- Deactivating parent Empresa ID: 1579 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1579;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1567;

-- Deactivating historical Sede: CTRO MED.VETERIN. SAN AGUSTIN (RUC: 10090203091)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3472;
-- Deactivating parent Empresa ID: 1580 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1580;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 286;

-- Deactivating historical Sede: CLINICA VETERINARIA PICO (RUC: 10421123883)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3473;
-- Deactivating parent Empresa ID: 1581 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1581;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1568;

-- Deactivating historical Sede: Clinica Veterinaria Sin papi Vet Shop (RUC: 10473694471)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3474;
-- Deactivating parent Empresa ID: 1582 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1582;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1569;

-- Deactivating historical Sede: pet care center (RUC: 10412079197)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3475;
-- Deactivating parent Empresa ID: 1583 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1583;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1570;

-- Deactivating historical Sede: Centro Veterinario Animal Life (RUC: 20606749458)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3476;
-- Deactivating parent Empresa ID: 1584 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1584;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1571;

-- Deactivating historical Sede: DKF PETS CLINICA VETERINARIA (RUC: 20554223118)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3477;
-- Deactivating parent Empresa ID: 1585 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1585;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1572;

-- Deactivating historical Sede: PET SHOP HAPPY DOG (RUC: 10458402910)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3478;
-- Deactivating parent Empresa ID: 1586 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1586;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1573;

-- Deactivating historical Sede: Blue Vet (RUC: 10726618939)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3479;
-- Deactivating parent Empresa ID: 1587 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1587;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1574;

-- Deactivating historical Sede: ANIMAL CARE (RUC: 20451484916)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3480;
-- Deactivating parent Empresa ID: 1588 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1588;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1575;

-- Deactivating historical Sede: Veterinaria Centro Pets (RUC: 10702173049)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3481;
-- Deactivating parent Empresa ID: 1589 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1589;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1576;

-- Deactivating historical Sede: PETLOVER CENTRO VET. CARVAL (RUC: 10105394701)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3482;
-- Deactivating parent Empresa ID: 1590 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1590;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1577;

-- Deactivating historical Sede: PET SHOP HUELLITAS (RUC: 20606699981)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3483;
-- Deactivating parent Empresa ID: 1591 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1591;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1578;

-- Deactivating historical Sede: Clínica Veterinaria José y sus Mascotas (RUC: 10154302790)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3484;
-- Deactivating parent Empresa ID: 1592 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1592;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1579;

-- Deactivating historical Sede: Clínica Veterinaria José y su Mascota (RUC: 20603038496)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3485;
-- Deactivating parent Empresa ID: 1593 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1593;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1580;

-- Deactivating historical Sede: VETERINARIA CABRERA (RUC: 10401362512)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3486;
-- Deactivating parent Empresa ID: 1594 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1594;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1581;

-- Deactivating historical Sede: VETER HOUSE (RUC: 10455168461)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3487;
-- Deactivating parent Empresa ID: 1595 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1595;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1582;

-- Deactivating historical Sede: Veterinaria Animaniak (RUC: 20606225068)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3488;
-- Deactivating parent Empresa ID: 1596 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1596;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1583;

-- Deactivating historical Sede: CLINICA VETERINARIA GRANDES MASCOTAS (RUC: 20393455871)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3489;
-- Deactivating parent Empresa ID: 1597 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1597;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1584;

-- Deactivating historical Sede: Centro médico veterinario León (RUC: 10102305804)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3490;
-- Deactivating parent Empresa ID: 1598 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1598;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1585;

-- Deactivating historical Sede: Mathys pet (RUC: 10258301167)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3491;
-- Deactivating parent Empresa ID: 1599 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1599;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1586;

-- Deactivating historical Sede: CENTRO VETERINARIO ANIMAL SPACE (RUC: 09459853)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3492;
-- Deactivating parent Empresa ID: 1600 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1600;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1587;

-- Deactivating historical Sede: VETERINARIA PET'S FAMILY (RUC: 15607862033)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3493;
-- Deactivating parent Empresa ID: 1601 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1601;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1587;

-- Deactivating historical Sede: Ecopet (RUC: 20601871395)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3494;
-- Deactivating parent Empresa ID: 1602 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1602;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1587;

-- Deactivating historical Sede: Veterinaria Dr Tarazona (RUC: 20605208160)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3495;
-- Deactivating parent Empresa ID: 1603 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1603;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1587;

-- Deactivating historical Sede: HEALTHY PETS (RUC: 10464401763)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3496;
-- Deactivating parent Empresa ID: 1604 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1604;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1587;

-- Deactivating historical Sede: VETERINARIA PRINCIPAL (RUC: 20603582251)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3497;
-- Deactivating parent Empresa ID: 1605 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1605;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1587;

-- Deactivating historical Sede: HAPPY PET'S (RUC: 20548613206)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3498;
-- Deactivating parent Empresa ID: 1606 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1606;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1587;

-- Deactivating historical Sede: PET FEELING (RUC: 10071841605)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3499;
-- Deactivating parent Empresa ID: 1607 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1607;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1587;

-- Deactivating historical Sede: Veterinaria thamyvet (RUC: 10090281491)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3500;
-- Deactivating parent Empresa ID: 1608 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1608;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1588;

-- Deactivating historical Sede: VETERINARIA SAN PEDRITO (RUC: 10069561379)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3501;
-- Deactivating parent Empresa ID: 1609 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1609;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1589;

-- Deactivating historical Sede: Resident Pet (RUC: 10465659446)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3502;
-- Deactivating parent Empresa ID: 1610 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1610;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1590;

-- Deactivating historical Sede: Veterinaria lince (RUC: 10422514860)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3503;
-- Deactivating parent Empresa ID: 1611 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1611;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1591;

-- Deactivating historical Sede: CENTRO VETERINARIO ENTRE PATAS (RUC: 15107890529)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3504;
-- Deactivating parent Empresa ID: 1612 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1612;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1592;

-- Deactivating historical Sede: CENTRO VETERINARIO DE PATAS (RUC: 10061866723)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3505;
-- Deactivating parent Empresa ID: 1613 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1613;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1593;

-- Deactivating historical Sede: CENTRO VETERINARIO DE PATAS (RUC: 10420889653)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3506;
-- Deactivating parent Empresa ID: 1614 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1614;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1594;

-- Deactivating historical Sede: CENTRO VETERINARIO DE PATAS (RUC: 10430098956)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3507;
-- Deactivating parent Empresa ID: 1615 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1615;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1595;

-- Deactivating historical Sede: CLINICA VETERINARIA ZERPA (RUC: 10418369421)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3508;
-- Deactivating parent Empresa ID: 1616 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1616;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1596;

-- Deactivating historical Sede: CLINICA VETERINARIA ZERPA (RUC: 20607583570)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3509;
-- Deactivating parent Empresa ID: 1617 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1617;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1597;

-- Deactivating historical Sede: CLINICA VETERINARIA ZERPA (RUC: 20607583570)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3510;

-- Deactivating historical Sede: pasó de p juridica a natural // UNIVET S.A.C.	// 20602903827 (RUC: 20602903827)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3511;
-- Deactivating parent Empresa ID: 1618 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1618;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1598;

-- Deactivating historical Sede: Veterinaria Arrtervet (RUC: 10418731384)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3512;
-- Deactivating parent Empresa ID: 1619 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1619;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1599;

-- Deactivating historical Sede: CLINICA VETERINA GAVET (RUC: 20608136801)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3513;
-- Deactivating parent Empresa ID: 1620 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1620;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1600;

-- Deactivating historical Sede: PETMEDIC (RUC: 20600859367)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3514;
-- Deactivating parent Empresa ID: 1621 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1621;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1601;

-- Deactivating historical Sede: VETERINARIA PETTOYS (RUC: 20546880592)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3515;
-- Deactivating parent Empresa ID: 1622 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1622;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1602;

-- Deactivating historical Sede: VETERINARIA FOX (RUC: 10427998610)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3516;
-- Deactivating parent Empresa ID: 1623 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1623;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1603;

-- Deactivating historical Sede: VETERINARIA CABELLOS (RUC: 20547554907)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3517;
-- Deactivating parent Empresa ID: 1624 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1624;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1604;

-- Deactivating historical Sede: SAVASANA CLÍNICA DENTAL (RUC: 20606495669)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3518;
-- Deactivating parent Empresa ID: 1625 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1625;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1605;

-- Deactivating historical Sede: CLINICA VETERINARIA PROYECTO PET (RUC: 20607044181)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3519;
-- Deactivating parent Empresa ID: 1626 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1626;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1606;

-- Deactivating historical Sede: MUNDO VET (RUC: 10482650118)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3520;
-- Deactivating parent Empresa ID: 1627 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1627;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1607;

-- Deactivating historical Sede: AVANTI DENT (RUC: 10476687484)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3521;
-- Deactivating parent Empresa ID: 1628 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1628;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1608;

-- Deactivating historical Sede: PETCOMPANY (RUC: 20554254935)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3522;
-- Deactivating parent Empresa ID: 1629 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1629;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1609;

-- Deactivating historical Sede: VETERINARIA REYNO ANIMAL (RUC: 20554016597)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3523;
-- Deactivating parent Empresa ID: 1630 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1630;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1610;

-- Deactivating historical Sede: EMERGENCIA ANIMAL (RUC: 20600462564)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3524;
-- Deactivating parent Empresa ID: 1631 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1631;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1611;

-- Deactivating historical Sede: CONSULTORIO FERNANDEZ (RUC: 99900000012)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3525;
-- Deactivating parent Empresa ID: 1632 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1632;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1612;

-- Deactivating historical Sede: CONSULTORIO DENTAL SR. DE LUREN (RUC: 10258332585)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3526;
-- Deactivating parent Empresa ID: 1633 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1633;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1613;

-- Deactivating historical Sede: OLMAS DENT (RUC: 10400578902)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3527;
-- Deactivating parent Empresa ID: 1634 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1634;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1614;

-- Deactivating historical Sede: CONSULTORIO DENTAL ODONTOLIFE (RUC: 10471984278)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3528;
-- Deactivating parent Empresa ID: 1635 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1635;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1615;

-- Deactivating historical Sede: CONSULTORIO VIDAFEM (RUC: 20608252232)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3529;
-- Deactivating parent Empresa ID: 1636 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1636;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1616;

-- Deactivating historical Sede: SERVICIOS MEDICOS MEDI MUJER (RUC: 10461464926)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3530;
-- Deactivating parent Empresa ID: 1637 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1637;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1617;

-- Deactivating historical Sede: SERVICIOS MEDICOS MEDI MUJER (RUC: 10410040137)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3531;
-- Deactivating parent Empresa ID: 1638 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1638;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1618;

-- Deactivating historical Sede: Centro de podología María de los Ángeles (RUC: 10156508085)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3532;
-- Deactivating parent Empresa ID: 1639 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1639;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1619;

-- Deactivating historical Sede: ZOO PE & SPA (RUC: 99900000013)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3533;
-- Deactivating parent Empresa ID: 1640 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1640;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1620;

-- Deactivating historical Sede: CONSULTORIO MEDICO OXIGENO (RUC: 20600266170)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3534;
-- Deactivating parent Empresa ID: 1641 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1641;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1621;

-- Deactivating historical Sede: DEMMTAL (RUC: 10074567369)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3535;
-- Deactivating parent Empresa ID: 1642 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1642;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1119;

-- Deactivating historical Sede: YASSDENT (RUC: 20606531541)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3536;
-- Deactivating parent Empresa ID: 1643 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1643;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1622;

-- Deactivating historical Sede: HAPPY PETS (RUC: 20604747423)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3537;
-- Deactivating parent Empresa ID: 1644 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1644;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1623;

-- Deactivating historical Sede: maxiloclinic (RUC: 20552917481)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3538;
-- Deactivating parent Empresa ID: 1645 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1645;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1624;

-- Deactivating historical Sede: Policlínico Marfa.Lab (RUC: 20605747371)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3539;
-- Deactivating parent Empresa ID: 1646 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1646;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1625;

-- Deactivating historical Sede: DENTAL PROMEDI - K (RUC: 20517178137)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3540;
-- Deactivating parent Empresa ID: 1647 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1647;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1626;

-- Deactivating historical Sede: INYECTABLES (RUC: 10078199127)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3541;
-- Deactivating parent Empresa ID: 1648 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1648;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1627;

-- Deactivating historical Sede: Clínica dental Galarza (RUC: 10102144291)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3542;
-- Deactivating parent Empresa ID: 1649 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1649;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1628;

-- Deactivating historical Sede: Policlínico Rosaluz (RUC: 20515391682)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3543;
-- Deactivating parent Empresa ID: 1650 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1650;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1629;

-- Deactivating historical Sede: DENTAL DIAZ (RUC: 10214575120)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3544;
-- Deactivating parent Empresa ID: 1651 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1651;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1630;

-- Deactivating historical Sede: CENTRO ODONTOLÓGICO DENTILU (RUC: 20607909572)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3545;
-- Deactivating parent Empresa ID: 1652 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1652;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1631;

-- Deactivating historical Sede: dental 314 (RUC: 20608329740)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3546;
-- Deactivating parent Empresa ID: 1653 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1653;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1632;

-- Deactivating historical Sede: NATURAL DENT (RUC: 10074733862)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3547;
-- Deactivating parent Empresa ID: 1654 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1654;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1633;

-- Deactivating historical Sede: INNOVA DENT (RUC: 10067690091)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3548;
-- Deactivating parent Empresa ID: 1655 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1655;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1634;

-- Deactivating historical Sede: LUMINE DENT (RUC: 10700522445)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3549;
-- Deactivating parent Empresa ID: 1656 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1656;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1635;

-- Deactivating historical Sede: Maxsalud (RUC: 10707805621)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3550;
-- Deactivating parent Empresa ID: 1657 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1657;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1636;

-- Deactivating historical Sede: PROFI DENT (RUC: 10729782977)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3551;
-- Deactivating parent Empresa ID: 1658 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1658;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1637;

-- Deactivating historical Sede: CLINICA DENTAL RUFFNER (RUC: 10400731751)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3552;
-- Deactivating parent Empresa ID: 1659 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1659;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1638;

-- Deactivating historical Sede: POLICLINICO BARDALES (RUC: 10090127506)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3553;
-- Deactivating parent Empresa ID: 1660 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1660;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1639;

-- Deactivating historical Sede: ELIDENT (RUC: 10406871474)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3554;
-- Deactivating parent Empresa ID: 1661 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1661;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1640;

-- Deactivating historical Sede: VETERINARIA VET MEDICAL (RUC: 20566315930)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3555;
-- Deactivating parent Empresa ID: 1662 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1662;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1641;

-- Deactivating historical Sede: MEDICDERM (RUC: 20602764959)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3556;
-- Deactivating parent Empresa ID: 1663 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1663;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1642;

-- Deactivating historical Sede: MEDICDERM (RUC: 20602764959)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3557;

-- Deactivating historical Sede: Dental Montalvo (RUC: 10708804865)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3558;
-- Deactivating parent Empresa ID: 1664 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1664;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1643;

-- Deactivating historical Sede: Veterinaria Ramírez (RUC: 20601758475)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3559;
-- Deactivating parent Empresa ID: 1665 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1665;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1644;

-- Deactivating historical Sede: Ecobio Mediclab SAC (RUC: 20553145512)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3560;
-- Deactivating parent Empresa ID: 1666 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1666;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1645;

-- Deactivating historical Sede: CRNTRO MEDICO OBSTETRICO SANTA TERESITA (RUC: 10403634242)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3561;
-- Deactivating parent Empresa ID: 1667 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1667;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1646;

-- Deactivating historical Sede: BEA SMILE (RUC: 10473420355)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3562;
-- Deactivating parent Empresa ID: 1668 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1668;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1647;

-- Deactivating historical Sede: DIETER ROTH MEDICO VETERINARIO (RUC: 10108129773)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3563;
-- Deactivating parent Empresa ID: 1669 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1669;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1648;

-- Deactivating historical Sede: SAN LUCAS (RUC: 20603572280)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3564;
-- Deactivating parent Empresa ID: 1670 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1670;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1649;

-- Deactivating historical Sede: Consultorio dental José Mendoza (RUC: 10421094956)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3565;
-- Deactivating parent Empresa ID: 1671 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1671;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1650;

-- Deactivating historical Sede: DOCTOR FAUNA (RUC: 20608472631)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3566;
-- Deactivating parent Empresa ID: 1672 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1672;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1651;

-- Deactivating historical Sede: Policlínico Medicoach (RUC: 20608499203)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3567;
-- Deactivating parent Empresa ID: 1673 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1673;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1652;

-- Deactivating historical Sede: PILLCO APET (RUC: 20563646684)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3568;
-- Deactivating parent Empresa ID: 1674 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1674;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1653;

-- Deactivating historical Sede: CONSULTORIOS MEDICOS MARIA AUXILIADORA (RUC: 20607923231)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3569;
-- Deactivating parent Empresa ID: 1675 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1675;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1654;

-- Deactivating historical Sede: DENTAL URQUIZO (RUC: 10458929233)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3570;
-- Deactivating parent Empresa ID: 1676 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1676;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1655;

-- Deactivating historical Sede: Consultorio Odontológico Mi Sonrisa (RUC: 10316630923)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3571;
-- Deactivating parent Empresa ID: 1677 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1677;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1656;

-- Deactivating historical Sede: Odontocenter (RUC: 20166355703)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3572;
-- Deactivating parent Empresa ID: 1678 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1678;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1657;

-- Deactivating historical Sede: VETERINARIA MUNICIPAL PUENTE PIEDRA (RUC: 20607994260)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3573;
-- Deactivating parent Empresa ID: 1679 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1679;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1658;

-- Deactivating historical Sede: M.A.BIOLAB (RUC: 15606423800)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3574;
-- Deactivating parent Empresa ID: 1680 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1680;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1659;

-- Deactivating historical Sede: INACTIVO (RUC: 10458500075)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3575;
-- Deactivating parent Empresa ID: 1681 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1681;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1660;

-- Deactivating historical Sede: DENTOSALUD (RUC: 10468000101)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3576;
-- Deactivating parent Empresa ID: 1682 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1682;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1661;

-- Deactivating historical Sede: NATUR SALAS (RUC: 20603114087)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3577;
-- Deactivating parent Empresa ID: 1683 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1683;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1662;

-- Deactivating historical Sede: Artdental (RUC: 10445693869)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3578;
-- Deactivating parent Empresa ID: 1684 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1684;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1663;

-- Deactivating historical Sede: Normedic (RUC: 20607006858)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3579;
-- Deactivating parent Empresa ID: 1685 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1685;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1664;

-- Deactivating historical Sede: CONSULTORIO DENTAL MEGADENT (RUC: 10414813866)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3580;
-- Deactivating parent Empresa ID: 1686 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1686;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1665;

-- Deactivating historical Sede: CLINICA VETERINARIA SAN ROQUE (RUC: 20605637371)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3581;
-- Deactivating parent Empresa ID: 1687 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1687;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1666;

-- Deactivating historical Sede: Medical Dent Esthetic (RUC: 20563482550)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3582;
-- Deactivating parent Empresa ID: 1688 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1688;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1667;

-- Deactivating historical Sede: ECOGRAFIAS LAS VIOLETAS (RUC: 10097941772)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3583;
-- Deactivating parent Empresa ID: 1689 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1689;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1668;

-- Deactivating historical Sede: Veterinaria del Carmen (RUC: 10102986585)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3584;
-- Deactivating parent Empresa ID: 1690 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1690;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1669;

-- Deactivating historical Sede: CDF CONSULTORIOS S.A.C2 (RUC: 20608717286)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3585;
-- Deactivating parent Empresa ID: 1691 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1691;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1670;

-- Deactivating historical Sede: CDF CONSULTORIOS S.A.C (RUC: 20608717286)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3586;

-- Deactivating historical Sede: CONSULTORIO DENTAL ODONTOLIKE (RUC: 10100314211)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3587;
-- Deactivating parent Empresa ID: 1692 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1692;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1671;

-- Deactivating historical Sede: COSMETIK MEDI SPA (RUC: 20608103857)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3588;
-- Deactivating parent Empresa ID: 1693 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1693;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1672;

-- Deactivating historical Sede: CONSULTORIO FEMENINO INTIMAS (RUC: 10225155092)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3589;
-- Deactivating parent Empresa ID: 1694 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1694;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1673;

-- Deactivating historical Sede: FAMILY DENTIST (RUC: 10465579710)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3590;
-- Deactivating parent Empresa ID: 1695 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1695;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1674;

-- Deactivating historical Sede: Veterinaria dr. ralth (RUC: 20607959782)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3591;
-- Deactivating parent Empresa ID: 1696 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1696;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1675;

-- Deactivating historical Sede: Dental Villarán (RUC: 10108683061)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3592;
-- Deactivating parent Empresa ID: 1697 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1697;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1676;

-- Deactivating historical Sede: Cedimax (RUC: 20501913899)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3593;
-- Deactivating parent Empresa ID: 1698 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1698;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1677;

-- Deactivating historical Sede: SMILE & CARE (RUC: 10461623510)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3594;
-- Deactivating parent Empresa ID: 1699 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1699;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1678;

-- Deactivating historical Sede: NANVAS ODONTOSTETIC (RUC: 99900000014)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3595;
-- Deactivating parent Empresa ID: 1700 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1700;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1679;

-- Deactivating historical Sede: CORTA LLAMADA, NO QUIERE PROGRAMAR (RUC: 10449755397)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3596;
-- Deactivating parent Empresa ID: 1701 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1701;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1680;

-- Deactivating historical Sede: Imagine medic (RUC: 10439235077)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3597;
-- Deactivating parent Empresa ID: 1702 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1702;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1681;

-- Deactivating historical Sede: ODONTO SAN ROQUE (RUC: 10425272514)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3598;
-- Deactivating parent Empresa ID: 1703 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1703;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1682;

-- Deactivating historical Sede: Dental Cabrera (RUC: 10060683935)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3599;
-- Deactivating parent Empresa ID: 1704 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1704;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1683;

-- Deactivating historical Sede: ANTES CABRERA LIÑAN JESUS RUC :10060683935 (RUC: 10060683935)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3600;

-- Deactivating historical Sede: Odontovilla (RUC: 20605253220)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3601;
-- Deactivating parent Empresa ID: 1705 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1705;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1684;

-- Deactivating historical Sede: Dental Unlimited (RUC: 10090852871)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3602;
-- Deactivating parent Empresa ID: 1706 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1706;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1685;

-- Deactivating historical Sede: Vip guau Groomer and Petshop (RUC: 20606464879)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3603;
-- Deactivating parent Empresa ID: 1707 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1707;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1686;

-- Deactivating historical Sede: ADOPTA UNA MASCOTA (RUC: 10180546699)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3604;
-- Deactivating parent Empresa ID: 1708 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1708;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1687;

-- Deactivating historical Sede: COREDENT (RUC: 10081423470)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3605;
-- Deactivating parent Empresa ID: 1709 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1709;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1688;

-- Deactivating historical Sede: CENTRO MEDICO OBSTÉTRICO SALUD DE LA MUJER Y FAMILIA (RUC: 10467043086)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3606;
-- Deactivating parent Empresa ID: 1710 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1710;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1689;

-- Deactivating historical Sede: KIRUSDENT CLINICA DENTAL (RUC: 15604588160)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3607;
-- Deactivating parent Empresa ID: 1711 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1711;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1690;

-- Deactivating historical Sede: 4 pet´s (RUC: 20602532519)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3608;
-- Deactivating parent Empresa ID: 1712 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1712;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1691;

-- Deactivating historical Sede: BACKSTAGE TATTOO (RUC: 10461066688)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3609;
-- Deactivating parent Empresa ID: 1713 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1713;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1692;

-- Deactivating historical Sede: Vita-dent (RUC: 10712913245)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3610;
-- Deactivating parent Empresa ID: 1714 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1714;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1693;

-- Deactivating historical Sede: CLINICA VETERINARIA CANICAT (RUC: 10061988292)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3611;
-- Deactivating parent Empresa ID: 1715 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1715;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1694;

-- Deactivating historical Sede: SALVA SALUD (RUC: 20606587032)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3612;
-- Deactivating parent Empresa ID: 1716 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1716;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1695;

-- Deactivating historical Sede: CENTRO MEDICO MEDI VIDA E.I.R.L. (RUC: 20601042712)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3613;
-- Deactivating parent Empresa ID: 1717 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1717;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1696;

-- Deactivating historical Sede: CENTRO MEDICO MEDI VIDA E.I.R.L. (RUC: 20601042712)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3614;

-- Deactivating historical Sede: CENTRO MEDICO MEDI VIDA E.I.R.L. (RUC: 20601042712)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3615;

-- Deactivating historical Sede: EMMANUEL (RUC: 10459397031)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3616;
-- Deactivating parent Empresa ID: 1718 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1718;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1697;

-- Deactivating historical Sede: Clínica Veterinaria Maskotopia (RUC: 10410634118)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3617;
-- Deactivating parent Empresa ID: 1719 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1719;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1698;

-- Deactivating historical Sede: Consultorio Odontológico Dra. Mirella Pure (RUC: 10470699235)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3618;
-- Deactivating parent Empresa ID: 1720 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1720;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1699;

-- Deactivating historical Sede: VETERINARIA VETSCAN (RUC: 20551919057)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3619;
-- Deactivating parent Empresa ID: 1721 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1721;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1700;

-- Deactivating historical Sede: Moderna Lab Import (RUC: 20493132173)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3620;
-- Deactivating parent Empresa ID: 1722 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1722;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1701;

-- Deactivating historical Sede: IDENTAL (RUC: 20548541965)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3621;
-- Deactivating parent Empresa ID: 1723 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1723;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1702;

-- Deactivating historical Sede: Urban Pet (RUC: 20608835807)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3622;
-- Deactivating parent Empresa ID: 1724 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1724;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1703;

-- Deactivating historical Sede: CLINICA DENTAL SMILE VALEDENT (RUC: 10431598430)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3623;
-- Deactivating parent Empresa ID: 1725 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1725;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1704;

-- Deactivating historical Sede: Lengüetazo Petcare (RUC: 20608890956)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3624;
-- Deactivating parent Empresa ID: 1726 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1726;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1705;

-- Deactivating historical Sede: Lengüetazo Petcare (RUC: 10451426198)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3625;
-- Deactivating parent Empresa ID: 1727 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1727;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1706;

-- Deactivating historical Sede: Traumarehab SPORT (RUC: 20608961527)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3626;
-- Deactivating parent Empresa ID: 1728 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1728;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1707;

-- Deactivating historical Sede: Pets and love veterinaria (RUC: 20608497189)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3627;
-- Deactivating parent Empresa ID: 1729 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1729;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1708;

-- Deactivating historical Sede: Kefa Consultorios (RUC: 10097404955)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3628;
-- Deactivating parent Empresa ID: 1730 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1730;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1709;

-- Deactivating historical Sede: Metro Vet (RUC: 10160231055)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3629;
-- Deactivating parent Empresa ID: 1731 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1731;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1710;

-- Deactivating historical Sede: IRODEM X (RUC: 20544858832)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3630;
-- Deactivating parent Empresa ID: 1732 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1732;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1711;

-- Deactivating historical Sede: VETERINARIA MUNDO ANIMAL (RUC: 20607687693)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3631;
-- Deactivating parent Empresa ID: 1733 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1733;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1712;

-- Deactivating historical Sede: CARRASCO MARTINEZ JOSE ANTONIO (RUC: 10106444795)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3632;
-- Deactivating parent Empresa ID: 1734 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1734;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1713;

-- Deactivating historical Sede: Maza medical & laboratorios (RUC: 20604921938)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3633;
-- Deactivating parent Empresa ID: 1735 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1735;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1714;

-- Deactivating historical Sede: ODONTOPANDO (RUC: 20608775669)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3634;
-- Deactivating parent Empresa ID: 1736 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1736;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1715;

-- Deactivating historical Sede: Veterinaria Santa Felicia (RUC: 10400181361)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3635;
-- Deactivating parent Empresa ID: 1737 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1737;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1716;

-- Deactivating historical Sede: Ecosalud (RUC: 20608584685)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3636;
-- Deactivating parent Empresa ID: 1738 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1738;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1717;

-- Deactivating historical Sede: Animall Veterinaria (RUC: 10446350906)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3637;
-- Deactivating parent Empresa ID: 1739 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1739;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1718;

-- Deactivating historical Sede: consultorio médico retablo (RUC: 20605634266)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3638;
-- Deactivating parent Empresa ID: 1740 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1740;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1719;

-- Deactivating historical Sede: Zumadent (RUC: 10432445602)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3639;
-- Deactivating parent Empresa ID: 1741 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1741;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1720;

-- Deactivating historical Sede: VETERIFARMA (RUC: 10716341025)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3640;
-- Deactivating parent Empresa ID: 1742 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1742;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1721;

-- Deactivating historical Sede: VETSUR CLINICA VETERINARIA (RUC: 20608900064)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3641;
-- Deactivating parent Empresa ID: 1743 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1743;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1722;

-- Deactivating historical Sede: Renacer Medical (RUC: 20609536811)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3642;
-- Deactivating parent Empresa ID: 1744 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1744;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1723;

-- Deactivating historical Sede: Centro odontológico Luant (RUC: 20606232293)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3643;
-- Deactivating parent Empresa ID: 1745 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1745;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1724;

-- Deactivating historical Sede: DOGPACKERS Club Canino (RUC: 20609157713)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3644;
-- Deactivating parent Empresa ID: 1746 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1746;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1725;

-- Deactivating historical Sede: ABV BARBERIA SAC (RUC: 20603741198)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3645;
-- Deactivating parent Empresa ID: 1747 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1747;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1726;

-- Deactivating historical Sede: VETERINARIA KUSI ALKHO SAC (RUC: 20601799929)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3646;
-- Deactivating parent Empresa ID: 1748 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1748;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1727;

-- Deactivating historical Sede: Jannet Melissa Salcedo Macal2 (RUC: 10461997673)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3647;
-- Deactivating parent Empresa ID: 1749 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1749;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1728;

-- Deactivating historical Sede: Jannet Melissa Salcedo Macalupu (RUC: 10461997673)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3648;

-- Deactivating historical Sede: ASISTENCIA VETERINARIA SALUD AN (RUC: 20608470761)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3649;
-- Deactivating parent Empresa ID: 1750 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1750;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1729;

-- Deactivating historical Sede: Consultorio Médico Dr.Fernández (RUC: 20609695731)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3650;
-- Deactivating parent Empresa ID: 1751 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1751;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 887;

-- Deactivating historical Sede: AV.SANTIAGO DE SURCO 3162 SURCO (RUC: 20607878375)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3651;
-- Deactivating parent Empresa ID: 1752 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1752;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1730;

-- Deactivating historical Sede: Dental Cristo Rey (RUC: 99900000015)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3652;
-- Deactivating parent Empresa ID: 1753 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1753;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 154;

-- Deactivating historical Sede: CLÍNICA DENTAL ILLUMINANCE (RUC: 10454891151)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3653;
-- Deactivating parent Empresa ID: 1754 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1754;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 788;

-- Deactivating historical Sede: HOSPITAL VETERINARIO CENTRAL DEL EJÉRCITO (Clínica Veterinaria La Molina) (RUC: 99900000016)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3654;
-- Deactivating parent Empresa ID: 1755 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1755;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 819;

-- Deactivating historical Sede: MR Dental Spa (RUC: 99900000017)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3655;
-- Deactivating parent Empresa ID: 1756 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1756;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 401;

-- Deactivating historical Sede: cowtechnologies (RUC: 20603064012)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3656;
-- Deactivating parent Empresa ID: 1757 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1757;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1731;

-- Deactivating historical Sede: CENTRO ODONTOLOGICO LIBENTY (RUC: 20612790991)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3657;
-- Deactivating parent Empresa ID: 1758 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1758;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1732;

-- Deactivating historical Sede: Linares Veterinaria & Spa (RUC: 20613242776)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3658;
-- Deactivating parent Empresa ID: 1759 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1759;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 518;

-- Deactivating historical Sede: CARLOS GIL GABRIEL CALVO MAC (RUC: 99900000018)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3659;
-- Deactivating parent Empresa ID: 1760 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1760;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1733;

-- Deactivating historical Sede: CENTRO DE REHABILITACION EN OD (RUC: 20611325011)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3660;
-- Deactivating parent Empresa ID: 1761 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1761;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1734;

-- Deactivating historical Sede: SUMINISTROS VETERINARIOS H & S (RUC: 20608728652)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3661;
-- Deactivating parent Empresa ID: 1762 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1762;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1735;

-- Deactivating historical Sede: samantha rojas (RUC: 10712919928)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3662;
-- Deactivating parent Empresa ID: 1763 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1763;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1736;

-- Deactivating historical Sede: CSALUD SA (RUC: 20101165389)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3663;
-- Deactivating parent Empresa ID: 1764 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1764;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1737;

-- Deactivating historical Sede: Consultorio odontologí (RUC: 99900000020)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3664;
-- Deactivating parent Empresa ID: 1765 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1765;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 968;

-- Deactivating historical Sede: Clínica Dental Cristiana (RUC: 20602352049)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3665;
-- Deactivating parent Empresa ID: 1766 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1766;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1738;

-- Deactivating historical Sede: QALI FRUITS SAC (RUC: 20512441174)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3666;
-- Deactivating parent Empresa ID: 1767 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1767;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1739;

-- Deactivating historical Sede: Dr. Miguel Lau (RUC: 10405521712)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3667;
-- Deactivating parent Empresa ID: 1768 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1768;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1740;

-- Deactivating historical Sede: FEDERACION INTERNACIONAL DE SOC (RUC: 20513883138)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3668;
-- Deactivating parent Empresa ID: 1769 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1769;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1741;

-- Deactivating historical Sede: INVERSIONES AGROPECUARIAS CONTI (RUC: 20601255406)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3669;
-- Deactivating parent Empresa ID: 1770 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1770;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1742;

-- Deactivating historical Sede: IVANNA DOOR (RUC: 10703493667)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3670;
-- Deactivating parent Empresa ID: 1771 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1771;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1743;

-- Deactivating historical Sede: HOJA 1 (3) (RUC: 99900000021)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3671;
-- Deactivating parent Empresa ID: 1772 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1772;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1744;

-- Deactivating historical Sede: Luz de vida (RUC: 10708688903)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3672;
-- Deactivating parent Empresa ID: 1773 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1773;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1322;

-- Deactivating historical Sede: POLIDENTO (RUC: 99900000022)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3673;
-- Deactivating parent Empresa ID: 1774 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1774;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1346;

-- Deactivating historical Sede: hoja 2 (6) (RUC: 99900000023)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3674;
-- Deactivating parent Empresa ID: 1775 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1775;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1745;

-- Deactivating historical Sede: vencido (RUC: 20452379661)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3675;
-- Deactivating parent Empresa ID: 1776 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1776;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1746;

-- Deactivating historical Sede: SERVICIOS MÉDICOS Y AFINES EDDE (RUC: 20494826632)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3676;
-- Deactivating parent Empresa ID: 1777 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1777;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1747;

-- Deactivating historical Sede: ICAMEDIC (RUC: 20601095450)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3677;
-- Deactivating parent Empresa ID: 1778 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1778;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1748;

-- Deactivating historical Sede: aguirre (RUC: 20494652031)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3678;
-- Deactivating parent Empresa ID: 1779 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1779;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1749;

-- Deactivating historical Sede: ORDEN DE RECOJO (RUC: 20269376806)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3679;
-- Deactivating parent Empresa ID: 1780 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1780;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1750;

-- Deactivating historical Sede: cancelado (RUC: 10456242125)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3680;
-- Deactivating parent Empresa ID: 1781 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1781;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1751;

-- Deactivating historical Sede: VET. VET HOUSE (RUC: 10447468561)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3681;
-- Deactivating parent Empresa ID: 1782 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1782;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1752;

-- Deactivating historical Sede: VET. VET HOUSE PUEBLO JOVEN SEÑOR DE LUREN (RUC: 10454497550)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3682;
-- Deactivating parent Empresa ID: 1783 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1783;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1753;

-- Deactivating historical Sede: COLITAS FELICES (RUC: 10443843723)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3683;
-- Deactivating parent Empresa ID: 1784 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1784;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1754;

-- Deactivating historical Sede: COLITAS FELICES (RUC: 10443843723)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3684;

-- Deactivating historical Sede: Vet. Vet house Gudalupe (RUC: 10441768023)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3685;
-- Deactivating parent Empresa ID: 1785 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1785;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1755;

-- Deactivating historical Sede: Clin Vet Montoya (RUC: 10705171667)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3686;
-- Deactivating parent Empresa ID: 1786 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1786;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1756;

-- Deactivating historical Sede: Veterinaria petshop CityVet (RUC: 10425067139)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3687;
-- Deactivating parent Empresa ID: 1787 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1787;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1757;

-- Deactivating historical Sede: CLIN VET DEL DR YOBER (RUC: 20535015164)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3688;
-- Deactivating parent Empresa ID: 1788 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1788;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1758;

-- Deactivating historical Sede: ANULO CONTRATO (RUC: 10460581163)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3689;
-- Deactivating parent Empresa ID: 1789 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1789;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1759;

-- Deactivating historical Sede: Clínica Evaleti (RUC: 10154498520)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3690;
-- Deactivating parent Empresa ID: 1790 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1790;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1760;

-- Deactivating historical Sede: HOSPITAL REGIONAL DE ICA (RUC: 43611309)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3691;
-- Deactivating parent Empresa ID: 1791 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1791;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1200;

-- Deactivating historical Sede: VETERINARIA ARENALES (RUC: 20605408924)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3692;
-- Deactivating parent Empresa ID: 1792 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1792;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1761;

-- Deactivating historical Sede: XARO RENAL CARE SAC (RUC: 20535045829)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3693;
-- Deactivating parent Empresa ID: 1793 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1793;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1762;

-- Deactivating historical Sede: SWISSDENT E.I.R.L. (RUC: 20600339771)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3694;
-- Deactivating parent Empresa ID: 1794 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1794;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1763;

-- Deactivating historical Sede: Consultorio dental panchito & bichectomia Cañete (RUC: 10727205271)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3695;
-- Deactivating parent Empresa ID: 1795 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1795;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1764;

-- Deactivating historical Sede: HOSPITAL DE CHINCHA - CAAT (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3696;
-- Deactivating parent Empresa ID: 1796 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1796;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1765;

-- Deactivating historical Sede: HOSPITAL SAN JOSE DE CHINCHA (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3697;

-- Deactivating historical Sede: P.S SAN JOSE (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3698;

-- Deactivating historical Sede: P.S HOJA REDONDA (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3699;

-- Deactivating historical Sede: P.S WIRACOCHA (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3700;

-- Deactivating historical Sede: C.S EL CARMEN (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3701;

-- Deactivating historical Sede: P.S EL SALVADOR (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3702;

-- Deactivating historical Sede: C.S ALTO LARAN (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3703;

-- Deactivating historical Sede: P.S BALCONCITO (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3704;

-- Deactivating historical Sede: C.S SAN ISIDRO (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3705;

-- Deactivating historical Sede: P.S SUNAMPE (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3706;

-- Deactivating historical Sede: P.S CRUZ BLANCA (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3707;

-- Deactivating historical Sede: P.S CONDORILLO ALTO (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3708;

-- Deactivating historical Sede: P.S LOS ALAMOS (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3709;

-- Deactivating historical Sede: P.S SAN AGUSTIN (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3710;

-- Deactivating historical Sede: C.S CHINCHA BAJA (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3711;

-- Deactivating historical Sede: C.S GROCIO PRADO (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3712;

-- Deactivating historical Sede: C.S PUEBLO NUEVO (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3713;

-- Deactivating historical Sede: C.S TAMBO DE MORA (RUC: 20410275768)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3714;

-- Deactivating historical Sede: ANULADO (RUC: 20600624891)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3715;
-- Deactivating parent Empresa ID: 1797 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1797;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1766;

-- Deactivating historical Sede: PROGRAMA DE DESARROLLO DE SANID (RUC: 20414251561)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3716;
-- Deactivating parent Empresa ID: 1798 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1798;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1767;

-- Deactivating historical Sede: DRA. YEARLING HERRERA (RUC: 10475685674)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3717;
-- Deactivating parent Empresa ID: 1799 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1799;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1768;

-- Deactivating historical Sede: POB SAC (RUC: 20612065668)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3718;
-- Deactivating parent Empresa ID: 1800 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1800;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1769;

-- Deactivating historical Sede: HOJA (2) (RUC: 99900000024)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3719;
-- Deactivating parent Empresa ID: 1801 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1801;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1770;

-- Deactivating historical Sede: HOJA (RUC: 99900000025)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3720;
-- Deactivating parent Empresa ID: 1802 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1802;
UPDATE `Cliente` SET `activo` = 0 WHERE `id_cliente` = 1771;

-- Deactivating historical Sede: Clinica Oquendo (RUC: 20610727507)
UPDATE `Sede` SET `activo` = 0 WHERE `id_sede` = 3721;
-- Deactivating parent Empresa ID: 1803 (No active sedes remaining)
UPDATE `Empresa` SET `activo` = 0 WHERE `id_empresa` = 1803;


-- --------------------------------------------------------
-- SECTION 2: ADD NEW CLIENTS (MISSING RUCS IN EXCEL)
-- --------------------------------------------------------

-- [NEW CLIENT] Fila 1504: RAMIREZ GONZALES SAMUEL JUNIOR YAMPIERO (RUC: 10438919878)
INSERT INTO `Cliente` (`nombre`, `tipo_documento`, `dni`, `activo`) VALUES ('RAMIREZ GONZALES SAMUEL JUNIOR YAMPIERO', 'RUC', '10438919878', 1);
SET @new_cliente_id = LAST_INSERT_ID();
INSERT INTO `Empresa` (`id_cliente`, `razon_social`, `ruc`, `activo`) VALUES (@new_cliente_id, 'RAMIREZ GONZALES SAMUEL JUNIOR YAMPIERO', '10438919878', 1);
SET @new_empresa_id = LAST_INSERT_ID();
INSERT INTO `Sede` (`id_empresa`, `nombre_comercial`, `direccion`, `distrito`, `provincia`, `departamento`, `contacto_nombre`, `contacto_telefono`, `activo`) VALUES (@new_empresa_id, 'ODENTIA', 'AV. Simón Bolivar N 309 - Pueblo libre', 'PUEBLO LIBRE', 'Lima', 'Lima', '', '', 1);
SET @new_sede_id = LAST_INSERT_ID();

-- [NEW CLIENT] Fila 1473: Jeny Luz Lázaro Ramos (RUC: 10708688903)
INSERT INTO `Cliente` (`nombre`, `tipo_documento`, `dni`, `activo`) VALUES ('Jeny Luz Lázaro Ramos', 'RUC', '10708688903', 1);
SET @new_cliente_id = LAST_INSERT_ID();
INSERT INTO `Empresa` (`id_cliente`, `razon_social`, `ruc`, `activo`) VALUES (@new_cliente_id, 'Jeny Luz Lázaro Ramos', '10708688903', 1);
SET @new_empresa_id = LAST_INSERT_ID();
INSERT INTO `Sede` (`id_empresa`, `nombre_comercial`, `direccion`, `distrito`, `provincia`, `departamento`, `contacto_nombre`, `contacto_telefono`, `activo`) VALUES (@new_empresa_id, 'Luz de vida', 'Jr. Francisco Bolognesi N 316, cercado de Puente Piedra', 'PUENTE PIEDRA', 'Lima', 'Lima', '', 'Jeny Luz Lázaro Ramos 925 128 618', 1);
SET @new_sede_id = LAST_INSERT_ID();
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (@new_sede_id, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);

-- [NEW CLIENT] Fila 1500: CANCHUCAJA CAHUANA OMAR RODRIGO (RUC: 10756084128)
INSERT INTO `Cliente` (`nombre`, `tipo_documento`, `dni`, `activo`) VALUES ('CANCHUCAJA CAHUANA OMAR RODRIGO', 'RUC', '10756084128', 1);
SET @new_cliente_id = LAST_INSERT_ID();
INSERT INTO `Empresa` (`id_cliente`, `razon_social`, `ruc`, `activo`) VALUES (@new_cliente_id, 'CANCHUCAJA CAHUANA OMAR RODRIGO', '10756084128', 1);
SET @new_empresa_id = LAST_INSERT_ID();
INSERT INTO `Sede` (`id_empresa`, `nombre_comercial`, `direccion`, `distrito`, `provincia`, `departamento`, `contacto_nombre`, `contacto_telefono`, `activo`) VALUES (@new_empresa_id, 'POLIDENTO', 'Mz. D, Lt 5 ASOCIACION CIRCUNVALACION EL AGUSTINO.', 'LIMA', 'Lima', 'Lima', '', 'OMAR CANCHUCAJA CAHUANA 992232828', 1);
SET @new_sede_id = LAST_INSERT_ID();
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (@new_sede_id, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);

-- [NEW CLIENT] Fila 1503: SERVICIO DE ODONTOLOGIA ESPECIALIZADO EIRL (RUC: 20521980541)
INSERT INTO `Cliente` (`nombre`, `tipo_documento`, `dni`, `activo`) VALUES ('SERVICIO DE ODONTOLOGIA ESPECIALIZADO EIRL', 'RUC', '20521980541', 1);
SET @new_cliente_id = LAST_INSERT_ID();
INSERT INTO `Empresa` (`id_cliente`, `razon_social`, `ruc`, `activo`) VALUES (@new_cliente_id, 'SERVICIO DE ODONTOLOGIA ESPECIALIZADO EIRL', '20521980541', 1);
SET @new_empresa_id = LAST_INSERT_ID();
INSERT INTO `Sede` (`id_empresa`, `nombre_comercial`, `direccion`, `distrito`, `provincia`, `departamento`, `contacto_nombre`, `contacto_telefono`, `activo`) VALUES (@new_empresa_id, 'CONSULTORIO MEDICO DENTAL LA MOLINA', 'AVENIDA CONSTRUCTORES 1015 LA MOLINA', 'LA MOLINA', 'Lima', 'Lima', '', '', 1);
SET @new_sede_id = LAST_INSERT_ID();

-- [NEW CLIENT] Fila 1506: SALUD OCUPACIONAL SAN LUCAS EIRL (RUC: 20603486936)
INSERT INTO `Cliente` (`nombre`, `tipo_documento`, `dni`, `activo`) VALUES ('SALUD OCUPACIONAL SAN LUCAS EIRL', 'RUC', '20603486936', 1);
SET @new_cliente_id = LAST_INSERT_ID();
INSERT INTO `Empresa` (`id_cliente`, `razon_social`, `ruc`, `activo`) VALUES (@new_cliente_id, 'SALUD OCUPACIONAL SAN LUCAS EIRL', '20603486936', 1);
SET @new_empresa_id = LAST_INSERT_ID();
INSERT INTO `Sede` (`id_empresa`, `nombre_comercial`, `direccion`, `distrito`, `provincia`, `departamento`, `contacto_nombre`, `contacto_telefono`, `activo`) VALUES (@new_empresa_id, 'OCUPASALUD', 'calle arequipa 184, Mz D lt 30 urb. Tilda  a una cuadra del colegio san ignacio school', 'ATE', 'Lima', 'Lima', '', '', 1);
SET @new_sede_id = LAST_INSERT_ID();

-- [NEW CLIENT] Fila 555: Linares Clinica Veterinaria EIRL (RUC: 20613247761)
INSERT INTO `Cliente` (`nombre`, `tipo_documento`, `dni`, `activo`) VALUES ('Linares Clinica Veterinaria EIRL', 'RUC', '20613247761', 1);
SET @new_cliente_id = LAST_INSERT_ID();
INSERT INTO `Empresa` (`id_cliente`, `razon_social`, `ruc`, `activo`) VALUES (@new_cliente_id, 'Linares Clinica Veterinaria EIRL', '20613247761', 1);
SET @new_empresa_id = LAST_INSERT_ID();
INSERT INTO `Sede` (`id_empresa`, `nombre_comercial`, `direccion`, `distrito`, `provincia`, `departamento`, `contacto_nombre`, `contacto_telefono`, `activo`) VALUES (@new_empresa_id, 'Linares Veterinaria & Spa', 'Av san Luis nro 2753. San Borja', 'SAN BORJA', 'Lima', 'Lima', '', '945156862', 1);
SET @new_sede_id = LAST_INSERT_ID();
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (@new_sede_id, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);

-- [NEW CLIENT] Fila 1505: INVERSIONES SALUD ANIMAL ANRU SAC (RUC: 20615908925)
INSERT INTO `Cliente` (`nombre`, `tipo_documento`, `dni`, `activo`) VALUES ('INVERSIONES SALUD ANIMAL ANRU SAC', 'RUC', '20615908925', 1);
SET @new_cliente_id = LAST_INSERT_ID();
INSERT INTO `Empresa` (`id_cliente`, `razon_social`, `ruc`, `activo`) VALUES (@new_cliente_id, 'INVERSIONES SALUD ANIMAL ANRU SAC', '20615908925', 1);
SET @new_empresa_id = LAST_INSERT_ID();
INSERT INTO `Sede` (`id_empresa`, `nombre_comercial`, `direccion`, `distrito`, `provincia`, `departamento`, `contacto_nombre`, `contacto_telefono`, `activo`) VALUES (@new_empresa_id, 'WALAC Magdalena', 'JIRON LIBERTAD 653', 'MAGDALENA', 'Lima', 'Lima', '', '', 1);
SET @new_sede_id = LAST_INSERT_ID();


-- --------------------------------------------------------
-- SECTION 3: UPDATE CONTRACTS FOR EXISTING CLIENTS
-- --------------------------------------------------------

-- Creating new active contract for: ALFREDO ORTEGA CLINICA DE DERMATOLOGIA VETERINARIA E.I.R.L. (RUC: 20602832601)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO ODONTOLOGICO INTEGRAL BARRANCO S.R.L. (RUC: 20609538881)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (3, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DENTIMAX PERU S.A.C. (RUC: 20556912239)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (8, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GRIMALDO VARA ARTHUR HAROLD (RUC: 10439879489)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (10, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ALGENDONES ALMEYDA MELISA EMERITA (RUC: 10401351898)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (12, '2026-01-01', 70.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: CENTRO ODONTOLOGICO BASILIOS DENT SAC (RUC: 20603311567)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (17, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO VETERINARIO MEDIKA VET S.A.C (RUC: 20563298627)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (19, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ABANTO FLORIAN MARIA FLORINDA (RUC: 10086778187)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (21, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: NUÑEZ CABALLERO EMILIA ELIZABETH (RUC: 10086340351)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (23, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DENTI SMILE E.I.R.L. (RUC: 20603208758)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (25, '2026-01-01', 50.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: ASTRODENT EIRL (RUC: 20533743952)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (27, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SMILE CITY S.A.C. (RUC: 20553030456)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (29, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MALDONADO MARTEL RICARDO ANTONIO (RUC: 10005083317)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (34, '2026-01-01', 94.4, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: KARINA LISBETH REYES QUIÑONES (RUC: 10449896071)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (37, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: RAUL GUILLERMO MANCILLA ROJO (RUC: 10095490056)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (39, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PEKYS PET (RUC: 20601616905)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (43, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ASF SALUD SAC (RUC: 20548617619)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (45, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ROJAS ACOSTA IVAN SEGUNDO (RUC: 10453824328)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (47, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CORPORACION SERVICIOS EVENTOS Y EQUIPOS MEDICOS KURA (RUC: 20601218187)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (51, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Roger Vladimir Chavez Flores (RUC: 10413204084)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (53, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CONSULTORIO DENTAL MDM SAC (RUC: 20604758620)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (57, '2026-01-01', 80.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: VICTOR OSWALDO GUERRERO ROJAS (RUC: 10407000965)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (59, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Silvia Neyra Celia Rocio (RUC: 10061447003)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (63, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: A & G TUSALUD S.A.C. (RUC: 20600817745)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (68, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LIZ MARIBEL GUTIERREZ GUIÑO (RUC: 10436169014)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (70, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LIZARRAGA URIBE ELBA EMPERATRIZ (RUC: 10408762630)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (72, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DANIEL GABRIEL TELLO FERNANDEZ (RUC: 10100687751)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (77, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: EDITH JOVANA VALQUI SOSA (RUC: 10454609285)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (79, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JORGE MANUEL BREÑA TOVAR (RUC: 10400273656)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (83, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: HELGA GONZALES NIÑO (RUC: 10405062211)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (87, '2026-01-01', 50.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: VICTOR ARMANDO BARRANTES SAAVEDRA (RUC: 10099650813)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (91, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VICTOR ARMANDO BARRANTES SAAVEDRA (RUC: 10099650813)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (92, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MAXIMO DOROTEO GALVEZ (RUC: 10420105911)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (114, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JOSE ANTONIO CONTRERAS LEON (RUC: 10401118816)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (118, '2026-01-01', 90.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: IMPORT & EXPORT GRUPO MILENIUM S.A.C. (RUC: 20602461841)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (120, '2026-01-01', 45.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: IMPORT & EXPORT GRUPO MILENIUM S.A.C. (RUC: 20602461841)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (121, '2026-01-01', 45.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: IMPORT & EXPORT GRUPO MILENIUM S.A.C. (RUC: 20602461841)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (122, '2026-01-01', 45.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: RIGOBERTO ANIBERTO PEINADO CHUCOS (RUC: 10069319012)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (132, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PHARVET CORPORATION G & M E.I.R.L. (RUC: 20606909749)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (134, '2026-01-01', 80.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: JESSICA DEISSY CARHUAY BARZOLA (RUC: 10403501072)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (136, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JESSICA DEISSY CARHUAY BARZOLA (RUC: 10403501072)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (137, '2026-01-01', 50.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: DORIS HAYDEE MONSALVE RAMIREZ (RUC: 10441897974)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (143, '2026-01-01', 90.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: BONZANO SALAZAR GADDY JACQUELINE (RUC: 10258420514)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (145, '2026-01-01', 60.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: INVERSIONES PEPA SAC (RUC: 20607972819)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (149, '2026-01-01', 70.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: TEJADA ALEGRE JORGE ENRRIQUE (RUC: 10416604148)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (151, '2026-01-01', 70.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: DENISS VANESSA CUBA CASTILLO (RUC: 10406765038)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (161, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GRUPO JSP E.I.R.L. (RUC: 20604284997)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (163, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICA VETERINARIA ARZ E.I.R.L (RUC: 20606214104)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (165, '2026-01-01', 80.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: Soto ghiggo joseph (RUC: 10464839122)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (173, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LILIANA LIDA GUTIERREZ RAYMONDI (RUC: 10103905104)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (180, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CALZADILLA HUDSON YESLANY MARENY (RUC: 15604792085)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (184, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VIDALON ROMO LUZ MARISELA (RUC: 10452066829)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (186, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CCOLCCA MITMA FELY JUANA (RUC: 10428294063)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (188, '2026-01-01', 100.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GRUPO GENTIL E.I.R.L. (RUC: 20566121141)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (190, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DEL PINO MENDOZA ERNESTO HUMBERTO (RUC: 10256547088)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (191, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SERVICIOS MEDICOS PAMAEH S.A.C. (RUC: 20562783467)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (195, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DIANA CAROLINA AGUIRRE RIVERA (RUC: 10450868294)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (197, '2026-01-01', 50.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: HUAMAN RODRIGUEZ RUBEN DARIO (RUC: 10257173467)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (200, '2026-01-01', 60.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: CORPORACION CLASAM EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA (RUC: 20602481116)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (204, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VIDA SALUD OCUPACIONAL S.A.C. (RUC: 20607179370)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (206, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DE ORTODONCIA, ESTETICA E IMPLANTOLOGIA DENTAL DENTISONRISAS E.I.R.L. (RUC: 20606769670)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (209, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MULTIMASCOTAS SOCIEDAD ANONIMA CERRADA (RUC: 20608822756)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (213, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Juan Jose Vasquez Suarez (RUC: 10450788606)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (219, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: IVAN GUEVARA ROCA (RUC: 10106298446)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (221, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JOB MANUEL ALBERCA ROMERO (RUC: 10444370772)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (225, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Enrique Millones Davila (RUC: 10099663672)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (227, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: White Smile Odontología Especializada E.I.R.L (RUC: 20607227668)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (233, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Centro Odontológico Biomedix sac (RUC: 15603654975)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (239, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CRUZ AGURTO JORGE EDUARDO (RUC: 10707368387)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (240, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CONSULTORIO DENTAL JHON DENT EIRL (RUC: 20600600967)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (242, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: INVERSIONES SIMPET S.A.C. (RUC: 20610344489)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (250, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICA DENTAL KUSI DENT E.I.R.L (RUC: 20537043360)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (254, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JESSICA  CARTAGENA MEZA (RUC: 10776604262)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (264, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Sofia marivel hidalgo cruz (RUC: 10097480465)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (276, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SALUD POR ESPECIALISTAS MEDINA E.I.R.L. (RUC: 20603065043)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (281, '2026-01-01', 118.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: Dental Rehabilitación Integral Estética EIRL (RUC: 20547160101)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (283, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Tu clínica veterinaria Dr. Bernardo A E.I.R.L. (RUC: 20606075406)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (285, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Haydee Yovana Pato Sáenz (RUC: 10400036166)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (287, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Consultorio Dental CV SAC (RUC: 20604938750)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (289, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: AGVET S.A.C. (RUC: 20608086596)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (291, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Rodriguez Ibarra Alondra (RUC: 10754057195)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (293, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Sociedad teomil sac (RUC: 20609789582)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (295, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VL ODONTOLOGOS ASOCIADOS S.A.C. (RUC: 20610621491)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (299, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ECHEVARRIA ANGULO MARIA (RUC: 10098349591)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (301, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MENDIZABAL ARIZMENDI ARMANDO (RUC: 10085138974)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (303, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JUAN ANGEL PAUCAR ESTRELLA (RUC: 10747358724)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (307, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CONSULTORIOS ESPECIALIZADOS SERFLO E.I.R.L. (RUC: 20609872480)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (315, '2026-01-01', 120.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SERVICIOS VETERINARIOS ESPECIALIZADOS SAC (RUC: 20551542280)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (319, '2026-01-01', 59.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: CORPORACION QUIRURGICA ONCOLOGIA SAC (RUC: 20521587459)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (332, '2026-01-01', 100.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: SERVIC. MEDICOS BAZAN BLAS Y ASOC. S.R.L (RUC: 20104932267)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (337, '2026-01-01', 200.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: Dayana Miluska Monroy Murga (RUC: 10712265685)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (339, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Marybel Mixán VARGAS (RUC: 10098960304)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (356, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PAREJA MALDONADO FERNANDO (RUC: 10420382745)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (357, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: HUAPAYA PARDAVE MARIA DEL CARMEN (RUC: 10466880405)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (359, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Luz Paola Yauri Bellido (RUC: 10716384590)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (362, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DE CONTROL Y BIENESTAR VETERINARIO CANOPOLIS S.A.C. (RUC: 20608320289)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (364, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GRIMALDO PAREDES YOHANNA LESLIE (RUC: 10466030517)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (371, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JIMÉNEZ GALLET GABY ANDREA (RUC: 10484091060)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (381, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CABRERA JAYO KRISTEL ESTEFANI (RUC: 10463058755)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (389, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DESPOSORIO MOSQUERA ROXANA MILAGROS (RUC: 10772791351)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (391, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SARAVIA HERNANDEZ LUVIA VICTORIA (RUC: 10400033701)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (393, '2026-01-01', 94.4, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JULCA LOPEZ AMARILIS FABIOLA (RUC: 10484085574)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (395, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: HIDALGO CRUZ, SOFIA MARIVEL (RUC: 10097480465)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (277, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DE CIRUGÍAS, DIAGNÓSTICO, FARMACIA Y DESARROLLO PROFESIONAL VETERINARIO LOPEZ Y QUISPE S.A.C. (RUC: 20610943846)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (399, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GIANINNA BERNICE BATTILANA SUSANIBAR (RUC: 10619754901)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (402, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CUBAS LEON JUANITA CLARISA (RUC: 10102170526)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (408, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CONSULTORIO ODONTOLOGICO MATISDENT SAC (RUC: 20601731496)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (420, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CALDASMEDINA S.A.C. (RUC: 20606251255)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (423, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ALFREDO VÁSQUEZ ANGELES (RUC: 10461411296)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (425, '2026-01-01', 98.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: BETZABE PAOLA CANALES SANCHEZ (RUC: 10402387136)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (427, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LMARVET S.A.C. (RUC: 20552217587)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (432, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JAVE YUPANQUI ERICK JAVIER (RUC: 10461718987)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (438, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ACUVET S.R.L. (RUC: 20611769874)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (440, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PATITAS CON ESPERANZA CLINICA VETERINARIA E.I.R.L. (RUC: 20606471221)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (442, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SONRISAS SERVICIOS DENTALES S.A.C. (RUC: 20605669591)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (446, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: BOCANEGRA SUELDO KATHERINE FRANCESCA (RUC: 10447428976)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (448, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ARONI ALLCCA KARINA MARLENI (RUC: 10748936535)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (452, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SILVA TUMBA JORDAN (RUC: 10709810834)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (457, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MARIA ELENA MATUTE MIKULAK (RUC: 10256110119)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (478, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ALVAREZ DELGADO KARLA NICOLE (RUC: 10724810719)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (487, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CASAS ROGRIGUEZ EULOGIO (RUC: 10092486490)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (511, '2026-01-01', 70.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: Centro de servicios profesionales torres E.I.R.L (RUC: 20606868686)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (513, '2026-01-01', 80.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: COLITA FELIZ S.A.C. (RUC: 20545895499)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (519, '2026-01-01', 60.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: DIAZ CACERES MANUEL ENRIQUE (RUC: 15106973102)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (528, '2026-01-01', 50.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: FLORES PANDURO ANGELICA LOURDES (RUC: 10438875102)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (532, '2026-01-01', 70.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: JIMME TEOFILO TERRONES QUISPE (RUC: 10434944410)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (541, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JURADO TORREJON DE BARRENECHEA CARMEN (RUC: 10106122283)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (544, '2026-01-01', 90.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: P.Y. SERVET E.I.R.L. (RUC: 20609144310)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (556, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DENTAL ESTHETIC 042 SOCIEDAD ANONIMA CERRADA (RUC: 20608589563)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (557, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ROKASD DISTRIBUICIONES EIRL (RUC: 20546303790)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (559, '2026-01-01', 98.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: CIMEVET S.A.C. (RUC: 20609984474)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (563, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: INTEGRA SALUD PERU S.A.C. (RUC: 20602966918)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (574, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: TRUJILLO MENDOZA LUIS ARNALDO (RUC: 10733657885)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (577, '2026-01-01', 50.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: PAZ ESPINOZA JORGE MARTIN (RUC: 10412455644)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (580, '2026-01-01', 80.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: VICTORIA ROSA SANTOME MALPARTIDA (RUC: 10065931511)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (582, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VON ALCIDES GARCIA MERCADO (RUC: 10074678667)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (587, '2026-01-01', 70.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: Luis Bermudez Barrera (RUC: 10061259789)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (597, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MALDONADO MARTEL RICARDO ANTONIO (RUC: 10005083317)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (35, '2026-01-01', 94.4, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MARICELA DEL CARMEN MEDINA QUISPE (RUC: 10704356728)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (603, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: HELP PETS HOSPITAL & LAB S.A.C (RUC: 20608896962)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (609, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GROOMANDVET S.A.C. (RUC: 20609764792)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (611, '2026-01-01', 98.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: HUARCAYA TACAS HILDA CAROLINE (RUC: 10703465094)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (617, '2026-01-01', 90.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: VASQUEZ ARROYO ANGELO JESUS (RUC: 10096073408)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (623, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: RAUL MONTERO CAJAVILCA (RUC: 10104514991)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (640, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: APU SALUD MEDICOS A DOMICILIO SAC (RUC: 20602375383)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (657, '2026-01-01', 250.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: BETO VETERINARIA S.A.C. (RUC: 20608015559)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (672, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: TORRES AGUIRRE JORGE LUIS (RUC: 10225147081)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (681, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PINEDA LLANOS CARLA ANABEL (RUC: 10436358186)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (689, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Operadora Dental FEL MAR E.I.R.L. (RUC: 20562647792)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (695, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DE ESPECIALIDADES MEDICO QUIRURGICAS VETERINARIAS (RUC: 20605095012)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (697, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICA VETERINARIA D´MASKOTAS S.A.C. (RUC: 20605942742)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (699, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICA VETERINARIA D´MASKOTAS S.A.C. (RUC: 20605942742)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (700, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICA VETERINARIA D´MASKOTAS S.A.C. (RUC: 20605942742)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (701, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DOMINGUEZ RUIZ YAMYR (RUC: 10466750153)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (714, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO ORAL LASER SAC (RUC: 20502423747)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (716, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MARIA PIA RIOS TELLO (RUC: 10441163164)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (722, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: AR21 Dent Sac. (RUC: 20608295535)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (724, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CONSULTORIO DENTAL JHON DENT E.I.R.L. (RUC: 20600600967)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (243, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICAS DENTALES G&C DR. GAMARRA EIRL (RUC: 20605486879)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (735, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ROBERT PABLO TOHALINO (RUC: 10443966361)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (741, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CUIDADOS VETERINARIOS G & M S.A.C. (RUC: 20608239406)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (537, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Mirella Cruz Salas (RUC: 10407657549)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (768, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ARMAS LAMA RONAL DANTE (RUC: 10257291699)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (770, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DENTRIX PERU SAC (RUC: 20607492728)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (774, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: F45 E.I.R.L. (RUC: 20525005161)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (778, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JOHN MANUEL ENEQUE MANDUJANO (RUC: 10730030474)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (780, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: REPRESENTACIONES VETERINARIAS EL DORADO S.A.C.. (RUC: 20604600597)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (784, '2026-01-01', 57.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: NORMA VIRGINIA  OJEDA RAMIREZ (RUC: 10409026091)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (794, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ESCOBAR HUAMAN JHOSELIN KATERIN (RUC: 10704385973)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (804, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Vanessa Juliana Tataje Ramos (RUC: 10421950054)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (805, '2026-01-01', 170.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: María Betzabe Acuña cusma (RUC: 10272822072)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (825, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO MEDICO POLONIA S.A.C. (RUC: 20608548409)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (829, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: INVERSIONES VETERINARIAS MONTANA (RUC: 20553435511)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (850, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: POLICLINICO SANTA ANITA E.I.R.L. (RUC: 20293436321)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (852, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Servicios Odontomed FB SAC (RUC: 20607929727)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (856, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: HUERTAS RAMOS ANGELA ASTRID (RUC: 15525051606)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (858, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JORGE LUIS SONCCO CHULLUNQUIA (RUC: 10411013915)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (862, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: FLORES CARBAJAL LENIN WALTER (RUC: 10459123500)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (868, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LIMAVET CENTER E.I.R.L. (RUC: 20605799125)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (893, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C. (RUC: 20609381834)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (901, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICA VETERINARIA HINOSTROZA S.A.C. (RUC: 20610196111)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (906, '2026-01-01', 98.0, 'por_servicio', 'bimestral', 1);
-- Updating contract for: EMPRESA MUNICIPAL DE CHORRILLOS S.A (RUC: 20556621188)
-- Excel: S/ 130.0 / quincenal | DB: S/ 160.0 / quincenal
UPDATE `ContratoServicio` SET `tarifa` = 130.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'quincenal' WHERE `id_contrato` = 908;
-- Creating new active contract for: LUZGAR E.I.R.L (RUC: 20524055482)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (914, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Sonríe Clínicas Dentales Sac (RUC: 20518544111)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (916, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LOVERA FRANCO MARITZA BEATRIZ (RUC: 10214587900)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (921, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Dolly Cárdenas martinez (RUC: 10081521145)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (929, '2026-01-01', 118.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Mónica Berrocal Tello (RUC: 10454194042)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (931, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MARIA PATRICIA MORENO LA ROSA (RUC: 10257562595)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (947, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: NANCY GIOVANA LLANO BUITRON (RUC: 10096903001)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (949, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GENOBEVA MARIÑO FIERRO (RUC: 10731492447)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (954, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ORTIZ POLO ANIBAL RAFAEL (RUC: 10105317943)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (958, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PATRICIA ALONDRA CORDOVA VILCA (RUC: 10463642023)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (963, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PAURINOTTO LLOSA CESAR DANIEL (RUC: 10436330214)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (965, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: IDENTICAL PRODUCTOS Y SERVICIOS ODONTOLOGICOS S.A.C. (RUC: 20563077531)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (987, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Reyes Zelayarán Joan Manuel (RUC: 10453972891)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (999, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Sandra Mariel Armas Reynoso (RUC: 10421382099)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1015, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIAS S.A.C. (RUC: 20604685126)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1022, '2026-01-01', 57.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIAS S.A.C. (RUC: 20604685126)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1023, '2026-01-01', 57.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SMILE PLUS S.A.C. (RUC: 20602476465)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1047, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SIMEL NEGOCIACIONES E.I.R.L. (RUC: 20600117964)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1051, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SMILE PLUS S.A.C. (RUC: 20602476465)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1048, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LUZMILA TECSE CCORIHUAMAN (RUC: 10436438929)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1054, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SOLUCIONES INTEGRALES MAS SALUD S. A. C. (RUC: 20602300651)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1056, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Rosa Esther Fajardo Sotelo (RUC: 10218808820)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1060, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: EMPRESA MUNICIPAL DE CHORRILLOS S.A.. (RUC: 20556621188)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (909, '2026-01-01', 450.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: U.E. 404 HOSPITAL SAN JUAN DE DIOS (RUC: 20452578949)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1062, '2026-01-01', 170.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Peña Huamani Yanet ysela (RUC: 10424580291)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1080, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: FANNY ZARELA NIETO VELAOCHAGA (RUC: 10332617155)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1092, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: QUEZADA HUERTA GROUP SAC (RUC: 20610904859)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1097, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Maribel Jacqueline Vila Guillén (RUC: 10407976911)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1103, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SHADOW PET EIRL (RUC: 20601713480)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1105, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: SANITAS CORPUS EIRL (RUC: 20549009884)
-- Excel: S/ 380.0 / eventual | DB: S/ 380.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 380.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 1110;
-- Creating new active contract for: WAWA Y SUS PATAS SAC (RUC: 20557563688)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1112, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: HEMOVET S.R.L. (RUC: 20605394524)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1120, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: YPANAQUE GODOY KIARA DALIA (RUC: 10470714561)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1121, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VETERINARIA NORTH SAC (RUC: 20606899298)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1115, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ZELADA SANCHEZ YURI ANITA (RUC: 10448337265)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1123, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SANTILLANA ORMAECHE MANUEL GINO (RUC: 10433259241)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1129, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO ODONTOLOGICO MIA SONRISA Y ESPECIALIDADES EIRL (RUC: 20607125920)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1138, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Corporativo Veterinario SAC (RUC: 20546435432)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1149, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GOLD TOOTH ESTETICA DENTAL E.I.R.L. (RUC: 20609578506)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1154, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO MEDICO DE APOYO LOS ANGELES SRL (RUC: 20607248380)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1160, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CABEZAS YANQUI CINTHIA DEL ROSARIO SOLEDAD (RUC: 10459111820)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1184, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MARLENY LIZ ARIAS VICUNA (RUC: 10096471136)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1196, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Inversiones e Innovaciones Veterinarias Ferrel SAC (RUC: 20612643734)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1202, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: jessica mendoza llanos (RUC: 10412455288)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1206, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GRUPO VETERINARIO LIFECAN SAC (RUC: 20606878142)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1210, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: MAPEVAS SOCIEDAD ANONIMA CERRADA - MAPEVAS S.A.C. (RUC: 20602841899)
-- Excel: S/ 118.0 / semanal | DB: S/ 80.0 / semanal
UPDATE `ContratoServicio` SET `tarifa` = 118.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'semanal' WHERE `id_contrato` = 1135;
-- Creating new active contract for: LOPEZ MENDOZA CYNTHIA MARISOL (RUC: 10416346211)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1242, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LIDIA CARMEN PEREZ ROJAS (RUC: 10200871362)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1247, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VETERINARIA CAROZZI VET EIRL (RUC: 20604724750)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1261, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SANTANA RIBEIRO DE OLIVEIRA MARCELO (RUC: 15510523234)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1280, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GR REPRESENTACION VETERINARIA EIRL (RUC: 20611832801)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1286, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTURY PET VETERINARIA E.I.R.L (RUC: 20608544675)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1288, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Javier Farias Verá (RUC: 10420437051)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1292, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: ERNESTO EUDALDO SAAVEDRA MEZONES (RUC: 10067484083)
-- Excel: S/ 65.0 / mensual | DB: S/ 60.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 65.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 1294;
-- Creating new active contract for: Jiska vie SAC (RUC: 20566371848)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1296, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: FERNANDEZ MEGO WILLAM (RUC: 10422189853)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1301, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: POLICLINICO INSTANT MEDIC S.A.C. (RUC: 20606772751)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1316, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Health &Food Pets S.A.C (RUC: 20613158988)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1325, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Health &Food Pets S.A.C (RUC: 20613158988)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1325, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: KARINA OLINDA CABELLO ROJAS (RUC: 10100917209)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1329, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO ODONTOLOGICO LOS OLIVOS S R LTDA (RUC: 20101547826)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1344, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Alicia Lizbeth López Baltazar (RUC: 10762786741)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1350, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ANGGELA VANESSA BOHORQUEZ GALLEGOS (RUC: 10709026637)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1352, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MORALES BARRANTES CARLA ALEJANDRA (RUC: 10434329324)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1372, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CITY VET S.A.C. (RUC: 20602321496)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1382, '2026-01-01', 120.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ODONTOLOGIA INTEGRAL Y ESTETICA S.A.C (RUC: 20300656383)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1384, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GONZALES ANTUNEZ SUSAN ALEJANDRA (RUC: 10465201971)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1386, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: PROSEVAR S.A.C. (RUC: 20428962177)
-- Excel: S/ 70.0 / eventual | DB: S/ 70.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 70.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 1390;
-- Creating new active contract for: INVERSIONES OSVA S.A.C. (RUC: 20607850641)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1398, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Mirian Milagros Huallpa Lujan (RUC: 10466866917)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1405, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ELAM SALUD SAC (RUC: 20610311891)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1407, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Lizbeth Vanessa Calle Laya (RUC: 10752751965)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1409, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SONCO PONGO JUAN CARLOS (RUC: 10460699644)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1411, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: COMPLEJO ODONTOLOGICO DENTILIFE S.A.C (RUC: 20609766965)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1413, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MERCADO VEGA DEYSI MERCEDES (RUC: 10462088707)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1418, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Maria Guisela Silva Olivera (RUC: 10401934869)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1424, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Juan José Lazarte Gómez (RUC: 10088916676)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1426, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Maria Guisela Silva Olivera (RUC: 20554283447)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1438, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Bazan Varas Maruja Consuelo > (RUC: 10086821686)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1456, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CONSULTORIOS ESPECIALIZADOS SERFLO E.I.R.L. (RUC: 20609872480)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (316, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: EL HURON AZUL EIRL (RUC: 20545766842)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1040, '2026-01-01', 57.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ESTEFANIA NEYRA ROJAS SOTO (RUC: 10468546065)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1469, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LINCE CENTRO DE REHABILITACION DENTAL SAC (RUC: 20609376393)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1478, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: KAREN YVONNE MELLAREZ ALIAGA (RUC: 10724402777)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1484, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO ODONTOLOGICO DR. CAVERO S.A.C. (RUC: 20605402691)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1495, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Odontobren EIRL (RUC: 20538184129)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1497, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: FLORES CARBAJAL LENIN WALTER (RUC: 10459123500)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (869, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: QUISPE ALATA DE EGUIA NATALIA LUCIA (RUC: 10083166211)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1499, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Edward Luis Palomino Nieves (RUC: 10461198606)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1503, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Katherine Zavaleta Salinas (RUC: 10740273171)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1505, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CABANILLAS ZAFRA JUDITH ESMERALDA (RUC: 10471448716)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1514, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ONCOVET COMAS EIRL (RUC: 20611805498)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1519, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: FÉLIX ARTEMIO CUSTODIO AULLA (RUC: 10451599831)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1526, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LUISA ELENA CORDOVA HERRERA (RUC: 10440718499)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1528, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VETERINARIA SIEMPRE AMIGOS E.I.R.L. (RUC: 20605334181)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1529, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ODONTO SATO EIRL (RUC: 20610735992)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1535, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: POLICLINICO ALTAGRACIA E.I.R.L. (RUC: 20607669041)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1537, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: FIGUEROA MORON GONZALO DANIEL (RUC: 10444956157)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1550, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Karen Katherine Hernández Caba (RUC: 10467128171)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1174, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: RIVERA CHIPANA ANGELICA MARIA (RUC: 10075082971)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1559, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: POLICLINICO DON BOSCO S.A.C. (RUC: 20609097745)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1568, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Estética dental Dra. Nardy Ruck S.A.C. (RUC: 20609820340)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1576, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: IMPORTACIONES MENDOZA PAREDES S.A.C. (RUC: 20604206716)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1578, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GONZALEZ MOSCOSO SERVICIOS MEDICOS SAC (RUC: 20548849820)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1587, '2026-01-01', 200.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JOHN ULISES ALIAGA PARIONA (RUC: 10461591146)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1590, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Inversiones Medelac S:A:C. (RUC: 20606783346)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1592, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Alfredo Alexander Medina Nakahodo (RUC: 10405157697)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1596, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Eloy Burga Noriega (RUC: 10102731048)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1602, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: IMAGEN DENTAL CENTER E.I.R.L. (RUC: 20604816352)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1606, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Centro Médico Juan XXIII SAC (RUC: 20117252281)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1611, '2026-01-01', 500.0, 'por_servicio', 'eventual', 1);
-- Creating new active contract for: Policlinico Santa Teresa Jesús SAC (RUC: 20613302744)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1613, '2026-01-01', 440.0, 'por_servicio', 'eventual', 1);
-- Creating new active contract for: Miriam Galván Calle (RUC: 10411624621)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1620, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLÍNICA DENTAL IMAGE EIRL (RUC: 20549056459)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1622, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: BELDAD DENTAL CARE E.I.R.L. (RUC: 20610350578)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1627, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Smile Desing Odontología integral (RUC: 20610542370)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1629, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: C & F SALUD S.A.C. (RUC: 20600980875)
-- Excel: S/ 80.0 / mensual | DB: S/ 80.0 / quincenal
UPDATE `ContratoServicio` SET `tarifa` = 80.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 1107;
-- Creating new active contract for: LYA DENT S.A.C. (RUC: 20609898331)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1647, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Productos bionatura del Perú EIRL (RUC: 20607316016)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1653, '2026-01-01', 118.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SERVICIOS FLORES & FONSECA S.R.L. (RUC: 20610534822)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1655, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DE ORTODONCIA Y REHABILITACION ESPECIALIZADA S.A.C. (RUC: 20606350610)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1657, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Clínica dental el Remanso Sac (RUC: 20545628377)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1659, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: HUARHUACHI YSLACHIN LIDIA (RUC: 10314900036)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1667, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: OSCAR SIDNEY SALDAÑA BUSTAMANTE (RUC: 10072599336)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1679, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Livia Teresa Rivas Ortega (RUC: 15604316763)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1681, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SILVA ROJAS MARIO ALBERTO (RUC: 10095761190)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1687, '2026-01-01', 165.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: M&S DENTAL ATELIER SOCIEDAD ANÓNIMA CERRADA - M&S DENTAL ATELIER S.A.C. (RUC: 20600375335)
-- Excel: S/ 65.0 / mensual | DB: S/ 55.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 65.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 1689;
-- Creating new active contract for: INVESTMENTS SAN FRANCISCO DE ASIS SOCIEDAD ANONIMA CERRADA (RUC: 20609545080)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1691, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: BERNAL MUNAILLA BRIGITTE (RUC: 10454432962)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1697, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: TIERRA ANIMAL SOCIEDAD ANONIMA CERRADA (RUC: 20607610151)
-- Excel: S/ 55.0 / eventual | DB: S/ 55.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 55.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 1700;
-- Creating new active contract for: ONCOVET E.I.R.L. (RUC: 20609771594)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1564, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ANDERSON DE LA CRUZ CARBAJAL (RUC: 10449111481)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1728, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LUNA HUANCA IGNACIO (RUC: 10062648495)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1730, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: francis Kelvin Ramos Lara (RUC: 10408605658)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1732, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: oral revealed sac (RUC: 20602558291)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1738, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Cinthia Paucca Montoya (RUC: 10445612664)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1743, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: AGROINDUSTRIAS CALLPA SAC (RUC: 20522222144)
-- Excel: S/ 1500.0 / eventual | DB: S/ 1500.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 1500.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 1745;
-- Creating new active contract for: A.R. VET-LAB BIOPACIFIC Y ASOCIADOS SAC (RUC: 20600005163)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1747, '2026-01-01', 180.0, 'por_servicio', 'semanal', 1);
-- Creating new active contract for: SANCHEZ SALAZAR MARIA MAGALY (RUC: 10103629867)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1750, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Hubert Vega Toledo (RUC: 10095384795)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1770, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: B&C PRODUCTOS Y SERVICIOS SAC (RUC: 20606719583)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1777, '2026-01-01', 98.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: MI SALUD-BC CONSULTORIO'S - ASOCIADOS S.A.C (RUC: 20608296965)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1782, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Marilia Vidal Villar (RUC: 10448033177)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1785, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Grupo veterinario las viñas sac (RUC: 20549914951)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1792, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SILVA MATIAS PAMELA ZULEMA (RUC: 10445882424)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1802, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GIL SANCHEZ E.I.R.L. (RUC: 20609747995)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1804, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICA GLOBAL EIRL (RUC: 20600503511)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1806, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ESPECIALIDADES ODONTOLOGICAS QUIROZ E.I.R.L (RUC: 20548125821)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1812, '2026-01-01', 50.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: LESGA MEDIC SAC (RUC: 20606552085)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1814, '2026-01-01', 50.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: ZETA GROUP SRL (RUC: 20600240430)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1819, '2026-01-01', 55.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: Leslie Villanueva García (RUC: 10463215931)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1821, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VETERINARIA PET WOLF E.I.R.L. (RUC: 20609511975)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1828, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: NEUROSOFT PERU S.A.C. (RUC: 20569012563)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1830, '2026-01-01', 90.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: Centro Shama Niños de la Calle (RUC: 20456378758)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1839, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: BUSINESS AND INNOVATIONS A&P S.A.C. - BIAP S.A.C. (RUC: 20574644616)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1843, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: COAR CONSULTORIO ODONTOLOGICO ARIAS E.I.R.L. (RUC: 20602807135)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1845, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LAREDO TANTAVILCA EVELYN NOEMI (RUC: 10423272681)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1847, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ESCOBAR CHOLAN JULISSA LIZETH (RUC: 10759000787)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1851, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: ONCOLOGIA S.A.C. (RUC: 20428674201)
-- Excel: S/ 500.0 / eventual | DB: S/ 500.0 / semanal
UPDATE `ContratoServicio` SET `tarifa` = 500.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 1858;
-- Creating new active contract for: RUBIO ODONTOLOGIA Y MEDICINA ESTETICA S.A.C. (RUC: 20600423682)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1868, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LEDESMA CORZO LUCIA KARINA (RUC: 10428267970)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1870, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Asiri Dental Medic S.A.C (RUC: 20611382708)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1874, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VARA MARQUEZ MARINO DANTE (RUC: 10225032497)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1885, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: bezas (RUC: 20607005428)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1887, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ELENA COTRINA LLANOS (RUC: 10423970672)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1893, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: CLINICA HERNANI S.A.C (RUC: 20608647709)
-- Excel: S/ 7.0 / eventual | DB: S/ 7.0 / quincenal
UPDATE `ContratoServicio` SET `tarifa` = 7.0, `tipo_tarifa` = 'por_kg', `frecuencia` = 'eventual' WHERE `id_contrato` = 1901;
-- Creating new active contract for: URRUNAGA VELASQUEZ CRISTIAN PAUL (RUC: 10420741206)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1907, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: EGOAVIL LA ROSA RAYMUNDO GUILLERMO (RUC: 10103447513)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1911, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LOPCAN EIRL (RUC: 20607737348)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1917, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MINISTERIO DE DEFENSA Ejército Peruano UO 0770 (RUC: 20131369124)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1935, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Gerardo Daniel Pazos Falcón (RUC: 10412967947)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1942, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Luis Hiroshi Nakandakare Santana (RUC: 10414795663)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1944, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ELIZABETH LOPEZ OCHOA (RUC: 10704310019)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1953, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: RISUS DENTAL E.I.R.L (RUC: 20613212893)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1955, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: AO PETS SAC (RUC: 20606955104)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1963, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: TRIGOSO VERGARAY HANS (RUC: 10437722850)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1971, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DE LA ROCA AGUIRRE ELIANA MARGOT (RUC: 10467390584)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1985, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DENTAL DRA OBREGÓN SAC (RUC: 20608275895)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1998, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DE ESPECIALIDADES VETERINARIAS SAC (RUC: 20548431353)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2003, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: INSTITUTO ESPECIALIZADO EN SERVICIO DE SALUD SAC (RUC: 20600385411)
-- Excel: S/ 150.0 / eventual | DB: S/ 150.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 150.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 2005;
-- Creating new active contract for: ARAUJO ROBLES JORGE LUIS (RUC: 15255471101)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2014, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Alvarado & Fuchs S.A.C (RUC: 20608073184)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2033, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CURI NAVARRO ANA MARIA (RUC: 10102458627)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2051, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Sofía Esther Solis Villanueva (RUC: 10062316689)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2055, '2026-01-01', 90.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: IDENTICAL PRODUCTOS Y SERVICIOS ODONTOLOGICOS S.A.C. (RUC: 20563077531)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (988, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MULTI MASCOT E.I.R.L. (RUC: 20546923151)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2075, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CHELIMEDIC SAC (RUC: 20609944626)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2078, '2026-01-01', 118.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MULTISERVICIOS DE SALUD CHR S.A.C. (RUC: 20546143733)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1644, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: EMPRESA MUNICIPAL DE CHORRILLOS S.A. (RUC: 20556621188)
-- Excel: S/ 187.5 / interdiario | DB: S/ 187.5 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 187.5, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'interdiario' WHERE `id_contrato` = 910;
-- Creating new active contract for: DE LA FLOR SOTO EDGAR (RUC: 10255729492)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2089, '2026-01-01', 98.0, 'por_servicio', 'bimestral', 1);
-- Updating contract for: EMPRESA MUNICIPAL DE CHORRILLOS S.A (RUC: 20556621188)
-- Excel: S/ 400.0 / semanal | DB: S/ 187.5 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 400.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'semanal' WHERE `id_contrato` = 910;
-- Creating new active contract for: ARMONIZACION FACIAL PERU SAC (RUC: 20611032359)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2111, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Idental Design Peru Sac (RUC: 20609819414)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2122, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: primo (RUC: 10215207876)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2124, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Bellido Martinez Edwin Arturo (RUC: 10485461855)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2132, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SMILE DESIGN PRO CLINICA DENTAL S.A.C. (RUC: 20611541113)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2139, '2026-01-01', 90.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: GAMARRA MADUEÑO LENIN PAUL (RUC: 10103151509)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2150, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Optimal dent esthetic implant center sac (RUC: 20611954957)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2157, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: C & G MASCOTAS SAC (RUC: 20601177511)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2165, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Lucero Díaz Alcántara (RUC: 10734164998)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2169, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: AVILA VELARDE MYRIAM MERCEDES (RUC: 10078664687)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2174, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LOZA AYBAR YULY KATHERINE (RUC: 10705649796)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2181, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MACCHA MAYTA LESSLY STEFANY (RUC: 10730876748)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2185, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ZELAYA CASTRO PIO FAVIO (RUC: 10093847836)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2187, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CAYCHO DANZ ANDRES EDUARDO (RUC: 10103291262)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2189, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SERMED SERVICIOS INTEGRALES EN MEDICINA ESPECIALIZADA S.A.C. (RUC: 20554010556)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2196, '2026-01-01', 150.0, 'por_servicio', 'eventual', 1);
-- Creating new active contract for: MAMANI CURAZI BELDEN IVAN (RUC: 10414294958)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2198, '2026-01-01', 90.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: BOHORQUEZ DE LA CRUZ MANUEL GUSTAVO (RUC: 10218633833)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2200, '2026-01-01', 70.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: CASIMIRO MALCA JESSICA NIEVES (RUC: 10098322596)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2202, '2026-01-01', 80.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: ANGEL DE JESUS CARRILLO COLLANTES (RUC: 10462207706)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2210, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ATENCIO MEZA ZORAIDA CARMEN (RUC: 10040168279)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2212, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CAN SPA SHOP S.A.C. (RUC: 20607253111)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2219, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VILMOT INNOVACIONES ODONTOLÓGICAS EIRL (RUC: 20608475959)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2221, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLÍNICA VETERINARIA Y PET SHOP A Y R S. A. C. (RUC: 20602197078)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2227, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: DIAZ RAMIREZ JAQUEDITH DEL PILAR (RUC: 10716378565)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2232, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: EUROVET SOCIEDAD ANONIMA CERRADA (RUC: 20524866537)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2234, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GARCIA SANCHEZ CHRISTIAN SANDOR JESUS (RUC: 10448761296)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2236, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Hilda Maurenn Solis Uribe (RUC: 10106291255)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2238, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ICAZA ESCOBEDO SAC (RUC: 20606002051)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2241, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: IMPORT & EXPORT GRUPO MILENIUM S.A.C. (RUC: 20602461841)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (123, '2026-01-01', 45.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MAS CALIDAD DE VIDA SOCIEDAD ANONIMA CERRADA (RUC: 20507317589)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2258, '2026-01-01', 45.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MONICA CIEZA CALDERON (RUC: 10437841336)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2261, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: NADIA IVETTE  ESTRADA  RODRIGUEZ (RUC: 10712640087)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2263, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: NEOCORPUS CLINICA DE CIRUGIA PLASTICA INTEGRAL SAC (RUC: 20511944202)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2268, '2026-01-01', 94.4, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Bertha paullo pomahuacre de Montero (RUC: 10455507362)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2271, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PESANTES INFANTES ALDO (RUC: 10107253420)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2275, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SISTEMAS INTEGRALES DE SALUD DIAZ SAC (RUC: 20601209927)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2286, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SISTEMAS INTEGRALES DE SALUD DIAZ SAC (RUC: 20601209927)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2287, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: TIFFANY FOUNDATION S.A.C. (RUC: 20602100651)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2292, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: TOMEK ASOCIADOS SAC (RUC: 20513905719)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2294, '2026-01-01', 94.4, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Tsukamoto Espinoza Karim Belen (RUC: 10422223873)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2296, '2026-01-01', 45.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GARAYAR BURNEO ROSA JULLIANA (RUC: 10105132676)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2300, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: RENZO CAPURRO VILLARÁN (RUC: 10091537813)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2306, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MONTES ATAUCURI NATALY ASLEDY (RUC: 10427686782)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2308, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO DENTAL Y LABORATORIO CABRERA S.R.L. (RUC: 20555284200)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2312, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLÍNICA ISPHER SRLTDA (RUC: 20260124499)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2314, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GARCIA RODRIGUEZ UZIAS ABEL (RUC: 10741290800)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2316, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: HUAMAN ZARATE HENRY WALTER (RUC: 10107652634)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2320, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: AO PETS S.A.C. (RUC: 20606955104)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (1963, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ANINA BUSTOS RODRIGUEZ (RUC: 10453651211)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2331, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: inversiones y servicios veterinarios sa (RUC: 20603293312)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2335, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JUANA IRIS VELASQUEZ GOÑE (RUC: 10435440466)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2336, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Dayna Lecaros Tamayo (RUC: 10731928482)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2338, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SERVICIOS MEDICOS ODONTOLOGICOS ASESORIA E INVESTIGACION S.A.C (RUC: 20543457044)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2340, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SERVICIOS MEDICOS ODONTOLOGICOS ASESORIA E INVESTIGACION S.A.C (RUC: 20543457044)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2341, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VILLENA CHOCCE FHABIOLA FRANCHESCA (RUC: 10704447502)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2346, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: CORPORACION EMPRESARIAL SEÑOR DE LUREN SAC (RUC: 20605036512)
-- Excel: S/ 300.0 / eventual | DB: S/ 300.0 / quincenal
UPDATE `ContratoServicio` SET `tarifa` = 300.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 2350;
-- Creating new active contract for: INVERSIONES VETERINARIAS HIGUESA S.A.C. (RUC: 20610485082)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2353, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Cindy del Pilar Zapata Fuertes (RUC: 10709233209)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2356, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: SAIRITUPAC QUISPE RAQUEL (RUC: 10446454086)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2358, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PERCY ADOLFO ROBLES CARRANZA (RUC: 10472659231)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2360, '2026-01-01', 70.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Dento esthetic company sac (RUC: 20602600361)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2364, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: INVERSIONES ASTENGO-MONZON S.R.L. (RUC: 20609748363)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2366, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Matías Vet EIRL (RUC: 20557975366)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (158, '2026-01-01', 69.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MULTISERVICES ODONTOLOGICO SUAREZ E.I.R.L. (RUC: 20610710957)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2374, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: PROMOCION  PREVENCION DE SALUD EN EL TRABAJADOR S.A.C. (RUC: 20601758661)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2376, '2026-01-01', 150.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: PROMOCION  PREVENCION DE SALUD EN EL TRABAJADOR S.A.C. (RUC: 20601758661)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2377, '2026-01-01', 150.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: INTEGRAL MEDICAL CARE S.A.C. (RUC: 20607167908)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2381, '2026-01-01', 65.0, 'por_servicio', 'quincenal', 1);
-- Creating new active contract for: HUAMAN NAJARRO LILY LUZ (RUC: 10454208191)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2385, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GRUPO CONSORCIO VETERINARIO S.A.C. (RUC: 20607299944)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (168, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GUERRA HUAMAN FELIX ANTONIO (RUC: 10099384510)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2397, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Emer Medic SAC (RUC: 20375646561)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2403, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: ROSE CLINIC E.I.R.L. (RUC: 20607633011)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2405, '2026-01-01', 60.0, 'por_servicio', 'bimestral', 1);
-- Creating new active contract for: SALUD XPRESS SOCIEDAD ANONIMA CERRADA (RUC: 20612344575)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2407, '2026-01-01', 120.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MARIA DE LOS ANGELES GONZALEZ RIVAS (RUC: 15602873495)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2411, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C. (RUC: 20518247761)
-- Excel: S/ 200.0 / quincenal | DB: S/ 80.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 200.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'quincenal' WHERE `id_contrato` = 2447;
-- Creating new active contract for: ADMINISTRADORA DE SERVICIOS INTEGRALES DE SALUD S.A.C. - ADSERINSA (RUC: 20555957808)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (984, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: ONCOLOGIA S.A.C. (RUC: 20428674201)
-- Excel: S/ 4.49 / interdiario | DB: S/ 4.49 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 4.49, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'interdiario' WHERE `id_contrato` = 1859;
-- Updating contract for: UCIVET SAC (RUC: 20601498902)
-- Excel: S/ 80.0 / eventual | DB: S/ 300.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 80.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 2493;
-- Creating new active contract for: CENTRO ODONTOLOGICO HAPPYS DENT E.I.R.L. (RUC: 20545918961)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2499, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: GISELLE KARIN ARROYO TOVAR (RUC: 10075006824)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2507, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CURI GONZALES JOSE SANTOS (RUC: 10415753336)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2551, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: R&M INVERSIONES VETERINARIAS E.I.R.L. (RUC: 20608225774)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2564, '2026-01-01', 50.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Eduardo Rafael Pérez Solano (RUC: 10096725448)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2584, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Negocios Multiples D&P S.A.C. (RUC: 20612941204)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2598, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: RENGIFO SANGAMA KATHERIN DELFINA (RUC: 10460049216)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2641, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: MARQUEZ CUARESMA MARINETH MARINITHA (RUC: 10460411772)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2683, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: FUCHS CENTRO ODONTOLOGICO S.A.C (RUC: 20613440128)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2699, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CENTRO ODONTOLÓGICO VERODENT E.I.R.L (RUC: 20602320279)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2707, '2026-01-01', 55.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Melissa Fiorella Becerra Trujillo (RUC: 10471418299)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2709, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VENSALUD 24 SAC (RUC: 20613739191)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2720, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Juan Enrique Cabanillas zafra (RUC: 10420758613)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2722, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: Juan Enrique Cabanillas zafra (RUC: 10420758613)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2723, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: JOAMEDIC E.I.R.L. (RUC: 20608977385)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2753, '2026-01-01', 90.0, 'por_servicio', 'quincenal', 1);
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2791;
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2792;
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2793;
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2794;
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2795;
-- Creating new active contract for: SILVERIO NOVATO SIERRA SERRANO (RUC: 10060143370)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2800, '2026-01-01', 59.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2796;
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2797;
-- Updating contract for: UCAL S.A.C (RUC: 20537886618)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2804;
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2798;
-- Updating contract for: Desarrollo Educativo S.A (RUC: 20603817185)
-- Excel: S/ 30.0 / mensual | DB: S/ 65.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 30.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2799;
-- Creating new active contract for: VETERINARIA GLOBAL VET S.A.C. (RUC: 20605258701)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2805, '2026-01-01', 70.0, 'por_servicio', 'bimestral', 1);
-- Updating contract for: ONCOLOGIA S.A.C. (RUC: 20428674201)
-- Excel: S/ 800.0 / semanal | DB: S/ 4.49 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 800.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'semanal' WHERE `id_contrato` = 1859;
-- Updating contract for: Glow Inversiones SAC (RUC: 20600575733)
-- Excel: S/ 80.0 / mensual | DB: S/ 60.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 80.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2740;
-- Updating contract for: Glow Inversiones SAC (RUC: 20600575733)
-- Excel: S/ 80.0 / mensual | DB: S/ 60.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 80.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2739;
-- Updating contract for: Glow Inversiones SAC (RUC: 20600575733)
-- Excel: S/ 80.0 / mensual | DB: S/ 60.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 80.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2741;
-- Creating new active contract for: CENTRO NEUFROROLOGICO DEL SUR SAC (RUC: 20514612669)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2819, '2026-01-01', 60.0, 'por_servicio', 'interdiario', 1);
-- Updating contract for: FLORES VELASQUEZ LUIS RENATO (RUC: 10081507193)
-- Excel: S/ 65.0 / mensual | DB: S/ 55.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 65.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 1798;
-- Creating new active contract for: Centro odontologico mi dentista Kids SAC (RUC: 20600045173)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2830, '2026-01-01', 120.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: RESODUNA SAC (RUC: 20604944768)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2833, '2026-01-01', 236.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: C.M.E Y SALUD OCUPACIONAL STO. TORIBIO DE MOGROVEJO E.I.R.L. (RUC: 20534979771)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2839, '2026-01-01', 118.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: LABORATORIO FARMACEUTICO PERUANO S.R.L (RUC: 20104318321)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2843, '2026-01-01', 700.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CLINICA SEÑOR DE LUREN DE ICA SAC (RUC: 20494306043)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2848, '2026-01-01', 50.0, 'por_servicio', 'semanal', 1);
-- Creating new active contract for: NETAFIM PERU SAC (RUC: 20481450510)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2850, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: VAMOS PET SHOP SAC (RUC: 20606196114)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2853, '2026-01-01', 60.0, 'mensual_fijo', 'mensual', 1);
-- Creating new active contract for: CONSULTORIO DE ATENCION ESPECIALIZADO EN SALUD FEMENINA SALUDFEM E.I.R.L. (RUC: 20612386979)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2859, '2026-01-01', 80.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: GAMARRA HEALTHCARE CENTER SAC (RUC: 20600994302)
-- Excel: S/ 1250.0 / eventual | DB: S/ 1250.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 1250.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 2866;
-- Updating contract for: UCIVET SAC (RUC: 20601498902)
-- Excel: S/ 300.0 / quincenal | DB: S/ 300.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 300.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'quincenal' WHERE `id_contrato` = 2493;
-- Creating new active contract for: Linda Huarancca Chumbe (RUC: 10407791091)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2872, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: CORPORACION SONRISA 3D SAC (RUC: 20606610557)
-- Excel: S/ 80.0 / mensual | DB: S/ 85.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 80.0, `tipo_tarifa` = 'mensual_fijo', `frecuencia` = 'mensual' WHERE `id_contrato` = 2917;
-- Updating contract for: OFTALMO MEDICAL CENTER S.A.C. (RUC: 20607132454)
-- Excel: S/ 70.0 / quincenal | DB: S/ 80.0 / quincenal
UPDATE `ContratoServicio` SET `tarifa` = 70.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'quincenal' WHERE `id_contrato` = 1230;
-- Creating new active contract for: SILVA CAMPOS ARMANDO RAFAEL (RUC: 15603427898)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2969, '2026-01-01', 65.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: Centro Nefrologico Señor de la.Misericordia SAC (RUC: 20554908641)
-- Excel: S/ 3.5 / interdiario | DB: S/ 3.5 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 3.5, `tipo_tarifa` = 'por_kg', `frecuencia` = 'interdiario' WHERE `id_contrato` = 2988;
-- Updating contract for: DERMATOLÓGICA PERÚ E.I.R.L. (RUC: 20601483701)
-- Excel: S/ 1800.0 / eventual | DB: S/ 1800.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 1800.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 2997;
-- Creating new active contract for: MELYSALUD S.A.C (RUC: 20553512281)
INSERT INTO `ContratoServicio` (`id_sede`, `fecha_inicio`, `tarifa`, `tipo_tarifa`, `frecuencia`, `activo`) VALUES (2117, '2026-01-01', 90.0, 'mensual_fijo', 'mensual', 1);
-- Updating contract for: SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726,2728,2728-A,2730,2738,2740 AREA 1,379.26 M2. PUEBLO LIBRE (RUC: 20612164984)
-- Excel: S/ 2.5 / mensual | DB: S/ 2500.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 2.5, `tipo_tarifa` = 'por_kg', `frecuencia` = 'mensual' WHERE `id_contrato` = 3081;
-- Updating contract for: SERVICIOS ASISTENCIALES SANTA BEATRIZ SAC (RUC: 20566148006)
-- Excel: S/ 2800.0 / interdiario | DB: S/ 2800.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 2800.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'interdiario' WHERE `id_contrato` = 3133;
-- Updating contract for: W & H INVESTMENT S.A.C (RUC: 20552711603)
-- Excel: S/ 150.0 / eventual | DB: S/ 150.0 / mensual
UPDATE `ContratoServicio` SET `tarifa` = 150.0, `tipo_tarifa` = 'por_servicio', `frecuencia` = 'eventual' WHERE `id_contrato` = 3137;

COMMIT;