-- PostgreSQL schema converted from MySQL

CREATE TABLE "AuditLog" (

  "id_log" integer NOT NULL,
  "id_usuario" integer DEFAULT NULL,
  "tabla_afectada" varchar(50) NOT NULL,
  "id_registro" integer DEFAULT NULL,
  "accion" text NOT NULL,
  "datos_anteriores" longtext DEFAULT NULL CHECK (json_valid("datos_anteriores")),
  "datos_nuevos" longtext DEFAULT NULL CHECK (json_valid("datos_nuevos")),
  "ip_address" varchar(45) DEFAULT NULL,
  "fecha_hora" timestamp DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE "CalendarioRecojo" (

  "id" integer NOT NULL,
  "mes" integer NOT NULL COMMENT 'Mes (1-12)',
  "anio" integer NOT NULL COMMENT 'Año',
  "dias_json" longtext DEFAULT NULL COMMENT 'JSON con formato {"YYYY-MM-DD": ["distrito1", "distrito2"], ...}' CHECK (json_valid("dias_json")),
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "Cliente" (

  "id_cliente" integer NOT NULL,
  "nombre" varchar(100) NOT NULL,
  "tipo_documento" text DEFAULT 'DNI',
  "dni" varchar(15) DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "ContratoLaboral" (

  "id_contrato_laboral" integer NOT NULL,
  "id_empleado" integer NOT NULL,
  "cargo" varchar(100) NOT NULL,
  "fecha_inicio" date NOT NULL,
  "fecha_fin" date DEFAULT NULL,
  "sueldo" decimal(10,2) DEFAULT NULL,
  "tipo_contrato" text DEFAULT 'indefinido',
  "doc_escaneado" varchar(255) DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "ContratoServicio" (

  "id_contrato" integer NOT NULL,
  "id_sede" integer NOT NULL,
  "fecha_inicio" date NOT NULL,
  "fecha_fin" date DEFAULT NULL,
  "frecuencia" text NOT NULL,
  "peso_limite_kg" decimal(10,2) DEFAULT NULL,
  "tarifa_adicional_kg" decimal(10,2) DEFAULT NULL,
  "tarifa" decimal(10,2) NOT NULL,
  "tipo_tarifa" text DEFAULT 'por_servicio',
  "doc_escaneado" varchar(255) DEFAULT NULL,
  "comprobante_pago" varchar(500) DEFAULT NULL,
  "observaciones" text DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "Egreso" (

  "id_egreso" integer NOT NULL,
  "categoria" text NOT NULL,
  "subcategoria" varchar(50) NOT NULL,
  "descripcion" varchar(255) NOT NULL,
  "monto" decimal(10,2) NOT NULL,
  "fecha" date NOT NULL,
  "id_ruta" integer DEFAULT NULL COMMENT 'Ruta asociada para gastos operativos',
  "id_vehiculo" integer DEFAULT NULL COMMENT 'Vehículo asociado para gastos de mantenimiento',
  "comprobante" varchar(100) DEFAULT NULL COMMENT 'Número de factura/boleta',
  "observaciones" text DEFAULT NULL,
  "id_usuario" integer NOT NULL COMMENT 'Usuario que registró el gasto',
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "EgresoSubcategoria" (

  "id_subcategoria" integer NOT NULL,
  "categoria" text NOT NULL,
  "nombre" varchar(50) NOT NULL,
  "descripcion" varchar(100) DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1

);

CREATE TABLE "Empleado" (

  "id_empleado" integer NOT NULL,
  "dni" varchar(8) NOT NULL,
  "nombres" varchar(100) NOT NULL,
  "apellidos" varchar(100) NOT NULL,
  "telefono" varchar(20) DEFAULT NULL,
  "email" varchar(100) DEFAULT NULL,
  "direccion" varchar(255) DEFAULT NULL,
  "fecha_nacimiento" date DEFAULT NULL,
  "licencia_conducir" varchar(20) DEFAULT NULL,
  "categoria_licencia" varchar(10) DEFAULT NULL,
  "fecha_venc_licencia" date DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "Empresa" (

  "id_empresa" integer NOT NULL,
  "id_cliente" integer NOT NULL,
  "razon_social" varchar(200) NOT NULL,
  "rubro" varchar(100) DEFAULT NULL,
  "ruc" varchar(11) NOT NULL,
  "direccion_fiscal" varchar(255) DEFAULT NULL,
  "distrito" varchar(100) DEFAULT NULL,
  "provincia" varchar(100) DEFAULT NULL,
  "departamento" varchar(100) DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "Factura" (

  "id_factura" integer NOT NULL,
  "id_servicio" integer NOT NULL,
  "numero_factura" varchar(50) NOT NULL,
  "doc_escaneado" varchar(500) DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE "FirmaDigital" (

  "id_firma" integer NOT NULL,
  "id_proceso" integer NOT NULL,
  "token" varchar(64) NOT NULL,
  "firmado" tinyinteger DEFAULT 0,
  "firma_imagen" varchar(500) DEFAULT NULL,
  "ip_firmante" varchar(45) DEFAULT NULL,
  "user_agent" text DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_firma" timestamp DEFAULT NULL

);

CREATE TABLE "GestionCobranza" (

  "id" integer NOT NULL,
  "id_servicio" integer NOT NULL,
  "id_sede" integer NOT NULL,
  "tipo_gestion" text NOT NULL,
  "resultado" text NOT NULL,
  "observaciones" text DEFAULT NULL,
  "fecha_proxima_gestion" date DEFAULT NULL,
  "gestionado_por" integer DEFAULT NULL,
  "fecha_gestion" timestamp DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE "Guia" (

  "id_guia" integer NOT NULL,
  "id_servicio" integer NOT NULL,
  "serie" varchar(10) DEFAULT NULL,
  "numero_guia" varchar(20) NOT NULL,
  "fecha_emision" date DEFAULT NULL,
  "punto_partida" varchar(255) DEFAULT NULL,
  "punto_llegada" varchar(255) DEFAULT NULL,
  "doc_escaneado" varchar(255) DEFAULT NULL,
  "observaciones" text DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "IngresoNuevoCliente" (

  "id" integer NOT NULL,
  "id_contrato" integer NOT NULL,
  "id_sede" integer NOT NULL,
  "meses_pagados" integer NOT NULL,
  "monto_total" decimal(10,2) NOT NULL,
  "fecha_pago" date NOT NULL,
  "metodo_pago" varchar(50) DEFAULT NULL,
  "observaciones" text DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE "Manifiesto" (

  "id_manifiesto" integer NOT NULL,
  "id_servicio" integer NOT NULL,
  "numero_manifiesto" varchar(50) DEFAULT NULL,
  "tipo_residuo" varchar(100) DEFAULT NULL,
  "codigo_residuo" varchar(20) DEFAULT NULL,
  "descripcion_residuo" text DEFAULT NULL,
  "peso_kg" decimal(10,2) DEFAULT NULL,
  "unidad_medida" varchar(20) DEFAULT 'kg',
  "cantidad_bultos" integer DEFAULT NULL,
  "nombre_responsable" varchar(100) DEFAULT NULL,
  "cargo_responsable" varchar(100) DEFAULT NULL,
  "dni_responsable" varchar(15) DEFAULT NULL,
  "doc_escaneado" varchar(255) DEFAULT NULL,
  "observaciones" text DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "NewsletterSubscriber" (

  "id_subscriber" integer NOT NULL,
  "email" varchar(255) NOT NULL,
  "nombre" varchar(100) DEFAULT NULL,
  "codigo_descuento" varchar(50) NOT NULL,
  "descuento_usado" tinyinteger DEFAULT 0,
  "activo" tinyinteger DEFAULT 1,
  "ip_address" varchar(45) DEFAULT NULL,
  "user_agent" text DEFAULT NULL,
  "pagina_origen" varchar(255) DEFAULT NULL,
  "fecha_suscripcion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_uso_descuento" timestamp DEFAULT NULL

);

CREATE TABLE "Planta" (

  "id_planta" integer NOT NULL,
  "razon_social" varchar(200) NOT NULL,
  "ruc" varchar(11) NOT NULL,
  "nombre_comercial" varchar(200) DEFAULT NULL,
  "direccion" varchar(255) NOT NULL,
  "distrito" varchar(100) DEFAULT NULL,
  "provincia" varchar(100) DEFAULT NULL,
  "departamento" varchar(100) DEFAULT NULL,
  "tipo_tratamiento" varchar(100) DEFAULT NULL,
  "codigo_eps" varchar(50) DEFAULT NULL,
  "telefono" varchar(20) DEFAULT NULL,
  "contacto_nombre" varchar(100) DEFAULT NULL,
  "contacto_email" varchar(100) DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "ProcesoAlta" (

  "id_proceso" integer NOT NULL,
  "datos_json" longtext NOT NULL CHECK (json_valid("datos_json")),
  "etapa_actual" integer DEFAULT 1,
  "id_usuario_creador" integer DEFAULT NULL,
  "id_usuario_modificador" integer DEFAULT NULL,
  "doc_generado" varchar(255) DEFAULT NULL,
  "doc_firmado" varchar(255) DEFAULT NULL,
  "comprobante_pago" varchar(255) DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "Prospecto" (

  "id_prospecto" integer NOT NULL,
  "nombre_comercial" varchar(200) NOT NULL,
  "tipo_cliente" text DEFAULT 'persona',
  "ruc" varchar(11) DEFAULT NULL,
  "dni" varchar(15) DEFAULT NULL,
  "telefono" varchar(20) DEFAULT NULL,
  "email" varchar(100) DEFAULT NULL,
  "direccion" varchar(255) DEFAULT NULL,
  "distrito" varchar(100) DEFAULT NULL,
  "fuente" varchar(50) DEFAULT NULL,
  "estado" text DEFAULT 'nuevo',
  "valor_potencial" decimal(10,2) DEFAULT NULL,
  "notas" text DEFAULT NULL,
  "id_usuario_asignado" integer DEFAULT NULL,
  "fecha_proximo_contacto" date DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "Ruta" (

  "id_ruta" integer NOT NULL,
  "id_vehiculo" integer NOT NULL,
  "codigo_ruta" varchar(50) DEFAULT NULL,
  "fecha" date NOT NULL,
  "hora_salida" time DEFAULT NULL,
  "hora_retorno" time DEFAULT NULL,
  "km_inicial" integer DEFAULT NULL,
  "km_final" integer DEFAULT NULL,
  "estado" text DEFAULT 'programada',
  "observaciones" text DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP ,
  "id_chofer" integer DEFAULT NULL,
  "id_ayudante" integer DEFAULT NULL

);

CREATE TABLE "Sede" (

  "id_sede" integer NOT NULL,
  "id_empresa" integer NOT NULL,
  "nombre_comercial" varchar(200) NOT NULL,
  "direccion" varchar(255) NOT NULL,
  "distrito" varchar(100) DEFAULT NULL,
  "provincia" varchar(100) DEFAULT NULL,
  "departamento" varchar(100) DEFAULT NULL,
  "region" varchar(20) DEFAULT NULL,
  "referencia" text DEFAULT NULL,
  "coordenadas_gps" varchar(50) DEFAULT NULL,
  "contacto_nombre" varchar(100) DEFAULT NULL,
  "contacto_telefono" varchar(20) DEFAULT NULL,
  "contacto_telefono_2" varchar(20) DEFAULT NULL,
  "contacto_email" varchar(100) DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "Servicio" (

  "id_servicio" integer NOT NULL,
  "id_sede" integer NOT NULL,
  "id_ruta" integer DEFAULT NULL,
  "id_planta" integer DEFAULT NULL,
  "id_contrato" integer DEFAULT NULL,
  "mes_servicio" varchar(50) DEFAULT NULL,
  "fecha_ejecucion" date DEFAULT NULL,
  "estado" text DEFAULT 'completado',
  "estado_pago" text DEFAULT 'pendiente',
  "fecha_pago" date DEFAULT NULL,
  "forma_pago" varchar(50) DEFAULT NULL,
  "residuo" text DEFAULT NULL,
  "observaciones" text DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "ServicioEmpleado" (

  "id_servicio_empleado" integer NOT NULL,
  "id_servicio" integer NOT NULL,
  "id_empleado" integer NOT NULL,
  "rol" text DEFAULT 'ayudante',
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE "Usuario" (

  "id_usuario" integer NOT NULL,
  "username" varchar(50) NOT NULL,
  "password_hash" varchar(255) NOT NULL,
  "nombre_completo" varchar(100) NOT NULL,
  "rol" text DEFAULT 'viewer',
  "email" varchar(100) DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "ultimo_acceso" timestamp DEFAULT NULL,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

CREATE TABLE "UsuarioPermiso" (

  "id_permiso" integer NOT NULL,
  "id_usuario" integer NOT NULL,
  "modulo" varchar(50) NOT NULL,
  "puede_ver" tinyinteger DEFAULT 1,
  "puede_editar" tinyinteger DEFAULT 0,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE "Vehiculo" (

  "id_vehiculo" integer NOT NULL,
  "placa" varchar(10) NOT NULL,
  "marca" varchar(50) DEFAULT NULL,
  "modelo" varchar(50) DEFAULT NULL,
  "anio" integer DEFAULT NULL,
  "color" varchar(30) DEFAULT NULL,
  "tonelaje_max" decimal(6,2) DEFAULT NULL,
  "tipo" text DEFAULT 'camion',
  "numero_motor" varchar(50) DEFAULT NULL,
  "numero_chasis" varchar(50) DEFAULT NULL,
  "fecha_venc_soat" date DEFAULT NULL,
  "fecha_venc_revision" date DEFAULT NULL,
  "fecha_venc_mtc" date DEFAULT NULL,
  "activo" tinyinteger DEFAULT 1,
  "fecha_creacion" timestamp DEFAULT CURRENT_TIMESTAMP,
  "fecha_modificacion" timestamp DEFAULT CURRENT_TIMESTAMP 

);

