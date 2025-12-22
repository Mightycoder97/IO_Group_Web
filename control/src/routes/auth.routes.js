/**
 * IO Group - Authentication Routes
 */

const express = require('express');
const bcrypt = require('bcryptjs');
const router = express.Router();
const { executeQuery } = require('../../config/database');
const { generateToken } = require('../../config/auth');
const { authMiddleware } = require('../middleware/auth.middleware');

/**
 * POST /api/auth/login
 * User login
 */
router.post('/login', async (req, res) => {
    try {
        const { username, password } = req.body;

        if (!username || !password) {
            return res.status(400).json({
                success: false,
                message: 'Usuario y contraseña son requeridos'
            });
        }

        // Find user
        const result = await executeQuery(
            `SELECT id_usuario, username, password_hash, nombre_completo, rol, email, activo 
             FROM Usuario 
             WHERE username = @username`,
            { username }
        );

        if (result.recordset.length === 0) {
            return res.status(401).json({
                success: false,
                message: 'Usuario o contraseña incorrectos'
            });
        }

        const user = result.recordset[0];

        // Check if user is active
        if (!user.activo) {
            return res.status(401).json({
                success: false,
                message: 'Usuario desactivado'
            });
        }

        // Verify password
        const validPassword = await bcrypt.compare(password, user.password_hash);

        if (!validPassword) {
            return res.status(401).json({
                success: false,
                message: 'Usuario o contraseña incorrectos'
            });
        }

        // Update last access
        await executeQuery(
            `UPDATE Usuario SET ultimo_acceso = GETDATE() WHERE id_usuario = @id`,
            { id: user.id_usuario }
        );

        // Generate token
        const token = generateToken({
            id: user.id_usuario,
            username: user.username,
            nombre: user.nombre_completo,
            rol: user.rol
        });

        // Log login
        await executeQuery(
            `INSERT INTO AuditLog (id_usuario, tabla_afectada, accion, ip_address)
             VALUES (@userId, 'Usuario', 'LOGIN', @ip)`,
            { userId: user.id_usuario, ip: req.ip }
        );

        res.json({
            success: true,
            message: 'Inicio de sesión exitoso',
            token,
            user: {
                id: user.id_usuario,
                username: user.username,
                nombre: user.nombre_completo,
                rol: user.rol,
                email: user.email
            }
        });

    } catch (err) {
        console.error('Login error:', err);
        res.status(500).json({
            success: false,
            message: 'Error en el servidor'
        });
    }
});

/**
 * POST /api/auth/register
 * Register new user (Admin only - handled via direct DB or protected route)
 */
router.post('/register', authMiddleware, async (req, res) => {
    try {
        // Only admin can create users
        if (req.user.rol !== 'admin') {
            return res.status(403).json({
                success: false,
                message: 'Solo administradores pueden crear usuarios'
            });
        }

        const { username, password, nombre_completo, rol, email } = req.body;

        // Validate required fields
        if (!username || !password || !nombre_completo || !rol) {
            return res.status(400).json({
                success: false,
                message: 'Campos requeridos: username, password, nombre_completo, rol'
            });
        }

        // Check if username exists
        const existing = await executeQuery(
            `SELECT id_usuario FROM Usuario WHERE username = @username`,
            { username }
        );

        if (existing.recordset.length > 0) {
            return res.status(400).json({
                success: false,
                message: 'El nombre de usuario ya existe'
            });
        }

        // Hash password
        const salt = await bcrypt.genSalt(10);
        const password_hash = await bcrypt.hash(password, salt);

        // Insert user
        const result = await executeQuery(
            `INSERT INTO Usuario (username, password_hash, nombre_completo, rol, email)
             OUTPUT INSERTED.id_usuario
             VALUES (@username, @password_hash, @nombre_completo, @rol, @email)`,
            { username, password_hash, nombre_completo, rol, email }
        );

        res.status(201).json({
            success: true,
            message: 'Usuario creado exitosamente',
            id: result.recordset[0].id_usuario
        });

    } catch (err) {
        console.error('Register error:', err);
        res.status(500).json({
            success: false,
            message: 'Error creando usuario'
        });
    }
});

