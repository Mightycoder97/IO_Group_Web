/**
 * IO Group - Contratos de Servicio Routes
 */

const express = require('express');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { authMiddleware } = require('../middleware/auth.middleware');
const { canEdit, canView } = require('../middleware/roles.middleware');

router.use(authMiddleware);

/**
 * GET /api/contratos
 */
router.get('/', canView, async (req, res) => {
    try {
        const { search, id_sede, activo, vigentes } = req.query;

        let query = `
            SELECT cs.*, s.nombre_comercial as sede_nombre, s.direccion as sede_direccion,
                   e.razon_social as empresa_razon_social
            FROM ContratoServicio cs
            INNER JOIN Sede s ON cs.id_sede = s.id_sede
            INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
            WHERE 1=1
        `;
        const params = {};

        if (search) {
            query += ` AND (cs.codigo_contrato LIKE @search OR s.nombre_comercial LIKE @search)`;
            params.search = `%${search}%`;
        }

        if (id_sede) {
            query += ` AND cs.id_sede = @id_sede`;
            params.id_sede = id_sede;
        }

        if (activo !== undefined) {
            query += ` AND cs.activo = @activo`;
            params.activo = activo === 'true' ? 1 : 0;
        }

        if (vigentes === 'true') {
            query += ` AND (cs.fecha_fin IS NULL OR cs.fecha_fin >= GETDATE())`;
        }

        query += ` ORDER BY cs.fecha_inicio DESC`;

        const result = await executeQuery(query, params);

        res.json({
            success: true,
            data: result.recordset,
            total: result.recordset.length
        });

    } catch (err) {
        console.error('Error getting contracts:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo contratos'
        });
    }
});

/**
 * GET /api/contratos/:id
 */
router.get('/:id', canView, async (req, res) => {
    try {
        const { id } = req.params;

        const result = await executeQuery(
            `SELECT cs.*, s.nombre_comercial as sede_nombre, s.direccion as sede_direccion,
                    e.razon_social as empresa_razon_social, e.ruc as empresa_ruc
             FROM ContratoServicio cs
             INNER JOIN Sede s ON cs.id_sede = s.id_sede
             INNER JOIN Empresa e ON s.id_empresa = e.id_empresa
             WHERE cs.id_contrato = @id`,
            { id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Contrato no encontrado'
            });
        }

        res.json({
            success: true,
            data: result.recordset[0]
        });

    } catch (err) {
        console.error('Error getting contract:', err);
        res.status(500).json({
            success: false,
            message: 'Error obteniendo contrato'
        });
    }
});

/**
 * POST /api/contratos
 */
router.post('/', canEdit, async (req, res) => {
    try {
        const {
            id_sede, codigo_contrato, fecha_inicio, fecha_fin, frecuencia,
            peso_limite_kg, tarifa, tipo_tarifa, doc_escaneado, observaciones
        } = req.body;

        if (!id_sede || !fecha_inicio || !frecuencia || !tarifa) {
            return res.status(400).json({
                success: false,
                message: 'Sede, fecha inicio, frecuencia y tarifa son requeridos'
            });
        }

        const result = await executeQuery(
            `INSERT INTO ContratoServicio (id_sede, codigo_contrato, fecha_inicio, fecha_fin, 
                                          frecuencia, peso_limite_kg, tarifa, tipo_tarifa, 
                                          doc_escaneado, observaciones)
             OUTPUT INSERTED.id_contrato
             VALUES (@id_sede, @codigo_contrato, @fecha_inicio, @fecha_fin, @frecuencia,
                    @peso_limite_kg, @tarifa, @tipo_tarifa, @doc_escaneado, @observaciones)`,
            {
                id_sede, codigo_contrato, fecha_inicio, fecha_fin, frecuencia,
                peso_limite_kg, tarifa, tipo_tarifa, doc_escaneado, observaciones
            }
        );

        res.status(201).json({
            success: true,
            message: 'Contrato creado exitosamente',
            id: result.recordset[0].id_contrato
        });

    } catch (err) {
        console.error('Error creating contract:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando contrato'
        });
    }
});

/**
 * PUT /api/contratos/:id
 */
router.put('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;
        const {
            id_sede, codigo_contrato, fecha_inicio, fecha_fin, frecuencia,
            peso_limite_kg, tarifa, tipo_tarifa, doc_escaneado, observaciones, activo
        } = req.body;

        await executeQuery(
            `UPDATE ContratoServicio SET 
                id_sede = ISNULL(@id_sede, id_sede),
                codigo_contrato = @codigo_contrato,
                fecha_inicio = ISNULL(@fecha_inicio, fecha_inicio),
                fecha_fin = @fecha_fin,
                frecuencia = ISNULL(@frecuencia, frecuencia),
                peso_limite_kg = @peso_limite_kg,
                tarifa = ISNULL(@tarifa, tarifa),
                tipo_tarifa = @tipo_tarifa,
                doc_escaneado = @doc_escaneado,
                observaciones = @observaciones,
                activo = ISNULL(@activo, activo),
                fecha_modificacion = GETDATE()
             WHERE id_contrato = @id`,
            {
                id, id_sede, codigo_contrato, fecha_inicio, fecha_fin, frecuencia,
                peso_limite_kg, tarifa, tipo_tarifa, doc_escaneado, observaciones, activo
            }
        );

        res.json({
            success: true,
            message: 'Contrato actualizado exitosamente'
        });

    } catch (err) {
        console.error('Error updating contract:', err);
        res.status(500).json({
            success: false,
            message: 'Error actualizando contrato'
        });
    }
});

/**
 * DELETE /api/contratos/:id
 */
router.delete('/:id', canEdit, async (req, res) => {
    try {
        const { id } = req.params;

        await executeQuery(
            `UPDATE ContratoServicio SET activo = 0, fecha_modificacion = GETDATE() WHERE id_contrato = @id`,
            { id }
        );

        res.json({
            success: true,
            message: 'Contrato eliminado exitosamente'
        });

    } catch (err) {
        console.error('Error deleting contract:', err);
        res.status(500).json({
            success: false,
            message: 'Error eliminando contrato'
        });
    }
});

module.exports = router;
