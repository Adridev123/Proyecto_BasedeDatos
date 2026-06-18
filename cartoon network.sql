drop database if exists series;

create database series;

use series;

create table Series(
ID_Serie int primary key auto_increment not null,
Nombre varchar(25),
Año_Estreno date,
Creador varchar(25)
);

create table Personajes(
ID_Personaje int primary key auto_increment not null,
Nombre varchar(25),
Rol varchar(25),
Nivel_Energia varchar(25),
ID_Serie int,
foreign key (ID_Serie) references Series(ID_Serie)
);

create table Episodios(
ID_Episodio int primary key auto_increment not null,
Titulo_Episodio varchar(25),
ID_Serie int,
foreign key (ID_Serie) references Series(ID_Serie),
Duracion_min int(10),
Raiting int(10)
);

create table Habilidades(
ID_Habilidad int primary key auto_increment not null,
ID_Personaje int,
foreign key (ID_Personaje) references Personajes(ID_Personaje),
Nombre varchar(25),
Tipo varchar(25)
);

create table Enemigos(
ID_Enemigo int primary key auto_increment not null,
ID_Heroe int,
foreign key (ID_Heroe) references Personajes(ID_Personaje),
ID_Villano int,
foreign key (ID_Villano) references Personajes(ID_Personaje),
Encuentros_Totales int(6)
);

create table Objetos_Misticos(
ID_Objeto int primary key auto_increment not null,
Nombre varchar(25),
ID_Personaje int,
foreign key (ID_Personaje) references Personajes(ID_Personaje),
Valor_Subasta int(10)
);

use series;

insert into Series(Nombre, Año_Estreno, Creador)
values
("Hora De Aventura", "2010/01/11", "Pendleton Ward"),
("Ben 10", "2006/01/13", "Duncan Rouleau"),
("Billy y Mandy", "2003/06/13", "Maxwell Atoms"),
("Un Show Mas", "2010/09/06", "J. G. Quintel"),
("Coraje el Perro Cobarde", "1999/11/12", "John R. Dilworth"),
("El Laboratorio De Dexter", "1996/04/27", "Genndy Tartakovsky");

insert into Personajes(Nombre, Rol, Nivel_Energia, ID_Serie)
values
("Finn el Humano", "Protagonista", 85, 1),
("Jake el Perro", "Protagonista", 90, 1),
("Rey Helado", "Antagonista", 75, 1),
("Ben Tennyson", "Protagonista", 95, 2),
("Vilgax", "Antagonista", 98, 2),
("Puro Hueso", "Secundario", 80, 3),
("Mordecai", "Protagonista", 60, 4),
("Rigby", "Protagonista", 55, 4),
("Coraje", "Protagonista", 40, 5),
("Dexter", "Protagonista", 70, 6);

select Nombre, Creador from Series
order by Nombre asc;

select Nombre, Rol from Personajes
where Nombre like "F%" or "B%";