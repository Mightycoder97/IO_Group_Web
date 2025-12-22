/**
 * IO Group - Plantas Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/plantas
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, tipo_tratamiento, activo } = req.query;

        let query = `SELECT * FROM Planta WHERE 1=1`;
        const params = {};

        if (search) {
            query += ` AND (razon_social LIKE @search OR nombre_comercial LIKE @search OR ruc LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (tipo_tratamiento) {
            query += ` AND tipo_tratamiento = @tipo_tratamiento`;
            params.tipo_tratamiento = tipo_tratamiento;
        }

        if (activo !== undefined) {
            query += ` AND activo = @activo`;
            params.activo = activo === 'true' ? 1 : 0;
        }

        query += ` ORDER BY nombre_comercial`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting plants:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo plantas'
        });
    }
});

/**
 * GET /api/plantas/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT * FROM Planta WHERE id_planta = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Planta no encontrada'
            });
        }

        res.json({
            success: true,
            data: result.recordset[0]
        });

    } catch (err) {
        console.error('Error getting plant:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo planta'
        });
    }
});

/**
 * POST /api/plantas
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const {
            razon_social, ruc, nombre_comercial, direccion, distrito, provincia,
            departamento, tipo_tratamiento, codigo_eps, telefono, contacto_nombre, contacto_email
        } = req.body;

        if (!razon_social || !ruc || !direccion) {
            return res.status(400).json({
                success: false,
                message: 'Razón social, RUC y dirección son requeridos'
            });
        }

        // Check RUC
        const existing = await executeQuery(
            `SELECT id_planta FROM Planta WHERE ruc = @ruc`,
            { ruc }
        );

        if (existing.recordset.length > 0) {
            return res.status(400).json({
                success: false,
                message: 'Ya existe una planta con ese RUC'
            });
        }

        const result = await executeQuery(
            `INSERT INTO Planta (razon_social, ruc, nombre_comercial, direccion, distrito, provincia,
                                departamento, tipo_tratamiento, codigo_eps, telefono, contacto_nombre, contacto_email)
             OUTPUT INSERTED.id_planta
             VALUES (@razon_social, @ruc, @nombre_comercial, @direccion, @distrito, @provincia,
                    @departamento, @tipo_tratamiento, @codigo_eps, @telefono, @contacto_nombre, @contacto_email)`,
            {
                razon_social, ruc, nombre_comercial, direccion, distrito, provincia,
                departamento, tipo_tratamiento, codigo_eps, telefono, contacto_nombre, contacto_email
            }
        );

        res.status(201).json({
            success: true,
            message: 'Planta creada exitosamente',
            id: result.recordset[0].id_planta
        });

    } catch (err) {
        console.error('Error creating plant:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando planta'
        });
    }
});

/**
 * PUT /api/plantas/:id
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const {
            razon_social, ruc, nombre_comercial, direccion, distrito, provincia,
            departamento, tipo_tratamiento, codigo_eps, telefono, contacto_nombre, contacto_email, activo
        } = req.body;

        await executeQuery(
            `UPDATE Planta SET 
                razon_social = ISNULL(@razon_social, razon_social),
                ruc = ISNULL(@ruc, ruc),
                nombre_comercial = @nombre_comercial,
                direccion = ISNULL(@direccion, direccion),
                distrito = @distrito,
                provincia = @provincia,
                departamento = @departamento,
                tipo_tratamiento = @tipo_tratamiento,
                codigo_eps = @codigo_eps,
                telefono = @telefono,
                contacto_nombre = @contacto_nombre,
                contacto_email = @contacto_email,
                activo = ISNULL(@activo, activo),
                fecha_modificacion = GETDATE()
             WHERE id_planta = @id`,
            {
                id, razon_social, ruc, nombre_comercial, direccion, distrito, provincia,
                departamento, tipo_tratamiento, codigo_eps, telefono, contacto_nombre, contacto_email, activo
            }
        );

        res.json({
            success: true,
            message: 'Planta actualizada exitosamente'
        });

    } catch (err) {
        console.error('Error updating plant:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando planta'
        });
    }
});

/**
 * DELETE /api/plantas/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        await executeQuery(
            `UPDATE Planta SET activo = 0, fecha_modificacion = GETDATE() WHERE id_planta = @id`,
            { id }
        );

        res.json({
            success: true,
            message: 'Planta eliminada exitosamente'
        });

    } catch (err) {
        console.error('Error deleting plant:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando planta'
        });
    }
});

module.exports = router;
