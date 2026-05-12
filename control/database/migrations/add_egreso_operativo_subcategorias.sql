-- Ensure route expense subcategories exist for Egresos.
INSERT IGNORE INTO EgresoSubcategoria (categoria, nombre, descripcion, activo) VALUES
('operativo', 'combustible', 'Combustible de ruta', 1),
('operativo', 'peajes', 'Peajes de ruta', 1),
('operativo', 'cochera', 'Cocheras o estacionamientos de ruta', 1),
('operativo', 'menu', 'Menu o alimentacion de ruta', 1),
('operativo', 'reparacion', 'Reparaciones operativas del camion', 1),
('operativo', 'otros', 'Otros gastos operativos de ruta', 1);
