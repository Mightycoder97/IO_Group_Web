/**
 * IO Group - Guias Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/guias
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, fecha_desde, fecha_hasta } = req.query;

        let query = `
            SELECT g.*, s.codigo_servicio, s.fecha_ejecucion,
                   se.nombre_comercial as sede_nombre,
                   e.razon_social as empresa_razon_social,
                   p.nombre_comercial as planta_nombre
            FROM Guia g
            INNER JOIN Servicio s ON g.id_servicio = s.id_servicio
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            INNER JOIN Planta p ON s.id_planta = p.id_planta
            WHERE 1=1
        `;
        const params = {};

        if (search) {
            query += ` AND (g.numero_guia LIKE @search OR g.serie LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (fecha_desde) {
            query += ` AND g.fecha_emision >= @fecha_desde`;
            params.fecha_desde = fecha_desde;
        }

        if (fecha_hasta) {
            query += ` AND g.fecha_emision <= @fecha_hasta`;
            params.fecha_hasta = fecha_hasta;
        }

        query += ` ORDER BY g.fecha_emision DESC`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting guides:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo guías'
        });
    }
});

/**
 * GET /api/guias/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT g.*, s.codigo_servicio, s.fecha_ejecucion,
                    se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                    e.razon_social as empresa_razon_social,
                    p.nombre_comercial as planta_nombre, p.direccion as planta_direccion
             FROM Guia g
             INNER JOIN Servicio s ON g.id_servicio = s.id_servicio
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             INNER JOIN Planta p ON s.id_planta = p.id_planta
             WHERE g.id_guia = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Guía no encontrada'
            });
        }

        res.json({
            success: true,
            data: result.recordset[0]
        });

    } catch (err) {
        console.error('Error getting guide:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo guía'
        });
    }
});

/**
 * POST /api/guias
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const {
            id_servicio, serie, numero_guia, fecha_emision,
            punto_partida, punto_llegada, doc_escaneado, observaciones
        } = req.body;

        if (!id_servicio || !numero_guia || !fecha_emision) {
            return res.status(400).json({
                success: false,
                message: 'Servicio, número de guía y fecha de emisión son requeridos'
            });
        }

        // Check if guide exists for this service
        const existing = await executeQuery(
            `SELECT id_guia FROM Guia WHERE id_servicio = @id_servicio`,
            { id_servicio }
        );

        if (existing.recordset.length > 0) {
            return res.status(400).json({
                success: false,
                message: 'Ya existe una guía para este servicio'
            });
        }

        const result = await executeQuery(
            `INSERT INTO Guia (id_servicio, serie, numero_guia, fecha_emision,
                              punto_partida, punto_llegada, doc_escaneado, observaciones)
             OUTPUT INSERTED.id_guia
             VALUES (@id_servicio, @serie, @numero_guia, @fecha_emision,
                    @punto_partida, @punto_llegada, @doc_escaneado, @observaciones)`,
            { id_servicio, serie, numero_guia, fecha_emision, punto_partida, punto_llegada, doc_escaneado, observaciones }
        );

        res.status(201).json({
            success: true,
            message: 'Guía creada exitosamente',
            id: result.recordset[0].id_guia
        });

    } catch (err) {
        console.error('Error creating guide:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando guía'
        });
    }
});

/**
 * PUT /api/guias/:id
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const {
            serie, numero_guia, fecha_emision,
            punto_partida, punto_llegada, doc_escaneado, observaciones
        } = req.body;

        await executeQuery(
            `UPDATE Guia SET 
                serie = @serie,
                numero_guia = ISNULL(@numero_guia, numero_guia),
                fecha_emision = ISNULL(@fecha_emision, fecha_emision),
                punto_partida = @punto_partida,
                punto_llegada = @punto_llegada,
                doc_escaneado = @doc_escaneado,
                observaciones = @observaciones,
                fecha_modificacion = GETDATE()
             WHERE id_guia = @id`,
            { id, serie, numero_guia, fecha_emision, punto_partida, punto_llegada, doc_escaneado, observaciones }
        );

        res.json({
            success: true,
            message: 'Guía actualizada exitosamente'
        });

    } catch (err) {
        console.error('Error updating guide:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando guía'
        });
    }
});

/**
 * DELETE /api/guias/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        await executeQuery(`DELETE FROM Guia WHERE id_guia = @id`, { id });

        res.json({
            success: true,
            message: 'Guía eliminada exitosamente'
        });

    } catch (err) {
        console.error('Error deleting guide:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando guía'
        });
    }
});

module.exports = router;
