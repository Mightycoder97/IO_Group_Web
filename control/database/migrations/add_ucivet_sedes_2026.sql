-- UCIVET SAC - dos sedes operativas para servicios distintos.
-- Fuente: BASE DE DATOS 2026.xlsx / hoja DATA IOGROUP
-- Filas detectadas:
--   1145: recojo normal de residuos biocontaminados, 3 veces por semana, S/ 80 por servicio.
--   1336: recojo de residuos especiales, quincenal, S/ 300 por servicio.

SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;
START TRANSACTION;

SET @ucivet_ruc := '20601498902';
SET @ucivet_cliente_dni := '10783480';
SET @ucivet_fecha_inicio := '2025-08-08';
SET @ucivet_fecha_fin := '2026-08-08';

SET @ucivet_empresa_id := (
  SELECT id_empresa
  FROM Empresa
  WHERE ruc = @ucivet_ruc
  LIMIT 1
);

INSERT INTO Cliente (nombre, tipo_documento, dni, activo)
SELECT 'VEGA GONZALEZ MARCO A.', 'DNI', @ucivet_cliente_dni, 1
WHERE @ucivet_empresa_id IS NULL
  AND NOT EXISTS (
    SELECT 1
    FROM Cliente
    WHERE dni = @ucivet_cliente_dni
  );

SET @ucivet_cliente_id := COALESCE(
  (
    SELECT id_cliente
    FROM Empresa
    WHERE ruc = @ucivet_ruc
    LIMIT 1
  ),
  (
    SELECT id_cliente
    FROM Cliente
    WHERE dni = @ucivet_cliente_dni
    ORDER BY id_cliente DESC
    LIMIT 1
  )
);

INSERT INTO Empresa (
  id_cliente,
  razon_social,
  rubro,
  ruc,
  direccion_fiscal,
  distrito,
  provincia,
  departamento,
  activo
)
SELECT
  @ucivet_cliente_id,
  'UCIVET SAC',
  'VETERINARIA',
  @ucivet_ruc,
  'Av. Arnaldo Márquez 2006 Jesús Maria',
  'JESUS MARIA',
  'LIMA',
  'LIMA',
  1
WHERE NOT EXISTS (
  SELECT 1
  FROM Empresa
  WHERE ruc = @ucivet_ruc
);

SET @ucivet_empresa_id := (
  SELECT id_empresa
  FROM Empresa
  WHERE ruc = @ucivet_ruc
  LIMIT 1
);

UPDATE Empresa
SET
  razon_social = 'UCIVET SAC',
  rubro = COALESCE(NULLIF(rubro, ''), 'VETERINARIA'),
  direccion_fiscal = COALESCE(NULLIF(direccion_fiscal, ''), 'Av. Arnaldo Márquez 2006 Jesús Maria'),
  distrito = COALESCE(NULLIF(distrito, ''), 'JESUS MARIA'),
  provincia = COALESCE(NULLIF(provincia, ''), 'LIMA'),
  departamento = COALESCE(NULLIF(departamento, ''), 'LIMA'),
  activo = 1
WHERE id_empresa = @ucivet_empresa_id;

-- Sede operativa 1: recojo normal de biocontaminados.
SET @ucivet_sede_bio_id := (
  SELECT id_sede
  FROM Sede
  WHERE id_empresa = @ucivet_empresa_id
    AND direccion LIKE '%Arnaldo%'
    AND direccion LIKE '%2006%'
    AND LOWER(TRIM(nombre_comercial)) IN ('ucivet', 'ucivet - biocontaminados')
  ORDER BY
    CASE
      WHEN LOWER(TRIM(nombre_comercial)) = 'ucivet - biocontaminados' THEN 0
      ELSE 1
    END,
    id_sede
  LIMIT 1
);

INSERT INTO Sede (
  id_empresa,
  nombre_comercial,
  direccion,
  distrito,
  provincia,
  departamento,
  referencia,
  coordenadas_gps,
  contacto_nombre,
  contacto_telefono,
  contacto_telefono_2,
  contacto_email,
  activo
)
SELECT
  @ucivet_empresa_id,
  'UCIVET - BIOCONTAMINADOS',
  'Av. Arnaldo Márquez 2006 Jesús Maria',
  'JESUS MARIA',
  'LIMA',
  'LIMA',
  'Horario: 9am a 6pm. Programacion: Mariela 980774275 / 012660990 / 987015656. Paga fin de mes.',
  NULL,
  'MARIELA ALTAMIRANO',
  '980774275',
  '012660990/987015656',
  NULL,
  1
