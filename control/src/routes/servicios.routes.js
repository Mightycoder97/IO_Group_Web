/**
 * IO Group - Servicios Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/servicios
 */
router.get('/', canView, async (req, res) => {
    try {
        const { fecha, id_sede, id_ruta, estado, fecha_desde, fecha_hasta } = req.query;

        let query = `
            SELECT s.*, 
                   se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                   e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
                   p.nombre_comercial as planta_nombre,
                   r.codigo_ruta, v.placa as vehiculo_placa,
                   m.peso_kg, m.tipo_residuo,
                   f.numero_factura, f.monto_total
            FROM Servicio s
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            INNER JOIN Planta p ON s.id_planta = p.id_planta
            LEFT JOIN Ruta r ON s.id_ruta = r.id_ruta
            LEFT JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
            LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
            LEFT JOIN Factura f ON s.id_servicio = f.id_servicio
            WHERE 1=1
        `;
        const params = {};

        if (fecha) {
            query += ` AND s.fecha_programada = @fecha`;
            params.fecha = fecha;
        }

        if (fecha_desde) {
            query += ` AND s.fecha_programada >= @fecha_desde`;
            params.fecha_desde = fecha_desde;
        }

        if (fecha_hasta) {
            query += ` AND s.fecha_programada <= @fecha_hasta`;
            params.fecha_hasta = fecha_hasta;
        }

        if (id_sede) {
            query += ` AND s.id_sede = @id_sede`;
            params.id_sede = id_sede;
        }

        if (id_ruta) {
            query += ` AND s.id_ruta = @id_ruta`;
            params.id_ruta = id_ruta;
        }

        if (estado) {
            query += ` AND s.estado = @estado`;
            params.estado = estado;
        }

        query += ` ORDER BY s.fecha_programada DESC, s.hora_llegada`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting services:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo servicios'
        });
    }
});

