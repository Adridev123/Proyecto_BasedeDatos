drop database if exists ele;

create database ele;

use ele;

create table Tecnicos(
ID_Tecnico int primary key auto_increment not null,
Tipo_Servicio enum("Preventivo", "Correctivo"),
Nombre varchar(10),
Apellido varchar(10)
);

create table Organizaciones(
ID_Organizacion int primary key auto_increment not null,
Nombre varchar(30)
);

create table Vehiculos(
ID_Vehiculo int primary key auto_increment not null,
ID_Organizacion int,
foreign key(ID_Organizacion) references Organizaciones(ID_Organizacion),
Marca varchar(10)
);

create table Revisiones(
ID_Revision int primary key auto_increment not null,
Fecha date,
Estado_Vehiculo enum("Bien", "Mal", "Medio"),
Nivel_Bateria int(3),
Costo int(6),
ID_Tecnico int,
foreign key(ID_Tecnico) references Tecnicos(ID_Tecnico),
ID_Vehiculo int,
foreign key(ID_Vehiculo) references Vehiculos(ID_Vehiculo)
);

use ele;

insert into Tecnicos(Tipo_Servicio, Nombre, Apellido)
values
("Preventivo", "Juan", "Perez"),
("Preventivo", "Pablo", "Dominguez"),
("Correctivo", "Enzo", "Ramirez");

insert into Organizaciones(Nombre)
values
("Tecnicaet32"),
("Tecnica motor"),
("Tecnica");

insert into Vehiculos(ID_Organizacion, Marca)
values
(1, "Tesla"),
(2, "Mercedes"),
(3, "Ferrari");

insert into Revisiones(Fecha, Estado_Vehiculo, Nivel_Bateria, Costo, ID_Tecnico, ID_Vehiculo)
values
(2026-09-10, "Bien", 67, 10000, 1, 1),
(2026-04-08, "Medio", 50, 30000, 2, 2),
(2026-05-12, "Mal", 10, 60000, 3, 3);

select Vehiculos.Marca, Organizaciones.Nombre, Tecnicos.ID_Tecnico from Revisiones
join Tecnicos on Revisiones.ID_Revision = Tecnicos.ID_Tecnico
join Vehiculos on Revisiones.ID_Revision = Vehiculos.ID_Vehiculo
join Organizaciones on Vehiculos.ID_Vehiculo = Organizaciones.ID_Organizacion
group by Organizaciones.Nombre;

select Costo, ID_Vehiculo from Revisiones
where Costo > (select avg(Costo) from Revisiones);

select Organizaciones.Nombre, Revisiones.Nivel_Bateria from Revisiones
join Vehiculos on Revisiones.ID_Revision = Vehiculos.ID_Vehiculo
join Organizaciones on Vehiculos.ID_Vehiculo = Organizaciones.ID_Organizacion
where Nivel_Bateria > (select avg(Nivel_Bateria) from Revisiones);

select Nombre, Tipo_Servicio from Tecnicos
where Tipo_Servicio = "Correctivo";