-- ============================================
-- IO Control - Phase 4: Control Financiero
-- Database Migration
-- ============================================

-- ============================================
-- TABLA: GestionCobranza
-- Registro de gestiones de cobranza (WhatsApp, llamadas, visitas)
-- ============================================
CREATE TABLE IF NOT EXISTS GestionCobranza (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_sede INT NOT NULL,
    tipo_gestion ENUM('whatsapp','llamada','visita') NOT NULL,
    resultado ENUM('contactado','no_contesta','promesa_pago','pagado','rechazado') NOT NULL,
    observaciones TEXT,
    fecha_proxima_gestion DATE,
    gestionado_por INT,
    fecha_gestion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON DELETE CASCADE,
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede) ON DELETE CASCADE
);

-- ============================================
-- TABLA: IngresoNuevoCliente  
-- Pagos adelantados de nuevos clientes
-- ============================================
CREATE TABLE IF NOT EXISTS IngresoNuevoCliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT NOT NULL,
    id_sede INT NOT NULL,
    meses_pagados INT NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(50),
    observaciones TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_contrato) REFERENCES ContratoServicio(id_contrato) ON DELETE CASCADE,
    FOREIGN KEY (id_sede) REFERENCES Sede(id_sede) ON DELETE CASCADE
);

-- ============================================
-- INDICES para optimización
-- ============================================
CREATE INDEX idx_gestion_servicio ON GestionCobranza(id_servicio);
CREATE INDEX idx_gestion_sede ON GestionCobranza(id_sede);
CREATE INDEX idx_gestion_fecha ON GestionCobranza(fecha_gestion);
CREATE INDEX idx_gestion_resultado ON GestionCobranza(resultado);

CREATE INDEX idx_ingreso_nuevo_sede ON IngresoNuevoCliente(id_sede);
CREATE INDEX idx_ingreso_nuevo_fecha ON IngresoNuevoCliente(fecha_pago);
CREATE INDEX idx_ingreso_nuevo_contrato ON IngresoNuevoCliente(id_contrato);
