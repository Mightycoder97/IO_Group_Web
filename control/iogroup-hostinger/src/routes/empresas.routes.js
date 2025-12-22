/**
 * IO Group - Empresas Routes
 * CRUD operations for companies
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/empresas
 * Get all companies
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, id_cliente, activo } = req.query;

        let query = `
            SELECT e.*, c.nombre as cliente_nombre,
                   (SELECT COUNT(*) FROM Sede s WHERE s.id_empresa = e.id_empresa) as total_sedes
            FROM Empresa e
            INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
            WHERE 1=1
        `;
        const params = {};

        if (search) {
            query += ` AND (e.razon_social LIKE @search OR e.ruc LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (id_cliente) {
            query += ` AND e.id_cliente = @id_cliente`;
            params.id_cliente = id_cliente;
        }

        if (activo !== undefined) {
            query += ` AND e.activo = @activo`;
            params.activo = activo === 'true' ? 1 : 0;
        }

        query += ` ORDER BY e.razon_social`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting companies:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo empresas'
        });
    }
});

/**
 * GET /api/empresas/:id
 * Get company by ID
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT e.*, c.nombre as cliente_nombre
             FROM Empresa e
             INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
             WHERE e.id_empresa = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Empresa no encontrada'
            });
        }

        // Get sedes
        const sedes = await executeQuery(
            `SELECT * FROM Sede WHERE id_empresa = @id ORDER BY nombre_comercial`,
            { id }
        );

        res.json({
            success: true,
            data: {
                ...result.recordset[0],
                sedes: sedes.recordset
            }
        });

    } catch (err) {
        console.error('Error getting company:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo empresa'
        });
    }
});

/**
 * POST /api/empresas
 * Create new company
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const { id_cliente, razon_social, ruc, direccion_fiscal, telefono, email } = req.body;

        if (!id_cliente || !razon_social || !ruc) {
            return res.status(400).json({
                success: false,
                message: 'Cliente, razón social y RUC son requeridos'
            });
        }

        // Validate RUC format (11 digits)
        if (!/^\d{11}$/.test(ruc)) {
            return res.status(400).json({
                success: false,
                message: 'El RUC debe tener 11 dígitos'
            });
        }

        // Check if RUC exists
        const existing = await executeQuery(
            `SELECT id_empresa FROM Empresa WHERE ruc = @ruc`,
            { ruc }
        );

        if (existing.recordset.length > 0) {
            return res.status(400).json({
                success: false,
                message: 'Ya existe una empresa con ese RUC'
            });
        }

        const result = await executeQuery(
            `INSERT INTO Empresa (id_cliente, razon_social, ruc, direccion_fiscal, telefono, email)
             OUTPUT INSERTED.id_empresa
             VALUES (@id_cliente, @razon_social, @ruc, @direccion_fiscal, @telefono, @email)`,
            { id_cliente, razon_social, ruc, direccion_fiscal, telefono, email }
        );

        res.status(201).json({
            success: true,
            message: 'Empresa creada exitosamente',
            id: result.recordset[0].id_empresa
        });

    } catch (err) {
        console.error('Error creating company:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando empresa'
        });
    }
});

/**
 * PUT /api/empresas/:id
 * Update company
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const { id_cliente, razon_social, ruc, direccion_fiscal, telefono, email, activo } = req.body;

        // Check if RUC is taken by another company
        if (ruc) {
            const rucCheck = await executeQuery(
                `SELECT id_empresa FROM Empresa WHERE ruc = @ruc AND id_empresa != @id`,
                { ruc, id }
            );

            if (rucCheck.recordset.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: 'Ya existe otra empresa con ese RUC'
                });
            }
        }

        await executeQuery(
            `UPDATE Empresa SET 
                id_cliente = ISNULL(@id_cliente, id_cliente),
                razon_social = ISNULL(@razon_social, razon_social),
                ruc = ISNULL(@ruc, ruc),
                direccion_fiscal = @direccion_fiscal,
                telefono = @telefono,
                email = @email,
                activo = ISNULL(@activo, activo),
                fecha_modificacion = GETDATE()
             WHERE id_empresa = @id`,
            { id, id_cliente, razon_social, ruc, direccion_fiscal, telefono, email, activo }
        );

        res.json({
            success: true,
            message: 'Empresa actualizada exitosamente'
        });

    } catch (err) {
        console.error('Error updating company:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando empresa'
        });
    }
});

/**
 * DELETE /api/empresas/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        // Check for active sedes
        const sedes = await executeQuery(
            `SELECT COUNT(*) as count FROM Sede WHERE id_empresa = @id AND activo = 1`,
            { id }
        );

        if (sedes.recordset[0].count > 0) {
            return res.status(400).json({
                success: false,
                message: 'No se puede eliminar: la empresa tiene sedes activas'
            });
        }

        await executeQuery(
            `UPDATE Empresa SET activo = 0, fecha_modificacion = GETDATE() WHERE id_empresa = @id`,
            { id }
        );

        res.json({
            success: true,
            message: 'Empresa eliminada exitosamente'
        });

    } catch (err) {
        console.error('Error deleting company:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando empresa'
        });
    }
});

module.exports = router;
