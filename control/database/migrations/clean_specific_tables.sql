-- Script para limpiar todas las tablas, a excepción de las solicitadas:
-- Se conservan intactas: Usuario, Empleado, Vehiculo, Planta

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Eliminar primero las tablas HILAS (las más profundas en la jerarquía)
DELETE FROM AuditLog;
ALTER TABLE AuditLog AUTO_INCREMENT = 1;

DELETE FROM Factura;
ALTER TABLE Factura AUTO_INCREMENT = 1;

DELETE FROM Guia;
ALTER TABLE Guia AUTO_INCREMENT = 1;

DELETE FROM Manifiesto;
ALTER TABLE Manifiesto AUTO_INCREMENT = 1;

DELETE FROM ServicioEmpleado;
ALTER TABLE ServicioEmpleado AUTO_INCREMENT = 1;

-- 2. Eliminar Servicios y Contratos (padres de Facturas, pero hijos de Sede)
DELETE FROM Servicio;
ALTER TABLE Servicio AUTO_INCREMENT = 1;

DELETE FROM ContratoServicio;
ALTER TABLE ContratoServicio AUTO_INCREMENT = 1;

DELETE FROM CalendarioRecojo;
ALTER TABLE CalendarioRecojo AUTO_INCREMENT = 1;

DELETE FROM Ruta;
ALTER TABLE Ruta AUTO_INCREMENT = 1;

-- 3. Eliminar Sedes (padre de servicio, hijo de empresa)
DELETE FROM Sede;
ALTER TABLE Sede AUTO_INCREMENT = 1;

-- 4. Eliminar Empresas (padre de Sede, hijo de Cliente)
DELETE FROM Empresa;
ALTER TABLE Empresa AUTO_INCREMENT = 1;

-- 5. Eliminar Clientes (Padre Supremo)
DELETE FROM Cliente;
ALTER TABLE Cliente AUTO_INCREMENT = 1;

-- 6. Eliminar el resto de tablas independientes
DELETE FROM ContratoLaboral;
ALTER TABLE ContratoLaboral AUTO_INCREMENT = 1;

DELETE FROM EgresoSubcategoria;
ALTER TABLE EgresoSubcategoria AUTO_INCREMENT = 1;

DELETE FROM Egreso;
ALTER TABLE Egreso AUTO_INCREMENT = 1;

DELETE FROM GestionCobranza;
ALTER TABLE GestionCobranza AUTO_INCREMENT = 1;

DELETE FROM IngresoNuevoCliente;
ALTER TABLE IngresoNuevoCliente AUTO_INCREMENT = 1;

DELETE FROM NewsletterSubscriber;
ALTER TABLE NewsletterSubscriber AUTO_INCREMENT = 1;

DELETE FROM Prospecto;
ALTER TABLE Prospecto AUTO_INCREMENT = 1;

DELETE FROM UsuarioPermiso;
ALTER TABLE UsuarioPermiso AUTO_INCREMENT = 1;


SET FOREIGN_KEY_CHECKS = 1;
