/**
 * IO Group - Sedes Routes
 * CRUD operations for company branches
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/sedes
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, id_empresa, activo } = req.query;

        let query = `
            SELECT s.*, e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
                   c.nombre as cliente_nombre
            FROM Sede s
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
            WHERE 1=1
        `;
        const params = {};

        if (search) {
            query += ` AND (s.nombre_comercial LIKE @search OR s.direccion LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (id_empresa) {
            query += ` AND s.id_empresa = @id_empresa`;
            params.id_empresa = id_empresa;
        }

        if (activo !== undefined) {
            query += ` AND s.activo = @activo`;
            params.activo = activo === 'true' ? 1 : 0;
        }

        query += ` ORDER BY e.razon_social, s.nombre_comercial`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting sedes:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo sedes'
        });
    }
});

/**
 * GET /api/sedes/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT s.*, e.razon_social as empresa_razon_social, e.ruc as empresa_ruc
             FROM Sede s
             INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
             WHERE s.id_sede = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Sede no encontrada'
            });
        }

        // Get active contracts
        const contratos = await executeQuery(
            `SELECT * FROM ContratoServicio WHERE id_sede = @id AND activo = 1 ORDER BY fecha_inicio DESC`,
            { id }
        );

        res.json({
            success: true,
            data: {
                ...result.recordset[0],
                contratos: contratos.recordset
            }
        });

    } catch (err) {
        console.error('Error getting sede:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo sede'
        });
    }
});

/**
 * POST /api/sedes
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const {
            id_empresa, nombre_comercial, direccion, distrito, provincia,
            departamento, contacto_nombre, contacto_telefono, contacto_email,
            latitud, longitud
        } = req.body;

        if (!id_empresa || !nombre_comercial || !direccion) {
            return res.status(400).json({
                success: false,
                message: 'Empresa, nombre comercial y dirección son requeridos'
            });
        }

        const result = await executeQuery(
            `INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, 
                              departamento, contacto_nombre, contacto_telefono, contacto_email,
                              latitud, longitud)
             OUTPUT INSERTED.id_sede
             VALUES (@id_empresa, @nombre_comercial, @direccion, @distrito, @provincia,
                    @departamento, @contacto_nombre, @contacto_telefono, @contacto_email,
                    @latitud, @longitud)`,
            {
                id_empresa, nombre_comercial, direccion, distrito, provincia, departamento,
                contacto_nombre, contacto_telefono, contacto_email, latitud, longitud
            }
        );

        res.status(201).json({
            success: true,
            message: 'Sede creada exitosamente',
            id: result.recordset[0].id_sede
        });

    } catch (err) {
        console.error('Error creating sede:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando sede'
        });
    }
});

/**
 * PUT /api/sedes/:id
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const {
            id_empresa, nombre_comercial, direccion, distrito, provincia,
            departamento, contacto_nombre, contacto_telefono, contacto_email,
            latitud, longitud, activo
        } = req.body;

        await executeQuery(
            `UPDATE Sede SET 
                id_empresa = ISNULL(@id_empresa, id_empresa),
                nombre_comercial = ISNULL(@nombre_comercial, nombre_comercial),
                direccion = ISNULL(@direccion, direccion),
                distrito = @distrito,
                provincia = @provincia,
                departamento = @departamento,
                contacto_nombre = @contacto_nombre,
                contacto_telefono = @contacto_telefono,
                contacto_email = @contacto_email,
                latitud = @latitud,
                longitud = @longitud,
                activo = ISNULL(@activo, activo),
                fecha_modificacion = GETDATE()
             WHERE id_sede = @id`,
            {
                id, id_empresa, nombre_comercial, direccion, distrito, provincia, departamento,
                contacto_nombre, contacto_telefono, contacto_email, latitud, longitud, activo
            }
        );

        res.json({
            success: true,
            message: 'Sede actualizada exitosamente'
        });

    } catch (err) {
        console.error('Error updating sede:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando sede'
        });
    }
});

/**
 * DELETE /api/sedes/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        // Check for active services
        const servicios = await executeQuery(
            `SELECT COUNT(*) as count FROM Servicio WHERE id_sede = @id AND estado != 'cancelado'`,
            { id }
        );

        if (servicios.recordset[0].count > 0) {
            return res.status(400).json({
                success: false,
                message: 'No se puede eliminar: la sede tiene servicios asociados'
            });
        }

        await executeQuery(
            `UPDATE Sede SET activo = 0, fecha_modificacion = GETDATE() WHERE id_sede = @id`,
            { id }
        );

        res.json({
            success: true,
            message: 'Sede eliminada exitosamente'
        });

    } catch (err) {
        console.error('Error deleting sede:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando sede'
        });
    }
});

module.exports = router;
