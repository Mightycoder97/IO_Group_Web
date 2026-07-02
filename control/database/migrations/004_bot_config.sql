-- =============================================
-- IO Group CRM - Configuración del Bot de Ventas
-- Migration 004
-- =============================================

CREATE TABLE IF NOT EXISTS BotConfig (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL DEFAULT 'Bot de Ventas IO Group',
    system_prompt TEXT NOT NULL,
    knowledge_base TEXT NULL COMMENT 'Información adicional del negocio',
    modelo VARCHAR(50) DEFAULT 'gemini-2.5-flash',
    temperature DECIMAL(2,1) DEFAULT 0.7,
    max_tokens INT DEFAULT 500,
    horario_activo JSON NULL COMMENT 'Horario por día de la semana',
    auto_transfer_keywords JSON NULL COMMENT 'Keywords que disparan transferencia',
    max_bot_messages INT DEFAULT 10 COMMENT 'Máximo de mensajes bot antes de transferir',
    mensaje_bienvenida TEXT NULL,
    mensaje_transferencia TEXT DEFAULT 'Te conecto con uno de nuestros asesores especializados. Un momento por favor. 🙏',
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Configuración predeterminada para IO Group
INSERT INTO BotConfig (nombre, system_prompt, knowledge_base, mensaje_bienvenida, auto_transfer_keywords, horario_activo) VALUES (
    'Bot de Ventas IO Group',
    'Eres un asistente de ventas profesional de IO Group, una empresa peruana líder en gestión integral de residuos sólidos (biocontaminados, industriales, hospitalarios). Tu objetivo es:
1. Dar la bienvenida cordial al cliente
2. Entender qué tipo de servicio necesita
3. Explicar brevemente los servicios disponibles
4. Recopilar datos básicos (nombre, empresa, tipo de negocio, ubicación)
5. Si el cliente muestra interés serio en contratar, transferir a un asesor humano

Reglas importantes:
- Responde siempre en español
- Sé profesional pero amigable y cercano
- No inventes precios específicos, indica que un asesor le dará la cotización exacta según su caso
- Si no sabes algo, di que verificarás con el equipo
- Mantén las respuestas cortas (máximo 2-3 párrafos)
- Si el cliente pide hablar con una persona real, transfiere inmediatamente
- Usa emojis con moderación (máximo 1-2 por mensaje)
- Si preguntan por cobertura, indica Lima Metropolitana y principales ciudades del Perú
- No compartas información confidencial de la empresa
- Si detectas que el cliente está listo para contratar o pide cotización formal, transfiere a un asesor',
    'IO Group - Servicios principales:
• Recolección y transporte de residuos biocontaminados (Clase A)
• Gestión de residuos industriales y peligrosos
• Tratamiento por incineración y autoclave
• Documentación: Manifiestos, Declaraciones SIGERSOL, reportes OEFA/DIGESA

Clientes típicos:
• Clínicas dentales y consultorios odontológicos
• Veterinarias y clínicas veterinarias
• Laboratorios clínicos
• Centros médicos y policlínicos
• Hospitales y clínicas
• Farmacias y boticas
• Spas y centros estéticos
• Estudios de tatuajes
• Empresas industriales

Frecuencias disponibles: diaria, interdiaria, semanal, quincenal, mensual
Cobertura: Lima Metropolitana (todos los distritos) y principales ciudades
Certificaciones: EPS-RS vigente, autorización DIGESA
Beneficios: Cumplimiento normativo, trazabilidad completa, documentación digital, soporte dedicado',
    '¡Hola! 👋 Bienvenido a IO Group, expertos en gestión de residuos. Soy tu asistente virtual. ¿En qué puedo ayudarte hoy?',
    '["quiero contratar", "precio final", "hablar con alguien", "persona real", "asesor humano", "cotización formal", "firmar contrato", "quiero cotizar", "cuánto cuesta", "necesito hablar con alguien", "agente humano"]',
    '{"lunes":{"inicio":"08:00","fin":"22:00"},"martes":{"inicio":"08:00","fin":"22:00"},"miercoles":{"inicio":"08:00","fin":"22:00"},"jueves":{"inicio":"08:00","fin":"22:00"},"viernes":{"inicio":"08:00","fin":"22:00"},"sabado":{"inicio":"09:00","fin":"14:00"},"domingo":null}'
);
