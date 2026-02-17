# MAPEO DE DATOS: DATA 2026 → BASE DE DATOS u511863531_IOGroupBD

## 📊 Resumen de Columnas Excel vs Entidades BD

**Total de columnas en Excel:** 36  
**Entidades objetivo:** Cliente, Empresa, Sede, ContratoServicio

---

## 🧑‍💼 1. TABLA: Cliente

| Columna Excel | Campo BD | Tipo BD | Descripción |
|---------------|----------|---------|-------------|
| CLIENTE | `nombre` | VARCHAR(100) | Nombre completo del cliente |
| DNI | `dni` | VARCHAR(15) | Documento de identidad |
| - | `tipo_documento` | ENUM | Valor por defecto: 'DNI' |
| - | `activo` | TINYINT(1) | Valor por defecto: 1 |
| - | `id_cliente` | INT(11) | AUTO_INCREMENT (PK) |

**Notas:**
- El campo CLIENTE puede contener nombres de personas naturales
- Si CLIENTE es vacío o contiene "-", se debe omitir o usar razón social como alternativa

---

## 🏢 2. TABLA: Empresa

| Columna Excel | Campo BD | Tipo BD | Descripción |
|---------------|----------|---------|-------------|
| RAZON SOCIAL | `razon_social` | VARCHAR(200) | Razón social de la empresa |
| RUC | `ruc` | VARCHAR(11) | RUC de la empresa (único) |
| DIRECCION | `direccion_fiscal` | VARCHAR(255) | Dirección fiscal |
| DISTRITO | `distrito` | VARCHAR(100) | Distrito |
| PROVINCIA | `provincia` | VARCHAR(100) | Provincia |
| DEPARTAMENTO | `departamento` | VARCHAR(100) | Departamento |
| RUBRO | - | - | Campo adicional (no existe en BD actual) |
| - | `id_empresa` | INT(11) | AUTO_INCREMENT (PK) |
| - | `id_cliente` | INT(11) | FK → Cliente.id_cliente |
| - | `activo` | TINYINT(1) | Valor por defecto: 1 |

**Relación:** Empresa pertenece a un Cliente (1:1 o N:1)

---

## 🏪 3. TABLA: Sede

| Columna Excel | Campo BD | Tipo BD | Descripción |
|---------------|----------|---------|-------------|
| NOMBRE COMERCIAL | `nombre_comercial` | VARCHAR(200) | Nombre comercial de la sede |
| DIRECCION | `direccion` | VARCHAR(255) | Dirección de la sede |
| DISTRITO | `distrito` | VARCHAR(100) | Distrito de la sede |
| PROVINCIA | `provincia` | VARCHAR(100) | Provincia de la sede |
| DEPARTAMENTO | `departamento` | VARCHAR(100) | Departamento de la sede |
| CONTACTO | `contacto_nombre` | VARCHAR(100) | Nombre del contacto |
| TELEFONO PARA PROGRAMAR | `contacto_telefono` | VARCHAR(20) | Teléfono principal |
| TELEFONO PARA COBRAR | `contacto_telefono_2` | VARCHAR(20) | Teléfono secundario |
| CONTACTO HOJA DE RUTA | `contacto_email` | VARCHAR(100) | Email del contacto (si aplica) |
| OBSERVACION | `referencia` | TEXT | Referencias u observaciones |
| UBICACIÓN | `coordenadas_gps` | VARCHAR(50) | Coordenadas GPS si están disponibles |
| HORARIO | - | - | Información adicional para referencia |
| REPRESENTANTE | - | - | Información adicional del representante |
| - | `id_sede` | INT(11) | AUTO_INCREMENT (PK) |
| - | `id_empresa` | INT(11) | FK → Empresa.id_empresa |
| - | `activo` | TINYINT(1) | Valor por defecto: 1 |

**Relación:** Sede pertenece a una Empresa (N:1)

---

## 📋 4. TABLA: ContratoServicio

