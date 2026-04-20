create database TIENDA;
use TIENDA;

Create table Productos(
ID_Producto Int Auto_increment primary key not null,
Nombre varchar(30),
Precio int(9)
);

Create table Clientes(
ID_Cliente Int Auto_increment primary key not null,
Nombre varchar(30)
);

Create table Vendedores(
ID_Vendedor Int Auto_increment primary key not null,
Nombre varchar(30)
);

Create table Repartidores(
ID_Repartidor Int Auto_increment primary key not null,
Nombre varchar(30)
);

Create table Pedidos(
ID_Pedido Int Auto_increment primary key not null,
ID_Producto Int not null,
ID_Cliente Int not null,
FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
Cantidad int(2),
Estado varchar(25),
Fecha date
);

Create table Ventas(
ID_Venta Int auto_increment primary key not null,
ID_Vendedor Int not null,
ID_Pedido Int not null,
ID_Repartidor Int not null,
FOREIGN KEY (ID_Vendedor) REFERENCES Vendedores(ID_Vendedor),
FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
FOREIGN KEY (ID_Repartidor) REFERENCES Repartidores(ID_Repartidor),
Tipo_factura enum("A", "B", "C")
);