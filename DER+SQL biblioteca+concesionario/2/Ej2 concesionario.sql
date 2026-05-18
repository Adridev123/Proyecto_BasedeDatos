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

use ej2;

insert into Marcas(Nombre)
values
("Renault"),
("Mercedes"),
("Volkswagen"),
("Toyota"),
("Audi");

insert into Concecionarios(Nombre)
values
("Volkswagen Concecionario"),
("Mercedes Concecionario"),
("Tio autos"),
("Motors"),
("Audi Concecionario");

insert into Cliente(Nombre, Apellido, DNI, Direccion, Telefono)
values
("Santino", "Mendel", 49234567, "Caballito", "+54 911 99346743"),
("Adriano", "Flux", 49897654, "Chacarita", "+54 911 32456789"),
("Tadeo", "Alvarez", 49562109, "Liniers", "+54 911 88402100"),
("Michael", "Fernandez", 47007655, "Puerto Madero", "+54 911 67674432"),
("Marcos", "Martinez", 48658732, "Recoleta", "+54 911 89456632");

insert into Mecanico(Nombre, Apellido, DNI, Fecha_Contratacion, Salario)
values
("Pablo", "Ramirez", 47294578, 2022-09-23, "$800.000"),
("Torcuato", "Martinez", 43294578, 2010-04-13, "$810.000"),
("Roberto", "Diaz", 45566809, 2004-05-06, "$970.500"),
("Ezequiel", "Mesa", 46561209, 2024-11-30, "$930.600"),
("Hernesto", "Cormillot", 41652755, 1970-02-10, "800.010");

insert into Coches(Matricula, Modelo, Color, ID_Marca, Estado, Kilometraje, Cantidad, ID_Concecionario)
values
("AA932QQ", "Vento", "Negro", 3, "Usado", 10000, 1, 3),
("FF666FF", "Renault 12", "Rojo", 1, "Usado", 90000, 1, 3),
("RR122RQ", "Mercedes AMG", "Blanco", 2, "Nuevo", 0, 3, 2),
("TT908TH", "Audi RS e-tron GT", "Gris", 5, "Nuevo", 0, 5, 5),
("HE114NY", "Toyota C-HR+", "Negro", 4, "Nuevo", 0, 2, 4);

insert into Compras(ID_Cliente, ID_Coche)
values
(1, 3),
(2, 2),
(3, 4),
(4, 1),
(5, 5);

insert into Reparaciones(ID_Cliente, ID_Coche)
values
(1, 3),
(2, 2),
(3, 4),
(4, 1),
(5, 5);

insert into  Mecanicos_Reparaciones(ID_Reparacion, ID_Mecanico, Fecha_Reparacion, Horas_Tardadas)
values
(1, 3, 2026-04-23, "11:30:00"),
(2, 5, 2026-02-13, "14:20:00"),
(3, 4, 2026-07-12, "16:10:00"),
(4, 2, 2026-03-07, "15:00:00"),
(5, 1, 2026-11-25, "10:20:00");