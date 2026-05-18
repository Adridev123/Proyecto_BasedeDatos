create database ej3;

use ej3;
create table Estadios(
ID_Estadio int auto_increment primary key not null,
Nombre varchar(25),
Capacidad int(6)
);
create table Barrios(
ID_Barrio int auto_increment primary key not null,
Nombre varchar(25)
);
create table Equipos(
ID_Equipo int auto_increment primary key not null,
Nombre varchar(25),
Año_Fundacion year,
ID_Estadio int not null,
foreign key(ID_Estadio) references Estadios(ID_Estadio),
ID_Barrio int not null,
foreign key(ID_Barrio) references Barrios(ID_Barrio),
ID_Partido int not null,
foreign key(ID_Partido) references Partidos(ID_Partido)
);
create table Partidos(
ID_Partido int auto_increment primary key not null,
ID_Equipo_Local int not null,
foreign key(ID_Equipo_Local) references Equipos(ID_Equipo),
ID_Equipo_Visitante int not null,
foreign key(ID_Equipo_Visitante) references Equipos(ID_Equipo),
Fecha date,
Goles_Local int(2),
Goles_Visitante int(2)
);
create table Posiciones(
ID_Posicion int auto_increment primary key not null,
Nombre varchar(25)
);
create table Jugadores(
ID_Jugadores int auto_increment primary key not null,
Nombre varchar(25),
Apellido varchar(25),
Fecha_Nacimiento date,
ID_Equipo int not null,
foreign key(ID_Equipo) references Equipos(ID_Equipo),
ID_Posicion int not null,
foreign key(ID_Posicion) references Posiciones(ID_Posicion)
);
create table Goles(
ID_Gol int auto_increment primary key not null,
Minuto int(3),
Descripcion varchar(50),
ID_Partido int not null,
foreign key(ID_Partido) references Partidos(ID_Partido),
ID_Jugador int not null,
foreign key(ID_Jugador) references Jugadores(ID_Jugador)
);
create table Presidentes(
ID_Presidente int auto_increment primary key not null,
Nombre varchar(25),
Apellido varchar(25),
DNI int(8),
Fecha_Nacimiento date,
Año_Eleccion year,
ID_Equipo int not null,
foreign key(ID_Equipo) references Equipos(ID_Equipo)
);

use ej3;

insert into Estadios(Nombre, Capacidad)
values
("Diego Armando Maradona", 26000),
("La bombonera", 57200),
("Gigante de arroyito", 46955),
("Monumental", 85018),
("Libertadores de América", 48069);

insert into Barrios(Nombre)
values
("Paternal"),
("La Boca"),
("Arroyito"),
("Nuñez"),
("Avellaneda");

insert into Equipos(Nombre, Año_Fundacion, ID_Estadio, ID_Barrio)
values
("Argentinos Juniors", 1904, 1, 1),
("Boca jrs", 1905, 2, 2),
("Rosario central", 1889, 3, 3),
("River", 1901, 4, 4),
("Independiente", 1905, 5, 5);

insert into Partidos(ID_Equipo_Local, ID_Equipo_Visitante, Fecha, Goles_Local, Goles_Visitante)
values
(1, 4, 26-02-26, 1, 0),
(3, 2, 25-09-14, 1, 1),
(5, 4, 25-09-8, 0, 0);

insert into Posiciones(Nombre)
values
("Extremo Derecho"),
("Mediocampista central"),
("Extremo Derecho"),
("Lateral Derecho"),
("Enganche");

insert into Jugadores(Nombre, Apellido, ID_Equipo, ID_Posicion)
values
("Hernan", "Lopez Muñoz", 1, 1),
("Leandro", "Paredes", 2, 2),
("Angel", "Di Maria", 3, 3),
("Gonzalo", "Montiel", 4, 4),
("Ignacio", "Malcorra", 5, 5);

insert into Goles(Minuto, Descripcion, ID_Partido, ID_Jugador)
values
(34, "Remate cruzado", 1, 1),
(20, "Gol de cabeza", 2, 2),
(24, "Gol olimpico", 2, 3);

insert into Presidentes(Nombre, Apellido, DNI, Fecha_Nacimiento, Año_Eleccion, ID_Equipo)
values
("Cristian", "Malaespina", 25594170, 1977-09-24, 2023, 1),
("Juan Roman", "Riquelme", 26752869, 1978-06-24, 2023, 2),
("Gonzalo", "Belloso", 23760742, 1974-03-30, 2022, 3),
("Stefano Dante", "Cozza Di Carlo", 34534275, 1989-05-13, 2025, 4),
("Nestor", "Grindetti", 11553269, 1955-02-24, 2023, 5);