# Guía de Despliegue en Hostinger

## Requisitos Previos
- Plan de hosting con soporte para Node.js
- Acceso a panel de Hostinger

---

## Paso 1: Crear Base de Datos MySQL

1. Ir a **Hosting → Bases de datos → MySQL Databases**
2. Crear nueva base de datos: `iogroup_db`
3. Anotar:
   - Host: `sql123.main-hosting.eu` (aparece en el panel)
   - Usuario: `u123456789_iogroup`
   - Contraseña: (la que configures)

---

## Paso 2: Importar Schema

1. Ir a **phpMyAdmin**
2. Seleccionar la base de datos creada
3. Ir a pestaña **Importar**
4. Cargar archivo: `database/schema.sql`
5. Ejecutar

---

## Paso 3: Importar Datos Iniciales

1. En phpMyAdmin, ir a **Importar**
2. Cargar archivo: `database/seed.sql`
3. Ejecutar

---

## Paso 4: Configurar Variables de Entorno

Crear archivo `.env` en la raíz del proyecto:

```env
PORT=3000

# Base de datos Hostinger
DB_HOST=sql123.main-hosting.eu
DB_PORT=3306
DB_USER=u123456789_iogroup
DB_PASSWORD=tu_password
DB_DATABASE=u123456789_iogroup

# JWT
JWT_SECRET=clave_super_segura_cambiar_en_produccion
JWT_EXPIRES_IN=24h

# Uploads
UPLOAD_PATH=./uploads
```

---

## Paso 5: Subir Proyecto

### Opción A: Git
```bash
git clone tu-repositorio
cd tu-repositorio
npm install
```

### Opción B: FTP
1. Comprimir proyecto sin `node_modules`
2. Subir y descomprimir en `public_html` o directorio del sitio
3. Ejecutar `npm install` desde terminal SSH

---

## Paso 6: Iniciar Aplicación

En Hostinger con soporte Node.js:

```bash
npm start
```

O configurar PM2 si está disponible:
```bash
pm2 start server.js --name iogroup
pm2 save
```

---

## Paso 7: Crear Usuario Admin

Desde terminal o navegador:

```bash
curl -X POST https://tudominio.com/api/auth/setup
```

Credenciales por defecto:
- Usuario: `admin`
- Contraseña: `Admin123!`

---

## Verificación

1. Abrir `https://tudominio.com`
2. Iniciar sesión con admin/Admin123!
3. Verificar dashboard carga correctamente

---

## Solución de Problemas

### Error de conexión a DB
- Verificar host, usuario y contraseña en `.env`
- Confirmar IP del servidor está permitida en MySQL

### Error 502/504
- Verificar que Node.js está corriendo
- Revisar logs con `pm2 logs`

### Página en blanco
- Verificar archivos estáticos en `public/`
- Confirmar Express sirve correctamente static files
