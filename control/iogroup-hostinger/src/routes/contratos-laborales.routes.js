/**
 * IO Group - Contratos Laborales Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { adminOnly, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/contratos-laborales
 */
router.get('/', canView, async (req, res) => {
    try {
        const { id_empleado, activo, vigentes } = req.query;

        let query = `
            SELECT cl.*, e.nombres + ' ' + e.apellidos as empleado_nombre, e.dni as empleado_dni
            FROM ContratoLaboral cl
            INNER JOIN Empleado e ON cl.id_empleado = e.id_empleado
            WHERE 1=1
        `;
        const params = {};

        if (id_empleado) {
            query += ` AND cl.id_empleado = @id_empleado`;
            params.id_empleado = id_empleado;
        }

        if (activo !== undefined) {
            query += ` AND cl.activo = @activo`;
            params.activo = activo === 'true' ? 1 : 0;
        }

        if (vigentes === 'true') {
            query += ` AND (cl.fecha_fin IS NULL OR cl.fecha_fin >= GETDATE())`;
        }

        query += ` ORDER BY cl.fecha_inicio DESC`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting labor contracts:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo contratos laborales'
        });
    }
});

/**
 * GET /api/contratos-laborales/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT cl.*, e.nombres + ' ' + e.apellidos as empleado_nombre, e.dni as empleado_dni
             FROM ContratoLaboral cl
             INNER JOIN Empleado e ON cl.id_empleado = e.id_empleado
             WHERE cl.id_contrato_laboral = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Contrato no encontrado'
            });
        }

        res.json({
            success: true,
            data: result.recordset[0]
        });

    } catch (err) {
        console.error('Error getting labor contract:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo contrato laboral'
        });
    }
});

/**
 * POST /api/contratos-laborales
 */
router.post('/', adminOnly, async (req, res) => {
    try {
        const { id_empleado, cargo, fecha_inicio, fecha_fin, sueldo, tipo_contrato, doc_escaneado } = req.body;

        if (!id_empleado || !cargo || !fecha_inicio) {
            return res.status(400).json({
                success: false,
                message: 'Empleado, cargo y fecha de inicio son requeridos'
            });
        }

        const result = await executeQuery(
            `INSERT INTO ContratoLaboral (id_empleado, cargo, fecha_inicio, fecha_fin, sueldo, tipo_contrato, doc_escaneado)
             OUTPUT INSERTED.id_contrato_laboral
             VALUES (@id_empleado, @cargo, @fecha_inicio, @fecha_fin, @sueldo, @tipo_contrato, @doc_escaneado)`,
            { id_empleado, cargo, fecha_inicio, fecha_fin, sueldo, tipo_contrato, doc_escaneado }
        );

        res.status(201).json({
            success: true,
            message: 'Contrato laboral creado exitosamente',
            id: result.recordset[0].id_contrato_laboral
        });

    } catch (err) {
        console.error('Error creating labor contract:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando contrato laboral'
        });
    }
});

/**
 * PUT /api/contratos-laborales/:id
 */
router.put('/:id', adminOnly, async (req, res) => {
    try {
        const { id } = req.params;
        const { id_empleado, cargo, fecha_inicio, fecha_fin, sueldo, tipo_contrato, doc_escaneado, activo } = req.body;

        await executeQuery(
            `UPDATE ContratoLaboral SET 
                id_empleado = ISNULL(@id_empleado, id_empleado),
                cargo = ISNULL(@cargo, cargo),
                fecha_inicio = ISNULL(@fecha_inicio, fecha_inicio),
                fecha_fin = @fecha_fin,
                sueldo = @sueldo,
                tipo_contrato = @tipo_contrato,
                doc_escaneado = @doc_escaneado,
                activo = ISNULL(@activo, activo),
                fecha_modificacion = GETDATE()
             WHERE id_contrato_laboral = @id`,
            { id, id_empleado, cargo, fecha_inicio, fecha_fin, sueldo, tipo_contrato, doc_escaneado, activo }
        );

        res.json({
            success: true,
            message: 'Contrato laboral actualizado exitosamente'
        });

    } catch (err) {
        console.error('Error updating labor contract:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando contrato laboral'
        });
    }
});

/**
 * DELETE /api/contratos-laborales/:id
 */
router.delete('/:id', adminOnly, async (req, res) => {
    try {
        const { id } = req.params;

        await executeQuery(
            `UPDATE ContratoLaboral SET activo = 0, fecha_modificacion = GETDATE() WHERE id_contrato_laboral = @id`,
            { id }
        );

        res.json({
            success: true,
            message: 'Contrato laboral eliminado exitosamente'
        });

    } catch (err) {
        console.error('Error deleting labor contract:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando contrato laboral'
        });
    }
});

module.exports = router;
