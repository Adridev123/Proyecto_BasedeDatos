INSERT into productos(Nombre, Precio)
Values("Pantalon", 30000),
("Gorra", 15000),
("Zapatillas", 60000);

INSERT into Clientes(Nombre)
Values("Santino"),
("Manuel"),
("Enzo");

INSERT into Vendedores(Nombre)
Values("Santiago"),
("Joaquín"),
("Martina");

INSERT into Repartidores(Nombre)
Values("Jazmín"),
("Facundo"),
("Lautaro");

INSERT into Pedidos(ID_Producto, ID_Cliente, Cantidad, Estado, Fecha)
values(1, 1, 2, 'Entregado', '15/02/26'),
(2, 2, 8, 'Cancelado', '20/04/26'),
(2, 2, 11, 'En proceso', '01/01/26');

INSERT into Ventas(ID_Vendedor, ID_Pedido, ID_Repartidor, Tipo_factura)
values(1, 1, 1, "A"),
(2, 2, 2, "B"),
(3, 3, 3, "C");