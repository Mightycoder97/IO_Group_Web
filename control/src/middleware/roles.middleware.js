/**
 * IO Group - Roles Middleware
 * Role-based access control for routes
 */

/**
 * Roles hierarchy
 */
const ROLES = {
    ADMIN: 'admin',
    EDITOR: 'editor',
    VIEWER: 'viewer'
};

/**
 * Check if user has required role
 * @param {...string} allowedRoles - Roles that can access the route
 */
function requireRole(...allowedRoles) {
    return (req, res, next) => {
        // Check if user is authenticated
        if (!req.user) {
            return res.status(401).json({
                success: false,
                message: 'No autenticado'
            });
        }

        const userRole = req.user.rol;

        // Admin always has access
        if (userRole === ROLES.ADMIN) {
            return next();
        }

        // Check if user role is in allowed roles
        if (allowedRoles.includes(userRole)) {
            return next();
        }

        return res.status(403).json({
            success: false,
            message: 'No tiene permisos para realizar esta acción'
        });
    };
}

/**
 * Admin only middleware
 */
function adminOnly(req, res, next) {
    if (!req.user || req.user.rol !== ROLES.ADMIN) {
        return res.status(403).json({
            success: false,
            message: 'Solo administradores pueden realizar esta acción'
        });
    }
    next();
}

/**
 * Editor or Admin middleware
 */
function canEdit(req, res, next) {
    if (!req.user || (req.user.rol !== ROLES.ADMIN && req.user.rol !== ROLES.EDITOR)) {
        return res.status(403).json({
            success: false,
            message: 'No tiene permisos de edición'
        });
    }
    next();
}

/**
 * Any authenticated user (including viewer)
 */
function canView(req, res, next) {
    if (!req.user) {
        return res.status(401).json({
            success: false,
            message: 'Debe iniciar sesión para ver este contenido'
        });
    }
    next();
}

module.exports = {
    ROLES,
    requireRole,
    adminOnly,
    canEdit,
    canView
};
