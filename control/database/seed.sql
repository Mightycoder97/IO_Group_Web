-- ============================================
-- IO Group - Seed Data (MySQL)
-- Solo usuario administrador
-- ============================================

USE iogroup_db;

-- ============================================
-- Usuario Admin (password: Admin123!)
-- ============================================
INSERT INTO Usuario (username, password_hash, nombre_completo, rol, email) VALUES
('admin', '$2a$10$mmf2vyZrF119xLhyLSW5X.sXjSyCorxyPXU8gLGGyNoH/ZlKHQSaLe', 'Administrador del Sistema', 'admin', 'admin@iogroup.pe');