/**
 * GET /api/auth/me
 * Get current user info
 */
router.get('/me', authMiddleware, async (req, res) => {
    try {
        const result = await executeQuery(
            `SELECT id_usuario, username, nombre_completo, rol, email, ultimo_acceso
             FROM Usuario 
             WHERE id_usuario = @id`,
            { id: req.user.id }
        );

        if (result.recordset.length === 0) {
            return res.status(404).json({
                success: false,
                message: 'Usuario no encontrado'
            });
        }

        res.json({
            success: true,
            user: result.recordset[0]
        });

    } catch (err) {
        res.status(500).json({
            success: false,
            message: 'Error obteniendo información del usuario'
        });
    }
});

/**
 * PUT /api/auth/change-password
 * Change user password
 */
router.put('/change-password', authMiddleware, async (req, res) => {
    try {
        const { currentPassword, newPassword } = req.body;

        if (!currentPassword || !newPassword) {
            return res.status(400).json({
                success: false,
                message: 'Contraseña actual y nueva son requeridas'
            });
        }

        // Get current password hash
        const result = await executeQuery(
            `SELECT password_hash FROM Usuario WHERE id_usuario = @id`,
            { id: req.user.id }
        );

        // Verify current password
        const validPassword = await bcrypt.compare(currentPassword, result.recordset[0].password_hash);

        if (!validPassword) {
            return res.status(401).json({
                success: false,
                message: 'Contraseña actual incorrecta'
            });
        }

        // Hash new password
        const salt = await bcrypt.genSalt(10);
        const password_hash = await bcrypt.hash(newPassword, salt);

        // Update password
        await executeQuery(
            `UPDATE Usuario SET password_hash = @password_hash, fecha_modificacion = GETDATE()
             WHERE id_usuario = @id`,
            { password_hash, id: req.user.id }
        );

        res.json({
            success: true,
            message: 'Contraseña actualizada exitosamente'
        });

    } catch (err) {
        res.status(500).json({
            success: false,
            message: 'Error cambiando contraseña'
        });
    }
});

/**
 * POST /api/auth/logout
 * User logout (just for audit logging)
 */
router.post('/logout', authMiddleware, async (req, res) => {
    try {
        // Log logout
        await executeQuery(
            `INSERT INTO AuditLog (id_usuario, tabla_afectada, accion, ip_address)
             VALUES (@userId, 'Usuario', 'LOGOUT', @ip)`,
            { userId: req.user.id, ip: req.ip }
        );

        res.json({
            success: true,
            message: 'Sesión cerrada exitosamente'
        });
    } catch (err) {
        res.json({ success: true, message: 'Sesión cerrada' });
    }
});

/**
 * POST /api/auth/setup
 * Initial setup - create admin user if none exists
 */
router.post('/setup', async (req, res) => {
    try {
        // Check if any admin exists
        const admins = await executeQuery(
            `SELECT COUNT(*) as count FROM Usuario WHERE rol = 'admin'`
        );

        if (admins.recordset[0].count > 0) {
            return res.status(400).json({
                success: false,
                message: 'Ya existe un administrador. Use el login normal.'
            });
        }

        // Create default admin
        const salt = await bcrypt.genSalt(10);
        const password_hash = await bcrypt.hash('Admin123!', salt);

        await executeQuery(
            `INSERT INTO Usuario (username, password_hash, nombre_completo, rol, email)
             VALUES ('admin', @password_hash, 'Administrador del Sistema', 'admin', 'admin@iogroup.pe')`,
            { password_hash }
        );

        res.status(201).json({
            success: true,
            message: 'Usuario administrador creado',
            credentials: {
                username: 'admin',
                password: 'Admin123!'
            }
        });

    } catch (err) {
        console.error('Setup error:', err);
        res.status(500).json({
            success: false,
            message: 'Error en configuración inicial'
        });
    }
});

module.exports = router;
