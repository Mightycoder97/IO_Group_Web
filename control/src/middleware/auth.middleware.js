/**
 * IO Group - Authentication Middleware
 * Protects routes requiring authentication
 */

const { verifyToken } = require('../../config/auth');

/**
 * Authentication middleware
 * Checks for valid JWT token in Authorization header
 */
function authMiddleware(req, res, next) {
    try {
        // Get token from header
        const authHeader = req.headers.authorization;

        if (!authHeader) {
            return res.status(401).json({
                success: false,
                message: 'No se proporcionó token de autenticación'
            });
        }

        // Extract token (Bearer <token>)
        const token = authHeader.startsWith('Bearer ')
            ? authHeader.slice(7)
            : authHeader;

        // Verify token
        const decoded = verifyToken(token);

        // Attach user info to request
        req.user = decoded;

        next();
    } catch (err) {
        return res.status(401).json({
            success: false,
            message: 'Token inválido o expirado'
        });
    }
}

/**
 * Optional authentication middleware
 * Attaches user if token present, continues otherwise
 */
function optionalAuth(req, res, next) {
    try {
        const authHeader = req.headers.authorization;

        if (authHeader) {
            const token = authHeader.startsWith('Bearer ')
                ? authHeader.slice(7)
                : authHeader;
            req.user = verifyToken(token);
        }

        next();
    } catch (err) {
        // Continue without user
        next();
    }
}

module.exports = {
    authMiddleware,
    optionalAuth
};
