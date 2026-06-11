INSERT INTO Productos (IDProducto, Nombre, Descripcion, Precio, Stock) VALUES
(1, 'Cofre de madera', 'Cofre de almacenamiento 27 ranuras', 3500, 42),
(2, 'Espada de diamante', 'Espada forjada, +7 daño base', 12500, 12),
(3, 'Poción de curación', 'Restaura salud instantáneamente', 450, 128),
(4, 'Armadura de hierro', 'Set completo, protección media', 9800, 7),
(5, 'Bloque de piedra', 'Madera procesada para construcción', 120, 204);

INSERT INTO Clientes (IDCliente, Nombre, Apellido, Email, Direccion) VALUES
(1, 'Martín', 'García', 'martin.garcia@example.com', 'Av. Corrientes 1234, CABA'),
(2, 'Lucía', 'Pérez', 'lucia.perez@example.com', 'Cnel. Díaz 45, La Plata'),
(3, 'Javier', 'Rodríguez', 'javier.rodriguez@example.com', 'Calle Falsa 742, Córdoba'),
(4, 'Sofía', 'López', 'sofia.lopez@example.com', 'San Martín 210, Rosario'),
(5, 'Diego', 'Fernández', 'diego.fernandez@example.com', 'Belgrano 88, Mendoza');

INSERT INTO Pedidos (IDPedido, IDCliente, Fecha, Estado) VALUES
(1001, 1, '2026-05-28', 'Entregado'),
(1002, 3, '2026-06-02', 'Enviado'),
(1003, 2, '2026-06-05', 'En proceso'),
(1004, 5, '2026-06-08', 'Pendiente'),
(1005, 4, '2026-06-09', 'Enviado');