WHERE @ucivet_sede_bio_id IS NULL;

SET @ucivet_sede_bio_id := COALESCE(
  @ucivet_sede_bio_id,
  (
    SELECT id_sede
    FROM Sede
    WHERE id_empresa = @ucivet_empresa_id
      AND nombre_comercial = 'UCIVET - BIOCONTAMINADOS'
    ORDER BY id_sede DESC
    LIMIT 1
  )
);

UPDATE Sede
SET
  nombre_comercial = 'UCIVET - BIOCONTAMINADOS',
  direccion = 'Av. Arnaldo Márquez 2006 Jesús Maria',
  distrito = 'JESUS MARIA',
  provincia = 'LIMA',
  departamento = 'LIMA',
  referencia = 'Horario: 9am a 6pm. Programacion: Mariela 980774275 / 012660990 / 987015656. Paga fin de mes.',
  contacto_nombre = 'MARIELA ALTAMIRANO',
  contacto_telefono = '980774275',
  contacto_telefono_2 = '012660990/987015656',
  activo = 1
WHERE id_sede = @ucivet_sede_bio_id;

INSERT INTO ContratoServicio (
  id_sede,
  fecha_inicio,
  fecha_fin,
  frecuencia,
  peso_limite_kg,
  tarifa_adicional_kg,
  tarifa,
  tipo_tarifa,
  observaciones,
  activo
)
SELECT
  @ucivet_sede_bio_id,
  @ucivet_fecha_inicio,
  @ucivet_fecha_fin,
  'semanal',
  NULL,
  NULL,
  80.00,
  'por_servicio',
  'Fuente Excel DATA IOGROUP fila 1145. Frecuencia real: 3 veces por semana. Limite indicado: 120 x mes. Tarifa: 80 por servicio. Residuos biocontaminados.',
  1
WHERE NOT EXISTS (
  SELECT 1
  FROM ContratoServicio
  WHERE id_sede = @ucivet_sede_bio_id
    AND fecha_inicio = @ucivet_fecha_inicio
    AND frecuencia = 'semanal'
    AND tarifa = 80.00
    AND tipo_tarifa = 'por_servicio'
);

SET @ucivet_contrato_bio_id := (
  SELECT id_contrato
  FROM ContratoServicio
  WHERE id_sede = @ucivet_sede_bio_id
    AND fecha_inicio = @ucivet_fecha_inicio
    AND frecuencia = 'semanal'
    AND tarifa = 80.00
    AND tipo_tarifa = 'por_servicio'
  ORDER BY id_contrato DESC
  LIMIT 1
);

UPDATE ContratoServicio
SET
  fecha_fin = @ucivet_fecha_fin,
  peso_limite_kg = NULL,
  tarifa_adicional_kg = NULL,
  observaciones = 'Fuente Excel DATA IOGROUP fila 1145. Frecuencia real: 3 veces por semana. Limite indicado: 120 x mes. Tarifa: 80 por servicio. Residuos biocontaminados.',
  activo = 1
WHERE id_contrato = @ucivet_contrato_bio_id;

UPDATE ContratoServicio
SET activo = 0
WHERE id_sede = @ucivet_sede_bio_id
  AND id_contrato <> @ucivet_contrato_bio_id
  AND activo = 1;

-- Sede operativa 2: recojo de residuos especiales.
SET @ucivet_sede_esp_id := (
  SELECT id_sede
  FROM Sede
  WHERE id_empresa = @ucivet_empresa_id
    AND direccion LIKE '%Arnaldo%'
    AND direccion LIKE '%2006%'
    AND LOWER(TRIM(nombre_comercial)) IN ('ucivet sac', 'ucivet - residuos especiales')
  ORDER BY
    CASE
      WHEN LOWER(TRIM(nombre_comercial)) = 'ucivet - residuos especiales' THEN 0
      ELSE 1
    END,
    id_sede
  LIMIT 1
);

INSERT INTO Sede (
  id_empresa,
  nombre_comercial,
  direccion,
  distrito,
  provincia,
  departamento,
  referencia,
  coordenadas_gps,
  contacto_nombre,
  contacto_telefono,
  contacto_telefono_2,
  contacto_email,
  activo
)
SELECT
  @ucivet_empresa_id,
  'UCIVET - RESIDUOS ESPECIALES',
  'Av. Arnaldo Márquez 2006 Jesús Maria',
  'JESUS MARIA',
  'LIMA',
  'LIMA',
  'Servicio quincenal de residuos especiales. Programacion: Mariela 980774275 / 012660990 / 987015656.',
  NULL,
  'MARIELA ALTAMIRANO',
  '980774275',
  '012660990/987015656',
  NULL,
  1
