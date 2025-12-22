/**
 * IO Group - Manifiestos Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/manifiestos
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, tipo_residuo, fecha_desde, fecha_hasta } = req.query;

        let query = `
            SELECT m.*, s.codigo_servicio, s.fecha_ejecucion,
                   se.nombre_comercial as sede_nombre,
                   e.razon_social as empresa_razon_social,
                   p.nombre_comercial as planta_nombre
            FROM Manifiesto m
            INNER JOIN Servicio s ON m.id_servicio = s.id_servicio
            INNER JOIN Sede se ON s.id_sede = se.id_sede
            INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
            INNER JOIN Planta p ON s.id_planta = p.id_planta
            WHERE 1=1
        `;
        const params = {};

        if (search) {
            query += ` AND (m.numero_manifiesto LIKE @search OR m.tipo_residuo LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (tipo_residuo) {
            query += ` AND m.tipo_residuo LIKE @tipo_residuo`;
            params.tipo_residuo = `%${tipo_residuo}%`;
        }

        if (fecha_desde) {
            query += ` AND s.fecha_ejecucion >= @fecha_desde`;
            params.fecha_desde = fecha_desde;
        }

        if (fecha_hasta) {
            query += ` AND s.fecha_ejecucion <= @fecha_hasta`;
            params.fecha_hasta = fecha_hasta;
        }

        query += ` ORDER BY m.fecha_creacion DESC`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting manifests:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo manifiestos'
        });
    }
});

/**
 * GET /api/manifiestos/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT m.*, s.codigo_servicio, s.fecha_ejecucion,
                    se.nombre_comercial as sede_nombre, se.direccion as sede_direccion,
                    e.razon_social as empresa_razon_social, e.ruc as empresa_ruc,
                    p.nombre_comercial as planta_nombre, p.ruc as planta_ruc
             FROM Manifiesto m
             INNER JOIN Servicio s ON m.id_servicio = s.id_servicio
             INNER JOIN Sede se ON s.id_sede = se.id_sede
             INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
             INNER JOIN Planta p ON s.id_planta = p.id_planta
             WHERE m.id_manifiesto = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Manifiesto no encontrado'
            });
        }

        res.json({
            success: true,
            data: result.recordset[0]
        });

    } catch (err) {
        console.error('Error getting manifest:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo manifiesto'
        });
    }
});

/**
 * POST /api/manifiestos
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const {
            id_servicio, numero_manifiesto, tipo_residuo, codigo_residuo,
            descripcion_residuo, peso_kg, unidad_medida, cantidad_bultos,
            nombre_responsable, cargo_responsable, dni_responsable, doc_escaneado, observaciones
        } = req.body;

        if (!id_servicio || !tipo_residuo || !peso_kg) {
            return res.status(400).json({
                success: false,
                message: 'Servicio, tipo de residuo y peso son requeridos'
            });
        }

        // Check if manifest already exists for this service
        const existing = await executeQuery(
            `SELECT id_manifiesto FROM Manifiesto WHERE id_servicio = @id_servicio`,
            { id_servicio }
        );

        if (existing.recordset.length > 0) {
            return res.status(400).json({
                success: false,
                message: 'Ya existe un manifiesto para este servicio'
            });
        }

        const result = await executeQuery(
            `INSERT INTO Manifiesto (id_servicio, numero_manifiesto, tipo_residuo, codigo_residuo,
                                    descripcion_residuo, peso_kg, unidad_medida, cantidad_bultos,
                                    nombre_responsable, cargo_responsable, dni_responsable, doc_escaneado, observaciones)
             OUTPUT INSERTED.id_manifiesto
             VALUES (@id_servicio, @numero_manifiesto, @tipo_residuo, @codigo_residuo,
                    @descripcion_residuo, @peso_kg, @unidad_medida, @cantidad_bultos,
                    @nombre_responsable, @cargo_responsable, @dni_responsable, @doc_escaneado, @observaciones)`,
            {
                id_servicio, numero_manifiesto, tipo_residuo, codigo_residuo,
                descripcion_residuo, peso_kg, unidad_medida, cantidad_bultos,
                nombre_responsable, cargo_responsable, dni_responsable, doc_escaneado, observaciones
            }
        );

        res.status(201).json({
            success: true,
            message: 'Manifiesto creado exitosamente',
            id: result.recordset[0].id_manifiesto
        });

    } catch (err) {
        console.error('Error creating manifest:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando manifiesto'
        });
    }
});

/**
 * PUT /api/manifiestos/:id
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const {
            numero_manifiesto, tipo_residuo, codigo_residuo,
            descripcion_residuo, peso_kg, unidad_medida, cantidad_bultos,
            nombre_responsable, cargo_responsable, dni_responsable, doc_escaneado, observaciones
        } = req.body;

        await executeQuery(
            `UPDATE Manifiesto SET 
                numero_manifiesto = @numero_manifiesto,
                tipo_residuo = ISNULL(@tipo_residuo, tipo_residuo),
                codigo_residuo = @codigo_residuo,
                descripcion_residuo = @descripcion_residuo,
                peso_kg = ISNULL(@peso_kg, peso_kg),
                unidad_medida = @unidad_medida,
                cantidad_bultos = @cantidad_bultos,
                nombre_responsable = @nombre_responsable,
                cargo_responsable = @cargo_responsable,
                dni_responsable = @dni_responsable,
                doc_escaneado = @doc_escaneado,
                observaciones = @observaciones,
                fecha_modificacion = GETDATE()
             WHERE id_manifiesto = @id`,
            {
                id, numero_manifiesto, tipo_residuo, codigo_residuo, descripcion_residuo,
                peso_kg, unidad_medida, cantidad_bultos, nombre_responsable, cargo_responsable,
                dni_responsable, doc_escaneado, observaciones
            }
        );

        res.json({
            success: true,
            message: 'Manifiesto actualizado exitosamente'
        });

    } catch (err) {
        console.error('Error updating manifest:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando manifiesto'
        });
    }
});

/**
 * DELETE /api/manifiestos/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        await executeQuery(`DELETE FROM Manifiesto WHERE id_manifiesto = @id`, { id });

        res.json({
            success: true,
            message: 'Manifiesto eliminado exitosamente'
        });

    } catch (err) {
        console.error('Error deleting manifest:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando manifiesto'
        });
    }
});

module.exports = router;
