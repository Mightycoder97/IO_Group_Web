/**
 * IO Group - Reportes Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);
router.use(canView);

// Dashboard summary
router.get('/dashboard', async (req, res) => {
    try {
        const stats = await executeQuery(`
            SELECT
                (SELECT COUNT(*) FROM Cliente WHERE activo = 1) as total_clientes,
                (SELECT COUNT(*) FROM Empresa WHERE activo = 1) as total_empresas,
                (SELECT COUNT(*) FROM Sede WHERE activo = 1) as total_sedes,
                (SELECT COUNT(*) FROM Servicio WHERE estado = 'programado') as servicios_programados,
                (SELECT COUNT(*) FROM Servicio WHERE estado = 'completado' AND MONTH(fecha_ejecucion) = MONTH(GETDATE())) as servicios_mes,
                (SELECT ISNULL(SUM(peso_kg), 0) FROM Manifiesto m INNER JOIN Servicio s ON m.id_servicio = s.id_servicio WHERE MONTH(s.fecha_ejecucion) = MONTH(GETDATE())) as kg_mes,
                (SELECT ISNULL(SUM(monto_total), 0) FROM Factura WHERE estado != 'anulada' AND MONTH(fecha_emision) = MONTH(GETDATE())) as facturacion_mes,
                (SELECT COUNT(*) FROM Factura WHERE estado = 'emitida') as facturas_pendientes,
                (SELECT COUNT(*) FROM vw_DocumentosPorVencer WHERE estado IN ('VENCIDO', 'CRITICO')) as alertas_criticas
        `);

        res.json({ success: true, data: stats.recordset[0] });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error obteniendo dashboard' });
    }
});

// Services by client
router.get('/servicios-por-cliente', async (req, res) => {
    try {
        const { fecha_desde, fecha_hasta } = req.query;
        let query = `
            SELECT c.nombre as cliente, e.razon_social as empresa, 
                   COUNT(s.id_servicio) as total_servicios,
                   ISNULL(SUM(m.peso_kg), 0) as total_kg,
                   ISNULL(SUM(f.monto_total), 0) as total_facturado
            FROM Cliente c
            INNER JOIN Empresa e ON c.id_cliente = e.id_cliente
            INNER JOIN Sede se ON e.id_empresa = se.id_empresa
            INNER JOIN Servicio s ON se.id_sede = s.id_sede
            LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
            LEFT JOIN Factura f ON s.id_servicio = f.id_servicio
            WHERE s.estado = 'completado'`;
        const params = {};
        if (fecha_desde) { query += ` AND s.fecha_ejecucion >= @fecha_desde`; params.fecha_desde = fecha_desde; }
        if (fecha_hasta) { query += ` AND s.fecha_ejecucion <= @fecha_hasta`; params.fecha_hasta = fecha_hasta; }
        query += ` GROUP BY c.nombre, e.razon_social ORDER BY total_servicios DESC`;

        const result = await executeQuery(query, params);
        res.json({ success: true, data: result.recordset });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error generando reporte' });
    }
});

// Monthly billing
router.get('/facturacion-mensual', async (req, res) => {
    try {
        const { anio } = req.query;
        const result = await executeQuery(`
            SELECT MONTH(fecha_emision) as mes, YEAR(fecha_emision) as anio,
                   COUNT(*) as total_facturas,
                   SUM(CASE WHEN estado = 'pagada' THEN monto_total ELSE 0 END) as total_pagado,
                   SUM(CASE WHEN estado = 'emitida' THEN monto_total ELSE 0 END) as total_pendiente,
                   SUM(CASE WHEN estado != 'anulada' THEN monto_total ELSE 0 END) as total_facturado
            FROM Factura WHERE YEAR(fecha_emision) = ISNULL(@anio, YEAR(GETDATE()))
            GROUP BY YEAR(fecha_emision), MONTH(fecha_emision)
            ORDER BY anio, mes`, { anio });
        res.json({ success: true, data: result.recordset });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error generando reporte' });
    }
});

// Residues by type
router.get('/residuos-por-tipo', async (req, res) => {
    try {
        const { fecha_desde, fecha_hasta } = req.query;
        let query = `SELECT tipo_residuo, COUNT(*) as total_servicios, SUM(peso_kg) as total_kg
            FROM Manifiesto m INNER JOIN Servicio s ON m.id_servicio = s.id_servicio WHERE 1=1`;
        const params = {};
        if (fecha_desde) { query += ` AND s.fecha_ejecucion >= @fecha_desde`; params.fecha_desde = fecha_desde; }
        if (fecha_hasta) { query += ` AND s.fecha_ejecucion <= @fecha_hasta`; params.fecha_hasta = fecha_hasta; }
        query += ` GROUP BY tipo_residuo ORDER BY total_kg DESC`;

        const result = await executeQuery(query, params);
        res.json({ success: true, data: result.recordset });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error generando reporte' });
    }
});

// Employee performance
router.get('/rendimiento-empleados', async (req, res) => {
    try {
        const { fecha_desde, fecha_hasta } = req.query;
        let query = `
            SELECT e.nombres + ' ' + e.apellidos as empleado, se.rol,
                   COUNT(DISTINCT s.id_servicio) as total_servicios,
                   COUNT(DISTINCT s.id_ruta) as total_rutas
            FROM Empleado e
            INNER JOIN ServicioEmpleado se ON e.id_empleado = se.id_empleado
            INNER JOIN Servicio s ON se.id_servicio = s.id_servicio
            WHERE s.estado = 'completado'`;
        const params = {};
        if (fecha_desde) { query += ` AND s.fecha_ejecucion >= @fecha_desde`; params.fecha_desde = fecha_desde; }
        if (fecha_hasta) { query += ` AND s.fecha_ejecucion <= @fecha_hasta`; params.fecha_hasta = fecha_hasta; }
        query += ` GROUP BY e.nombres, e.apellidos, se.rol ORDER BY total_servicios DESC`;

        const result = await executeQuery(query, params);
        res.json({ success: true, data: result.recordset });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error generando reporte' });
    }
});

// Vehicle usage
router.get('/uso-vehiculos', async (req, res) => {
    try {
        const { fecha_desde, fecha_hasta } = req.query;
        let query = `
            SELECT v.placa, v.marca, v.modelo,
                   COUNT(DISTINCT r.id_ruta) as total_rutas,
                   COUNT(s.id_servicio) as total_servicios,
                   ISNULL(SUM(r.km_final - r.km_inicial), 0) as km_recorridos
            FROM Vehiculo v
            LEFT JOIN Ruta r ON v.id_vehiculo = r.id_vehiculo
            LEFT JOIN Servicio s ON r.id_ruta = s.id_ruta
            WHERE 1=1`;
        const params = {};
        if (fecha_desde) { query += ` AND r.fecha >= @fecha_desde`; params.fecha_desde = fecha_desde; }
        if (fecha_hasta) { query += ` AND r.fecha <= @fecha_hasta`; params.fecha_hasta = fecha_hasta; }
        query += ` GROUP BY v.placa, v.marca, v.modelo ORDER BY total_rutas DESC`;

        const result = await executeQuery(query, params);
        res.json({ success: true, data: result.recordset });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error generando reporte' });
    }
});

module.exports = router;
