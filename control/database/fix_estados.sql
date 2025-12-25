-- ============================================
-- IO Group - Corrección de Estados de Facturas
-- Fecha: 2025-12-24
-- ============================================
-- Este script corrige el estado de las facturas basándose en:
-- 1. Campo 'observaciones' de la factura
-- 2. Campo 'metodo_pago' de la factura
-- ============================================

-- Primero, ver cuántas facturas hay que corregir
SELECT 
    estado,
    COUNT(*) as cantidad
FROM Factura
GROUP BY estado;

-- ============================================
-- PASO 1: Marcar como PAGADA las facturas que tienen
-- observaciones que indican pago realizado
-- ============================================

-- Facturas con observación que indica pago (CANCELADO, bancos, apps de pago)
UPDATE Factura 
SET estado = 'pagada',
    fecha_pago = fecha_emision
WHERE estado = 'emitida'
  AND (
    UPPER(observaciones) LIKE '%CANCELADO%'
    OR UPPER(observaciones) LIKE '%CANCELADA%'
    OR UPPER(observaciones) LIKE '%PAGADO%'
    OR UPPER(observaciones) LIKE '%PAGADA%'
    OR UPPER(observaciones) LIKE '%YAPE%'
    OR UPPER(observaciones) LIKE '%PLIN%'
    OR UPPER(observaciones) LIKE '%BCP%'
    OR UPPER(observaciones) LIKE '%BBVA%'
    OR UPPER(observaciones) LIKE '%INTERBANK%'
    OR UPPER(observaciones) LIKE '%SCOTIABANK%'
    OR UPPER(observaciones) LIKE '%BANCO%'
    OR UPPER(observaciones) LIKE '%DEPOSITO%'
    OR UPPER(observaciones) LIKE '%DEPÓSITO%'
    OR UPPER(observaciones) LIKE '%TRANSFERIDO%'
  );

-- Verificar cuántas se actualizaron
SELECT 'Facturas actualizadas a PAGADA por observaciones:' as mensaje, ROW_COUNT() as cantidad;

-- ============================================
-- PASO 2: Marcar como PENDIENTE (emitida) las que dicen
-- POR PAGAR o PENDIENTE
-- ============================================

-- Asegurarse de que las que dicen POR PAGAR o PENDIENTE queden como emitida
UPDATE Factura 
SET estado = 'emitida',
    fecha_pago = NULL
WHERE (
    UPPER(observaciones) LIKE '%POR PAGAR%'
    OR UPPER(observaciones) LIKE '%PENDIENTE%'
    OR UPPER(observaciones) LIKE '%POR COBRAR%'
  );

SELECT 'Facturas confirmadas como EMITIDA (pendientes):' as mensaje, ROW_COUNT() as cantidad;

-- ============================================
-- PASO 3: Verificar servicios - Estado completado si tiene
-- fecha_ejecucion Y tiene manifiesto asociado
-- ============================================

-- Actualizar servicios a 'completado' si tienen fecha de ejecución Y manifiesto
UPDATE Servicio s
SET s.estado = 'completado'
WHERE s.fecha_ejecucion IS NOT NULL
  AND EXISTS (SELECT 1 FROM Manifiesto m WHERE m.id_servicio = s.id_servicio);

SELECT 'Servicios actualizados a COMPLETADO:' as mensaje, ROW_COUNT() as cantidad;

-- Actualizar servicios a 'programado' si NO tienen fecha de ejecución O NO tienen manifiesto
UPDATE Servicio s
SET s.estado = 'programado'
WHERE s.fecha_ejecucion IS NULL
   OR NOT EXISTS (SELECT 1 FROM Manifiesto m WHERE m.id_servicio = s.id_servicio);

SELECT 'Servicios actualizados a PROGRAMADO:' as mensaje, ROW_COUNT() as cantidad;

-- ============================================
-- RESUMEN FINAL
-- ============================================
SELECT '========== RESUMEN FINAL ==========' as titulo;

SELECT 'SERVICIOS POR ESTADO:' as categoria;
SELECT estado, COUNT(*) as cantidad FROM Servicio GROUP BY estado;

SELECT 'FACTURAS POR ESTADO:' as categoria;
SELECT estado, COUNT(*) as cantidad FROM Factura GROUP BY estado;

SELECT 'FACTURAS PENDIENTES (emitida) - Por cobrar:' as categoria;
SELECT 
    COUNT(*) as total_facturas_pendientes,
    SUM(monto_total) as monto_total_pendiente
FROM Factura 
WHERE estado = 'emitida';

SELECT 'FACTURAS PAGADAS:' as categoria;
SELECT 
    COUNT(*) as total_facturas_pagadas,
    SUM(monto_total) as monto_total_cobrado
FROM Factura 
WHERE estado = 'pagada';
