# Guía de Despliegue en Hostinger - PHP Version

## Requisitos
- Plan Business Web Hosting de Hostinger
- Base de datos MySQL
- Acceso FTP o File Manager

---

## Paso 1: Crear Base de Datos MySQL

1. Ir a **hPanel → Bases de datos → MySQL Databases**
2. Crear base de datos con nombre descriptivo
3. Anotar credenciales:
   - **Host**: Aparece en el panel (ej: `localhost` o servidor MySQL)
   - **Database**: Nombre de la base de datos
   - **Usuario**: Usuario MySQL
   - **Contraseña**: La que configures

---

## Paso 2: Importar Schema

1. Ir a **phpMyAdmin** desde el panel
2. Seleccionar la base de datos
3. Ir a **Importar**
4. Cargar: `database/schema.sql`
5. Ejecutar

---

## Paso 3: Configurar Credenciales

Editar el archivo `control/api/config/config.php`:

```php
define('DB_HOST', 'tu_host_mysql');
define('DB_NAME', 'tu_nombre_db');
define('DB_USER', 'tu_usuario');
define('DB_PASS', 'tu_password');
define('JWT_SECRET', 'cambia_esta_clave_secreta_larga_2024');
```

> ⚠️ IMPORTANTE: Cambiar JWT_SECRET por una clave segura única

---

## Paso 4: Subir Archivos

### Usando File Manager:
1. Ir a **File Manager** en hPanel
2. Navegar a `public_html/control/`
3. Subir toda la carpeta `control/` con su contenido

### Estructura final:
```
public_html/
├── index.html          (página principal IO Group)
├── css/
├── js/
├── control/
│   ├── .htaccess
│   ├── index.php
│   ├── api/
│   │   ├── config/
│   │   │   ├── config.php
│   │   │   ├── database.php
│   │   │   └── jwt.php
│   │   ├── auth.php
│   │   ├── clientes.php
│   │   └── ... (demás APIs)
│   └── public/
│       ├── index.html
│       ├── css/
│       ├── js/
│       └── pages/
```

---

## Paso 5: Crear Usuario Admin

Acceder desde el navegador:

```
https://iogroup.pe/control/api/auth.php?action=setup
```

Esto creará un usuario admin con:
- **Usuario**: `admin`
- **Contraseña**: `Admin123!`

> ⚠️ Cambiar la contraseña después del primer login

---

## Paso 6: Verificar

1. Ir a `https://iogroup.pe/control/`
2. Ingresar con `admin` / `Admin123!`
3. Verificar que el dashboard carga

---

## Solución de Problemas

### Error 500
- Verificar permisos de archivos (644 para PHP, 755 para directorios)
- Revisar `.htaccess` está habilitado (mod_rewrite)

### Error de conexión a DB
- Verificar credenciales en `config.php`
- Confirmar que la base de datos existe

### Página en blanco
- Activar errores temporalmente en `config.php`:
  ```php
  ini_set('display_errors', 1);
  ```

### Error "Endpoint no encontrado"
- Verificar que `.htaccess` se subió correctamente
- Confirmar mod_rewrite está habilitado
