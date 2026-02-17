-- ============================================
-- SQL para limpiar TODAS las tablas de la base de datos
-- USANDO DELETE PARA EVITAR ERRORES DE LLAVES FORÁNEAS #1701
-- ============================================
SET FOREIGN_KEY_CHECKS = 0;

-- Tablas Transaccionales (Hijas)
DELETE FROM Factura;
ALTER TABLE Factura AUTO_INCREMENT = 1;

DELETE FROM Guia;
ALTER TABLE Guia AUTO_INCREMENT = 1;

DELETE FROM Manifiesto;
ALTER TABLE Manifiesto AUTO_INCREMENT = 1;

DELETE FROM ServicioEmpleado;
ALTER TABLE ServicioEmpleado AUTO_INCREMENT = 1;

-- Tablas Principales de Operaciones
DELETE FROM Servicio;
ALTER TABLE Servicio AUTO_INCREMENT = 1;

DELETE FROM Ruta;
ALTER TABLE Ruta AUTO_INCREMENT = 1;

-- Contratos
DELETE FROM ContratoServicio;
ALTER TABLE ContratoServicio AUTO_INCREMENT = 1;

DELETE FROM ContratoLaboral;
ALTER TABLE ContratoLaboral AUTO_INCREMENT = 1;

-- Entidades Relacionadas a Clientes
DELETE FROM Prospecto;
ALTER TABLE Prospecto AUTO_INCREMENT = 1;

DELETE FROM Sede;
ALTER TABLE Sede AUTO_INCREMENT = 1;

DELETE FROM Empresa;
ALTER TABLE Empresa AUTO_INCREMENT = 1;

DELETE FROM Cliente;
ALTER TABLE Cliente AUTO_INCREMENT = 1;

-- Recursos
DELETE FROM Empleado;
ALTER TABLE Empleado AUTO_INCREMENT = 1;

-- DELETE FROM Vehiculo;
-- ALTER TABLE Vehiculo AUTO_INCREMENT = 1;

-- NOTA: Se excluyen AuditLog, Planta, Usuario y Vehiculo según ediciones recientes

SET FOREIGN_KEY_CHECKS = 1;
