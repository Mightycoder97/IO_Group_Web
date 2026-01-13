-- ============================================
-- MIGRACIÓN: Sistema de Permisos por Usuario
-- ============================================

-- Tabla de permisos por módulo
CREATE TABLE IF NOT EXISTS UsuarioPermiso (
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    modulo VARCHAR(50) NOT NULL,
    puede_ver TINYINT(1) DEFAULT 1,
    puede_editar TINYINT(1) DEFAULT 0,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    UNIQUE KEY unique_usuario_modulo (id_usuario, modulo)
);

-- Índice para búsquedas rápidas
CREATE INDEX idx_permiso_usuario ON UsuarioPermiso(id_usuario);

-- Insertar permisos completos para usuarios admin existentes
INSERT INTO UsuarioPermiso (id_usuario, modulo, puede_ver, puede_editar)
SELECT u.id_usuario, m.modulo, 1, 1
FROM Usuario u
CROSS JOIN (
    SELECT 'dashboard' as modulo UNION ALL
    SELECT 'clientes' UNION ALL
    SELECT 'empresas' UNION ALL
    SELECT 'sedes' UNION ALL
    SELECT 'contratos' UNION ALL
    SELECT 'servicios' UNION ALL
    SELECT 'rutas' UNION ALL
    SELECT 'manifiestos' UNION ALL
    SELECT 'guias' UNION ALL
    SELECT 'empleados' UNION ALL
    SELECT 'vehiculos' UNION ALL
    SELECT 'plantas' UNION ALL
    SELECT 'facturas' UNION ALL
    SELECT 'prospectos' UNION ALL
    SELECT 'reportes' UNION ALL
    SELECT 'alertas' UNION ALL
    SELECT 'usuarios' UNION ALL
    SELECT 'mapa'
) m
WHERE u.rol = 'admin'
ON DUPLICATE KEY UPDATE puede_ver = 1, puede_editar = 1;
