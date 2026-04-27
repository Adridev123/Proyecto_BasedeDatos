
create database ej1;

use ej1;

create table Clientes(
	ID_Cliente int auto_increment primary key not null,
    Nombre varchar(18)
);
create table Productos(
	ID_Producto int auto_increment primary key not null,
    Nombre varchar(18),
    Precio int(10)
);
create table Pedidos(
	ID_Pedido int auto_increment primary key not null,
    ID_Producto int not null,
    ID_Cliente int not null,
    Foreign key (ID_Producto) references Productos(ID_Producto),
    Foreign key (ID_Cliente) references Clientes(ID_Cliente),
    Cantidad int(2),
    Estado varchar(20),
    Fecha date
);
create table Vendedores(
	ID_Vendedor int auto_increment primary key not null,
    Nombre varchar(18)
);
create table Repartidores(
	ID_Repartidor int auto_increment primary key not null,
    Nombre varchar(18)
);
create table Ventas(
	ID_Venta int auto_increment primary key not null,
    ID_Vendedor int not null,
    ID_Pedido int not null,
    ID_Repartidor int not null,
    Foreign key (ID_Vendedor) references Vendedores(ID_Vendedor),
    Foreign key (ID_Pedido) references Pedidos(ID_Pedido),
    Foreign key (ID_Repartidor) references Repartidores(ID_Repartidor),
    Factura enum("A","B","C")
);

use ej1;

insert into Productos(Nombre, Precio)
values
("Remera", 20000),
("Pantalon", 30000),
("Campera", 50000);

insert into Vendedores(Nombre)
values
("Paco"),
("Hernesto"),
("Roberto");

insert into Clientes(Nombre)
values
("Adriano"),
("Pablo"),
("Enzo");

insert into Pedidos(ID_Producto, ID_Cliente, Cantidad, Estado, Fecha)
value
(1, 1, 2, "Entregado", 12/02/26),
(2, 3, 1, "En Proceso", 10/06/26),
(3, 2, 4, "Cancelado", 20/09/26);

insert into Repartidores(Nombre)
values
("Lola"),
("Lucas"),
("Tomas");

insert into Ventas(ID_Vendedor, ID_Pedido, ID_Repartidor, Factura)
values
(1, 1, 1, "A"),
(2, 2, 2, "B"),
(3, 3, 3, "C");

select * from Productos;
select * from Ventas;
