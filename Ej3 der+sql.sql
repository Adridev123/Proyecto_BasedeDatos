drop database if exists ej3;
create database ej3;

use ej3;
create table Estadios(
ID_Estadio int auto_increment primary key not null,
Nombre varchar(25)
);
create table Equipos(
ID_Equipo int auto_increment primary key not null,
Nombre varchar(25),
ID_Estadio int not null
);
create table Posiciones(
ID_Posicion int auto_increment primary key not null,
Nombre varchar(25)
);
create table Jugadores(
ID_Jugadores int auto_increment primary key not null,
Nombre varchar(25),
Apellido varchar(25),
ID_Equipo int not null,
ID_Posicion int not null
);
create table Partidos(
ID_Partido int auto_increment primary key not null,
ID_Equipo int not null,
Fecha date,
Goles int(2),
Resultado varchar(5)
);

use ej3;

insert into Estadios(Nombre)
values
("Diego Armando Maradona"),
("La bombonera"),
("Gigante de arroyito"),
("Monumental");

insert into Equipos(Nombre, ID_Estadio)
values
("Argentinos Juniors", 1),
("Boca jrs", 2),
("Rosario central", 3),
("River", 4);

insert into Posiciones(Nombre)
values
("Extremo Derecho"),
("Mediocampista central"),
("Extremo Derecho"),
("Lateral Derecho");

insert into Jugadores(Nombre, Apellido, ID_Equipo, ID_Posicion)
values
("Hernan", "Lopez Muñoz", 1, 1),
("Leandro", "Paredes", 2, 2),
("Angel", "Di Maria", 3, 3),
("Gonzalo", "Montiel", 4, 4);

insert into Partidos(ID_Equipo, Fecha, Goles, Resultado)
values
(1, "26-8-24", 2, "2/0"),
(2, "26-3-14", 1, "1/2"),
(3, "26-9-30", 1, "1/1"),
(4, "26-5-4", 1, "1/0");

select * from Partidos;
select * from Jugadores;