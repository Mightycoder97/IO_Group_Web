# Mapa de Asignar Rutas — Funcionalidades Avanzadas

## Tareas (Baja Prioridad / Alta Complejidad)

### 1. Capa de distritos (GeoJSON overlay)
- Cargar GeoJSON con límites distritales de Lima Metropolitana y Callao
- Mostrar overlay semitransparente en el mapa
- Resaltar distritos que contienen sedes del filtro actual
- Mostrar nombre del distrito al hacer hover
- Archivos: `route-assignment-map.js` (método), `lima_distritos.json` (datos)

### 2. Mapa de calor de densidad
- Botón toggle en el header del mapa: "Ver densidad"
- Al activar: mostrar círculos semitransparentes donde se concentran sedes sin asignar
- Intensidad del color proporcional a la cantidad de sedes en esa zona
- Se actualiza con los filtros del panel izquierdo
- Archivos: `route-assignment-map.js`, `listar.html`

### 3. Previsualización de clusters K-means
- Modificar autoAsignarRutas() para que muestre una vista previa antes de confirmar
- Dibujar círculos de colores (1 por vehículo) en el mapa con:
  - Centro del cluster
  - Número de sedes asignadas
  - Color del vehículo
- Cada sede del cluster mostrada con el color de su futuro vehículo
- Botones "Confirmar" / "Cancelar" en un overlay flotante
- Al confirmar: ejecutar la asignación real
- Al cancelar: limpiar preview y restaurar vista anterior
- Archivos: `listar.html` (autoAsignarRutas), `route-assignment-map.js`
