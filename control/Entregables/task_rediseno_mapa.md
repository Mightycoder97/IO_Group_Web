# Rediseño del Mapa — Asignar Rutas

## Objetivo
Transformar el panel derecho (mapa) de la página Asignar Rutas para que sea más visual, informativo y mejor integrado con el panel izquierdo.

## Tareas Alta Prioridad

### 1. Etiquetas de nombre en marcadores del vehículo activo
- Mostrar nombre comercial (abreviado, máx 14 chars) debajo del marcador
- Solo visible para sedes del vehículo seleccionado
- Etiqueta con fondo blanco semitransparente, texto oscuro, borde sutil
- Archivo: `route-assignment-map.js`

### 2. Leyenda por vehículo (color + placa + conteo)
- Reemplazar leyenda genérica actual por grid de vehículos
- Cada item muestra: [ícono con color/forma] Placa - X sedes
- Actualización dinámica al asignar/quitar
- Archivos: `listar.html` (HTML/CSS), `route-assignment-map.js` (update)

### 3. Métricas rediseñadas con cards y barra de progreso
- Reemplazar barra de texto actual por 4 mini-cards:
  - Total filtro (con ícono)
  - Asignadas (con ícono, color verde)
  - Pendientes (con ícono, color ámbar)
  - Cumplimiento % (con barra de progreso)
- Archivo: `listar.html`

### 4. InfoWindow rico al click con acciones directas
- Al click en marcador: nombre, dirección, distrito, frecuencia, teléfono
- Botones: "Agregar a [placa]" / "Mover a [placa]", "WhatsApp", "Ver sede"
- Acciones directas sin necesidad de ir al panel izquierdo
- Archivos: `route-assignment-map.js`, `listar.html`

## Tareas Media Prioridad

### 5. Líneas de ruta del vehículo activo (polyline + flechas)
- Dibujar polyline conectando sedes asignadas al vehículo seleccionado
- Respetar el orden de la ruta
- Color de línea = color del vehículo
- Flechas direccionales en la línea
- Ocultar líneas al cambiar de vehículo
- Archivo: `route-assignment-map.js`

### 6. Clustering de marcadores para zonas densas
- Agrupar marcadores cercanos en un solo ícono con contador
- Al hacer zoom se desagrupan progresivamente
- Color del cluster indica proporción asignadas/pendientes
- Umbral: agrupar a partir de zoom <= 13
- Archivo: `route-assignment-map.js`

### 7. Sincronización hover entre panel izquierdo y mapa
- Hover en resultado de búsqueda → resalta marcador en mapa (escala 1.5x, glow)
- Hover en marcador → resalta tarjeta en búsqueda (borde verde)
- Eventos mouseenter/mouseleave
- Archivos: `listar.html`, `route-assignment-map.js`
