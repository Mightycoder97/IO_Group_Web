/**
 * IO Group - Facturas Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

router.get('/', canView, async (req, res) => {
    try {
        const { search, estado, fecha_desde, fecha_hasta } = req.query;
        let query = `
            SELECT f.*, s.codigo_servicio, e.razon_social as empresa_razon_social, e.ruc as empresa_ruc
            FROM Factura f
            INNER JOIN Servicio s ON f.id_servicio = s.id_servicio
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa WHERE 1=1`;
        const params = {};
        if (search) { query += ` AND f.numero_factura LIKE @search`; params.search = `%${search}%`; }
        if (estado) { query += ` AND f.estado = @estado`; params.estado = estado; }
        if (fecha_desde) { query += ` AND f.fecha_emision >= @fecha_desde`; params.fecha_desde = fecha_desde; }
        if (fecha_hasta) { query += ` AND f.fecha_emision <= @fecha_hasta`; params.fecha_hasta = fecha_hasta; }
        query += ` ORDER BY f.fecha_emision DESC`;
        const result = await executeQuery(query, params);
        res.json({ success: true, data: result.recordset, total: result.recordset.length });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error obteniendo facturas' });
    }
});

router.get('/:id', canView, async (req, res) => {
    try {
        const result = await executeQuery(
            `SELECT f.*, s.codigo_servicio, e.razon_social, e.ruc, e.direccion_fiscal
             FROM Factura f INNER JOIN Servicio s ON f.id_servicio = s.id_servicio
             INNER JOIN Sede se ON s.id_sede = se.id_sede INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             WHERE f.id_factura = @id`, { id: req.params.id });
        if (result.recordset.length === 0) return res.status(404).json({ success: false, message: 'Factura no encontrada' });
        res.json({ success: true, data: result.recordset[0] });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error obteniendo factura' });
    }
});

router.post('/', canEdit, async (req, res) => {
    try {
        const { id_servicio, serie, numero_factura, fecha_emision, monto_subtotal, igv, monto_total, fecha_vencimiento } = req.body;
        if (!id_servicio || !numero_factura || !monto_total) return res.status(400).json({ success: false, message: 'Campos requeridos faltantes' });
        const existing = await executeQuery(`SELECT id_factura FROM Factura WHERE id_servicio = @id_servicio`, { id_servicio });
        if (existing.recordset.length > 0) return res.status(400).json({ success: false, message: 'Ya existe factura para este servicio' });
        const sub = monto_subtotal || (monto_total / 1.18);
        const tax = igv || (monto_total - sub);
        const result = await executeQuery(
            `INSERT INTO Factura (id_servicio, serie, numero_factura, fecha_emision, monto_subtotal, igv, monto_total, fecha_vencimiento)
             OUTPUT INSERTED.id_factura VALUES (@id_servicio, @serie, @numero_factura, @fecha_emision, @sub, @tax, @monto_total, @fecha_vencimiento)`,
            { id_servicio, serie, numero_factura, fecha_emision, sub, tax, monto_total, fecha_vencimiento });
        res.status(201).json({ success: true, message: 'Factura creada', id: result.recordset[0].id_factura });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error creando factura' });
    }
});

router.put('/:id', canEdit, async (req, res) => {
    try {
        const { serie, numero_factura, fecha_emision, monto_subtotal, igv, monto_total, estado, fecha_vencimiento, fecha_pago, metodo_pago } = req.body;
        await executeQuery(
            `UPDATE Factura SET serie=@serie, numero_factura=ISNULL(@numero_factura,numero_factura), fecha_emision=ISNULL(@fecha_emision,fecha_emision),
             monto_subtotal=@monto_subtotal, igv=@igv, monto_total=ISNULL(@monto_total,monto_total), estado=@estado, fecha_vencimiento=@fecha_vencimiento,
             fecha_pago=@fecha_pago, metodo_pago=@metodo_pago, fecha_modificacion=GETDATE() WHERE id_factura=@id`,
            { id: req.params.id, serie, numero_factura, fecha_emision, monto_subtotal, igv, monto_total, estado, fecha_vencimiento, fecha_pago, metodo_pago });
        res.json({ success: true, message: 'Factura actualizada' });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error actualizando factura' });
    }
});

router.put('/:id/pagar', canEdit, async (req, res) => {
    try {
        await executeQuery(`UPDATE Factura SET estado='pagada', fecha_pago=GETDATE(), metodo_pago=@metodo, fecha_modificacion=GETDATE() WHERE id_factura=@id`,
            { id: req.params.id, metodo: req.body.metodo_pago });
        res.json({ success: true, message: 'Factura pagada' });
    } catch (err) { res.status(500).json({ success: false, message: 'Error' }); }
});

router.put('/:id/anular', canEdit, async (req, res) => {
    try {
        await executeQuery(`UPDATE Factura SET estado='anulada', fecha_modificacion=GETDATE() WHERE id_factura=@id`, { id: req.params.id });
        res.json({ success: true, message: 'Factura anulada' });
    } catch (err) { res.status(500).json({ success: false, message: 'Error' }); }
});

router.delete('/:id', canEdit, async (req, res) => {
    try {
        await executeQuery(`DELETE FROM Factura WHERE id_factura = @id`, { id: req.params.id });
        res.json({ success: true, message: 'Factura eliminada' });
    } catch (err) { res.status(500).json({ success: false, message: 'Error eliminando factura' }); }
});

module.exports = router;
