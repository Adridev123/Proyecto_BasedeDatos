create database EMPRESA;
use EMPRESA;

create table Estadios(
ID_Estadio int primary key not null auto_increment,
Nombre varchar(30),
Ubicacion varchar(30)
);

create table Campeonatos(
ID_Campeonato int primary key not null auto_increment,
ID_Estadio int not null,
FOREIGN KEY (ID_Estadio) REFERENCES Estadios(ID_Estadio)
);

create table Partidos(
ID_Partido int primary key not null auto_increment,
ID_Campeonato int not null,
Fecha date,
FOREIGN KEY (ID_Campeonato) REFERENCES Campeonatos(ID_Campeonato)
);

create table Equipos(
ID_Equipo int primary key not null auto_increment,
Nombre varchar(25)
);

create table Jugadores(
ID_Jugador int primary key not null auto_increment,
ID_Equipo int not null,
Nombre varchar(25),
Posicion varchar(25),
FOREIGN KEY (ID_Equipo) REFERENCES Equipos(ID_Equipo)
);

create table Goles(
ID_Gol int primary key not null auto_increment,
ID_Equipo int not null,
ID_Jugador int not null,
Minuto varchar(5),
Descripcion varchar (30),
FOREIGN KEY (ID_Equipo) REFERENCES Equipos(ID_Equipo),
FOREIGN KEY (ID_Jugador) REFERENCES Jugadores(ID_Jugador)
);