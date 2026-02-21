ALTER TABLE Servicio MODIFY residuo ENUM('BIOCONTAMINADO', 'ESPECIAL', 'ANIMAL CONTAMINADO', 'MERMA Y/O DESMEDRO') NULL;
ALTER TABLE Servicio ADD COLUMN observaciones TEXT AFTER residuo;

CREATE OR REPLACE VIEW vw_ServiciosCompleto AS
SELECT 
    s.id_servicio,
    s.mes_servicio,
    s.fecha_ejecucion,
    s.estado,
    se.nombre_comercial AS sede_nombre,
    se.direccion AS sede_direccion,
    e.razon_social AS empresa_razon_social,
    e.ruc AS empresa_ruc,
    c.nombre AS cliente_nombre,
    p.nombre_comercial AS planta_nombre,
    r.codigo_ruta,
    v.placa AS vehiculo_placa,
    m.peso_kg,
    m.tipo_residuo,
    f.numero_factura,
    s.estado_pago,
    s.residuo,
    s.observaciones
FROM Servicio s
INNER JOIN Sede se ON s.id_sede = se.id_sede
INNER JOIN Empresa e ON se.id_empresa = e.id_empresa
INNER JOIN Cliente c ON e.id_cliente = c.id_cliente
INNER JOIN Planta p ON s.id_planta = p.id_planta
LEFT JOIN Ruta r ON s.id_ruta = r.id_ruta
LEFT JOIN Vehiculo v ON r.id_vehiculo = v.id_vehiculo
LEFT JOIN Manifiesto m ON s.id_servicio = m.id_servicio
LEFT JOIN Factura f ON s.id_servicio = f.id_servicio;
    