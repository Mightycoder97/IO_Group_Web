# Task - Seguimiento De Entregables IO Group Web

Fecha de inicio del seguimiento: 2026-05-05  
Fuente base: `ENTREGABLES.md`
Modelo remoto: `ESTRATEGIA_TRABAJO_REMOTO.md`

## Objetivo

Cerrar el proyecto hasta dejarlo listo para uso productivo, tomando como linea base el analisis inicial de herramientas y entregables.

## Estado General

- [x] Inventario inicial de herramientas disponible.
- [x] Clasificacion inicial por estado disponible.
- [x] Calendario inicial de entregables disponible.
- [x] Estrategia de trabajo remoto por objetivos disponible.
- [x] Plantilla de reporte semanal disponible.
- [x] Reporte inicial de Semana 2 preparado.
- [x] Validacion tecnica con PHP instalado.
- [ ] Validacion end-to-end en navegador.
- [ ] Validacion con base de datos limpia.
- [ ] Validacion con datos reales o muestra operativa.

## Estrategia De Trabajo Remoto

Estado actual: Activa como modelo de seguimiento

- [x] Documento presentable para jefatura creado: `ESTRATEGIA_TRABAJO_REMOTO.md`.
- [x] Version Word-compatible creada: `ESTRATEGIA_TRABAJO_REMOTO.doc`.
- [x] Plantilla semanal creada: `PLANTILLA_REPORTE_SEMANAL.md`.
- [x] Version Word-compatible de plantilla creada: `PLANTILLA_REPORTE_SEMANAL.doc`.
- [x] Reporte operativo de inicio remoto creado: `AVANCE_SEMANA_2_CATALOGOS_BASE.md`.
- [ ] Completar reporte de Semana 2 con screenshots reales.
- [ ] Registrar bloqueos externos de Semana 2 si aparecen.
- [ ] Cerrar Semana 2 con demo o evidencia visible para jefatura.

## Etapa 1 - Base Tecnica Y Despliegue

Estado actual: Completado

- [x] Confirmar archivo schema oficial para despliegue.
- [x] Alinear documentacion de despliegue con el schema real.
- [x] Corregir rutas CSS absolutas para despliegue bajo `/control`.
- [x] Crear o reemplazar referencias a `public/css/control.css`.
- [x] Corregir textos con encoding roto.
- [x] Instalar PHP en entorno local o definir ambiente de validacion.
- [x] Ejecutar lint PHP sobre APIs principales.
- [x] Revisar `.htaccess` y rutas API en entorno final.

Resultado Etapa 1:

- Schema oficial confirmado: `database/squema.sql`.
- Guia de deploy actualizada: `DEPLOY_HOSTINGER.md`.
- Rutas CSS absolutas reemplazadas por rutas relativas en HTML.
- Archivo `public/css/control.css` creado.
- Encoding validado como UTF-8; los caracteres raros observados eran salida de consola, no contenido corrupto en archivo.
- PHP 8.4.20 instalado via winget.
- Lint PHP ejecutado con `scripts/lint-php.ps1`: 48 archivos OK.
- `.htaccess` actualizado con rutas faltantes: `altas`, `egresos`, `firma`, `check_frecuencias`.
- `public/js/config.js` sanitizado y agregado a `.gitignore` para no versionar claves reales.

## Etapa 2 - Catalogos Base

Estado actual: Completado a nivel de codigo; pendiente evidencia con datos reales

- [x] Clientes / Sedes: CRUD base implementado.
- [x] Sedes: cartilla disponible.
- [x] Vehiculos: catalogo base implementado.
- [x] Plantas: catalogo base implementado.
- [x] Empleados: catalogo base implementado.
- [x] Usuarios: CRUD base implementado.
- [x] Empresas: confirmar exposicion en navegacion o definir si queda como modulo interno.
- [ ] Validar formularios con datos reales.
- [x] Validar permisos de cada catalogo.

Resultado Etapa 2:

- Empresas queda expuesto como catalogo visible en el menu principal.
- Clientes, Empresas y Sedes quedan separados en navegacion para facilitar revision por jefatura.
- Botones de crear/eliminar en catalogos base quedan ligados al permiso del modulo correspondiente.
- Preset Operador actualizado para incluir catalogos base: clientes, empresas y sedes.
- Formulario de Usuarios alinea la ayuda visual de contrasena con la validacion real de API: minimo 8 caracteres, mayuscula, numero y caracter especial.
- Validacion tecnica ejecutada: PHP lint OK en 48 archivos; `public/js/app.js` sin errores de sintaxis; scripts inline de catalogos base parseados correctamente.
- Pendiente externo: completar screenshots y prueba con datos reales o muestra operativa.

