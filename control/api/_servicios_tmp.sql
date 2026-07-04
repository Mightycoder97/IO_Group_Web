-- ============================================================
-- IO Group — Servicios operativos Junio 2026
-- Generado: 2026-07-03
-- Total servicios: 1069
-- ============================================================
-- INSTRUCCIONES:
--   Importar en phpMyAdmin > u511863531_IOGroupBD > Importar
--   Usa INSERT IGNORE para evitar duplicados en re-ejecuciones
-- ============================================================

SET NAMES utf8mb4;
SET foreign_key_checks = 0;

-- ═══════════════════════════════════════════════════════
-- 2026-06-01 — 31 servicios
-- ═══════════════════════════════════════════════════════

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-01 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-01 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-01 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- QUALAB S.A.C | RUC: 20603175558
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(120.0, cs.tarifa),
    '[RUTA 2026-06-01 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603175558'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-01 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(1250.0, cs.tarifa),
    '[RUTA 2026-06-01 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- Arvet Sacs | RUC: 20613649213
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613649213'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- ZOOLO MASCOTAS VETERINARIAS S.A.C. | RUC: 20607760561
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607760561'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- RAMIREZ DEZA HENRY WILMAN | RUC: 10103447025
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10103447025'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- Mayorca Perez Sandro Oliver | RUC: 10076375742
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10076375742'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- LORD PETS E.I.R.L. | RUC: 20549113436
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20549113436'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- DENTAL LITTLE KIDS E.I.R.L. | RUC: 20535905780
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20535905780'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- CACERES GUTIERREZ JESUS FREDY | RUC: 10441796990
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10441796990'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- MORALES TEODORO ROSA NADIA | RUC: 10403378611
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10403378611'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- ARVET ASOCIADOS S.A.C.S. | RUC: 20613649213
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613649213'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- PALI INVERSIONES E.I.R.L. | RUC: 20554975918
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(94.4, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20554975918'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- CASTRO WHU MIRKO ALEXIS | RUC: 10103490249
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10103490249'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- ORTOGAM S.R.L. | RUC: 20472832302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20472832302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- CENTRO OFTALMOLOGICO DR. GERONIMO EIRL | RUC: 20609329298
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609329298'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- FRANQUICIAS DE INNOVACION DENTAL SAC | RUC: 20613275810
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613275810'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- TELLO CHUNGA NORMA JANNET | RUC: 10423855946
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10423855946'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- Veterinaria Elías Mendoza Cerna | RUC: 10267189442
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10267189442'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- LEON VENTOCILLA FREDDY RICARDO | RUC: 10103587692
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10103587692'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- HUANCA GARCIA BENNY DAVID | RUC: 10107979081
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10107979081'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- Desarrollo Educativo S.A | RUC: 20603817185
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(30.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603817185'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- QUEZADA HUERTA GROUP SAC | RUC: 20610904859
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-01 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610904859'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- EJERCITO PERUANO Escuela Militar de Chorrillos | RUC: 20131369124
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(20.0, cs.tarifa),
    '[RUTA 2026-06-01 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20131369124'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(25.0, cs.tarifa),
    '[RUTA 2026-06-01 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-01 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-01 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-01',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-01 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-01'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-02 — 42 servicios
-- ═══════════════════════════════════════════════════════

-- MATIAS VET E.I.R.L | RUC: 20557975366
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20557975366'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- VETERINARIA UNIDAS SJL E.I.R.L. | RUC: 20605127909
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605127909'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- JUMPA RIVERA MARCIA KRISTIE SANDY | RUC: 10708868499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10708868499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- Corporativo Veterinario SAC | RUC: 20546435432
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20546435432'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- Grupos Sanitovet SAC | RUC: 20566337402
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566337402'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- PRESTACIONES ODONTOLOGICAS FRIMAJ DENT E.I.R.L. | RUC: 20601081866
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601081866'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- ADNMEDICAL E.I.R.L. | RUC: 20603372191
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603372191'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- TELLO ROMANI YURI ROXANA | RUC: 10703453061
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10703453061'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- NARRO EGUIA BRYAN ENRIQUE | RUC: 10746602958
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10746602958'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- PRINCIPE ROMERO JORGE ARMANDO | RUC: 10801472619
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10801472619'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A. | RUC: 20608420933
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608420933'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- INVERSIONES JL TASAYCO E.I.R.L. | RUC: 20607028606
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607028606'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- MEGA MASCOTA S.A.C. | RUC: 20608308912
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608308912'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- YURIZ SALUD E.I.R.L. | RUC: 20610795201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610795201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- SALLO QUISPE CARMEN ABIGAIL | RUC: 10459779430
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10459779430'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- Desarrollo Educativo S.A | RUC: 20603817185
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(30.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603817185'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- CORPORACION EMPRESARIAL SANNA VET S.A.C. | RUC: 20609481103
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609481103'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-02 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-02 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(118.0, cs.tarifa),
    '[RUTA 2026-06-02 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- TOCON VALDIVIEZO LIZET VANESSA | RUC: 10422645514
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10422645514'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- MUÑIZ ZAMORA RUBEN LUCIO | RUC: 10214843183
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10214843183'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- VALNIM SAC | RUC: 20601506573
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601506573'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- CRUZ GARCIA BRENDA DORILA | RUC: 10107649412
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10107649412'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- Clínica Integral Odonto Free EIRL | RUC: 20610423257
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610423257'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- JANAMPA CLEMENTE VICTOR ALBERTO | RUC: 10730485714
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10730485714'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- IMAGEN DENTAL CENTER E.I.R.L. | RUC: 20604816352
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604816352'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- BRAÑEZ VIVAS LEONIDAS CERILO | RUC: 10162969868
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10162969868'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- VETERINARIAS LOTSO S.A.C. | RUC: 20603217579
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(58.3, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603217579'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- CELESTINO APOLINARIO ACENCIO BEKER | RUC: 10414166127
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10414166127'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- LESCANOVETS E.I.R.L. | RUC: 20602111998
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(62.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602111998'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- LESCANOVETS E.I.R.L. | RUC: 20602111998
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(62.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602111998'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- LESCANOVETS E.I.R.L. | RUC: 20602111998
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(62.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602111998'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- LESCANO AGUIRRE JESUS ENRIQUE | RUC: 10075482570
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(62.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10075482570'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- GRUPO ODONTOLOGICO CASAL S.A.C. | RUC: 20565355199
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20565355199'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- Lia cárdenas Alcazar | RUC: 10425712409
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10425712409'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- Dávila Gutiérrez Davis Clint | RUC: 10455206371
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10455206371'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- ESPINOZA ATENCIO FABIOLA CATHERINE | RUC: 10705051807
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10705051807'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- MASKOTOPIA CLINICAS VETERINARIAS SPA PET SHOP S.A. | RUC: 20608420933
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608420933'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- Hipólity MEDICAL Group EIRL | RUC: 20614742101
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614742101'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- CLINICA INTEGRAL ODONTO FREE EIRL | RUC: 20610423257
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-02',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-02 - Brum]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610423257'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-02'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-03 — 41 servicios
-- ═══════════════════════════════════════════════════════

-- VELASQUEZ VIZCARRA LUZ NATALY | RUC: 10444220592
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10444220592'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- PIZARRO PRADA ANTHONY MARTIN | RUC: 10721943114
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10721943114'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- vetSpizan eirl | RUC: 20606290951
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606290951'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- Jorge Luis Chavez Jara | RUC: 10704322521
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10704322521'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- FRANQUICIAS DE INNOVACION DENTAL SAC | RUC: 20613275810
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613275810'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- W & H INVESTMENT S.A.C | RUC: 20552711603
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20552711603'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-03 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- Corporación Fierro Artica SAC | RUC: 20610671901
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610671901'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- RAMOS HERNANDEZ MARIA ELENA | RUC: 10214574123
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10214574123'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- TORRES AGUIRRE JORGE LUIS | RUC: 10225147081
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10225147081'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- INVERSIONES DE SALUD Y BELLEZA MORALES S.A.C. | RUC: 20603504284
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603504284'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- GRUPO SANAR S.A.C. | RUC: 20601470412
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601470412'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- VICTORIO VELASQUEZ YAQUELIN ROCIO | RUC: 10412601845
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10412601845'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- VETERINARIA LOS FLAMENCOS E.I.R.L. | RUC: 20611282291
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611282291'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- AYBAR VASQUEZ MIXI GRISELDA | RUC: 10215616920
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10215616920'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- LOPEZ ROJAS JOSE CARLOS | RUC: 10201214314
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10201214314'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- Rosalinda Rubio Lezama | RUC: 10706071101
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10706071101'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- DR. CHRISTIAN S.A.C. | RUC: 20607896489
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607896489'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- Veterinaria vida animal e.i.r.l. | RUC: 20613580051
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613580051'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- JULIO ALBERTO MARTÍNEZ  APAZA | RUC: 10069158264
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10069158264'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- Inversiones Glory SAC | RUC: 20609885999
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609885999'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- INVERSIONES DE SALUD Y BELLEZA MORALES S.A.C. | RUC: 20603504284
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603504284'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- stephanie llantoy cosio | RUC: 10472168105
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10472168105'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- Ayllu Dent S.A.C | RUC: 20604651043
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604651043'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- SANCHEZ CUETO JOHNSTON BREAN | RUC: 10467628173
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10467628173'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- MATOS OLIVERA ABEL FRANK | RUC: 10403721625
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(98.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10403721625'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- JACOBO CASTILLA JESUS ANGELO | RUC: 10218602296
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10218602296'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- ROBLES HURTADO SILVIA PILAR | RUC: 10406021055
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10406021055'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- PILLACA GONZALES JAIME WALTER | RUC: 10068481860
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(94.4, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10068481860'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- ATAUSUPA OCROS NELLY MARIA | RUC: 10414475065
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10414475065'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- ODONTOLOGIA GOYAS E.I.R.L. | RUC: 20548159211
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20548159211'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- SIERRA FLORES KARINA STEFANY | RUC: 10463902131
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10463902131'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- Luis Estiv Goyas Blancas | RUC: 10409294613
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10409294613'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- ROMERO OBREGON ANDREA BELEN | RUC: 10451242526
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10451242526'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- EMPRESA GVET GESTIONES VETERINARIAS EIRL | RUC: 20608516434
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608516434'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-03',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(1250.0, cs.tarifa),
    '[RUTA 2026-06-03 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-03'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-04 — 38 servicios
-- ═══════════════════════════════════════════════════════

-- GARIBAY CARHUAMACA LUIS ALBERTO | RUC: 10417691281
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10417691281'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- TORRES LIZAMA CLAUDIA PATRICIA | RUC: 10455032607
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10455032607'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- ACHANCARAY ROJAS WILFREDO | RUC: 10094084089
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10094084089'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- MARIA VALDEZ CARPIO | RUC: 10100626646
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10100626646'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- CASTELLANOS VELAZCO MIGUEL ANGEL | RUC: 10087805170
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10087805170'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- Jhonny Marcelo Astete Torrejón | RUC: 10211338640
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10211338640'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- Galaxy pets SAC | RUC: 20613952153
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613952153'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- HUARACA DELGADO FLOR DE MARIA | RUC: 10208874476
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10208874476'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- CLINICA VETERINARIA SASH SA | RUC: 20601150205
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601150205'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- QUESQUEN CUYUBAMBA DHARIANA JUANA | RUC: 10457921824
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10457921824'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- CANDIDO VET PET SHOP SPA E.I.R.L - CANDIDO E.I.R.L | RUC: 20603933061
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603933061'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- LUIS DOMINGO ARIAS GUTIERREZ | RUC: 10093702617
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10093702617'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- HELAR MARTIN HERNANDEZ MUÑANTE | RUC: 10214625658
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10214625658'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- FRANQUICIAS DE INNOVACION DENTAL SAC | RUC: 20613275810
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613275810'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726, | RUC: 20612164984
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-04 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612164984'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- QUALAB S.A.C | RUC: 20603175558
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(120.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603175558'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- GRUPO MEDICO RS S.A.C. | RUC: 20608577093
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608577093'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- Clínica spce e.i.r.l | RUC: 20605797190
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605797190'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- AR BIOANÁLISIS SAC | RUC: 20607211265
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(130.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607211265'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- 4G integral sac | RUC: 20601016274
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(450.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601016274'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- VETERINARIA ORBEGOSO EIRL | RUC: 20338615915
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20338615915'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- CLIICA OQUENDO SAC | RUC: 20610727507
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-04 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610727507'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- FARRO GONZALEZ MARIA GLORIA | RUC: 10104239469
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10104239469'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- SALAZAR BRAVO CLAUDIO MARLON | RUC: 10067700967
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10067700967'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- MANUEL ALEJANDRO VIDAL FLORES | RUC: 10410038523
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10410038523'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- DENTAL FULLSONRISAS S.A.C. | RUC: 20613766546
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613766546'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- IBARRA YUPANQUI PAUL JHON | RUC: 10428015164
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10428015164'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- PERU CARM S.A.C. | RUC: 20524233330
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20524233330'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- UZURIAGA ALVARADO ELIZABETH EMILIA | RUC: 10225152069
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10225152069'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- Desarrollo Educativo S.A | RUC: 20603817185
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'orden_servicio',
    COALESCE(30.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603817185'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- HUATUCO GONZALES GINA MIRIAM | RUC: 10107142458
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10107142458'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- INSTITUTO DE EDUCACION SUPERIOR RICARDO PALMA SAC | RUC: 20338856955
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(180.0, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20338856955'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-04',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-04 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-04'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-05 — 41 servicios
-- ═══════════════════════════════════════════════════════

-- HBL S.R.L. | RUC: 20548396850
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20548396850'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- My Dentiss SAC | RUC: 20562730771
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20562730771'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- Javier Casas Luyo | RUC: 10707886019
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10707886019'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- PRIVET EIRL | RUC: 20603012411
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(98.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603012411'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- ANIMAL LIFE EXTRA CARE S.A.C. | RUC: 20517811557
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20517811557'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- ERNESTO EUDALDO SAAVEDRA MEZONES | RUC: 10067484083
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10067484083'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- LABORATORIO CLINICO PERU LABS E.I.R.L. | RUC: 20607902268
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607902268'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- VEVET S.A.C. | RUC: 20609951525
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609951525'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- Canales Larrea, Angela María | RUC: 10403783019
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10403783019'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- CENTRO MEDICO DENTAL SANTA INES S.A. | RUC: 20331894789
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20331894789'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- PETS SHOP LA MOLINA SOCIEDAD ANONIMA CERRADA | RUC: 20509844357
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(94.4, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20509844357'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- HUAPAYA EGOAVIL MILAGROS ELENA | RUC: 10704331598
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10704331598'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- GASTRO ENDOSCOPY E.I.R.L. | RUC: 20602289649
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602289649'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- HUAPAYA PANDO VICTOR ANDRES | RUC: 10100649620
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10100649620'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- CENTRO PRE-NATAL VIDA NUEVA | RUC: 20429156883
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20429156883'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- CORPORACION DENTAL PERUANA SONRISA SEGURA SAC | RUC: 20606650346
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606650346'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- CENTRO ODONTOLOGICO ESPECIALIZADO BIODENTAMERICA S | RUC: 20609073129
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609073129'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- CECILIA ROSARIO HOSPINA MEZA | RUC: 10091776460
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10091776460'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- W & H INVESTMENT S.A.C | RUC: 20552711603
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20552711603'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- EMPRESA MUNICIPAL DE CHORRILLOS S.A | RUC: 20556621188
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(400.0, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556621188'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- EMPRESA MUNICIPAL DE CHORRILLOS S.A. | RUC: 20556621188
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(187.5, cs.tarifa),
    '[RUTA 2026-06-05 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556621188'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- ARHUIS VELASQUEZ WILLIAM | RUC: 10431625461
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10431625461'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- LU LEON VDA DE PEREZ ANA MARIA | RUC: 10091760547
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10091760547'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- VETERINARIA ANIMAL LIFE S.A.C. | RUC: 20506975680
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20506975680'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- ZUAZO CORTEZ MILAGRITOS ADRIANA | RUC: 10222999869
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10222999869'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- CUATRO PATAS S.A.C. | RUC: 20506759715
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20506759715'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- WORLD ENTERPRICE PETS & VETS S.A.C. | RUC: 20604497559
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604497559'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- PRETTY PET S.A.C. | RUC: 20600475399
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600475399'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- Corporación HKS EIRL | RUC: 20609205947
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609205947'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- VARA BERNUY ERIKA ELIZABETH | RUC: 10106120566
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106120566'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- CENTRO ODONTOLOGICO ESPECIALIZADO PROVIDENCE S.A.C | RUC: 20602272011
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602272011'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- INVERSIONES BORE SAC | RUC: 20602673678
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602673678'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- UCAL S.A.C | RUC: 20537886618
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'orden_servicio',
    COALESCE(30.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20537886618'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- Grupo veterinario las viñas sac | RUC: 20549914951
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20549914951'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- GRUPO VETERINARIO LAS VIÑAS SAC | RUC: 20549914951
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20549914951'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-05',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(1250.0, cs.tarifa),
    '[RUTA 2026-06-05 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-05'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-06 — 6 servicios
-- ═══════════════════════════════════════════════════════

-- W&M CORPORACION SALUD S.A.C | RUC: 20613941577
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-06',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-06 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613941577'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-06'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-06',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-06 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-06'
  )
LIMIT 1;

-- W & H INVESTMENT S.A.C | RUC: 20552711603
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-06',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-06 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20552711603'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-06'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-06',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-06 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-06'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-06',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-06 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-06'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-06',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-06 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-06'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-08 — 43 servicios
-- ═══════════════════════════════════════════════════════

-- CENTRO ODONTOLOGICO DE NUEVA GENERACION SONRIE S.A | RUC: 20605325727
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605325727'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- VETERINARIA SAN MARCOS SAC | RUC: 20554422072
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20554422072'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- Juan Francisco Murrugarra Sánchez | RUC: 10415827330
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10415827330'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA | RUC: 20384463470
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20384463470'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- GONZALES GAVIDIA DORA | RUC: 10108681875
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10108681875'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- FAMONT PETS SAC | RUC: 20523984447
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20523984447'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- C. D. Romodent EIRL | RUC: 20518558171
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20518558171'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- CARES MEDICAL GROUP S.A.C. | RUC: 20605355324
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605355324'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- VERA BERROSPI DONNA PRISCILA | RUC: 10474665602
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10474665602'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- Pekitas Dent E.I.R.L | RUC: 20611773367
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611773367'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- EDUARDO SALAS ZORRILLA | RUC: 10421021363
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10421021363'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- ENJOY DENTAL GROUP S.A.C. | RUC: 20609564416
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609564416'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- Ivonne Geraldine Montes Valenzuela | RUC: 10481649515
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10481649515'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- THANI DENT S.A.C. | RUC: 20608386468
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608386468'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- QHALI KAY DENTAL EIRL | RUC: 20604537003
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604537003'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- SALVATIERRA MENDOZA KETTY | RUC: 10101781335
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10101781335'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- Oda Rios melgar | RUC: 10419707371
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10419707371'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- CORPORACION PERUANA DE FRANQUICIAS DENTALES | RUC: 20606688823
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606688823'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- FIORELA NUÑEZ ROSAS | RUC: 10752476883
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10752476883'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- Cristiam Roger Ayma Cusma | RUC: 10421409566
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10421409566'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- ENTRE MOTAS EIRL | RUC: 20609377764
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609377764'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- VETERINARIA SAN JUDAS TADEO E. I. R. L. | RUC: 20612088731
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612088731'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- Janeth Garamendi Alarcón | RUC: 15506656319
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '15506656319'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- HUAMAN REYES ALESSANDRA ISABEL | RUC: 10704348563
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10704348563'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- ALZAMORA LIMO MARCO ANTONIO | RUC: 10400553608
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10400553608'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- ADVANCE SALUD S.A.C. | RUC: 20553692246
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20553692246'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- SOTO ENCISO ROSA LUCY ANGELICA | RUC: 10101197552
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10101197552'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- CLINICA VETERINARIA SAN GABRIEL SAC | RUC: 20600539699
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600539699'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- CLINICA VETERINARIA TRINYVET E.I.R.L. | RUC: 20605946527
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605946527'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- CORPORACION VETERINARIA G&S SAC | RUC: 20603775016
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603775016'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- CLAUDIO ALBERTO ACCO NOA | RUC: 10106448154
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106448154'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- VIRGEN DE LA ASUNCION M Y O S.A.C. | RUC: 20600024150
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600024150'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- SURICHAQUI QUISPE PATRICIA | RUC: 10201030574
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10201030574'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- Miriam Rocio Gamarra López | RUC: 10090813434
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10090813434'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- HOSPITAL CLINICO VETERINARIO DEL SUR EMPRESA INDIV | RUC: 20538599175
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20538599175'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- PAREDES NAVARRO PATRICIA | RUC: 10106193091
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106193091'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- SERVICIOS ODONTOLOGICOS INTEGRALES VAMDENT E.I.R.L | RUC: 20549566228
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20549566228'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- CORPORACION DE FRANQUICIAS ODONTOLOGICAS SAC | RUC: 20613473255
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613473255'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- QUISPE MANCO BETTY | RUC: 10409776677
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(110.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10409776677'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- Clínica Veterinaria & Pet Shop SERVICAN EIRL | RUC: 20609283174
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609283174'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-08',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-08 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-08'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-09 — 53 servicios
-- ═══════════════════════════════════════════════════════

-- STUDIO DENTAL 3M S.A.C | RUC: 20610815481
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610815481'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- VETERINARIA PANDA EIRL | RUC: 20506738807
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20506738807'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- Lizeth Magaly Marcatinco Cuba | RUC: 10487931921
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(110.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10487931921'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- HONORIO CERNA ELENA ELIZABETH | RUC: 10419702094
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10419702094'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- CASTAÑEDA SUAREZ MIGUEL ANGEL | RUC: 10468184546
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10468184546'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- SOMMEDICS GRAM S.A.C. | RUC: 20607922153
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607922153'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- VETERINARIA D´PELOS S.A.C | RUC: 20606732610
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606732610'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- SERVICIOS MEDICOS ODONTOLOGICOS FLORES S.A.C. | RUC: 20609057450
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609057450'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- SALUD DENTAL ODONTOLOGIA INTEGRAL | RUC: 20602353240
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602353240'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- Clínica Veterinaria Ámbar EIRL | RUC: 20602702805
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602702805'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- INGA RUIZ FABIO ALBERTO | RUC: 10704348458
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10704348458'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- KRISTALDENT S.A.C. | RUC: 20549948775
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20549948775'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- CLINICA DE LA SONRISA PERU S.A.C. | RUC: 20609243661
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609243661'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- JESUS WILFREDO DE LA ROCA GARIBAY | RUC: 10104448751
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10104448751'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- DE LA CRUZ DEUDOR JOSE LUIS | RUC: 10408260031
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10408260031'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- CACERES PASTOR RAUL EFRAIN | RUC: 10405249290
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10405249290'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- LUMAR E&P SAC | RUC: 20492602371
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20492602371'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA | RUC: 20384463470
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20384463470'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- RYM SERVICIOS DE ESPECIALIDAD S.A.C. | RUC: 20613514229
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613514229'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- Jesús kiyoshi haramura glave | RUC: 10468277307
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10468277307'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- GRUPO SONRIE PERU SAC | RUC: 20601286158
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601286158'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- Medical center G.A SAC | RUC: 20614657678
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614657678'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- Karina Esthefania Espinal Melgarejo | RUC: 10712395619
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10712395619'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- Karina Esthefania Espinal Melgarejo | RUC: 10712395619
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10712395619'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- GRACE JESY ALARCON GUTIERREZ | RUC: 10488439281
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10488439281'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- jessica landa andia | RUC: 10106468589
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106468589'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- QUISPE VALLE EDUARDO JOSUE | RUC: 10429863606
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10429863606'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- G & G VETS FAMILY E.I.R.L. | RUC: 20607102288
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607102288'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- RT MEDIC EIRL | RUC: 20612211044
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612211044'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- CENTRO VETERINARIO OASIS DE LIMA SUR S.A.C. | RUC: 20610844929
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610844929'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- ESCORZA VILLEGAS BLANCA JAKELINE | RUC: 10476115375
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10476115375'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- COLQUI INGA CAROLINA | RUC: 10211361650
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10211361650'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- VARGAS SOR SERVICIOS INTEGRALES S. CIVIL DE R.L | RUC: 20556829170
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556829170'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- ESPINOZA GARCIA MILTON | RUC: 10229966931
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10229966931'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- CORPORACIÓN AMBAR E.I.R.L | RUC: 20608487213
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608487213'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- Clínica Veterinaria Ámbar EIRL | RUC: 20602702805
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602702805'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- ROMERO MORALES ROCIO AURORA | RUC: 10417772559
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10417772559'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- mendoza gonzales Diana Katterine | RUC: 10419266286
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10419266286'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- CENTRO MEDICO VETERINARIO & REHABILITACION REHAVET | RUC: 20607942871
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607942871'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- CLIVET PANDA SAC | RUC: 20602340962
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602340962'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- CLINICA FELINA JACOBITA S.A.C. | RUC: 20609688913
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609688913'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- Katherine Sanchez Valdez | RUC: 10456262754
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10456262754'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- C & F ODONTOLOGIA INTEGRAL S.A.C. | RUC: 20612208825
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612208825'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- MOREANO VEGA BRENDA LUCERO | RUC: 10479890205
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10479890205'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-09 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-09 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-09 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-09 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- QUALAB S.A.C | RUC: 20603175558
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(120.0, cs.tarifa),
    '[RUTA 2026-06-09 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603175558'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- VETERINARIA MI CACHORRITO SAC | RUC: 20545373441
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-09 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545373441'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-09 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-09',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(118.0, cs.tarifa),
    '[RUTA 2026-06-09 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-09'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-10 — 47 servicios
-- ═══════════════════════════════════════════════════════

-- ZOO MEDIC VETERINARIA SAC | RUC: 20605826629
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605826629'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Ursula Lidia Pérez Benito | RUC: 10106357477
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106357477'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- REPRESENTACIONES MAGDA`S SOCIEDAD ANONIMA CERRADA | RUC: 20384463470
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20384463470'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- OMONTE GUTIERREZ JOHAN ROLANDO | RUC: 10437752911
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10437752911'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- VICENTELO ALVAN JOSE VICTOR | RUC: 10066449594
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10066449594'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- JULIA ALICIA ASLLA ESPINOZA | RUC: 10436041620
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10436041620'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- GUZMAN SOLIS CARLOS SANDRO | RUC: 10416495497
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10416495497'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Milagros Mitma Ramírez | RUC: 10700511494
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10700511494'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- GUIDENT EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMI | RUC: 20557299212
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20557299212'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- COLS D'' LIMA MANUEL ALEJANDRO | RUC: 15602661927
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '15602661927'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- WALAC SAC | RUC: 20536780506
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20536780506'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- RAMOS GUERRERO LIZETH ARACELY | RUC: 10727044774
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10727044774'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- J & R DENTAL E.I.R.L | RUC: 20608460722
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608460722'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- CRISOSTOMO RODRIGUEZ JENNIFER VANESSA | RUC: 10441370381
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10441370381'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Glow Inversiones SAC | RUC: 20600575733
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600575733'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Glow Inversiones SAC | RUC: 20600575733
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600575733'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Luiggi Orlando Cornejo Peralta | RUC: 10103292811
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10103292811'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- ANIMAL CLINIC PERU E.I.R.L. | RUC: 20602364128
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(94.4, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602364128'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- CHAVEZ ROSALES ROSA MARIA | RUC: 10410499911
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10410499911'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- VILLA PET''S E.I.R.L. | RUC: 20601928877
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(118.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601928877'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- RAQUEL REBECA ALIAGA HERMOZA | RUC: 10405920498
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10405920498'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- IMPLANTODENTAL E.I.R.L. | RUC: 20604276161
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604276161'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- ERIKA BERNARDINA ROJAS DIAZ | RUC: 10098342911
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10098342911'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- GIOVANNI MAXIMO SOTELO CASAFRANCA | RUC: 10094945726
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10094945726'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- MI PATAZA EIRL | RUC: 20600890957
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600890957'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- King vet S.A.C | RUC: 20609560844
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609560844'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Augusto Donayre Casas | RUC: 10705486048
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10705486048'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-10 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- servicios veterinarios Gallardo SAC | RUC: 20602356532
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602356532'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- GUTIERREZ DEL VALLE CLAUDIA ISABEL | RUC: 10107106869
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10107106869'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Feel  Vet SAC | RUC: 20612328456
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612328456'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Centro de terapia física y rehabilitación AVS SAC | RUC: 20612275409
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612275409'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- VETERINARIA VENTURA E.I.R.L. | RUC: 20602267599
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602267599'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- DIENTE FELIZ S.A.C. | RUC: 20602675921
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602675921'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C | RUC: 20601427193
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601427193'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Glow Inversiones SAC | RUC: 20600575733
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600575733'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- Glow Inversiones SAC | RUC: 20600575733
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600575733'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- PETS FARMA VETERINARIA EIRL | RUC: 20602556736
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602556736'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- CEV BUSTAMANTE E.I.R.L. | RUC: 20610248706
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610248706'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- King vet S.A.C | RUC: 20609560844
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609560844'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- MAILLET VET EIRL | RUC: 20613318233
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613318233'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-10',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(1250.0, cs.tarifa),
    '[RUTA 2026-06-10 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-10'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-11 — 31 servicios
-- ═══════════════════════════════════════════════════════

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- GRUPO MEDICO RS S.A.C. | RUC: 20608577093
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608577093'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- CONSULTORIA RADIOLOGICA S.A.C. | RUC: 20607382795
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607382795'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- AR BIOANÁLISIS SAC | RUC: 20607211265
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(130.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607211265'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- PRAIMDENT SOCIEDAD ANONIMA CERRADA | RUC: 20512898387
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20512898387'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- ALLQUSERVICIOS S.A.C. | RUC: 20608628666
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608628666'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- ODONTOCRED E.I.R.L | RUC: 20545995795
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545995795'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726, | RUC: 20612164984
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-11 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612164984'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- NATURAL PETS SERVICIOS VETERINARIOS S.A.C. | RUC: 20606847093
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606847093'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- LOURDES KARINA PAREDES CAIHUACAS | RUC: 10408752162
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10408752162'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- PET INDUSTRY SAC | RUC: 20609956659
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609956659'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- Karen Ilse Ploog Cortes | RUC: 10409273586
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10409273586'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- JC REHAB EIRL | RUC: 20603575718
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603575718'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- ROES DERMA WELLNESS IMPORTACIONES Y EXPORTACIONES  | RUC: 20603961499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603961499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- PEREDO ARENAS FRANK ALEXANDER | RUC: 10417192463
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(62.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10417192463'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- TAML ODONTOLOGOS SAC | RUC: 20514310654
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20514310654'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- VETERINARIAS RUNA LUNA E.I.R.L. | RUC: 20607091669
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607091669'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- Johanna Patricia Gonzales Medina | RUC: 10402491685
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10402491685'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- SAKURA MARU DENTAL SAC | RUC: 20606421339
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606421339'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- CLINICA DENTAL SMILE PERFECTION | RUC: 20604380007
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604380007'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- Dental specialists SAC | RUC: 20548900361
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20548900361'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- TREMOLADAS E.I.R.L. | RUC: 20607117544
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607117544'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- Arturo Kobayashi Shinya | RUC: 10066296461
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10066296461'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- VERAMENDI MEDIC SACS | RUC: 20613628101
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613628101'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- CENTRO ODONTOLOGICO ESPECIALIZADO VMT S.A.C. | RUC: 20601969646
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601969646'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- CENTRO DE DIAGNOSTICO 3D SAC | RUC: 20610058648
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610058648'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- COAC MIRAFLORES E.I.R.L | RUC: 20614823021
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614823021'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-11',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-11 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-11'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-12 — 61 servicios
-- ═══════════════════════════════════════════════════════

-- RANILLA VALENTE GUISSELLA IVETTE | RUC: 10408896334
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10408896334'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Odontología especializada Smile Plus E.I.R.L | RUC: 20607074802
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607074802'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- ESTACION VETERINARIA S.A.C. | RUC: 20602600301
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602600301'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- RIOS AREVALO JUAN CARLOS | RUC: 10093831123
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10093831123'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- VET SAN PATRICIO SAC | RUC: 20613529897
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613529897'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- MULTISERVICIOS  DE SALUD CHR S.A.C | RUC: 20546143733
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20546143733'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- ESTRELLA APARICIO MELISSA GABRIELA | RUC: 10446650624
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10446650624'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- RAMIREZ LEGONIA SILVIA JESUS | RUC: 10100074236
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10100074236'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- TIERRA ANIMAL SOCIEDAD ANONIMA CERRADA | RUC: 20607610151
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607610151'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- GRUPO SALVAS PERU S.A.C | RUC: 20609182815
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609182815'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- LIDER DENT INVERSIONES MEDICAS SAC | RUC: 20603720670
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603720670'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- ODONTOP ODONTOLOGIA ESPECIALIZADA RGT S.A.C | RUC: 20601427193
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601427193'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Odonto Shine  B&E | RUC: 20604055327
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604055327'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Casvi SAC | RUC: 20553444773
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20553444773'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Omar Antonio Cedeño Zegarra | RUC: 10407027235
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10407027235'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Desarrollo Educativo S.A | RUC: 20603817185
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'orden_servicio',
    COALESCE(30.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603817185'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Glow Inversiones SAC | RUC: 20600575733
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600575733'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Glow Inversiones SAC | RUC: 20600575733
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600575733'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Centro Odontológico Fritz EIRL | RUC: 20507230033
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20507230033'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- INVERSIONES JMRI SAC | RUC: 20607354856
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607354856'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- LEOPOLDO MENESES ENTERPRISES E.I.R.L. | RUC: 20607524760
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607524760'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- CORPORACION SONRISA SEGURA SAC | RUC: 20603143788
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-12 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603143788'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- GABUS VET SAC | RUC: 20548058610
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20548058610'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- SERVICIOS VETERINARIOS INGE S.A.C. | RUC: 20473466148
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20473466148'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- ASMAT FAJARDO KARINA CECILIA | RUC: 10103432052
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10103432052'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- CABRERA & GALLESI SAC | RUC: 20610280791
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610280791'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- M & E TRAUMATOLOGIA S.A.C. | RUC: 20611155639
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611155639'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- VETERINARIA BLASVET SURCO E.I.R.L. | RUC: 20609943158
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609943158'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- CLINICA VETERINARIA GONZALEZ S.A.C. | RUC: 20553542431
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20553542431'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Plural Medical SAC | RUC: 20538228860
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20538228860'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- SERVICIOS VETERINARIOS CASTRO SOLUTION SAC | RUC: 20605393994
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605393994'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- DR. JOSE LUIS VET S.A.C. | RUC: 20609067137
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609067137'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- ENDODONCIARTE EIRL | RUC: 20614306131
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614306131'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- EMPRESA MUNICIPAL DE CHORRILLOS S.A | RUC: 20556621188
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(400.0, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556621188'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- EMPRESA MUNICIPAL DE CHORRILLOS S.A. | RUC: 20556621188
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(187.5, cs.tarifa),
    '[RUTA 2026-06-12 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556621188'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- DE ABREU BECERRA DIANA CLARA | RUC: 15603657109
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '15603657109'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- CEMIVET SAC | RUC: 20612314510
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612314510'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Cosmetic Dent EIRL | RUC: 20548390908
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20548390908'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Veterinaria central traverso eirl | RUC: 20609375575
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609375575'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- CUBASALUD E.I.R.L. | RUC: 20612269051
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612269051'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- VETERINARIA EL PALMAR EIRL | RUC: 20544039173
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20544039173'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Susan Leroy Garro Bedriñana | RUC: 10098796491
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10098796491'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- INVERSIONES ARIAS LEGUA S.A.C. | RUC: 20604586501
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604586501'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Rosario Aurora Zegarra Medina | RUC: 10088218987
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10088218987'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- SuDentist EIRL | RUC: 20601410495
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601410495'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- M&S DENTAL ATELIER SOCIEDAD ANÓNIMA CERRADA - M&S  | RUC: 20600375335
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600375335'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- INVERSIONES TCQ S.A.C. | RUC: 20605043021
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605043021'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- DERMIVET S.A.C. | RUC: 20603880421
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603880421'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- GRUPO QP E.I.R.L. | RUC: 20603297289
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603297289'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- VILLAVERDE MOSCOL ROCIO ISABEL | RUC: 10480123943
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10480123943'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- MEDIC DENTAL SMILE E.I.R.L. | RUC: 20512338322
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20512338322'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Desarrollo Educativo S.A | RUC: 20603817185
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'orden_servicio',
    COALESCE(30.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603817185'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- Brenda del Pilar Durango Hernández | RUC: 10106346793
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106346793'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- SANCHEZ QUEVEDO ZENISMEL EUSEBI | RUC: 15604733097
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '15604733097'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- CLINICA SANTA BEATRIZ | RUC: 20566148006
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-12',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-12 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566148006'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-12'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-13 — 16 servicios
-- ═══════════════════════════════════════════════════════

-- Jesus Rafael Gamarra Trujillo | RUC: 10081638875
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10081638875'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- K Y M ESTHETIC DENT SAC | RUC: 20600723571
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600723571'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- BARRA SOTO JANET CARMINA. | RUC: 10081611101
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10081611101'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- ASTUCURI YAURI JOSE ANTONIO | RUC: 10105985954
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10105985954'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- CORPORACION HIDALGO S.A.C. | RUC: 20538101525
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20538101525'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- FERNANDEZ QUINTANA CESAR AUGUSTO | RUC: 10088336491
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10088336491'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- SANCHEZ SANCHEZ DE ROJAS LUCY EMPERATRIZ | RUC: 10153854853
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(98.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10153854853'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- FLORES VELASQUEZ LUIS RENATO | RUC: 10081507193
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10081507193'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-13 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- W&M CORPORACION SALUD S.A.C | RUC: 20613941577
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-13 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613941577'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-13 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- PET´S PLACE VETERINARIOS SAC | RUC: 20523846648
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-13 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20523846648'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- W & H INVESTMENT S.A.C | RUC: 20552711603
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-13 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20552711603'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-13 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-13 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-13',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-13 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-13'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-15 — 47 servicios
-- ═══════════════════════════════════════════════════════

-- CLINICA REAL LOS LAURELES SAC | RUC: 20220832016
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(175.0, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20220832016'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CENTRO MEDICO VETERINARIO SURCO S.A.C. | RUC: 20604139121
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604139121'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- MEDAVAC- LAB SAC | RUC: 20606809086
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(200.0, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606809086'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CENTRO QUIRURGICO VETERINARIO E.I.R.L. | RUC: 20607826146
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607826146'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CORPORACION SONRISA 3D SAC | RUC: 20606610557
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606610557'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- OFTALMO MEDICAL CENTER S.A.C. | RUC: 20607132454
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607132454'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- Arturo cabrera fernandini | RUC: 10102231304
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10102231304'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(12.0, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-15 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- ODONTHO ESPECIALISTAS S.A.C | RUC: 20535640468
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20535640468'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- GOGIN ARMAS ERIKA ROSA | RUC: 10104774500
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10104774500'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- GABRIELA AQUINO HILARES | RUC: 10100796801
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10100796801'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CLUB MASCOTA VETERINARIA S.A.C. | RUC: 20600496132
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600496132'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- Linares Clinica Veterinaria EIRL | RUC: 20613242776
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613242776'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- RABANAL FERNANDEZ CESAR RUBEN | RUC: 10267293754
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10267293754'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- SANTHOME BERNALES VICTOR MANUEL | RUC: 10088051993
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10088051993'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- INVERSIONES SALASCORNEJO S.A.C. | RUC: 20611737506
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611737506'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CAMILO´S VET SAC | RUC: 20548927995
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20548927995'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- DENTAL CLASS S.A.C. | RUC: 20510975210
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20510975210'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- RG ODONTOLOGOS EMPRESA INDIVIDUAL DE RESPONSABILID | RUC: 20605128191
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605128191'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- MY DENTISS S.A.C | RUC: 20562730771
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20562730771'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- GRUPO GRESE EIRL | RUC: 20609318709
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609318709'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CLINICA FELINA JACOBITA S.A.C. | RUC: 20609688913
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609688913'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- Club Sonrisa Perú S.A.C | RUC: 20608397192
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608397192'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- DENTALISTA S.A.C. | RUC: 20611537698
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611537698'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- Clínica dental Snowdent eirl | RUC: 20607657077
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607657077'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- VET PRIME - DIAGNÓSTICO ECOGRÁFICO SOCIEDAD ANÓNIM | RUC: 20615600572
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20615600572'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- SERVICIOS VETERINARIOS ESPECIALIZADOS S.A.C. | RUC: 20551542280
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20551542280'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CLINICA SANTA BEATRIZ | RUC: 20566148006
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-15 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566148006'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- Tsukamoto Vilchez Luis | RUC: 10067253871
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10067253871'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CORPORACIÓN VETERINARIA SAN PÍO S.A.C. | RUC: 20606054832
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606054832'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- PET FRIENDLY SAC | RUC: 20601084628
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601084628'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRA | RUC: 20518132947
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(300.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20518132947'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- LIMA DEL MAR ESPECIALISTAS MEDICOS S.A.C. | RUC: 20603274084
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603274084'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- INSTITUTO INTEGRAL VIDA PLENA SAC | RUC: 20477940642
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(118.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20477940642'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- INSTITUTO INTEGRAL VIDA PLENA SAC | RUC: 20477940642
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20477940642'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CALDERON MOYA CHRISTIAN VICTOR | RUC: 10700148527
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(63.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10700148527'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- CIRUGIA PLASTICA PACHECO SAC | RUC: 20614448874
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614448874'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(300.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- Beauty Touch Estética Orofacial  & Odontologia | RUC: 20608795074
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-15',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-15 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608795074'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-15'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-16 — 44 servicios
-- ═══════════════════════════════════════════════════════

-- C & F SALUD S.A.C. | RUC: 20600980875
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-16 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600980875'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- SANITAS CORPUS EIRL | RUC: 20549009884
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(380.0, cs.tarifa),
    '[RUTA 2026-06-16 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20549009884'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- VETERINARIA MI CACHORRITO SAC | RUC: 20545373441
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-16 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545373441'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- VETERINARIA MI CACHORRITO SAC | RUC: 20545373441
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-16 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545373441'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DIAGNODENT S.A.C. | RUC: 20547256639
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20547256639'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- KAVELG SOCIEDAD ANONIMA CERRADA- KAVELG S.A.C. | RUC: 20518247761
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(200.0, cs.tarifa),
    '[RUTA 2026-06-16 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20518247761'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRA | RUC: 20518132947
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(300.0, cs.tarifa),
    '[RUTA 2026-06-16 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20518132947'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- QUALAB S.A.C | RUC: 20603175558
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(120.0, cs.tarifa),
    '[RUTA 2026-06-16 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603175558'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C. | RUC: 20607342441
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607342441'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- CASTILLA & GASPAR ODONTOLOGIA INTEGRAL S.A.C. | RUC: 20607342441
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607342441'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- SERVICHECK SALUD SAC. | RUC: 20603710658
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(180.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603710658'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CE | RUC: 20511018553
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20511018553'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- MEDICAL AND ODONTOLOGY SERVICE SOCIEDAD ANONIMA CE | RUC: 20511018553
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20511018553'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- GRUPO DENTAL GNJ S.A.C. | RUC: 20600453123
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600453123'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- Francisco Choque Huaman | RUC: 10409070910
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10409070910'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- Jhonny Marcelo Astete Torrejón | RUC: 10211338640
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10211338640'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DENTAL VEGADENT EIRL | RUC: 20600736397
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600736397'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- Carla Elena Ramirez Reyes | RUC: 10741677151
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10741677151'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- Arnaldo Nique Medrano Verastegui | RUC: 10106058208
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106058208'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- SERVICIOS DE CIRUGIA VETERINARIA E IMAGENES DR. LU | RUC: 20611878282
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611878282'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- GARCIA RAMIREZ WASHINGTON | RUC: 10061555418
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10061555418'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(118.0, cs.tarifa),
    '[RUTA 2026-06-16 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DANIELA DEL ROSARIO PALACIOS BARBA | RUC: 10734263708
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10734263708'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- CHILENO CORDOVA FERNANDO JAVIER | RUC: 10103058398
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10103058398'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- JCM SERVICIOS ODONTOLOGICO E.I.R.L | RUC: 20611241411
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611241411'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- G & S ODONTOLOGIA S.A.C. | RUC: 20601488117
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601488117'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- PET EXPRESSION S.A.C. | RUC: 20602970478
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602970478'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DANI PETS & VET S.A.C. | RUC: 20503481309
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20503481309'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- CLINICA VETERINARIA PRANA S.R.L. | RUC: 20546186467
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20546186467'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- MARCO DIAZ SERVICIOS VETERINARIOS EIRL | RUC: 20606290498
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606290498'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- ILLUMINANCE DENTAL E.I.R.L. | RUC: 20610637591
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610637591'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- CHAVEZ VILLANUEVA SUSAN SHIRLEY | RUC: 10425174733
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10425174733'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DEMMTAL SAC | RUC: 20612003280
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612003280'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DR. ALPACA S.A.C. | RUC: 20602297218
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602297218'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- ECOGRAPET SAC | RUC: 20543895157
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20543895157'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- CAVA ODONTOLOGIA ESPECIALIZADA S.A.C. | RUC: 20609132010
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609132010'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- MUNICIPALIDAD DISTRITAL DE SURQUILLO | RUC: 20131372346
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20131372346'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DIAGNODENT SAC | RUC: 20547256639
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20547256639'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- ATM SERVET SAC | RUC: 20603611579
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603611579'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- Empresa de servicios veterinarios y comerciales Pu | RUC: 20611103540
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611103540'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DOCTORLABS S.A.C. | RUC: 20612134210
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612134210'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-16',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-16 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-16'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-17 — 47 servicios
-- ═══════════════════════════════════════════════════════

-- ASISTENCIA ODONTOLOGICA ESPECIALIZADA SOCIEDAD ANO | RUC: 20538031993
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20538031993'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- HEALTHY PETS E.I.R.L. | RUC: 20551879837
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20551879837'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- PROPET SR S.A.C | RUC: 20608794191
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608794191'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- VEGA SANCHEZ SILVIA MARIBEL | RUC: 10411402113
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10411402113'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- EL HURON AZUL EIRL | RUC: 20545766842
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545766842'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- REPRESENTACIONES VETERINARIAS EL DORADO S.A.C. | RUC: 20604600597
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604600597'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- GRUPO SALUD SOLIS DÁVILA S.A.C. | RUC: 20603671288
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603671288'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- SANCHEZ PEREZ JORGE ANDRES | RUC: 10731723244
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10731723244'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- ANIMEDICA VET SAC | RUC: 20601722098
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601722098'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- RELUZ ORELLANA VICTOR MARTIN | RUC: 10081374703
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10081374703'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- ESCOBAR VASQUEZ MERY ROSARIO | RUC: 10411613696
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10411613696'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- MEDENT SALUD EIRL | RUC: 20607005371
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607005371'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- MIKADENT S.A.C | RUC: 20600344707
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600344707'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- GORDILLO MALDONADO CARLA ROSA EMILIA | RUC: 10078621643
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10078621643'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- CENTRO DE TERAPIA ALTERNATIVA Y ANTIENVEJECIMIENTO | RUC: 20511051682
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20511051682'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- INSTITUTO DE EDUCACIÓN SUPERIOR RICARDO PALMA S.A | RUC: 20338856955
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(200.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20338856955'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- VERSE BIEN CENTRO DE CIRUGIA ESTETICA INTEGRAL SAC | RUC: 20553898294
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(150.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20553898294'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- SOPIEST S.A.C. | RUC: 20600642023
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600642023'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- REVISI COMPANY E.I.R.L. | RUC: 20392922203
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20392922203'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- CONSULTORIO MEDICO DEL SUEÑO Y RESPIRACION SAC | RUC: 20610886958
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610886958'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- CHAVEZ VEREAU NATALI | RUC: 10425189021
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10425189021'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- FRANCE VET PERÚ EIRL | RUC: 20612029891
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612029891'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- ICBSAS | RUC: 20613697447
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613697447'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- W & H INVESTMENT S.A.C | RUC: 20552711603
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-17 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20552711603'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- LIVIAC ANICAMA  ERIKA YANETH | RUC: 10422988276
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10422988276'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- VILLAGOMEZ MORALES CAROLINA ISABEL | RUC: 10731254309
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10731254309'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- AntoFabri VS SAC | RUC: 20611638931
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611638931'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- AJA MEDINA HERMANOS S.A.C. | RUC: 20612142221
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612142221'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- PAWS & TAILS E.I.R.L. | RUC: 20600836855
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600836855'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- VETERINARIA SOLO PATAS S.A.C. | RUC: 20607644960
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607644960'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- ESPECIALIDADES VETERINARIAS EIRL | RUC: 20493029241
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20493029241'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- SIETE GUTIERREZ VDA DE ALVARADO YOLANDA | RUC: 10086605517
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10086605517'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- DILAS DENT E.I.R.L. | RUC: 20609344246
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609344246'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- MONTOYA GRANDA LOURDES LERIDA | RUC: 10084195648
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(98.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10084195648'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- Rafael Ricardo Benito Quispe | RUC: 10406142391
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10406142391'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- CENTRO MEDICO VETERINARIO MEDIC VET E.I.R.L | RUC: 20543825612
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20543825612'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- VETERINARIA FELIVET EIRL | RUC: 20556644471
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556644471'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- Ulises Bravo Quispe Vargas | RUC: 10200734551
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10200734551'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- SAYRITUPAC RIOS ALICIA | RUC: 10215740710
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10215740710'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- DENTALMANS E.I.R.L. | RUC: 20601130506
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601130506'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- CLINICA SANTA BEATRIZ | RUC: 20566148006
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-17',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-17 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566148006'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-17'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-18 — 44 servicios
-- ═══════════════════════════════════════════════════════

-- QUALAB S.A.C | RUC: 20603175558
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(120.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603175558'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- GRUPO MEDICO RS S.A.C. | RUC: 20608577093
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608577093'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- Clínica spce e.i.r.l | RUC: 20605797190
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605797190'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- AR BIOANÁLISIS SAC | RUC: 20607211265
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(130.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607211265'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- 4G integral sac | RUC: 20601016274
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(450.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601016274'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- VETERINARIA ORBEGOSO EIRL | RUC: 20338615915
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20338615915'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- CLIICA OQUENDO SAC | RUC: 20610727507
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-18 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610727507'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- Milagros Felicia Anicama Carranza | RUC: 10434524739
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10434524739'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- CEV BUSTAMANTE E.I.R.L. | RUC: 20610248706
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610248706'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- FREDY ARTURO CERVANTES REYNA | RUC: 10072656887
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10072656887'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- MILAGROS BRIONES LAU LI | RUC: 10472000336
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10472000336'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- ROSAS CARRERA ETZABE YAMILETT | RUC: 10448904836
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10448904836'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- RICHARD QUISPE CANGAHUALA | RUC: 10471130732
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10471130732'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- Animal Garden sac | RUC: 20607053287
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607053287'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- MEDICVET INTEGRATIVA SAC | RUC: 20612548430
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612548430'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- REHTO SALUD SAC | RUC: 20612105473
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(75.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612105473'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- UNIDOS MI PRIMERA SONRISA SAC | RUC: 20604309621
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604309621'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- Fernando Acosta Soria | RUC: 10406125713
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10406125713'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- EVET LIMA S.A.C. | RUC: 20602939864
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602939864'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- Clínica Diagnostico Veterinario SAC | RUC: 20604188688
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604188688'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- MUNICIPALIDAD DISTRITAL DE JESUS MARIA | RUC: 20131366290
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20131366290'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-18 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- MAXI MEDIC EIRL | RUC: 20544253094
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20544253094'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- LOKIPET S.A.C | RUC: 20608486888
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608486888'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- NAKURA S.A.C. | RUC: 20605223983
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605223983'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- GOCO SPET SAC | RUC: 20605402578
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605402578'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- VET CORP SAC | RUC: 20514178527
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20514178527'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- Zavala Carlos Magali Inés | RUC: 10420138241
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10420138241'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- ELIZABETH RICALDI CAFFO | RUC: 10759045144
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10759045144'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- Servicios Veterinarios Sebasmedic EIRL | RUC: 20613400002
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613400002'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- VETERINARIA HUSARES DE JUNIN SAC | RUC: 20610675787
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610675787'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- CUELLAR VELAOCHAGA GABRIELA INES | RUC: 10724242451
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10724242451'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- IRIS MEDICINA FELINA E.I.R.L. | RUC: 20611828820
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611828820'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- ELIANA MARIA AGUIRRE ALVARADO | RUC: 10200778851
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10200778851'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- Alessandra Patricia Villena Cumpa | RUC: 10470044743
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10470044743'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- DOWAVA EIRL | RUC: 20612006564
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612006564'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- CONSULTORIO DENTAL DR. CUADROS E.I.R.L. | RUC: 20615187322
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20615187322'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- VitalPro SAC | RUC: 20614280639
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614280639'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726, | RUC: 20612164984
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-18',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-18 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612164984'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-18'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-19 — 10 servicios
-- ═══════════════════════════════════════════════════════

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-19 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-19 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- CLINICA SANTA BEATRIZ | RUC: 20566148006
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-19 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566148006'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-19 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-19 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-19 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-19 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-19 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- EMPRESA MUNICIPAL DE CHORRILLOS S.A | RUC: 20556621188
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(400.0, cs.tarifa),
    '[RUTA 2026-06-19 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556621188'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- EMPRESA MUNICIPAL DE CHORRILLOS S.A. | RUC: 20556621188
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-19',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(187.5, cs.tarifa),
    '[RUTA 2026-06-19 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556621188'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-19'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-20 — 45 servicios
-- ═══════════════════════════════════════════════════════

-- RUBEN ANTONIO GALINDO ROCA | RUC: 10417525357
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10417525357'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- LEONARDO GALINDO JURADO | RUC: 10700301686
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10700301686'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- CESAR PHOL CASAVILCA SIMON | RUC: 10722058181
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10722058181'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- CESAR PHOL CASAVILCA SIMON | RUC: 10722058181
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10722058181'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- CARLOS RAMIRO POLO RAMIREZ | RUC: 10257259078
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10257259078'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- CONSULTORIO DENTAL JHON DENT E.I.R.L. | RUC: 20600600967
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600600967'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- INVERSIONES Y SERVICIOS GENERALES ANIMALAND S.A.C. | RUC: 20610005501
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610005501'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- VETERINARIA SATELITE EIRL | RUC: 20601313872
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601313872'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- BERROSPI GROUP SAC | RUC: 20606846356
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606846356'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- ZEGARRA ALVA TEOFILO | RUC: 10102510246
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10102510246'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Teofilo zegarra Alva | RUC: 10102510246
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10102510246'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- CENTRO VETERINARIO J Y B EIRL | RUC: 20610578161
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610578161'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- LA JARA HERNANDEZ VICTOR JUAN CARLOS | RUC: 10448686456
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10448686456'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- SIMPET SAC | RUC: 20610344489
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610344489'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Lourdes Juliana Mathias López | RUC: 10076457382
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10076457382'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Clínica Veterinaria Eovet sac | RUC: 20612475408
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612475408'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- TUNY GALLARDO MARIO VLADIMIR | RUC: 10413218158
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-20 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10413218158'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- HUAMANI VILLANUEVA KATIA KARINA | RUC: 10427788399
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10427788399'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- VANEDENT EIRL | RUC: 20603826273
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603826273'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Clínica dental happy faces | RUC: 20609097061
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-20 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609097061'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- DOCTORLABS S.A.C. | RUC: 20612134210
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-20 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612134210'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Dentaurus Clínica Dental EIRL | RUC: 20538730816
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20538730816'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- FEBRES GARCIA CARLOS AUGUSTO | RUC: 10075417441
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10075417441'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Díaz Manco Tiffany Betsabe | RUC: 10431798927
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10431798927'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- grupo Trujillo & asociados SAC | RUC: 20544979389
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20544979389'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- DENTICARE ODONTOLOGIA E.I.R.L. | RUC: 20607058742
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607058742'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- ESTHETICDENT SAC | RUC: 20513473665
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20513473665'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- INVERSIONES Y SERVICIOS VETERINARIOS S.A. | RUC: 20603293313
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603293313'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- VETERINARIA BLAS VET LINCE | RUC: 20609931559
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609931559'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- SILVA MEZZICH PEDRO JOSE | RUC: 10094547003
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10094547003'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- QS VET SAC | RUC: 20602371515
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602371515'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- RENACER, SALUD Y BELLEZA S.A.C. | RUC: 20609118343
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609118343'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- CLINICA VETERINARIA ANIMALANDIA M & S S.A.C. | RUC: 20609260140
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609260140'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Becodent sacs | RUC: 20608989863
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608989863'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- ASENDENT PERU S.A.C. | RUC: 20611786582
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611786582'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- VET PLUS EIRL | RUC: 20109724778
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20109724778'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- VETCARE S.A.C. | RUC: 20614046172
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614046172'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Grupo inversiones J&J asociados sac | RUC: 20614036002
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614036002'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- SIALER GONZALES DORA MAYRA | RUC: 10732106711
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10732106711'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- Juan Diego Flores Rodas | RUC: 10707743081
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10707743081'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- W&M CORPORACION SALUD S.A.C | RUC: 20613941577
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613941577'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- W & H INVESTMENT S.A.C | RUC: 20552711603
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20552711603'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-20',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-20 - Paull]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-20'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-22 — 68 servicios
-- ═══════════════════════════════════════════════════════

-- VERGARA FELICES LUIS ALBERTO | RUC: 10077371864
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10077371864'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- NOBU ODONTOLOGIA SAC | RUC: 20613678035
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613678035'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- AMELIA SOLIS CHAVEZ | RUC: 10409151880
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10409151880'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- BELLEZA Y CIENCIA SAC | RUC: 20548548625
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(170.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20548548625'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- TANIA ELVIRA RAMÍREZ CARRILLO | RUC: 10401006503
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10401006503'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- DOCTOR MASCOTA S.A.C. | RUC: 20606028581
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606028581'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- ADMINISTRADORA DE SERVICIOS INTEGRALES DE SALUD S. | RUC: 20555957808
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20555957808'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- INSTITUTO VETERINARIO DE ESPECIALIDADES MEDICAS S. | RUC: 20563289636
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20563289636'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- URIBE REVOREDO MANUEL RICARDO | RUC: 10443725062
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10443725062'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- RUBIO VALDIVIESO ALICIA MARIA | RUC: 10077531829
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10077531829'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- DRAS VALVERDE SAC | RUC: 20609785412
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609785412'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Gilberto Arturo Huapaya Marcos | RUC: 10258111473
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10258111473'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- DIAZ CHAVEZ MARIA ELEANA | RUC: 10077624924
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10077624924'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- GOMEZ ALARCO JOSSEP MAURO | RUC: 10406806818
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10406806818'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Desarrollo Educativo S.A | RUC: 20603817185
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'orden_servicio',
    COALESCE(30.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603817185'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-22 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- YUREMMA SERRANO CHOQUE | RUC: 10427011904
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10427011904'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CLINICA VETERINARIA ACEVEDO EIRL | RUC: 20601872227
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601872227'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CONSULTORIO DENTAL RADIANTE DENT EIRL | RUC: 20606610875
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606610875'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- JOSE DAVID BENDEZU SARMIENTO | RUC: 15200506241
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '15200506241'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- HOSPITAL VETERINARIO HUELLAS Y MAS HUELLAS SAC | RUC: 20566086566
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566086566'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- AIDA YENI CRISTOBAL JAUNI | RUC: 10479926897
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10479926897'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CITYPETS E.I.R.L. | RUC: 20552375905
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20552375905'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- margarita martell martinez | RUC: 10087226480
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10087226480'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- EDUARDO PAREDES MUÑOZ | RUC: 10257759038
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10257759038'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- OCL DENTAL S.A.C. | RUC: 20606384221
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606384221'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CHRISTIAN FELIX LUYO AVILA | RUC: 10471530188
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10471530188'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- VALENTIN BELLEZA APOLAYA | RUC: 10481301985
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10481301985'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CLINICA VETERINARIA SAN JUAN MACIAS SRL | RUC: 20605479546
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605479546'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CMO SEÑORA DE GUADALUPE E.I.R.L. | RUC: 20606512598
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606512598'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- EVERPETS  SAC | RUC: 20554613412
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20554613412'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- DEL AGUILA TRINIDAD MARINEYLLY | RUC: 10420710564
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10420710564'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Centro Odontológico Biomedix sac | RUC: 20608719033
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608719033'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CLINICA VETERINARIA ACEVEDO EIRL | RUC: 20601872227
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601872227'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CLINICA SANTA BEATRIZ | RUC: 20566148006
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-22 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566148006'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Peluditos Petshop EIRL | RUC: 20611797843
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611797843'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CENTRO ODONTOLOGICO LA MAR E.I.R.L. | RUC: 20609374331
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609374331'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- POLICLINICO FAMILIAR SANTA ROSA E.I.R.L. | RUC: 20602032516
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602032516'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- MARÍA ÚRSULA DEL PILAR FLÓREZ CALDERÓN DE CARMEN | RUC: 10096755355
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10096755355'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CLINICA VETERINARIA UNIVERSAL PETS SAC | RUC: 20524244293
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20524244293'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Thatiana Danae Fachin Arbildo | RUC: 10455510304
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10455510304'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Intervención Especializada en Neurodesarrollo SAC | RUC: 20605132562
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(130.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605132562'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CARRILLO VARGAS MONICA CELESTE | RUC: 10096752968
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10096752968'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- DENTAL BELO SORRISO SAC | RUC: 20601192153
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601192153'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- INVERSIONES EL HURON AZUL EIRL | RUC: 20601401038
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601401038'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- INVERSIONES ANTARA S.A.C. | RUC: 20610149147
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610149147'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- MEDICINA ESTETICA Y BELLEZA INTEGRAL EIRL | RUC: 20603627581
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603627581'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- MONTES DIAZ MONICA LISSETH | RUC: 10407511617
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10407511617'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Consultorio Odontológico Dentios E.I.R.L | RUC: 20613838385
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613838385'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Veterinaria Animal Land SAC | RUC: 20609090171
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609090171'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- PET SHOP PERU SERVICIOS CANINO SAC | RUC: 20604435847
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604435847'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- GASTRO DIGESTIVO SAC | RUC: 20608381377
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(150.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608381377'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- ANIMEDICA VET S.A.C. | RUC: 20601722098
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601722098'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CLÍNICA VETERINARIA Y GROOMING CENTER S.A.C. | RUC: 20609381834
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609381834'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- VETERINARIOS PET+PERU S.A.C. | RUC: 20611970332
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611970332'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CACEDA MARQUINA VICTOR OSWALDO | RUC: 10188640015
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10188640015'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- VETERINARIA DEL RIO EIRL | RUC: 20614180952
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614180952'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Wilmer Vasquez Ramirez | RUC: 10103985191
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10103985191'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- Olivia Paola Carmona Quispe | RUC: 10704450996
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10704450996'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- CLINICA VETERINARIA HUELLAS Y MAS HUELLAS  SAC | RUC: 20566086566
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566086566'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- QUALAB S.A.C | RUC: 20603175558
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-22',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(120.0, cs.tarifa),
    '[RUTA 2026-06-22 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603175558'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-22'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-23 — 72 servicios
-- ═══════════════════════════════════════════════════════

-- Fiorella Quineche Andrade | RUC: 10417554691
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10417554691'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- VETERINARIA 4PATAS SOCIEDAD ANONIMA CERRADA | RUC: 20609482231
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609482231'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- MASTER IN PETS EIRL | RUC: 20544713354
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20544713354'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- AMIPET VETERINARIA E.I.R.L. | RUC: 20556501794
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556501794'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIA | RUC: 20601401038
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601401038'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- REPRESENTACIONES VETERINARIAS EL DORADO S.A.C. | RUC: 20604600597
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604600597'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Representaciones El Hurón Azul EIRL | RUC: 20602159826
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602159826'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Servicios veterinarios Pet''s Medic sac | RUC: 20603950578
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603950578'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CENTRO ODONTOLÓGICO BENJAMÍN DOIG SAC | RUC: 20607006335
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607006335'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CONSULTORIO DENTAL JHON DENT E.I.R.L. | RUC: 20600600967
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600600967'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- V&V Pets and Foods SAC | RUC: 20606195908
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606195908'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- INTEGRAL VET SAC | RUC: 20508507730
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20508507730'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- THE GROOMING PLACE-VETERINARIA & PET SHOP S.A.C. | RUC: 20613113721
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613113721'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- OLIVIA VIOLETA CERACIO PANDURO | RUC: 10418529984
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10418529984'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- JMP SERVICE S.A.C. | RUC: 20609968533
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609968533'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CASALT MULTISERVICIOS SAC | RUC: 20612308471
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612308471'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- AGROVETERINARIA MARTINEZ EIRL | RUC: 20135664538
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(98.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20135664538'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Luz pilar solis javier | RUC: 10258012599
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10258012599'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- HERNANDEZ ANDRADE MILIUSKA EDWIUMAR | RUC: 15604273886
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '15604273886'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CENTRO DE DIAGNOSTICO Y ESPECIALIDADES VETERINARIA | RUC: 20604685126
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604685126'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- VETERINARIA MATUTE SAC | RUC: 20614380188
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614380188'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- WENCESLAO QUISPE SORIA | RUC: 10067541869
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10067541869'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- AD CENTRO DE INNOVACION DENTAL EIRL | RUC: 20557251015
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20557251015'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- QUICENTRODENTAL EIRL | RUC: 20604167320
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604167320'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- VET BELLAVISTA SAC | RUC: 20615213331
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20615213331'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Alorella Dent Sac | RUC: 20615481654
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20615481654'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Marinazoo EIRL | RUC: 20554278443
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20554278443'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- SERVICIOS Y NEGOCIOS VETERINARIOS EL ALISO E.I.R.L | RUC: 20600957300
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(98.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600957300'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CLINIVET  LASSY EIRL | RUC: 20514715808
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20514715808'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- IPROVET EIRL | RUC: 20604354146
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604354146'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- RAYMUNDO TINTAYO FERNANDO JULIAN | RUC: 10101974567
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10101974567'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- BUSTINZA RODRIGUEZ OLGA MARINA | RUC: 10004959464
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10004959464'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Veterinaria Sanivet SAC | RUC: 20612144223
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612144223'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Christina Inga Villanueva | RUC: 10445138318
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10445138318'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Roberto Antonio Prieto Santos | RUC: 10401376254
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10401376254'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- ACVET PERU E.I.R.L | RUC: 20605441077
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605441077'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- JOSUE BOCANEGRA GAMERO | RUC: 10486192599
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10486192599'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- YESIKA YUDITH SOLIS YNOUYE | RUC: 10096362451
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10096362451'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- DENTAL SALCEDO SAC | RUC: 20615633683
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20615633683'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- MELYSALUD S.A.C | RUC: 20553512281
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20553512281'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Gino Antero Gambini Cercado | RUC: 10722267791
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10722267791'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Malu Fernandez Rodriguez | RUC: 10418172890
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10418172890'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- VETERINARIA WASY VET E.I.R.L | RUC: 20604020931
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(98.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604020931'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- ROSALES SILVA RAQUEL | RUC: 10425407495
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10425407495'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- JOSE WILFREDO MARTINES MONTAÑEZ | RUC: 10257786001
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(98.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10257786001'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Marisol Gaona Valderrama | RUC: 10754878253
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10754878253'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- SANTOS MERA CINDY STHEFANY | RUC: 10472383952
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10472383952'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- GALLO CABALLERO ANGELO JULIO GUILLERMO | RUC: 10099525661
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10099525661'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- AD CENTRO DE INNOVACION DENTAL EIRL | RUC: 20557251015
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20557251015'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- FAMILIA MUELITAS SAC | RUC: 20615598349
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20615598349'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- JARA VENTURA JOSE GIAN CARLO | RUC: 10421127269
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-23 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10421127269'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Hernandez Campoverde Zoila | RUC: 10167611341
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10167611341'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Bastidas Benites Alejandro Jaime Leonardo | RUC: 10731763416
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10731763416'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Denthalix E.I.R.L. | RUC: 20613766295
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613766295'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CENTRO DENTAL LIMA NORTE | RUC: 20605177302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605177302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- MARCOS OSCAR CARHUAHUANCA CORTEZ | RUC: 10106196805
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106196805'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CREART SALUD SAC | RUC: 20601663041
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601663041'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Emily Liliana Llacza Arellano | RUC: 10739542885
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10739542885'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Clínica Dental Brisa SAC | RUC: 20545590205
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545590205'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- BYMDENT SAC | RUC: 20614287056
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614287056'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- JOLICAHE S.A.C. | RUC: 20600499042
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600499042'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- ILUMINITY DENT SAC | RUC: 20608585509
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608585509'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- HAMPI WASI SAC | RUC: 20603053037
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603053037'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- CORPORACION EMPRESARIAL SEGURA SAC | RUC: 20608245414
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608245414'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- Aldo Enrique Gabriel Flores | RUC: 10099131166
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10099131166'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- IED INVERSIONES SAC | RUC: 20608615611
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608615611'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- ROSALES SILVA RAQUEL | RUC: 10425407495
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10425407495'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- ODONTOTRENDS SAC | RUC: 20607572713
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607572713'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- N Y A ALERTA VET S.A.C | RUC: 20563786265
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20563786265'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- ACERO PULIDO ESTHER JEANETTE | RUC: 10424571330
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10424571330'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-23',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-23 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-23'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-24 — 78 servicios
-- ═══════════════════════════════════════════════════════

-- ROSARIO FARIAS SERVICIOS VETERINARIOS E.I.R.L. | RUC: 20504596754
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20504596754'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Hernandez Roman Gabriela Noemi | RUC: 10458499620
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10458499620'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- DOCTOR MASCOTA SAC | RUC: 20606028581
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606028581'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- N Y L SERVICE DENT SAC | RUC: 20513940891
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20513940891'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Clínica odontológica Feijoo Eirl | RUC: 20602434916
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602434916'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- REPRESENTACIONES EL HURON AZUL EIRL | RUC: 20602159826
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602159826'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- EL HURON AZUL E.I.R.L | RUC: 20545766842
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545766842'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Servicios Veterinarios Pets Sites SAC | RUC: 20612298832
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612298832'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- HEALTHY PETS HERMANOS SAC | RUC: 20612705951
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612705951'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- ANDRES EDUARDO CASTRO CABALLERO | RUC: 10470127797
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10470127797'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Milagros del Rosario Mora Marquina | RUC: 10459641829
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10459641829'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- VELASCO GUERRERO MERCEDES JAQUELIN | RUC: 10469015608
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10469015608'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- AGUIRRE BELLIDO DE JARA CARLA SANDRIA AMALIA | RUC: 10099314058
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10099314058'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- RIVERA REYES RONY RANDALL | RUC: 10432543515
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10432543515'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- RIVERA REYES RONY RANDALL | RUC: 10432543515
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10432543515'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- VET D MASCOTA SAC | RUC: 20547105185
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20547105185'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- YAURI HUIZA ROGER JHOSEF | RUC: 10422960304
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10422960304'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CELI ARELLANO ROXANA OLENKA | RUC: 10418272355
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10418272355'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Andrea Contreras Consultorio Odontológico SAC | RUC: 20611285974
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611285974'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- LOVE & PETS VETERINARIAS SAC | RUC: 20610706747
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610706747'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- GOMEZ HIDALGO MARGARITA BEATRIZ | RUC: 10098642701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10098642701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- LOVE & PETS VETERINARIAS S.A.C. | RUC: 20610706747
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610706747'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- LA BARATISIMA SAC | RUC: 20601353041
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601353041'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Panoral Sac | RUC: 20478196106
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20478196106'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- G&R House SAC | RUC: 20615032965
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20615032965'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- W & H INVESTMENT S.A.C | RUC: 20552711603
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20552711603'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CABALLERO NUÑEZ GUILLERMO ENRIQUE | RUC: 10033804364
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10033804364'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- RIVERA CASTRO PAMELA LISSET | RUC: 10467049599
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10467049599'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Fredy Daniel Vilca Ninaja | RUC: 10012965635
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10012965635'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CENTRO GINECO OBSTETRICO CONCEBIR EIRL | RUC: 20608547780
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608547780'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Corporación copito y danna  SAC | RUC: 20613878182
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613878182'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Silva Neyra Celia Rocio | RUC: 10061447003
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10061447003'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- LABORATORIO CLINICO ESPECIALIZADO HEMOLAB EIRL | RUC: 20608531468
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608531468'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- JOSÉ LUIS GONZALES UCHUYPOMA | RUC: 10106898664
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10106898664'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CLINICA VETERINARIA DEL NORTE SAC | RUC: 20613146149
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613146149'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- FLORES CARBAJAL LENIN WALTER | RUC: 10459123500
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10459123500'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- MANRIQUE CHUQUISPUMA DARIO CRISANTO | RUC: 10439236219
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10439236219'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- SOTO ABARCA EDGARD ANTENOR | RUC: 10086344772
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10086344772'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CUENCA CARRION CARMEN | RUC: 10480336793
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10480336793'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(118.0, cs.tarifa),
    '[RUTA 2026-06-24 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- MEDICVET INTEGRATIVA SAC | RUC: 20612548430
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612548430'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- MORALES MONTEJO LUIS ABELARDO | RUC: 10084704861
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10084704861'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CLINICA ODONTOLOGICA ACSADENT EIRL | RUC: 20515719327
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515719327'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Karen Katherine Hernández Caba | RUC: 10467128171
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10467128171'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CCORI SUMAQ SRL | RUC: 20608165623
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608165623'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Cesmed Lima Norte SAC | RUC: 20605857613
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(85.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605857613'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Inversiones ceofam sac | RUC: 20510055897
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20510055897'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- ESPECIALIDADES MEDICAS VETERINARIAS S.A.C. - ESMEV | RUC: 20608063936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(94.4, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608063936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Jolicahe SAC | RUC: 20600499042
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600499042'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- HKH Reumatologia EIRL | RUC: 20514423262
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20514423262'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CLINICA DENTAL DIGITAL E.I.R.L. | RUC: 20614272792
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614272792'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CENTRO DE ESPECIALIDADES MEDICAS CORAZÓN DE JESÚS  | RUC: 20609000881
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609000881'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- ORTOSTETIC SONRISA SAC | RUC: 20610237429
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610237429'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- INVERSIONES ENCANTHADA S.A.C | RUC: 20613727052
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613727052'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Representaciones El Hurón Azul EIRL | RUC: 20602159826
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(57.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602159826'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- GRUPO SALUD DENTAL SAC | RUC: 20609199823
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609199823'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CLINICA SANTA BEATRIZ | RUC: 20566148006
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-24 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566148006'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- SALAZAR GUTIERREZ MIGUEL ANGEL | RUC: 10100259546
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10100259546'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- JAVIER ANTONIO ESTRADA CANTERO | RUC: 10071540320
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10071540320'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- VET LOVE PETS E.I.R.L. | RUC: 20610928219
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610928219'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- CLINICA VETERINARIA DEL NORTE S.A.C. | RUC: 20613146149
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613146149'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Pedro Luis Carlos Ávalos Sánchez | RUC: 10435868474
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10435868474'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Anngie Gissella Villar Calderón | RUC: 10413081667
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10413081667'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Desarrollo Educativo S.A | RUC: 20603817185
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(30.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603817185'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- FLORES CARBAJAL LENIN WALTER | RUC: 10459123500
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10459123500'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- FLORES CARBAJAL LENIN WALTER | RUC: 10459123500
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10459123500'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- HUAMANI VILLANUEVA KATIA KARINA | RUC: 10427788399
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10427788399'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- VANEDENT EIRL | RUC: 20603826273
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603826273'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- Clínica dental happy faces | RUC: 20609097061
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609097061'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-24',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-24 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-24'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-25 — 39 servicios
-- ═══════════════════════════════════════════════════════

-- QUALAB S.A.C | RUC: 20603175558
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(120.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603175558'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- GRUPO MEDICO RS S.A.C. | RUC: 20608577093
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608577093'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- Clínica spce e.i.r.l | RUC: 20605797190
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605797190'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- AR BIOANÁLISIS SAC | RUC: 20607211265
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(130.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607211265'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- 4G integral sac | RUC: 20601016274
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(450.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601016274'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- VETERINARIA ORBEGOSO EIRL | RUC: 20338615915
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20338615915'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- JUAN CARLOS ASTONITAS ASTONITAS | RUC: 10087438282
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10087438282'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- PET SOUND SERVICIOS S.A.C | RUC: 20609944898
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609944898'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- Amara inversiones S.A.C | RUC: 20615198324
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20615198324'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- CLIICA OQUENDO SAC | RUC: 20610727507
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-25 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610727507'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- GALINDO TIPISMANA ALVARO | RUC: 10717902888
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10717902888'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- ROSAS ALVA HUAMAN NANCY | RUC: 10099997228
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10099997228'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- PALOMINO SERVICIOS VETERINARIOS S.A.C. | RUC: 20605942637
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605942637'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- CASTILLO ARCE JORMAN AARON | RUC: 10483985377
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10483985377'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- VETERINARIA & SPA HAPPY CAN S.A.C. | RUC: 20602429106
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602429106'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- El Milagro de tu Sonrisa EIRL | RUC: 20601583551
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601583551'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- CLINICA VETERINARIA BASTET SALUKI EIRL | RUC: 20605875352
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605875352'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- ADVANCE DENTAL S.A.C. | RUC: 20609368129
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609368129'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- Multiservicios Advance SAC | RUC: 20612191116
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612191116'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- VETMED S.A.C | RUC: 20545864771
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545864771'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- MEGAMEDIC L Y A  SERVICIOS SAC | RUC: 20515275771
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515275771'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- Clínica veterinaria Dr.JhonD''vet | RUC: 20612962198
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612962198'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- DIAGNODENT S.A.C. | RUC: 20547256639
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20547256639'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- JOSELYN  CASTRO ZAMBRANO | RUC: 10744650319
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10744650319'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- VETERINARIA EL GRAN DANES S.A.C. | RUC: 20603630689
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603630689'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- D & L MARTINEZ S.A.C. | RUC: 20611411660
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611411660'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- DENTOLUX SAC | RUC: 20600592654
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600592654'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- CLINICA DENTAL SYACDENT S.A.C | RUC: 20600604717
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600604717'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- Veterinaria Cabrera J y P S.A.C. | RUC: 20608642570
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608642570'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- GRUPO MULTISERVICIOS Y SALUD M & K E.I.R.L. | RUC: 20611538457
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611538457'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- PRUDENCIO MAU EDGARD ENRIQUE | RUC: 10098543860
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10098543860'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- 6GDENT S.A.C. | RUC: 20609724791
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609724791'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- ELVIS OBLITAS TARRILLO | RUC: 10709139652
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10709139652'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- ARAVET CLINICA VETERINARIA S.A.C. | RUC: 20614821575
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614821575'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- SEGUNDA ETAPA AV. BRASIL N° 2722,2724,2724-A,2726, | RUC: 20612164984
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-25',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-25 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612164984'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-25'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-26 — 61 servicios
-- ═══════════════════════════════════════════════════════

-- CANALES PEREZ CLAUDIA CECILIA | RUC: 10421439929
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10421439929'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- EL LABRADOR SRL | RUC: 20479799785
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20479799785'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- RENGIDENT ODONTOLOGIA ESTETICA Y ESPECIALIZADA S.A | RUC: 20614794063
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614794063'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- consultorio médico pulso & vida | RUC: 20610407171
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610407171'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- SERVICIOS GENERALES DE SALUD SANTA FE DEL SUR E.I. | RUC: 20606479311
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606479311'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Rosse Mery Vilchez Maravi | RUC: 10453900865
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10453900865'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- POLICARPO CACEDA KEVIN RAUL ALEXANDER | RUC: 10756752389
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10756752389'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- consultorio dental Incisdent | RUC: 20610065717
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610065717'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- CENTRO MEDICO SAN CARLOS PEREZ E.I.R.L. | RUC: 20606659246
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606659246'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- INVERSIONES MINECRAFT S.A.C. | RUC: 20603528574
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603528574'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-26 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Veterinaria el gran danés SAC | RUC: 20603630689
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603630689'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- JOE RAMIREZ GUZMAN | RUC: 10101934638
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10101934638'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- CORPORATIVO GALARSAN S.A.C. | RUC: 20608967941
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608967941'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Vega Villanueva, Hernan | RUC: 10423834990
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10423834990'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- PAULO CESAR SALDAÑA SILVERA | RUC: 10099787461
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10099787461'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Miguel valencia delgado | RUC: 10167494027
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10167494027'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- CONSORCIO DE SERVICIOS GENERALES VETERINARIOS GUVA | RUC: 20608468359
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608468359'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- CIMEVET S.A.C. | RUC: 20609984474
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609984474'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- CLINICA VETERINARIA D´MASKOTAS S.A.C. | RUC: 20605942742
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605942742'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- JOCYAL & SERVICIOS SAC | RUC: 20492108848
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20492108848'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- ACVET PERU E.I.R.L | RUC: 20605441077
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605441077'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- SALVADOR SALVADOR ANGELA | RUC: 10428886475
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10428886475'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- ASOCIACION DE DESARROLLO DE LA EDUCACION Y LA SALU | RUC: 20136458923
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20136458923'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- PINCHI HILDEBRANDT JAVIER | RUC: 10079452209
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10079452209'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- POMA MENDO JESUS RAFAEL | RUC: 10080545687
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10080545687'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- BIOSERVET SRL | RUC: 20509303194
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20509303194'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- CHAVEZ MORE MAYRA VERONICA | RUC: 10489937773
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10489937773'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- DIAZ RODAS ROSA CECILIA | RUC: 10440120925
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10440120925'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Abigail Marcelina Cáceres Saldaña | RUC: 10101937726
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10101937726'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- MARISA NINAHUANCA PALOMINO | RUC: 10215484063
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(50.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10215484063'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Any Johana Vasquez Ramirez | RUC: 10457775763
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10457775763'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- URBINA ANTICONA EUGENIA YRIS | RUC: 10068030116
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10068030116'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- BLANKESY DENT ODONTOLOGOS SAC | RUC: 20613064401
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613064401'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Cristian Alciviades Tafur Guerrero | RUC: 10455023187
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10455023187'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- 10102144487 | RUC: 10102144487
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10102144487'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- CONSULTORIO DENTAL CORDOVA E.I.R.L. | RUC: 20609280329
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609280329'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- YVONNE OLIVIA OLIVARES TAIPE | RUC: 10218571871
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10218571871'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- DAMIAN OSCCO MARI LUZ | RUC: 10480513458
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10480513458'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- SANTOS SOTO LISSETTE LOURDES | RUC: 10107486491
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10107486491'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Animal Garden sac | RUC: 20607053287
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607053287'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- VIA ODONTOLOGICA ESECIALIZADA  S.A.C | RUC: 20611762462
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20611762462'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- LABORATORIO CLÍNICO SAMA S.A.C. | RUC: 20606759178
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606759178'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- ACVET PERU E.I.R.L | RUC: 20605441077
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605441077'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- ACVET PERU E.I.R.L | RUC: 20605441077
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20605441077'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- GRUPO SAN BERNARDO S.A.C. | RUC: 20610776117
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610776117'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- SILVA HUAMANI ROSIO RAQUEL | RUC: 10099762263
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10099762263'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Claritydent E.I.R.L. | RUC: 20600894529
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600894529'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- ANGEL Y CARLOS ODONTOLOGÌA ESPECIALIZADA S.A.C. | RUC: 20607752720
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607752720'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- VETERINARIA & SPA HAPPY CAN S.A.C. | RUC: 20602429106
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602429106'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- XIMAR SERVICIOS VETERINARIOS S.A.C. | RUC: 20608353187
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608353187'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Dental Medical Group H & M E.I.R.L. | RUC: 20612478440
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20612478440'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- Asociados Ganoza & Camac SAC | RUC: 20609904292
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609904292'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- PARIS PET SAC | RUC: 20613775430
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613775430'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- TREE DENT PERU E.I.R.L. | RUC: 20614486121
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614486121'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- WENCESLAO QUISPE SORIA | RUC: 10067541869
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10067541869'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- OPERADORES ODONTOLOGICOS WALFER S.A.C. | RUC: 20556748684
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556748684'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- CLINICA SANTA BEATRIZ | RUC: 20566148006
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-26',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-26 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566148006'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-26'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-27 — 34 servicios
-- ═══════════════════════════════════════════════════════

-- Grupo consorcio veterinario sac | RUC: 20607299944
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607299944'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- CLINICA DENTAL KUSI DENT EIRL | RUC: 20537043360
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20537043360'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- CLINICA DENTAL KUSI DENT EIRL | RUC: 20537043360
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20537043360'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- CLINICA VETERINARIA GAVET PERU S.A.C. | RUC: 20609660831
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20609660831'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- Laura Elizabeth Acuña Alvarez | RUC: 10714468222
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10714468222'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- F.S.Q. COMPANY S.A.C. | RUC: 20556252981
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20556252981'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- ISMINIO VALVERDE ANGEL CUSTODIO | RUC: 10107783798
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10107783798'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- MIL MASCOTAS S.A.C. | RUC: 20610928103
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610928103'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- CORPORACION ODONTOLOGICO SAN GABRIEL SAC | RUC: 20608423011
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(75.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608423011'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- LAVANDA PACHECO JUAN CARLOS | RUC: 10218633434
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10218633434'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- Veterinaria Dr Tarazona SAC | RUC: 20608359304
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20608359304'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- NICASIO SILVA CESAR FORTUNATO | RUC: 10437153723
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10437153723'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- Jeny Luz Lázaro Ramos | RUC: 10708688903
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10708688903'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- Tsukamoto Vilchez Luis | RUC: 10067253871
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10067253871'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- PET FRIENDLY SAC | RUC: 20601084628
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601084628'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRA | RUC: 20518132947
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(300.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20518132947'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- LIMA DEL MAR ESPECIALISTAS MEDICOS S.A.C. | RUC: 20603274084
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603274084'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- JUAREZ ALVAREZ CARMELA MAURA | RUC: 10072540463
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10072540463'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- INSTITUTO INTEGRAL VIDA PLENA SAC | RUC: 20477940642
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(118.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20477940642'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- INSTITUTO INTEGRAL VIDA PLENA SAC | RUC: 20477940642
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(59.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20477940642'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- CALDERON MOYA CHRISTIAN VICTOR | RUC: 10700148527
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(63.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10700148527'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(300.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- CIRUGIA PLASTICA PACHECO SAC | RUC: 20614448874
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(90.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20614448874'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(500.0, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- DERMATOLÓGICA PERÚ | RUC: 20601483701
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601483701'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- GAMARRA HEALTHCARE CENTER SAC | RUC: 20600994302
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-27 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600994302'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-27 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-27 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- TIERRA ANIMAL SOCIEDAD ANONIMA CERRADA | RUC: 20607610151
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(55.0, cs.tarifa),
    '[RUTA 2026-06-27 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607610151'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- PET´S PLACE VETERINARIOS SAC | RUC: 20523846648
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20523846648'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-27 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- SERVICIOS VETERINARIOS ESPECIALIZADOS S.A.C. | RUC: 20551542280
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-27 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20551542280'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- 2026-06-27 00:00:00 | RUC: 20613941577
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-27',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-27 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20613941577'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-27'
  )
LIMIT 1;

-- ═══════════════════════════════════════════════════════
-- 2026-06-30 — 30 servicios
-- ═══════════════════════════════════════════════════════

-- 10408266896 | RUC: 10408266896
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10408266896'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- Gonzales Elias Claudio Jesus | RUC: 10768018044
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10768018044'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- INVERSIONES MEFANE SAC | RUC: 20606393521
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606393521'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- INVERSIONES MEFANE SAC | RUC: 20606393521
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606393521'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- Martha Sofía Zanabria Montoya | RUC: 10484766539
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '10484766539'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- CLINICA REAL LOS LAURELES SAC | RUC: 20220832016
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20220832016'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- DETECTA CENTRO ONCOLOGICO S.A.C | RUC: 20515468499
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20515468499'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- MEDICINA EXTERNA S.A. | RUC: 20100339936
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20100339936'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- ONCOLOGIA S.A.C. | RUC: 20428674201
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Paul]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20428674201'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- C & F SALUD S.A.C. | RUC: 20600980875
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600980875'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- C & F SALUD S.A.C. | RUC: 20600980875
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20600980875'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- VETERINARIA MI CACHORRITO SAC | RUC: 20545373441
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545373441'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- VETERINARIA MI CACHORRITO SAC | RUC: 20545373441
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20545373441'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- SANITAS CORPUS EIRL | RUC: 20549009884
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(380.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20549009884'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- DIAGNODENT S.A.C. | RUC: 20547256639
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20547256639'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- SERVICIOS MEDICOS EL TREBOL SOCIEDAD ANONIMA CERRA | RUC: 20518132947
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(300.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20518132947'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- QUALAB S.A.C | RUC: 20603175558
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(120.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20603175558'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- CLINICA SANTA BEATRIZ | RUC: 20566148006
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(NULL, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20566148006'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- MAPEVAS SOCIEDAD ANONIMA CERRADA | RUC: 20602841899
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'transferencia',
    COALESCE(118.0, cs.tarifa),
    '[RUTA 2026-06-30 - Luis]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20602841899'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- CORPORACIÓN VETERINARIA SAN PÍO S.A.C. | RUC: 20606054832
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(65.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606054832'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- MEDAVAC- LAB SAC | RUC: 20606809086
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(200.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20606809086'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- CENTRO QUIRURGICO VETERINARIO E.I.R.L. | RUC: 20607826146
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607826146'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- CENTRO MEDICO VETERINARIO SURCO S.A.C. | RUC: 20604139121
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604139121'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- CENTRO MEDICO VETERINARIO SURCO S.A.C. | RUC: 20604139121
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(100.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20604139121'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- OFTALMO MEDICAL CENTER S.A.C. | RUC: 20607132454
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607132454'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- OFTALMO MEDICAL CENTER S.A.C. | RUC: 20607132454
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(70.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20607132454'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- UCIVET SAC | RUC: 20601498902
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(80.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20601498902'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

-- PETMAX S.A.C. | RUC: 20610289321
INSERT IGNORE INTO Servicio
    (id_sede, id_contrato, mes_servicio, fecha_ejecucion, estado, estado_pago, forma_pago, monto_cobrado, observaciones)
SELECT
    s.id_sede,
    cs.id_contrato,
    'Junio 2026',
    '2026-06-30',
    'completado',
    'pendiente',
    'efectivo',
    COALESCE(60.0, cs.tarifa),
    '[RUTA 2026-06-30 - Obed]'
FROM Sede s
INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
LEFT JOIN (
    SELECT cs1.* FROM ContratoServicio cs1
    INNER JOIN (
        SELECT id_sede, MAX(id_contrato) AS id_contrato
        FROM ContratoServicio WHERE activo = 1 GROUP BY id_sede
    ) lat ON lat.id_contrato = cs1.id_contrato
) cs ON cs.id_sede = s.id_sede
WHERE e.ruc = '20610289321'
  AND s.activo = 1
  AND NOT EXISTS (
      SELECT 1 FROM Servicio sv
      WHERE sv.id_sede = s.id_sede
        AND sv.fecha_ejecucion = '2026-06-30'
  )
LIMIT 1;

SET foreign_key_checks = 1;
-- FIN: 1069 sentencias INSERT generadas