| Columna Excel | Campo BD | Tipo BD | Descripción |
|---------------|----------|---------|-------------|
| FECHA INICIO CONTRATO | `fecha_inicio` | DATE | Fecha de inicio del contrato |
| VIGENCIA | `fecha_fin` | DATE | Fecha de fin del contrato |
| LIMITE DE PESO | `peso_limite_kg` | DECIMAL(10,2) | Límite de peso en kg |
| TARIFA | `tarifa` | DECIMAL(10,2) | Monto de la tarifa |
| FRECUENCIA | `frecuencia` | ENUM | Frecuencia del servicio |
| RENOVACION DE CONTRATO | - | - | Indica si hay renovación (información adicional) |
| METODO PAGO | - | - | Método de pago (información adicional) |
| DEBEN | - | - | Estado de deuda (información adicional) |
| STATUS | - | - | Estado del contrato/servicio |
| INICIO DE SERVICIO CLIENTES NUEVOS | - | - | Fecha adicional de inicio |
| FECHA S. ENERO | - | - | Fecha de servicio enero |
| FECHA S. FEBRERO | - | - | Fecha de servicio febrero |
| SERVICIO ENERO | - | - | Detalle servicio enero |
| SERVICIO FEBRERO | - | - | Detalle servicio febrero |
| N° S° ENERO | - | - | Número de servicio enero |
| N° S° FEBRERO | - | - | Número de servicio febrero |
| PROGRAMACIONES NUMERO | - | - | Número de programaciones |
| FECHA DE SERVICIO | - | - | Fecha general de servicio |
| - | `id_contrato` | INT(11) | AUTO_INCREMENT (PK) |
| - | `id_sede` | INT(11) | FK → Sede.id_sede |
| - | `tipo_tarifa` | ENUM | Valor por defecto: 'por_servicio' |
| - | `activo` | TINYINT(1) | Valor por defecto: 1 |
| - | `observaciones` | TEXT | Observaciones del contrato |

**Relación:** ContratoServicio pertenece a una Sede (1:1 o N:1)

---

## 🔗 Diagrama de Relaciones

```
┌─────────────────────────────────────────────────────────────┐
│                        Cliente                               │
├─────────────────────────────────────────────────────────────┤
│ id_cliente (PK)                                             │
│ nombre ← CLIENTE                                            │
│ dni ← DNI                                                   │
│ tipo_documento                                              │
│ activo                                                      │
└──────────────────────┬──────────────────────────────────────┘
                       │ 1:N
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                       Empresa                                │
├─────────────────────────────────────────────────────────────┤
│ id_empresa (PK)                                             │
│ id_cliente (FK)                                             │
│ razon_social ← RAZON SOCIAL                                 │
│ ruc ← RUC                                                   │
│ direccion_fiscal ← DIRECCION                                │
│ distrito ← DISTRITO                                         │
│ provincia ← PROVINCIA                                       │
│ departamento ← DEPARTAMENTO                                 │
│ activo                                                      │
└──────────────────────┬──────────────────────────────────────┘
                       │ 1:N
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                         Sede                                 │
├─────────────────────────────────────────────────────────────┤
│ id_sede (PK)                                                │
│ id_empresa (FK)                                             │
│ nombre_comercial ← NOMBRE COMERCIAL                         │
│ direccion ← DIRECCION                                       │
│ distrito ← DISTRITO                                         │
│ provincia ← PROVINCIA                                       │
│ departamento ← DEPARTAMENTO                                 │
│ contacto_nombre ← CONTACTO                                  │
│ contacto_telefono ← TELEFONO PARA PROGRAMAR                 │
│ contacto_telefono_2 ← TELEFONO PARA COBRAR                  │
│ contacto_email ← CONTACTO HOJA DE RUTA                      │
│ referencia ← OBSERVACION                                    │
│ coordenadas_gps ← UBICACIÓN                                 │
│ activo                                                      │
└──────────────────────┬──────────────────────────────────────┘
                       │ 1:N
                       ▼
┌─────────────────────────────────────────────────────────────┐
│                   ContratoServicio                           │
├─────────────────────────────────────────────────────────────┤
│ id_contrato (PK)                                            │
│ id_sede (FK)                                                │
│ fecha_inicio ← FECHA INICIO CONTRATO                        │
│ fecha_fin ← VIGENCIA                                        │
│ frecuencia ← FRECUENCIA                                     │
│ peso_limite_kg ← LIMITE DE PESO                             │
│ tarifa ← TARIFA                                             │
│ tipo_tarifa                                                 │
│ observaciones                                               │
│ activo                                                      │
└─────────────────────────────────────────────────────────────┘
```

---

## ⚠️ Consideraciones Importantes

### 1. Duplicidad de información
- **DIRECCION** aparece tanto en Empresa (direccion_fiscal) como en Sede (direccion)
- **DISTRITO, PROVINCIA, DEPARTAMENTO** aparecen en Empresa y Sede
- Se debe determinar si son la misma ubicación o diferentes

