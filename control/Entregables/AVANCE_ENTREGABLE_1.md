# Avance Del Proyecto - Entregable 1

Fecha: 2026-05-05  
Proyecto: IO Group Web - Control  
Entregable: Etapa 1 - Base Tecnica y Despliegue  
Estado: Completado

## Resumen

Se completo el primer entregable del plan de trabajo. La base tecnica queda preparada para continuar con los siguientes modulos: catalogos, operacion, documentos, finanzas e inteligencia operativa.

## Trabajo Realizado

| Item | Estado | Evidencia |
|---|---|---|
| Confirmar schema oficial | Completado | Schema oficial: `database/squema.sql` |
| Alinear documentacion de deploy | Completado | `DEPLOY_HOSTINGER.md` actualizado |
| Corregir rutas CSS absolutas | Completado | No quedan `href="/css...` en HTML |
| Crear `control.css` | Completado | Nuevo archivo: `public/css/control.css` |
| Revisar encoding | Completado | Archivos validados como UTF-8 |
| Instalar PHP local | Completado | PHP 8.4.20 instalado via winget |
| Ejecutar lint PHP | Completado | `scripts/lint-php.ps1`: 48 archivos OK |
| Revisar `.htaccess` | Completado | Rutas agregadas para altas, egresos, firma y check_frecuencias |
| Proteger config frontend | Completado | `public/js/config.js` sanitizado y agregado a `.gitignore` |

## Archivos Modificados O Creados

- `.gitignore`
- `.htaccess`
- `DEPLOY_HOSTINGER.md`
- `public/css/control.css`
- `public/js/config.js`
- `scripts/lint-php.ps1`
- `task.md`
- HTML de paginas bajo `public/` para rutas CSS relativas

## Resultado De Validacion

```text
PHP 8.4.20
PHP lint OK: 48 files
```

## Espacios Para Screenshots

### Screenshot 1 - Pantalla Inicial / Login

Descripcion esperada: captura de `https://iogroup.pe/control/` redirigiendo correctamente a login o dashboard.

```text
[PEGAR SCREENSHOT AQUI]
```

Notas:

________________________________________________________________________________

________________________________________________________________________________

### Screenshot 2 - Dashboard Con CSS Cargando

Descripcion esperada: dashboard con sidebar, tarjetas KPI y graficos renderizados.

```text
[PEGAR SCREENSHOT AQUI]
```

Notas:

________________________________________________________________________________

________________________________________________________________________________

### Screenshot 3 - CSS Directo En Deploy

Descripcion esperada: navegador abriendo `https://iogroup.pe/control/css/global.css` o `https://iogroup.pe/control/css/control.css`.

```text
[PEGAR SCREENSHOT AQUI]
```

Notas:

________________________________________________________________________________

________________________________________________________________________________

### Screenshot 4 - Validacion PHP Lint

Descripcion esperada: terminal mostrando `PHP lint OK: 48 files`.

```text
[PEGAR SCREENSHOT AQUI]
```

Notas:

________________________________________________________________________________

________________________________________________________________________________

### Screenshot 5 - Prueba De Endpoint API

Descripcion esperada: respuesta JSON de un endpoint como `/control/api/auth.php?action=me`.

```text
[PEGAR SCREENSHOT AQUI]
```

Notas:

________________________________________________________________________________

________________________________________________________________________________

## Avance Del Proyecto

| Etapa | Nombre | Estado |
|---|---|---|
| 1 | Base tecnica y despliegue | Completado |
| 2 | Catalogos base | Siguiente |
| 3 | Operacion | Pendiente |
| 4 | Documentos y altas | Pendiente |
| 5 | Finanzas | Pendiente |
| 6 | Inteligencia operativa | Pendiente |
| 7 | Seguridad y permisos | Pendiente |
| 8 | QA, UAT y lanzamiento | Pendiente |

## Pendientes Para El Siguiente Entregable

- Confirmar exposicion de Empresas en navegacion.
- Validar formularios de catalogos con datos reales.
- Validar permisos de cada catalogo.
- Revisar consistencia visual despues de `control.css`.
- Probar flujo login/dashboard en navegador con servidor local o ambiente Hostinger.

