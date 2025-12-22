/**
 * IO Group - Alertas Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);
router.use(canView);

// Get all expiring documents
router.get('/', async (req, res) => {
    try {
        const { estado } = req.query;

        let query = `SELECT * FROM vw_DocumentosPorVencer WHERE 1=1`;
        const params = {};

        if (estado) {
            query += ` AND estado = @estado`;
            params.estado = estado;
        }

        query += ` ORDER BY dias_restantes ASC`;

        const result = await executeQuery(query, params);
        res.json({ success: true, data: result.recordset, total: result.recordset.length });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error obteniendo alertas' });
    }
});

// Get critical alerts count
router.get('/count', async (req, res) => {
    try {
        const result = await executeQuery(`
            SELECT 
                SUM(CASE WHEN estado = 'VENCIDO' THEN 1 ELSE 0 END) as vencidos,
                SUM(CASE WHEN estado = 'CRITICO' THEN 1 ELSE 0 END) as criticos,
                SUM(CASE WHEN estado = 'ADVERTENCIA' THEN 1 ELSE 0 END) as advertencias,
                SUM(CASE WHEN estado = 'OK' THEN 1 ELSE 0 END) as ok
            FROM vw_DocumentosPorVencer
        `);
        res.json({ success: true, data: result.recordset[0] });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error contando alertas' });
    }
});

// Get alerts by type
router.get('/vehiculos', async (req, res) => {
    try {
        const result = await executeQuery(`
            SELECT * FROM vw_DocumentosPorVencer 
            WHERE tipo_documento = 'Vehiculo'
            ORDER BY dias_restantes ASC
        `);
        res.json({ success: true, data: result.recordset });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error' });
    }
});

router.get('/contratos', async (req, res) => {
    try {
        const result = await executeQuery(`
            SELECT * FROM vw_DocumentosPorVencer 
            WHERE tipo_documento IN ('ContratoServicio', 'ContratoLaboral')
            ORDER BY dias_restantes ASC
        `);
        res.json({ success: true, data: result.recordset });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error' });
    }
});

router.get('/licencias', async (req, res) => {
    try {
        const result = await executeQuery(`
            SELECT * FROM vw_DocumentosPorVencer 
            WHERE tipo_documento = 'Empleado'
            ORDER BY dias_restantes ASC
        `);
        res.json({ success: true, data: result.recordset });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Error' });
    }
});

module.exports = router;
