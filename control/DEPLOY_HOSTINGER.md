# Guia De Despliegue En Hostinger - PHP

## Requisitos

- Hosting con Apache y `mod_rewrite` habilitado.
- PHP 8.4 recomendado, compatible con PHP 8.2+ si el hosting lo exige.
- MySQL o MariaDB.
- Extensiones PHP: `pdo_mysql`, `openssl`, `json`, `mbstring`, `fileinfo`, `curl`.
- Acceso a File Manager, FTP/SFTP y phpMyAdmin.

## Archivos Confirmados Para Deploy

- Schema oficial base: `database/squema.sql`
- Seed admin opcional para base limpia: `database/seed.sql`
- Archivo de entorno ejemplo: `.env.example`
- Entrada web principal: `.htaccess` + `public/index.html`

> Nota: los archivos `database/schema_pg.sql` y `database/schema_pg_final.sql` son variantes PostgreSQL y no son el schema oficial para este despliegue PHP/MySQL.

## Paso 1: Crear Base De Datos MySQL

1. Entrar a hPanel.
2. Ir a Bases de datos > MySQL Databases.
3. Crear la base de datos.
4. Guardar estos datos:
   - Host
   - Database
   - Usuario
   - Password
   - Puerto, normalmente `3306`

## Paso 2: Importar Schema

1. Abrir phpMyAdmin.
2. Seleccionar la base de datos creada.
3. Ir a Importar.
4. Cargar `database/squema.sql`.
5. Ejecutar la importacion.

Si se necesita crear un usuario admin en una base sin datos, importar `database/seed.sql` solo despues de confirmar que la tabla `Usuario` esta vacia.

## Paso 3: Configurar Entorno

En el servidor, crear `control/.env` tomando como base `.env.example`:

```env
DB_HOST=localhost
DB_PORT=3306
DB_NAME=nombre_de_base
DB_USER=usuario_mysql
DB_PASSWORD=password_mysql
DB_CHARSET=utf8mb4

JWT_SECRET=clave_larga_y_segura_de_64_caracteres
JWT_EXPIRE=86400

CORS_ORIGIN=https://iogroup.pe
GOOGLE_MAPS_API_KEY=clave_google_maps
SUNAT_API_TOKEN=token_sunat
UPLOAD_PATH=./uploads
```

No colocar credenciales directamente en `api/config/config.php`; ese archivo ya lee variables desde `.env`.

## Paso 4: Configurar Google Maps En Frontend

Crear `control/public/js/config.js` en el servidor usando `control/public/js/config.example.js` como plantilla:

```js
const API_CONFIG = {
    GOOGLE_MAPS_API_KEY: 'TU_GOOGLE_MAPS_API_KEY'
};
```

Este archivo contiene una clave publica del frontend y no debe versionarse con credenciales reales.

## Paso 5: Subir Archivos

Subir la carpeta `control/` completa a:

```text
public_html/control/
```

Estructura esperada:

```text
public_html/
  control/
    .htaccess
    .env
    index.php
    api/
    database/
    public/
      index.html
      css/
      js/
      pages/
    uploads/
```

Permisos recomendados:

- Directorios: `755`
- Archivos PHP/HTML/CSS/JS: `644`
- `uploads/`: escribible por PHP segun configuracion del hosting

## Paso 6: Verificar Rutas

Abrir:

```text
https://iogroup.pe/control/
```

Verificar:

1. La pantalla redirige a login o dashboard segun sesion.
2. `https://iogroup.pe/control/css/global.css` carga correctamente.
3. `https://iogroup.pe/control/css/control.css` carga correctamente.
4. `https://iogroup.pe/control/api/auth.php?action=me` responde JSON, aunque sea con error 401 si no hay token.
5. Las rutas amigables `/control/api/clientes/1` y similares pasan por `.htaccess`.

## Paso 7: Validacion Tecnica Local

Con PHP instalado, ejecutar desde la raiz del proyecto:

```powershell
php -v
Get-ChildItem -Recurse -File -Include *.php |
  Where-Object { $_.FullName -notmatch '\\vendor\\' } |
  ForEach-Object { php -l $_.FullName }
```

Resultado esperado: sin errores de sintaxis.

## Solucion De Problemas

### Error 500

- Revisar permisos de archivos y directorios.
- Confirmar que `.htaccess` fue subido.
- Confirmar que `mod_rewrite` esta activo.
- Revisar credenciales en `.env`.

### Error De Conexion A DB

- Confirmar `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASSWORD` y `DB_PORT`.
- Confirmar que la importacion de `database/squema.sql` termino sin errores.

### CSS No Carga

- Confirmar que existen:
  - `control/public/css/global.css`
  - `control/public/css/control.css`
- Probar directamente `https://iogroup.pe/control/css/global.css`.

### Endpoint No Encontrado

- Confirmar que la regla correspondiente existe en `.htaccess`.
- Confirmar que el archivo PHP existe en `control/api/`.
- Usar preferentemente el cliente JS `api.js`, que convierte rutas como `/clientes/1` a `clientes.php?id=1`.