## Etapa 3 - Operacion

Estado actual: Casi listo

- [x] Servicios: CRUD base implementado.
- [x] Calendario: asignacion por distritos implementada.
- [x] Rutas: asignacion principal implementada.
- [x] Historial de rutas: listado implementado.
- [x] Control de ruta: actualizacion de servicios y pagos implementada.
- [ ] Unificar uso de fechas: `fecha_ejecucion`, `fecha_servicio`, `fecha_programada`.
- [ ] Corregir dependencias visuales de rutas y dashboard.
- [ ] Probar creacion de ruta con sedes reales.
- [ ] Probar cierre completo de ruta con pagos y evidencias.
- [ ] Validar firmas y auditoria en control de ruta.

## Etapa 4 - Documentos Y Altas

Estado actual: Parcial

- [x] Nuevas Altas: flujo base implementado.
- [x] Firma digital: flujo base implementado.
- [x] Guias: CRUD base implementado.
- [x] Manifiestos: CRUD base implementado.
- [ ] Contratos: alinear campos UI con API/schema.
- [ ] Contratos: implementar subida real de PDF.
- [ ] Facturas: corregir edicion y subida usando ID real en API.
- [ ] Guias: implementar carga de PDF/documento escaneado.
- [ ] Manifiestos: implementar carga de PDF/documento escaneado.
- [ ] Altas: validar migraciones requeridas en base limpia.
- [ ] Firma digital: agregar expiracion, auditoria y controles de seguridad.

## Etapa 5 - Finanzas

Estado actual: Casi listo

- [x] Ingresos: API y pantallas base implementadas.
- [x] Egresos: API y pantallas base implementadas.
- [x] Cobranza: gestion y pagos base implementados.
- [ ] Validar conciliacion entre servicios, facturas, ingresos y cobranza.
- [ ] Validar eliminacion o reverso de ingresos nuevos.
- [ ] Validar duplicados de facturas generadas desde cobranza.
- [ ] Confirmar seeds de subcategorias de egresos.
- [ ] Revisar permisos de ingresos, egresos y cobranza.

## Etapa 6 - Inteligencia Operativa

Estado actual: Parcial

- [x] Dashboard: base visual y KPIs implementados.
- [x] Mapa de sedes: marcadores base implementados.
- [ ] Alertas: implementar endpoints esperados por frontend.
- [ ] Alertas: corregir conteos y tabs por tipo.
- [ ] Reportes: implementar `/reportes/resumen`.
- [ ] Reportes: corregir filtros de fecha.
- [ ] Reportes: implementar exportacion.
- [ ] Dashboard: corregir badge de alertas.
- [ ] Mapa: conectar controles pendientes.
- [ ] Mapa: proteger o rotar API key de Google Maps.

## Etapa 7 - Seguridad Y Permisos

Estado actual: Falta

- [ ] Completar matriz de permisos con todos los modulos reales.
- [ ] Aplicar permisos por modulo en backend, no solo en UI.
- [ ] Revisar roles admin/supervisor/usuario.
- [ ] Retirar o proteger scripts debug/test/migracion.
- [ ] Revisar endpoints publicos de firma y altas.
- [ ] Rotar credenciales/API keys expuestas.
- [ ] Revisar uploads y validacion de archivos.
- [ ] Confirmar proteccion de directorios sensibles.

## Etapa 8 - QA, UAT Y Lanzamiento

Estado actual: Falta

- [ ] Preparar base limpia de prueba.
- [ ] Ejecutar pruebas de login y permisos.
- [ ] Ejecutar pruebas de catalogos.
- [ ] Ejecutar pruebas de rutas completas.
- [ ] Ejecutar pruebas de altas/firma/documentos.
- [ ] Ejecutar pruebas de facturacion/cobranza.
- [ ] Ejecutar pruebas de reportes/alertas/dashboard.
- [ ] Validar responsive y visual en navegador.
- [ ] Preparar checklist de UAT con usuario final.
- [ ] Corregir hallazgos de UAT.
- [ ] Congelar version candidata.
- [ ] Publicar version productiva.

## Definicion De Terminado

El proyecto se considerara listo cuando:

- [ ] Todas las etapas esten completadas.
- [ ] No existan endpoints criticos sin permisos adecuados.
- [ ] No existan scripts debug/test expuestos.
- [ ] El despliegue pueda repetirse desde documentacion limpia.
- [ ] Las pantallas principales funcionen con datos reales.
- [ ] El usuario final apruebe UAT.
