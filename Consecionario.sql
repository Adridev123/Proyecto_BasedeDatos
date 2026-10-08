create database Consecionario;

use Consecionario;

create table Modelos(
IDModelos int primary key auto_increment not null,
Color varchar(10),
Nombre varchar(10)
);

create table Marcas(
IDMarca int primary key auto_increment not null,
IDModelo int,
foreign key(IDModelo) references Modelos(IDModelo),
Nombre varchar(10)
);

create table Piezas(
IDPieza int primary key auto_increment not null,
IDMarca int,
foreign key(IDMarca) references Marcas(IDMarca),
IDModelo int,
foreign key(IDModelo) references Modelos(IDModelo),
Nombre varchar(10),
Stock int(10),
Precio float(10)
);

create table Provincias(
IDProvincia int primary key auto_increment not null,
Nombre varchar(10)
);

create table Contactos(
IDContacto int primary key auto_increment not null,
Telefono int(20),
Gmail varchar(20)
);

create table Seguros(
IDSeguro int primary key auto_increment not null,
Costo float(10),
Nivel enum("Bajo", "Alto", "Medio")
);

create table Consecionarios(
IDConsecionario int primary key auto_increment not null,
Nombre varchar(10),
IDProvincia int,
foreign key(IDProvincia) references Provincias(IDProvincia),
IDContacto int,
foreign key(IDContacto) references IDContacto(IDContacto)
);

create table Empleados(
IDEmpleado int primary key auto_increment not null,
IDConsecionario int,
foreign key(IDConsecionario) references Consecionario(IDConsecionario),
Nombre varchar(10),
Apellido varchar(10)
);

create table Clientes(
IDCliente int primary key auto_increment not null,
Nombre varchar(10),
Apellido varchar(10)
);

create table Coches(
IDCoche int primary key auto_increment not null,
IDMarca int,
foreign key(IDMarca) references Marcas(IDMarca),
IDConsecionario int,
foreign key(IDConsecionario) references Consecionario(IDConsecionario),
IDEmpleado int,
foreign key(IDEmpleado) references Empleados(IDEmpleado),
Matricula varchar(10),
Precio float(10)
);

create table PruebasDeManejo(
IDPruebaDeManejo int primary key auto_increment not null,
IDCliente int,
foreign key(IDCliente) references Clientes(IDCliente),
IDCoche int,
foreign key(IDCoche) references Coches(IDCoche),
IDEmpleado int,
foreign key(IDEmpleado) references Empleados(IDEmpleado),
Fecha date,
Duracion varchar(30)
);

create table FormasDePago(
IDFormaDePago int primary key auto_increment not null,
Tipo enum("Debito", "Credito", "Efectivo")
);

create table Compras(
IDCompra int primary key auto_increment not null,
IDCliente int,
foreign key(IDCliente) references Clientes(IDCliente),
IDCoche int,
foreign key(IDCoche) references Coches(IDCoche),
IDPieza int,
foreign key(IDPieza) references Piezas(IDPieza),
IDPermutacion int,
foreign key(IDPermutacion) references Permutaciones(IDPermutacion),
IDFormaDePago int,
foreign key(IDFormaDePago) references FormasDePago(IDFormaDePago),
Total float(20)
);

create table Envios(
IDEnvio int primary key auto_increment not null,
IDConsecionario int,
foreign key(IDConsecionario) references Consecionario(IDConsecionario),
IDCompra int,
foreign key(IDCompra) references Compras(IDCompra),
Costo float(10),
FechaSalida date,
FechaLLegada date,
Estado enum("Entregado", "Cancelado", "Atrasado", "En viaje")
);

create table Permutaciones(
IDPermutacion int primary key auto_increment not null,
IDCliente int,
foreign key(IDCliente) references Clientes(IDCliente),
IDCocheNuevo int,
foreign key(IDCocheNuevo) references Coches(IDCoche),
IDCocheUsado int,
foreign key(IDCocheUsado) references Coches(IDCoche),
MontoAdicional float(10)
);