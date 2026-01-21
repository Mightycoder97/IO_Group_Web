-- ========================================
-- REESTRUCTURACIÓN COMPLETA DE SERVICIOS Y FACTURAS
-- ADVERTENCIA: Este script ELIMINA todos los datos existentes
-- ========================================

-- ========================================
-- PASO 1: Limpiar tablas relacionadas primero
-- ========================================

-- Eliminar registros de tablas dependientes
DELETE FROM ServicioEmpleado;
DELETE FROM Manifiesto;
DELETE FROM Guia;
DELETE FROM Factura;
DELETE FROM Servicio;

-- ========================================
-- PASO 2: Reestructurar tabla Servicio
-- ========================================

-- Eliminar columna fecha_programada (ya no se usa)
ALTER TABLE Servicio DROP COLUMN IF EXISTS fecha_programada;
ALTER TABLE Servicio DROP COLUMN IF EXISTS codigo_servicio;
ALTER TABLE Servicio DROP COLUMN IF EXISTS hora_llegada;
ALTER TABLE Servicio DROP COLUMN IF EXISTS hora_salida;

-- Agregar nuevas columnas a Servicio
ALTER TABLE Servicio ADD COLUMN IF NOT EXISTS estado_pago ENUM('pendiente', 'pagado') DEFAULT 'pendiente';
ALTER TABLE Servicio ADD COLUMN IF NOT EXISTS fecha_pago DATE DEFAULT NULL;
ALTER TABLE Servicio ADD COLUMN IF NOT EXISTS forma_pago VARCHAR(50) DEFAULT NULL;
ALTER TABLE Servicio ADD COLUMN IF NOT EXISTS descripcion_residuo VARCHAR(255) DEFAULT NULL;

-- Para MySQL que no soporta IF NOT EXISTS/IF EXISTS, ejecutar manualmente:
-- ALTER TABLE Servicio DROP COLUMN fecha_programada;
-- ALTER TABLE Servicio DROP COLUMN codigo_servicio;
-- ALTER TABLE Servicio ADD COLUMN estado_pago ENUM('pendiente', 'pagado') DEFAULT 'pendiente';
-- ALTER TABLE Servicio ADD COLUMN fecha_pago DATE DEFAULT NULL;
-- ALTER TABLE Servicio ADD COLUMN forma_pago VARCHAR(50) DEFAULT NULL;
-- ALTER TABLE Servicio ADD COLUMN descripcion_residuo VARCHAR(255) DEFAULT NULL;

-- ========================================
-- PASO 3: Reestructurar tabla Factura
-- Solo mantener: id_factura, id_servicio, numero_factura, doc_escaneado
-- ========================================

DROP TABLE IF EXISTS Factura;
CREATE TABLE Factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL,
    numero_factura VARCHAR(50) NOT NULL,
    doc_escaneado VARCHAR(500) DEFAULT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON DELETE CASCADE
);

-- ========================================
-- RESUMEN DE ESTRUCTURA FINAL - SERVICIO
-- ========================================
-- id_servicio        - PK auto-increment
-- id_sede            - FK a Sede (cliente)
-- id_ruta            - FK a Ruta (nullable)
-- id_planta          - FK a Planta (destino del residuo)
-- id_contrato        - FK a Contrato (nullable)
-- mes_servicio       - VARCHAR para el mes (ej: "Enero", "Febrero")
-- fecha_ejecucion    - DATE (fecha real del servicio)
-- estado             - ENUM (programado, en_curso, completado, cancelado)
-- observaciones      - TEXT
-- fecha_creacion     - TIMESTAMP
-- fecha_modificacion - TIMESTAMP
-- estado_pago        - ENUM (pendiente, pagado)
-- fecha_pago         - DATE
-- forma_pago         - VARCHAR (transferencia, yape, plin, efectivo, deposito)
-- descripcion_residuo - VARCHAR (descripción del tipo de residuo)

-- ========================================
-- RESUMEN DE ESTRUCTURA FINAL - FACTURA
-- ========================================
-- id_factura         - PK auto-increment
-- id_servicio        - FK a Servicio
-- numero_factura     - VARCHAR
-- doc_escaneado      - VARCHAR (ruta al PDF)
-- fecha_creacion     - TIMESTAMP
