/**
 * IO Group - Empleados Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView, adminOnly } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/empleados
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, cargo, activo } = req.query;

        let query = `
            SELECT e.*, 
                   (SELECT TOP 1 cargo FROM ContratoLaboral cl 
                    WHERE cl.id_empleado = e.id_empleado AND cl.activo = 1 
                    ORDER BY cl.fecha_inicio DESC) as cargo_actual
            FROM Empleado e
            WHERE 1=1
        `;
        const params = {};

        if (search) {
            query += ` AND (e.nombres LIKE @search OR e.apellidos LIKE @search OR e.dni LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (activo !== undefined) {
            query += ` AND e.activo = @activo`;
            params.activo = activo === 'true' ? 1 : 0;
        }

        query += ` ORDER BY e.apellidos, e.nombres`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting employees:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo empleados'
        });
    }
});

/**
 * GET /api/empleados/conductores
 * Get only employees with license (drivers)
 */
router.get('/conductores', canView, async (req, res) => {
    try {
        const result = await executeQuery(
            `SELECT e.* FROM Empleado e
             WHERE e.activo = 1 AND e.licencia_conducir IS NOT NULL
             ORDER BY e.apellidos, e.nombres`
        );

        res.json({
            success: true,
            data: result.recordset
        });

    } catch (err) {
        res.status(500).json({
            success: false,
            message: 'Error obteniendo conductores'
        });
    }
});

/**
 * GET /api/empleados/operarios
 * Get employees without driver license (helpers)
 */
router.get('/operarios', canView, async (req, res) => {
    try {
        const result = await executeQuery(
            `SELECT e.* FROM Empleado e
             WHERE e.activo = 1 
             ORDER BY e.apellidos, e.nombres`
        );

        res.json({
            success: true,
            data: result.recordset
        });

    } catch (err) {
        res.status(500).json({
            success: false,
            message: 'Error obteniendo operarios'
        });
    }
});

/**
 * GET /api/empleados/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT * FROM Empleado WHERE id_empleado = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Empleado no encontrado'
            });
        }

        // Get contracts
        const contratos = await executeQuery(
            `SELECT * FROM ContratoLaboral WHERE id_empleado = @id ORDER BY fecha_inicio DESC`,
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
        console.error('Error getting employee:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo empleado'
        });
    }
});

/**
 * POST /api/empleados
 */
router.post('/', adminOnly, async (req, res) => {
    try {
        const {
            dni, nombres, apellidos, telefono, email, direccion,
            fecha_nacimiento, licencia_conducir, categoria_licencia, fecha_venc_licencia
        } = req.body;

        if (!dni || !nombres || !apellidos) {
            return res.status(400).json({
                success: false,
                message: 'DNI, nombres y apellidos son requeridos'
            });
        }

        // Check DNI
        const existing = await executeQuery(
            `SELECT id_empleado FROM Empleado WHERE dni = @dni`,
            { dni }
        );

        if (existing.recordset.length > 0) {
            return res.status(400).json({
                success: false,
                message: 'Ya existe un empleado con ese DNI'
            });
        }

        const result = await executeQuery(
            `INSERT INTO Empleado (dni, nombres, apellidos, telefono, email, direccion,
                                  fecha_nacimiento, licencia_conducir, categoria_licencia, fecha_venc_licencia)
             OUTPUT INSERTED.id_empleado
             VALUES (@dni, @nombres, @apellidos, @telefono, @email, @direccion,
                    @fecha_nacimiento, @licencia_conducir, @categoria_licencia, @fecha_venc_licencia)`,
            {
                dni, nombres, apellidos, telefono, email, direccion,
                fecha_nacimiento, licencia_conducir, categoria_licencia, fecha_venc_licencia
            }
        );

        res.status(201).json({
            success: true,
            message: 'Empleado creado exitosamente',
            id: result.recordset[0].id_empleado
        });

    } catch (err) {
        console.error('Error creating employee:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando empleado'
        });
    }
});

/**
 * PUT /api/empleados/:id
 */
router.put('/:id', adminOnly, async (req, res) => {
    try {
        const { id } = req.params;
        const {
            dni, nombres, apellidos, telefono, email, direccion,
            fecha_nacimiento, licencia_conducir, categoria_licencia, fecha_venc_licencia, activo
        } = req.body;

        // Check DNI uniqueness
        if (dni) {
            const dniCheck = await executeQuery(
                `SELECT id_empleado FROM Empleado WHERE dni = @dni AND id_empleado != @id`,
                { dni, id }
            );

            if (dniCheck.recordset.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: 'Ya existe otro empleado con ese DNI'
                });
            }
        }

        await executeQuery(
            `UPDATE Empleado SET 
                dni = ISNULL(@dni, dni),
                nombres = ISNULL(@nombres, nombres),
                apellidos = ISNULL(@apellidos, apellidos),
                telefono = @telefono,
                email = @email,
                direccion = @direccion,
                fecha_nacimiento = @fecha_nacimiento,
                licencia_conducir = @licencia_conducir,
                categoria_licencia = @categoria_licencia,
                fecha_venc_licencia = @fecha_venc_licencia,
                activo = ISNULL(@activo, activo),
                fecha_modificacion = GETDATE()
             WHERE id_empleado = @id`,
            {
                id, dni, nombres, apellidos, telefono, email, direccion,
                fecha_nacimiento, licencia_conducir, categoria_licencia, fecha_venc_licencia, activo
            }
        );

        res.json({
            success: true,
            message: 'Empleado actualizado exitosamente'
        });

    } catch (err) {
        console.error('Error updating employee:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando empleado'
        });
    }
});

/**
 * DELETE /api/empleados/:id
 */
router.delete('/:id', adminOnly, async (req, res) => {
    try {
        const { id } = req.params;

        await executeQuery(
            `UPDATE Empleado SET activo = 0, fecha_modificacion = GETDATE() WHERE id_empleado = @id`,
            { id }
        );

        res.json({
            success: true,
            message: 'Empleado eliminado exitosamente'
        });

    } catch (err) {
        console.error('Error deleting employee:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando empleado'
        });
    }
});

module.exports = router;
