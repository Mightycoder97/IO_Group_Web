/**
 * IO Group - Vehiculos Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/vehiculos
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, tipo, activo } = req.query;

        let query = `SELECT * FROM Vehiculo WHERE 1=1`;
        const params = {};

        if (search) {
            query += ` AND (placa LIKE @search OR marca LIKE @search OR modelo LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (tipo) {
            query += ` AND tipo = @tipo`;
            params.tipo = tipo;
        }

        if (activo !== undefined) {
            query += ` AND activo = @activo`;
            params.activo = activo === 'true' ? 1 : 0;
        }

        query += ` ORDER BY placa`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting vehicles:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo vehículos'
        });
    }
});

/**
 * GET /api/vehiculos/disponibles
 * Get vehicles available for a given date
 */
router.get('/disponibles', canView, async (req, res) => {
    try {
        const { fecha } = req.query;

        let query = `
            SELECT v.* FROM Vehiculo v
            WHERE v.activo = 1
            AND v.id_vehiculo NOT IN (
                SELECT r.id_vehiculo FROM Ruta r 
                WHERE r.fecha = @fecha AND r.estado IN ('programada', 'en_curso')
            )
            ORDER BY v.placa
        `;

        const result = await executeQuery(query, { fecha: fecha || new Date().toISOString().split('T')[0] });

        res.json({
            success: true,
            data: result.recordset
        });

    } catch (err) {
        res.status(500).json({
            success: false,
            message: 'Error obteniendo vehículos disponibles'
        });
    }
});

/**
 * GET /api/vehiculos/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT * FROM Vehiculo WHERE id_vehiculo = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Vehículo no encontrado'
            });
        }

        res.json({
            success: true,
            data: result.recordset[0]
        });

    } catch (err) {
        console.error('Error getting vehicle:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo vehículo'
        });
    }
});

/**
 * POST /api/vehiculos
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const {
            placa, marca, modelo, anio, color, tonelaje_max, tipo,
            numero_motor, numero_chasis, fecha_venc_soat, fecha_venc_revision, fecha_venc_mtc
        } = req.body;

        if (!placa) {
            return res.status(400).json({
                success: false,
                message: 'La placa es requerida'
            });
        }

        // Check if plate exists
        const existing = await executeQuery(
            `SELECT id_vehiculo FROM Vehiculo WHERE placa = @placa`,
            { placa }
        );

        if (existing.recordset.length > 0) {
            return res.status(400).json({
                success: false,
                message: 'Ya existe un vehículo con esa placa'
            });
        }

        const result = await executeQuery(
            `INSERT INTO Vehiculo (placa, marca, modelo, anio, color, tonelaje_max, tipo,
                                  numero_motor, numero_chasis, fecha_venc_soat, fecha_venc_revision, fecha_venc_mtc)
             OUTPUT INSERTED.id_vehiculo
             VALUES (@placa, @marca, @modelo, @anio, @color, @tonelaje_max, @tipo,
                    @numero_motor, @numero_chasis, @fecha_venc_soat, @fecha_venc_revision, @fecha_venc_mtc)`,
            {
                placa, marca, modelo, anio, color, tonelaje_max, tipo,
                numero_motor, numero_chasis, fecha_venc_soat, fecha_venc_revision, fecha_venc_mtc
            }
        );

        res.status(201).json({
            success: true,
            message: 'Vehículo creado exitosamente',
            id: result.recordset[0].id_vehiculo
        });

    } catch (err) {
        console.error('Error creating vehicle:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando vehículo'
        });
    }
});

/**
 * PUT /api/vehiculos/:id
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const {
            placa, marca, modelo, anio, color, tonelaje_max, tipo,
            numero_motor, numero_chasis, fecha_venc_soat, fecha_venc_revision, fecha_venc_mtc, activo
        } = req.body;

        // Check plate uniqueness
        if (placa) {
            const placaCheck = await executeQuery(
                `SELECT id_vehiculo FROM Vehiculo WHERE placa = @placa AND id_vehiculo != @id`,
                { placa, id }
            );

            if (placaCheck.recordset.length > 0) {
                return res.status(400).json({
                    success: false,
                    message: 'Ya existe otro vehículo con esa placa'
                });
            }
        }

        await executeQuery(
            `UPDATE Vehiculo SET 
                placa = ISNULL(@placa, placa),
                marca = @marca,
                modelo = @modelo,
                anio = @anio,
                color = @color,
                tonelaje_max = @tonelaje_max,
                tipo = @tipo,
                numero_motor = @numero_motor,
                numero_chasis = @numero_chasis,
                fecha_venc_soat = @fecha_venc_soat,
                fecha_venc_revision = @fecha_venc_revision,
                fecha_venc_mtc = @fecha_venc_mtc,
                activo = ISNULL(@activo, activo),
                fecha_modificacion = GETDATE()
             WHERE id_vehiculo = @id`,
            {
                id, placa, marca, modelo, anio, color, tonelaje_max, tipo,
                numero_motor, numero_chasis, fecha_venc_soat, fecha_venc_revision, fecha_venc_mtc, activo
            }
        );

        res.json({
            success: true,
            message: 'Vehículo actualizado exitosamente'
        });

    } catch (err) {
        console.error('Error updating vehicle:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando vehículo'
        });
    }
});

/**
 * DELETE /api/vehiculos/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        await executeQuery(
            `UPDATE Vehiculo SET activo = 0, fecha_modificacion = GETDATE() WHERE id_vehiculo = @id`,
            { id }
        );

        res.json({
            success: true,
            message: 'Vehículo eliminado exitosamente'
        });

    } catch (err) {
        console.error('Error deleting vehicle:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando vehículo'
        });
    }
});

module.exports = router;