### 2. Datos que requieren transformación
- **FRECUENCIA**: Valores en Excel deben mapear a ENUM ('diario','semanal','quincenal','mensual','bimestral','trimestral','eventual')
- **FECHA INICIO CONTRATO y VIGENCIA**: Convertir a formato DATE (YYYY-MM-DD)
- **LIMITE DE PESO y TARIFA**: Convertir a DECIMAL
- **TELEFONOS**: Limpiar y formatear

### 3. Campos obligatorios sin mapeo directo
- **RUBRO**: No existe campo en Empresa (podría agregarse como campo adicional)
- **HORARIO**: No tiene campo específico en BD
- **RENOVACION DE CONTRATO**: No tiene campo booleano en BD
- **METODO PAGO**: No existe en ContratoServicio
- **DEBEN, STATUS**: Campos de estado que no existen en BD

### 4. Datos de servicios históricos
Las columnas relacionadas con servicios específicos (ENERO, FEBRERO) deben procesarse separadamente en la tabla `Servicio` (no en ContratoServicio):
- FECHA S. ENERO, FECHA S. FEBRERO
- SERVICIO ENERO, SERVICIO FEBRERO
- N° S° ENERO, N° S° FEBRERO

### 5. Jerarquía de inserción
El orden correcto de inserción debe respetar las FK:
1. **Cliente** (obtener id_cliente)
2. **Empresa** (usar id_cliente, obtener id_empresa)
3. **Sede** (usar id_empresa, obtener id_sede)
4. **ContratoServicio** (usar id_sede)

---

## 📝 Ejemplo de Mapeo por Fila

```sql
-- 1. Insertar Cliente
INSERT INTO Cliente (nombre, dni, tipo_documento, activo)
VALUES ('[CLIENTE]', '[DNI]', 'DNI', 1);
SET @id_cliente = LAST_INSERT_ID();

-- 2. Insertar Empresa
INSERT INTO Empresa (id_cliente, razon_social, ruc, direccion_fiscal, distrito, provincia, departamento, activo)
VALUES (@id_cliente, '[RAZON SOCIAL]', '[RUC]', '[DIRECCION]', '[DISTRITO]', '[PROVINCIA]', '[DEPARTAMENTO]', 1);
SET @id_empresa = LAST_INSERT_ID();

-- 3. Insertar Sede
INSERT INTO Sede (id_empresa, nombre_comercial, direccion, distrito, provincia, departamento, 
                  contacto_nombre, contacto_telefono, contacto_telefono_2, contacto_email, 
                  referencia, coordenadas_gps, activo)
VALUES (@id_empresa, '[NOMBRE COMERCIAL]', '[DIRECCION]', '[DISTRITO]', '[PROVINCIA]', '[DEPARTAMENTO]',
        '[CONTACTO]', '[TELEFONO PARA PROGRAMAR]', '[TELEFONO PARA COBRAR]', '[CONTACTO HOJA DE RUTA]',
        '[OBSERVACION]', '[UBICACIÓN]', 1);
SET @id_sede = LAST_INSERT_ID();

-- 4. Insertar ContratoServicio
INSERT INTO ContratoServicio (id_sede, fecha_inicio, fecha_fin, frecuencia, peso_limite_kg, tarifa, tipo_tarifa, activo)
VALUES (@id_sede, '[FECHA INICIO CONTRATO]', '[VIGENCIA]', '[FRECUENCIA]', '[LIMITE DE PESO]', '[TARIFA]', 'por_servicio', 1);
```

---

## 🔍 Campos del Excel sin Mapeo Directo (Información Adicional)

| Columna Excel | Posible Uso |
|---------------|-------------|
| RUBRO | Agregar campo a Empresa o usar en observaciones |
| HORARIO | Agregar a referencia de Sede |
| RENOVACION DE CONTRATO | Agregar campo booleano a ContratoServicio |
| METODO PAGO | Agregar campo a ContratoServicio |
| DEBEN | Campo de cobranza - usar en gestión aparte |
| INICIO DE SERVICIO CLIENTES NUEVOS | Información adicional de fecha |
| PROGRAMACIONES NUMERO | Contador de programaciones |
| FECHA DE SERVICIO | Fecha general (puede usarse en Servicio) |
| FECHA S. ENERO/FEBRERO | Servicios específicos mensuales |
| SERVICIO ENERO/FEBRERO | Detalle de servicios |
| N° S° ENERO/FEBRERO | Números de servicio |
| STATUS | Estado general del cliente/contrato |

---

*Documento generado el: 16 de Febrero de 2026*
*Base de datos: u511863531_IOGroupBD*
*Archivo fuente: DATA 2026.xlsx - Hoja: Data Completa*
