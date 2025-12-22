/**
 * IO Group - Rutas Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/rutas
 */
router.get('/', canView, async (req, res) => {
    try {
        const { fecha, id_vehiculo, estado } = req.query;

        let query = `
            SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca, v.modelo as vehiculo_modelo,
                   (SELECT COUNT(*) FROM Servicio s WHERE s.id_ruta = r.id_ruta) as total_servicios
            FROM Ruta r
            INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
            WHERE 1=1
        `;
        const params = {};

        if (fecha) {
            query += ` AND r.fecha = @fecha`;
            params.fecha = fecha;
        }

        if (id_vehiculo) {
            query += ` AND r.id_vehiculo = @id_vehiculo`;
            params.id_vehiculo = id_vehiculo;
        }

        if (estado) {
            query += ` AND r.estado = @estado`;
            params.estado = estado;
        }

        query += ` ORDER BY r.fecha DESC, r.hora_salida`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting routes:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo rutas'
        });
    }
});

/**
 * GET /api/rutas/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT r.*, v.placa as vehiculo_placa, v.marca as vehiculo_marca
             FROM Ruta r
             INNER JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
             WHERE r.id_ruta = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Ruta no encontrada'
            });
        }

        // Get services in this route
        const servicios = await executeQuery(
            `SELECT s.*, se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                    e.razon_social as empresa_razon_social
             FROM Servicio s
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             WHERE s.id_ruta = @id
             ORDER BY s.hora_llegada`,
            { id }
        );

        res.json({
            success: true,
            data: {
                ...result.recordset[0],
                servicios: servicios.recordset
            }
        });

    } catch (err) {
        console.error('Error getting route:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo ruta'
        });
    }
});

/**
 * POST /api/rutas
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const { id_vehiculo, codigo_ruta, fecha, hora_salida, km_inicial, observaciones } = req.body;

        if (!id_vehiculo || !fecha) {
            return res.status(400).json({
                success: false,
                message: 'Vehículo y fecha son requeridos'
            });
        }

        // Check if vehicle is available
        const existing = await executeQuery(
            `SELECT id_ruta FROM Ruta 
             WHERE id_vehiculo = @id_vehiculo AND fecha = @fecha AND estado IN ('programada', 'en_curso')`,
            { id_vehiculo, fecha }
        );

        if (existing.recordset.length > 0) {
            return res.status(400).json({
                success: false,
                message: 'El vehículo ya tiene una ruta asignada para esta fecha'
            });
        }

        const result = await executeQuery(
            `INSERT INTO Ruta (id_vehiculo, codigo_ruta, fecha, hora_salida, km_inicial, observaciones)
             OUTPUT INSERTED.id_ruta
             VALUES (@id_vehiculo, @codigo_ruta, @fecha, @hora_salida, @km_inicial, @observaciones)`,
            { id_vehiculo, codigo_ruta, fecha, hora_salida, km_inicial, observaciones }
        );

        res.status(201).json({
            success: true,
            message: 'Ruta creada exitosamente',
            id: result.recordset[0].id_ruta
        });

    } catch (err) {
        console.error('Error creating route:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando ruta'
        });
    }
});

/**
 * PUT /api/rutas/:id
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const { id_vehiculo, codigo_ruta, fecha, hora_salida, hora_retorno, km_inicial, km_final, estado, observaciones } = req.body;

        await executeQuery(
            `UPDATE Ruta SET 
                id_vehiculo = ISNULL(@id_vehiculo, id_vehiculo),
                codigo_ruta = @codigo_ruta,
                fecha = ISNULL(@fecha, fecha),
                hora_salida = @hora_salida,
                hora_retorno = @hora_retorno,
                km_inicial = @km_inicial,
                km_final = @km_final,
                estado = ISNULL(@estado, estado),
                observaciones = @observaciones,
                fecha_modificacion = GETDATE()
             WHERE id_ruta = @id`,
            { id, id_vehiculo, codigo_ruta, fecha, hora_salida, hora_retorno, km_inicial, km_final, estado, observaciones }
        );

        res.json({
            success: true,
            message: 'Ruta actualizada exitosamente'
        });

    } catch (err) {
        console.error('Error updating route:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando ruta'
        });
    }
});

/**
 * PUT /api/rutas/:id/iniciar
 * Start a route
 */
router.put('/:id/iniciar', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const { km_inicial } = req.body;

        await executeQuery(
            `UPDATE Ruta SET 
                estado = 'en_curso',
                hora_salida = CONVERT(TIME, GETDATE()),
                km_inicial = @km_inicial,
                fecha_modificacion = GETDATE()
             WHERE id_ruta = @id`,
            { id, km_inicial }
        );

        res.json({
            success: true,
            message: 'Ruta iniciada'
        });

    } catch (err) {
        res.status(500).json({
            success: false,
            message: 'Error iniciando ruta'
        });
    }
});

/**
 * PUT /api/rutas/:id/finalizar
 * Complete a route
 */
router.put('/:id/finalizar', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const { km_final } = req.body;

        await executeQuery(
            `UPDATE Ruta SET 
                estado = 'completada',
                hora_retorno = CONVERT(TIME, GETDATE()),
                km_final = @km_final,
                fecha_modificacion = GETDATE()
             WHERE id_ruta = @id`,
            { id, km_final }
        );

        res.json({
            success: true,
            message: 'Ruta completada'
        });

    } catch (err) {
        res.status(500).json({
            success: false,
            message: 'Error finalizando ruta'
        });
    }
});

/**
 * DELETE /api/rutas/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        // Check for services
        const servicios = await executeQuery(
            `SELECT COUNT(*) as count FROM Servicio WHERE id_ruta = @id`,
            { id }
        );

        if (servicios.recordset[0].count > 0) {
            // Just cancel instead of delete
            await executeQuery(
                `UPDATE Ruta SET estado = 'cancelada', fecha_modificacion = GETDATE() WHERE id_ruta = @id`,
                { id }
            );
        } else {
            // Can delete if no services
            await executeQuery(`DELETE FROM Ruta WHERE id_ruta = @id`, { id });
        }

        res.json({
            success: true,
            message: 'Ruta eliminada exitosamente'
        });

    } catch (err) {
        console.error('Error deleting route:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando ruta'
        });
    }
});

module.exports = router;
