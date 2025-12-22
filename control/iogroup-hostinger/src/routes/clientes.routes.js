/**
 * IO Group - Clientes Routes
 * CRUD operations for clients
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

// All routes require authentication
router.use(authMiddleware);

/**
 * GET /api/clientes
 * Get all clients
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, activo } = req.query;

        let query = `
            SELECT c.*, 
                   (SELECT COUNT(*) FROM Empresa e WHERE e.id_cliente = c.id_cliente) as total_empresas
            FROM Cliente c
            WHERE 1=1
        `;
        const params = {};

        if (search) {
            query += ` AND (c.nombre LIKE @search OR c.dni LIKE @search OR c.email LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (activo !== undefined) {
            query += ` AND c.activo = @activo`;
            params.activo = activo === 'true' ? 1 : 0;
        }

        query += ` ORDER BY c.nombre`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting clients:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo clientes'
        });
    }
});

/**
 * GET /api/clientes/:id
 * Get client by ID with related companies
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        // Get client
        const clientResult = await executeQuery(
            `SELECT * FROM Cliente WHERE id_cliente = @id`,
            { id }
        );

        if (clientResult.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Cliente no encontrado'
            });
        }

        // Get related companies
        const empresasResult = await executeQuery(
            `SELECT * FROM Empresa WHERE id_cliente = @id ORDER BY razon_social`,
            { id }
        );

        res.json({
            success: true,
            data: {
                ...clientResult.recordset[0],
                empresas: empresasResult.recordset
            }
        });

    } catch (err) {
        console.error('Error getting client:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo cliente'
        });
    }
});

/**
 * POST /api/clientes
 * Create new client
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const { nombre, dni, telefono, email, direccion, notas } = req.body;

        if (!nombre) {
            return res.status(400).json({
                success: false,
                message: 'El nombre es requerido'
            });
        }

        // Check if DNI already exists
        if (dni) {
            const existing = await executeQuery(
                `SELECT id_cliente FROM Cliente WHERE dni = @dni`,
                { dni }
            );

            if (existing.recordset.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: 'Ya existe un cliente con ese DNI'
                });
            }
        }

        const result = await executeQuery(
            `INSERT INTO Cliente (nombre, dni, telefono, email, direccion, notas)
             OUTPUT INSERTED.id_cliente
             VALUES (@nombre, @dni, @telefono, @email, @direccion, @notas)`,
            { nombre, dni, telefono, email, direccion, notas }
        );

        // Audit log
        await executeQuery(
            `INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_nuevos)
             VALUES (@userId, 'Cliente', @registroId, 'INSERT', @datos)`,
            {
                userId: req.user.id,
                registroId: result.recordset[0].id_cliente,
                datos: JSON.stringify({ nombre, dni, telefono, email })
            }
        );

        res.status(201).json({
            success: true,
            message: 'Cliente creado exitosamente',
            id: result.recordset[0].id_cliente
        });

    } catch (err) {
        console.error('Error creating client:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando cliente'
        });
    }
});

/**
 * PUT /api/clientes/:id
 * Update client
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, dni, telefono, email, direccion, notas, activo } = req.body;

        // Check if client exists
        const existing = await executeQuery(
            `SELECT * FROM Cliente WHERE id_cliente = @id`,
            { id }
        );

        if (existing.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Cliente no encontrado'
            });
        }

        // Check if DNI is taken by another client
        if (dni) {
            const dniCheck = await executeQuery(
                `SELECT id_cliente FROM Cliente WHERE dni = @dni AND id_cliente != @id`,
                { dni, id }
            );

            if (dniCheck.recordset.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: 'Ya existe otro cliente con ese DNI'
                });
            }
        }

        await executeQuery(
            `UPDATE Cliente SET 
                nombre = ISNULL(@nombre, nombre),
                dni = @dni,
                telefono = @telefono,
                email = @email,
                direccion = @direccion,
                notas = @notas,
                activo = ISNULL(@activo, activo),
                fecha_modificacion = GETDATE()
             WHERE id_cliente = @id`,
            { id, nombre, dni, telefono, email, direccion, notas, activo }
        );

        // Audit log
        await executeQuery(
            `INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion, datos_anteriores, datos_nuevos)
             VALUES (@userId, 'Cliente', @id, 'UPDATE', @anterior, @nuevo)`,
            {
                userId: req.user.id,
                id,
                anterior: JSON.stringify(existing.recordset[0]),
                nuevo: JSON.stringify({ nombre, dni, telefono, email, activo })
            }
        );

        res.json({
            success: true,
            message: 'Cliente actualizado exitosamente'
        });

    } catch (err) {
        console.error('Error updating client:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando cliente'
        });
    }
});

/**
 * DELETE /api/clientes/:id
 * Soft delete client (set activo = 0)
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        // Check if client has active companies
        const empresas = await executeQuery(
            `SELECT COUNT(*) as count FROM Empresa WHERE id_cliente = @id AND activo = 1`,
            { id }
        );

        if (empresas.recordset[0].count > 0) {
            return res.status(400).json({
                success: false,
                message: 'No se puede eliminar: el cliente tiene empresas activas asociadas'
            });
        }

        await executeQuery(
            `UPDATE Cliente SET activo = 0, fecha_modificacion = GETDATE() WHERE id_cliente = @id`,
            { id }
        );

        // Audit log
        await executeQuery(
            `INSERT INTO AuditLog (id_usuario, tabla_afectada, id_registro, accion)
             VALUES (@userId, 'Cliente', @id, 'DELETE')`,
            { userId: req.user.id, id }
        );

        res.json({
            success: true,
            message: 'Cliente eliminado exitosamente'
        });

    } catch (err) {
        console.error('Error deleting client:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando cliente'
        });
    }
});

module.exports = router;