/**
 * GET /api/servicios/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT s.*, 
                    se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                    se.contacto_nombre as sede_contacto, se.contacto_telefono as sede_telefono,
                    e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
                    p.nombre_comercial as planta_nombre, p.direccion as planta_direccion,
                    cs.tarifa as contrato_tarifa, cs.tipo_tarifa as contrato_tipo_tarifa
             FROM Servicio s
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             INNER JOIN Planta p ON s.id_planta = p.id_planta
             LEFT JOIN ContratoServicio cs ON s.id_contrato = cs.id_contrato
             WHERE s.id_servicio = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Servicio no encontrado'
            });
        }

        // Get assigned employees
        const empleados = await executeQuery(
            `SELECT se.*, emp.nombres, emp.apellidos, emp.dni
             FROM ServicioEmpleado se
             INNER JOIN Empleado emp ON se.id_empleado = emp.id_empleado
             WHERE se.id_servicio = @id`,
            { id }
        );

        // Get manifiesto
        const manifiesto = await executeQuery(
            `SELECT * FROM Manifiesto WHERE id_servicio = @id`,
            { id }
        );

        // Get guia
        const guia = await executeQuery(
            `SELECT * FROM Guia WHERE id_servicio = @id`,
            { id }
        );

        // Get factura
        const factura = await executeQuery(
            `SELECT * FROM Factura WHERE id_servicio = @id`,
            { id }
        );

        res.json({
            success: true,
            data: {
                ...result.recordset[0],
                empleados: empleados.recordset,
                manifiesto: manifiesto.recordset[0] || null,
                guia: guia.recordset[0] || null,
                factura: factura.recordset[0] || null
            }
        });

    } catch (err) {
        console.error('Error getting service:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo servicio'
        });
    }
});

/**
 * POST /api/servicios
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const {
            id_sede, id_ruta, id_planta, id_contrato, codigo_servicio,
            fecha_programada, observaciones, empleados
        } = req.body;

        if (!id_sede || !id_planta || !fecha_programada) {
            return res.status(400).json({
                success: false,
                message: 'Sede, planta y fecha programada son requeridos'
            });
        }

        // Create service
        const result = await executeQuery(
            `INSERT INTO Servicio (id_sede, id_ruta, id_planta, id_contrato, codigo_servicio, fecha_programada, observaciones)
             OUTPUT INSERTED.id_servicio
             VALUES (@id_sede, @id_ruta, @id_planta, @id_contrato, @codigo_servicio, @fecha_programada, @observaciones)`,
            { id_sede, id_ruta, id_planta, id_contrato, codigo_servicio, fecha_programada, observaciones }
        );

        const id_servicio = result.recordset[0].id_servicio;

        // Assign employees if provided
        if (empleados && empleados.length > 0) {
            for (const emp of empleados) {
                await executeQuery(
                    `INSERT INTO ServicioEmpleado (id_servicio, id_empleado, rol)
                     VALUES (@id_servicio, @id_empleado, @rol)`,
                    { id_servicio, id_empleado: emp.id_empleado, rol: emp.rol }
                );
            }
        }

        res.status(201).json({
            success: true,
            message: 'Servicio creado exitosamente',
            id: id_servicio
        });

    } catch (err) {
        console.error('Error creating service:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando servicio'
        });
    }
});

/**
 * PUT /api/servicios/:id
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const {
            id_sede, id_ruta, id_planta, id_contrato, codigo_servicio,
            fecha_programada, fecha_ejecucion, hora_llegada, hora_salida,
            estado, observaciones, empleados
        } = req.body;

        await executeQuery(
            `UPDATE Servicio SET 
                id_sede = ISNULL(@id_sede, id_sede),
                id_ruta = @id_ruta,
                id_planta = ISNULL(@id_planta, id_planta),
                id_contrato = @id_contrato,
                codigo_servicio = @codigo_servicio,
                fecha_programada = ISNULL(@fecha_programada, fecha_programada),
                fecha_ejecucion = @fecha_ejecucion,
                hora_llegada = @hora_llegada,
                hora_salida = @hora_salida,
                estado = ISNULL(@estado, estado),
                observaciones = @observaciones,
                fecha_modificacion = GETDATE()
             WHERE id_servicio = @id`,
            {
                id, id_sede, id_ruta, id_planta, id_contrato, codigo_servicio,
                fecha_programada, fecha_ejecucion, hora_llegada, hora_salida, estado, observaciones
            }
        );

        // Update employees if provided
        if (empleados !== undefined) {
            // Remove existing assignments
            await executeQuery(`DELETE FROM ServicioEmpleado WHERE id_servicio = @id`, { id });

            // Add new assignments
            for (const emp of empleados) {
                await executeQuery(
                    `INSERT INTO ServicioEmpleado (id_servicio, id_empleado, rol)
                     VALUES (@id_servicio, @id_empleado, @rol)`,
                    { id_servicio: id, id_empleado: emp.id_empleado, rol: emp.rol }
                );
            }
        }

        res.json({
            success: true,
            message: 'Servicio actualizado exitosamente'
        });

    } catch (err) {
        console.error('Error updating service:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando servicio'
        });
    }
});

/**
 * PUT /api/servicios/:id/completar
 * Mark service as completed
 */
router.put('/:id/completar', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const { hora_llegada, hora_salida } = req.body;

        await executeQuery(
            `UPDATE Servicio SET 
                estado = 'completado',
                fecha_ejecucion = CAST(GETDATE() AS DATE),
                hora_llegada = @hora_llegada,
                hora_salida = @hora_salida,
                fecha_modificacion = GETDATE()
             WHERE id_servicio = @id`,
            { id, hora_llegada, hora_salida }
        );

        res.json({
            success: true,
            message: 'Servicio completado'
        });

    } catch (err) {
        res.status(500).json({
            success: false,
            message: 'Error completando servicio'
        });
    }
});

/**
 * DELETE /api/servicios/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        // Check if service has documents
        const docs = await executeQuery(
            `SELECT 
                (SELECT COUNT(*) FROM Manifiesto WHERE id_servicio = @id) +
                (SELECT COUNT(*) FROM Guia WHERE id_servicio = @id) +
                (SELECT COUNT(*) FROM Factura WHERE id_servicio = @id) as total`,
            { id }
        );

        if (docs.recordset[0].total > 0) {
            // Cancel instead of delete
            await executeQuery(
                `UPDATE Servicio SET estado = 'cancelado', fecha_modificacion = GETDATE() WHERE id_servicio = @id`,
                { id }
            );
        } else {
            // Delete employees first
            await executeQuery(`DELETE FROM ServicioEmpleado WHERE id_servicio = @id`, { id });
            await executeQuery(`DELETE FROM Servicio WHERE id_servicio = @id`, { id });
        }

        res.json({
            success: true,
            message: 'Servicio eliminado exitosamente'
        });

    } catch (err) {
        console.error('Error deleting service:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando servicio'
        });
    }
});

module.exports = router;
