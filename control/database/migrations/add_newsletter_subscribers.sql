-- ============================================
-- IO Group - Newsletter Subscribers Table
-- Migration: Add newsletter subscription system
-- ============================================

CREATE TABLE IF NOT EXISTS NewsletterSubscriber (
    id_subscriber INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    nombre VARCHAR(100),
    codigo_descuento VARCHAR(50) NOT NULL,
    descuento_usado TINYINT(1) DEFAULT 0,
    activo TINYINT(1) DEFAULT 1,
    ip_address VARCHAR(45),
    user_agent TEXT,
    pagina_origen VARCHAR(255),
    fecha_suscripcion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_uso_descuento DATETIME,
    
    INDEX idx_newsletter_email (email),
    INDEX idx_newsletter_codigo (codigo_descuento),
    INDEX idx_newsletter_fecha (fecha_suscripcion)
);

-- Add comments for documentation
ALTER TABLE NewsletterSubscriber COMMENT = 'Suscriptores al newsletter con código de descuento 15%';