WHERE @ucivet_sede_esp_id IS NULL;

SET @ucivet_sede_esp_id := COALESCE(
  @ucivet_sede_esp_id,
  (
    SELECT id_sede
    FROM Sede
    WHERE id_empresa = @ucivet_empresa_id
      AND nombre_comercial = 'UCIVET - RESIDUOS ESPECIALES'
    ORDER BY id_sede DESC
    LIMIT 1
  )
);

UPDATE Sede
SET
  nombre_comercial = 'UCIVET - RESIDUOS ESPECIALES',
  direccion = 'Av. Arnaldo Márquez 2006 Jesús Maria',
  distrito = 'JESUS MARIA',
  provincia = 'LIMA',
  departamento = 'LIMA',
  referencia = 'Servicio quincenal de residuos especiales. Programacion: Mariela 980774275 / 012660990 / 987015656.',
  contacto_nombre = 'MARIELA ALTAMIRANO',
  contacto_telefono = '980774275',
  contacto_telefono_2 = '012660990/987015656',
  activo = 1
WHERE id_sede = @ucivet_sede_esp_id;

INSERT INTO ContratoServicio (
  id_sede,
  fecha_inicio,
  fecha_fin,
  frecuencia,
  peso_limite_kg,
  tarifa_adicional_kg,
  tarifa,
  tipo_tarifa,
  observaciones,
  activo
)
SELECT
  @ucivet_sede_esp_id,
  @ucivet_fecha_inicio,
  @ucivet_fecha_fin,
  'quincenal',
  20.00,
  NULL,
  300.00,
  'por_servicio',
  'Fuente Excel DATA IOGROUP fila 1336. Servicio de residuos especiales. Frecuencia real: quincenal. Limite: 20 kg. Tarifa: 300 por servicio.',
  1
WHERE NOT EXISTS (
  SELECT 1
  FROM ContratoServicio
  WHERE id_sede = @ucivet_sede_esp_id
    AND fecha_inicio = @ucivet_fecha_inicio
    AND frecuencia = 'quincenal'
    AND tarifa = 300.00
    AND tipo_tarifa = 'por_servicio'
);

SET @ucivet_contrato_esp_id := (
  SELECT id_contrato
  FROM ContratoServicio
  WHERE id_sede = @ucivet_sede_esp_id
    AND fecha_inicio = @ucivet_fecha_inicio
    AND frecuencia = 'quincenal'
    AND tarifa = 300.00
    AND tipo_tarifa = 'por_servicio'
  ORDER BY id_contrato DESC
  LIMIT 1
);

UPDATE ContratoServicio
SET
  fecha_fin = @ucivet_fecha_fin,
  peso_limite_kg = 20.00,
  tarifa_adicional_kg = NULL,
  observaciones = 'Fuente Excel DATA IOGROUP fila 1336. Servicio de residuos especiales. Frecuencia real: quincenal. Limite: 20 kg. Tarifa: 300 por servicio.',
  activo = 1
WHERE id_contrato = @ucivet_contrato_esp_id;

UPDATE ContratoServicio
SET activo = 0
WHERE id_sede = @ucivet_sede_esp_id
  AND id_contrato <> @ucivet_contrato_esp_id
  AND activo = 1;

COMMIT;

SELECT
  e.ruc,
  e.razon_social,
  s.id_sede,
  s.nombre_comercial,
  s.direccion,
  cs.id_contrato,
  cs.frecuencia,
  cs.peso_limite_kg,
  cs.tarifa,
  cs.tipo_tarifa,
  cs.activo,
  cs.observaciones
FROM Empresa e
JOIN Sede s ON s.id_empresa = e.id_empresa
JOIN ContratoServicio cs ON cs.id_sede = s.id_sede
WHERE e.ruc = @ucivet_ruc
  AND s.id_sede IN (@ucivet_sede_bio_id, @ucivet_sede_esp_id)
  AND cs.id_contrato IN (@ucivet_contrato_bio_id, @ucivet_contrato_esp_id)
ORDER BY s.nombre_comercial, cs.id_contrato;
