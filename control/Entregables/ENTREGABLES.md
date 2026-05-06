# Entregables Del Proyecto IO Group Web

Fecha de analisis: 2026-05-05  
Proyecto: IO Group Web - modulo de control operativo  
Ubicacion: `C:\Users\Admin\Documents\GitHub\IO_Group_Web\control`

## Alcance

Este documento resume el estado actual de las herramientas encontradas en la app, clasifica cuales estan listas, cuales estan casi listas y cuales aun requieren desarrollo. Tambien propone un calendario de entregables como si el proyecto se iniciara desde cero, marcando el avance real segun el primer analisis.

## Criterios De Estado

- **Lista:** puede usarse como modulo base, pendiente solo de QA normal, datos reales o ajustes menores.
- **Casi lista:** el flujo principal existe, pero requiere correcciones puntuales antes de produccion.
- **Parcial:** existe una base funcional, pero faltan partes importantes del flujo.
- **Necesita desarrollo:** hay una brecha directa entre frontend, API, base de datos o comportamiento esperado.
- **No produccion:** herramienta util para desarrollo o mantenimiento, pero no debe quedar expuesta al usuario final.

## Resumen Ejecutivo

La aplicacion ya cuenta con una base solida para operacion diaria: catalogos, sedes, rutas, calendario, servicios, ingresos, egresos y cobranza. Los mayores riesgos antes de produccion estan en reportes, alertas, facturas, contratos, carga documental, permisos por modulo, limpieza de despliegue y seguridad.

Tambien se detectaron problemas transversales que deben resolverse antes de considerar el sistema listo para entrega: rutas CSS absolutas, archivo `control.css` faltante, textos con problemas de encoding, API key de Google Maps expuesta, scripts de debug o migracion dentro del arbol publico y documentacion de despliegue desalineada con los archivos reales de base de datos.

## Inventario De Herramientas

| Herramienta | Estado | Observaciones |
|---|---|---|
| Dashboard | Casi lista | KPIs y graficos existen. Falta corregir CSS y conteo de alertas. |
| Login / Auth | Casi lista | Login y JWT implementados. Falta alinear documentacion de instalacion y permisos. |
| Usuarios | Casi lista | CRUD y roles existen. Faltan permisos para altas, calendario, ingresos, egresos y cobranza. |
| Clientes / Sedes | Lista | CRUD y cartilla de sede implementados. Requiere QA visual y limpieza de encoding. |
| Empresas | Lista parcial | API y pantallas existen, pero no esta tan visible en la navegacion principal. |
| Prospectos | Casi lista | CRM funcional. Revisar logs de depuracion y dependencia de busqueda RUC/SUNAT. |
| Nuevas Altas | Casi lista | Flujo avanzado con documentos, contrato y firma. Falta QA end-to-end y seguridad documental. |
| Firma digital | Casi lista | Token publico y guardado de firma existen. Falta hardening, expiracion y auditoria completa. |
| Calendario | Lista | Asignacion por distritos y copia mensual implementadas. Permisos dependen de rutas. |
| Asignar Rutas | Casi lista | Flujo principal armado. Falta corregir CSS faltante y detalles de fechas/frecuencia. |
| Historial Rutas | Casi lista | Listado y consulta existen. Requiere QA con datos reales. |
| Control de Ruta | Casi lista | Actualiza servicios, pagos y estado. Falta QA fuerte sobre firmas/evidencias. |
| Servicios | Casi lista | CRUD listo. Hay mezcla de campos de fecha entre API, reportes y frontend. |
| Ingresos | Casi lista | Pantallas, API y graficos existen. Falta permisos y conciliacion contable final. |
| Egresos | Casi lista | CRUD, categorias y graficos existen. Validar seeds/subcategorias en base limpia. |
| Cobranza | Casi lista | Gestion, WhatsApp y pagos existen. Validar facturas, duplicados y cierres. |
| Facturas | Necesita desarrollo | Crear parece viable, pero edicion/subida por `/facturas/{id}` no coincide con la API actual. |
| Contratos | Necesita desarrollo | Hay campos de UI no soportados por API/schema y subida PDF pendiente. |
| Guias | Parcial | CRUD base existe. Falta carga de PDF/documento escaneado completa. |
| Manifiestos | Parcial | CRUD base existe. Falta carga documental y hay detalle de fecha en selector de servicios. |
| Vehiculos | Lista | Catalogo base funcional. |
| Plantas | Lista | Catalogo base funcional. |
| Empleados | Lista | Catalogo funcional usado por rutas. |
| Mapa de Sedes | Necesita desarrollo | Mapa y marcadores base existen. Varios controles no estan conectados y la API key esta expuesta. |
| Reportes | Necesita desarrollo | El frontend pide `/reportes/resumen`, pero la API no lo implementa. Exportacion pendiente. |
| Alertas | Necesita desarrollo | El frontend espera endpoints, conteos y tipos que la API no entrega con ese formato. |
| Geocodificador | No produccion | Genera SQL manual. Debe protegerse o convertirse en herramienta admin segura. |
| Scripts debug/migracion | No produccion | Deben retirarse, protegerse o separarse del despliegue publico. |

## Calendario De Entregables Desde Cero

| Etapa | Periodo sugerido | Entregable | Estado actual |
|---|---:|---|---|
| 1 | Semana 1 | Base tecnica: DB, auth, layout, navegacion, deploy inicial | Parcial |
| 2 | Semana 2 | Catalogos: clientes, sedes, empresas, vehiculos, plantas, empleados, usuarios | Mayormente listo |
| 3 | Semana 3 | Operacion: servicios, calendario, rutas, historial y control de ruta | Casi listo |
| 4 | Semana 4 | Documentos: contratos, facturas, guias, manifiestos, altas y firma digital | Parcial |
| 5 | Semana 5 | Finanzas: ingresos, egresos y cobranza | Casi listo |
| 6 | Semana 6 | Inteligencia operativa: dashboard, reportes, alertas y mapa | Parcial |
| 7 | Semana 7 | Seguridad, permisos, limpieza de debug, API keys, CSS, encoding y deploy | Falta |
| 8 | Semana 8 | QA integral, pruebas con datos reales, UAT y salida a produccion | Falta |

## Riesgos Transversales

1. **Permisos incompletos:** hay modulos visibles en navegacion que no aparecen en la matriz de permisos.
2. **Permisos no aplicados de forma uniforme en backend:** la UI oculta opciones, pero varias APIs dependen principalmente de rol general.
3. **Despliegue desalineado:** la documentacion menciona un schema que no coincide con los archivos actuales.
4. **CSS y rutas absolutas:** varias paginas apuntan a `/css/...`, lo cual puede fallar si la app vive bajo `/control`.
5. **Archivo CSS faltante:** algunas pantallas referencian `/css/control.css`, pero no se encontro ese archivo.
6. **Encoding:** existen textos con caracteres corruptos que afectan calidad percibida.
7. **Seguridad:** Google Maps API key esta versionada y hay scripts de mantenimiento/debug en el arbol del proyecto.
8. **Contratos/facturas/documentos:** faltan cargas y actualizaciones consistentes entre frontend y API.

## Prioridad Recomendada

1. Corregir bloqueadores globales: CSS, encoding, deploy, schema y seguridad.
2. Completar Alertas y Reportes porque afectan el control gerencial.
3. Corregir Facturas, Contratos y carga documental de Guias/Manifiestos.
4. Implementar permisos por modulo de forma consistente en frontend y backend.
5. Completar controles pendientes del Mapa de Sedes y proteger API key.
6. Ejecutar QA integral con datos reales y checklist de salida a produccion.

