<?php
/**
 * Helpers for route planning data.
 *
 * A route can be planned with sedes before Servicio rows are created. The
 * planned sedes are kept in the Ruta AuditLog payload and materialized later
 * from Control de Ruta.
 */

function normalizeRutaPlanSedes($sedes) {
    if (!is_array($sedes)) return [];

    $normalized = [];
    $seen = [];

    foreach ($sedes as $item) {
        if (is_array($item)) {
            $id_sede = intval($item['id_sede'] ?? 0);
            $forma_pago = $item['forma_pago'] ?? null;
            $obs = $item['obs'] ?? ($item['observaciones'] ?? null);
            $residuo = $item['residuo'] ?? null;
        } else {
            $id_sede = intval($item);
            $forma_pago = null;
            $obs = null;
            $residuo = null;
        }

        if ($id_sede <= 0 || isset($seen[$id_sede])) continue;
        $seen[$id_sede] = true;

        $normalized[] = [
            'id_sede' => $id_sede,
            'forma_pago' => $forma_pago ?: null,
            'obs' => $obs ?: null,
            'residuo' => $residuo ?: null
        ];
    }

    return $normalized;
}

function getRutaPlanSedes($id_ruta) {
    $logs = db()->query(
        "SELECT datos_nuevos
         FROM AuditLog
         WHERE tabla_afectada = 'Ruta'
           AND id_registro = ?
           AND datos_nuevos IS NOT NULL
           AND datos_nuevos LIKE '%\"sedes\"%'
         ORDER BY id_log DESC
         LIMIT 10",
        [$id_ruta]
    );

    foreach ($logs as $log) {
        $datos = json_decode($log['datos_nuevos'] ?? '{}', true);
        if (isset($datos['sedes']) && is_array($datos['sedes'])) {
            return normalizeRutaPlanSedes($datos['sedes']);
        }
    }

    return [];
}

function buildRutaPlanServicios($planSedes) {
    $planSedes = normalizeRutaPlanSedes($planSedes);
    if (empty($planSedes)) return [];

    $ids = array_map(fn($item) => intval($item['id_sede']), $planSedes);
    $placeholders = implode(',', array_fill(0, count($ids), '?'));

    $rows = db()->query(
        "SELECT se.id_sede, se.nombre_comercial as sede_nombre, se.direccion, se.distrito,
                se.contacto_nombre, se.contacto_telefono,
                e.ruc as empresa_ruc, e.razon_social as empresa_razon_social,
                cs.id_contrato, cs.tarifa as tarifa_servicio
         FROM Sede se
         INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
         LEFT JOIN (
             SELECT cs1.id_sede, cs1.id_contrato, cs1.tarifa
             FROM ContratoServicio cs1
             WHERE cs1.activo = 1
             AND cs1.fecha_inicio = (
                 SELECT MAX(cs2.fecha_inicio) FROM ContratoServicio cs2
                 WHERE cs2.id_sede = cs1.id_sede AND cs2.activo = 1
             )
         ) cs ON se.id_sede = cs.id_sede
         WHERE se.id_sede IN ($placeholders)",
        $ids
    );

    $bySede = [];
    foreach ($rows as $row) {
        $bySede[intval($row['id_sede'])] = $row;
    }

    $servicios = [];
    foreach ($planSedes as $index => $item) {
        $id_sede = intval($item['id_sede']);
        if (!isset($bySede[$id_sede])) continue;

        $servicios[] = array_merge($bySede[$id_sede], [
            'id_servicio' => -($index + 1),
            'estado' => 'programado',
            'estado_pago' => 'pendiente',
            'fecha_pago' => null,
            'forma_pago' => $item['forma_pago'] ?? null,
            'residuo' => $item['residuo'] ?? null,
            'observaciones' => $item['obs'] ?? null,
            'monto_cobrado' => null,
            'numero_manifiesto' => null,
            'numero_guia' => null,
            'peso_kg' => null,
            'firma_servicio' => null,
            'firma_pago' => null,
            'pendiente_creacion' => true
        ]);
    }

    return $servicios;
}
