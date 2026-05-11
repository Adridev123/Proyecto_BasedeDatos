create database ej2;

use ej2;

create table Marcas
(
ID_Marca int not null primary key auto_increment,
Nombre varchar(25)
);

create table Concecionarios
(
ID_Concecionario int not null primary key auto_increment,
Nombre varchar(25)
);

create table Cliente
(
ID_Cliente int not null primary key auto_increment,
Nombre varchar(25),
Apellido varchar(25),
DNI int(8),
Direccion varchar(25),
Telefono varchar(25)
);

create table Mecanico
(
ID_Mecanico int not null primary key auto_increment,
Nombre varchar(25),
Apellido varchar(25),
DNI int(8),
Fecha_Contratacion date,
Salario varchar(25)
);

create table Coches
(
ID_Coche int not null primary key auto_increment,
Matricua varchar(7),
Modelo varchar(25),
Color varchar(25),
ID_Marca int not null,
foreign key(ID_Marca) references Marcas(ID_Marca),
Estado enum("Nuevo", "Usado"),
Kilometraje int(5),
Cantidad int(3),
ID_Concecionario int not null,
foreign key(ID_Concecionario) references Concecionarios(ID_Concecionario)
);

create table Compras
(
ID_Compra int not null primary key auto_increment,
ID_Cliente int not null,
foreign key(ID_Cliente) references Clientes(ID_Cliente),
ID_Coche int not null,
foreign key(ID_Coche) references Coches(ID_Coche)
);

create table Reparaciones
(
ID_Reparacion int not null primary key auto_increment,
ID_Cliente int not null,
foreign key(ID_Cliente) references Clientes(ID_Cliente),
ID_Coche int not null,
foreign key(ID_Coche) references Coches(ID_Coche)
);

create table Mecanicos_Reparaciones
(
ID_Mecanico_Reparacion int not null primary key auto_increment,
ID_Reparacion int not null,
foreign key(ID_Reparacion) references Reparaciones(ID_Reparacion),
ID_Mecanico int not null,
foreign key(ID_Mecanico) references Mecanicos(ID_Mecanico),
Fecha_Reparacion date,
Horas_Tardadas time
);

use ej2,

