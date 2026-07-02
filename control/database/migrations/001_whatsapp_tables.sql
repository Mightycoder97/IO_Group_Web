-- =============================================
-- IO Group CRM - WhatsApp Cloud API Tables
-- Migration 001
-- =============================================

-- Conversaciones de WhatsApp
CREATE TABLE IF NOT EXISTS WhatsAppConversation (
    id_conversation INT AUTO_INCREMENT PRIMARY KEY,
    wa_conversation_id VARCHAR(100) NULL COMMENT 'ID de conversación en Meta',
    wa_phone VARCHAR(20) NOT NULL COMMENT 'Teléfono del cliente (+51...)',
    wa_profile_name VARCHAR(100) NULL COMMENT 'Nombre de perfil en WA',
    id_prospecto INT NULL COMMENT 'FK a Prospecto (auto-link)',
    id_usuario_asignado INT NULL COMMENT 'FK a Usuario (agente asignado)',
    estado ENUM('abierta','asignada','cerrada','bot') DEFAULT 'abierta',
    origen VARCHAR(50) DEFAULT 'whatsapp' COMMENT 'whatsapp, meta_ad, manual',
    campaign_id VARCHAR(100) NULL COMMENT 'ID de campaña Meta',
    mensajes_no_leidos INT DEFAULT 0,
    ultima_actividad TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_phone (wa_phone),
    INDEX idx_usuario (id_usuario_asignado),
    INDEX idx_estado (estado),
    INDEX idx_actividad (ultima_actividad)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Mensajes individuales
CREATE TABLE IF NOT EXISTS WhatsAppMessage (
    id_message INT AUTO_INCREMENT PRIMARY KEY,
    id_conversation INT NOT NULL,
    wa_message_id VARCHAR(100) NULL COMMENT 'ID del mensaje en Meta',
    direccion ENUM('entrante','saliente') NOT NULL,
    tipo ENUM('texto','imagen','audio','video','documento','plantilla','interactivo','ubicacion','contacto') DEFAULT 'texto',
    contenido TEXT NULL COMMENT 'Texto del mensaje o caption',
    media_url VARCHAR(500) NULL COMMENT 'URL del media',
    media_mime VARCHAR(50) NULL,
    metadata_json JSON NULL COMMENT 'Datos extra (botones, listas, etc.)',
    estado_envio ENUM('enviado','entregado','leido','fallido') DEFAULT 'enviado',
    enviado_por INT NULL COMMENT 'FK a Usuario (NULL si cliente o bot)',
    es_bot BOOLEAN DEFAULT FALSE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_conversation (id_conversation),
    INDEX idx_fecha (fecha_creacion),
    INDEX idx_wa_msg (wa_message_id),
    FOREIGN KEY (id_conversation) REFERENCES WhatsAppConversation(id_conversation) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Configuración de la API de WhatsApp
CREATE TABLE IF NOT EXISTS WhatsAppConfig (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phone_number_id VARCHAR(50) NOT NULL COMMENT 'ID del número en Meta',
    waba_id VARCHAR(50) NOT NULL COMMENT 'WhatsApp Business Account ID',
    access_token TEXT NOT NULL COMMENT 'Token de acceso (permanente)',
    verify_token VARCHAR(100) NOT NULL COMMENT 'Token de verificación del webhook',
    webhook_secret VARCHAR(100) NULL COMMENT 'App Secret para validar firma',
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
