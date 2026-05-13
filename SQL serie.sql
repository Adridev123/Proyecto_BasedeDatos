create database series;

use series;

create table Generos
(
ID_Genero int not null primary key auto_increment,
Nombre varchar(25)
);

create table Directores
(
ID_Director int not null primary key auto_increment,
Nombre varchar(25),
Edad_Director int(2),
Sueldo varchar(25)
);

create table Series
(
ID_Serie int not null primary key auto_increment,
Nombre varchar(25),
Año_Lanzamiento year,
Presupuesto varchar(25),
ID_Genero int not null,
foreign key(ID_Genero) references Generos(ID_Genero),
ID_Director int not null,
foreign key(ID_Director) references Directores(ID_Director),
Puntuacion int(2)
);

create table Plataformas
(
ID_Plataforma int not null primary key auto_increment,
Nombre varchar(25),
ID_Serie int not null,
foreign key(ID_Serie) references Series(ID_Serie)
);

create table Temporadas
(
ID_Temporada int not null primary key auto_increment,
Numero int(2),
Descripcion varchar(30),
ID_Serie int not null,
foreign key(ID_Serie) references Series(ID_Serie)
);

create table Personajes
(
ID_Personaje int not null primary key auto_increment,
Nombre varchar(25),
Edad int(3),
Genero enum("F","M"),
ID_Serie int not null,
foreign key(ID_Serie) references Series(ID_Serie)
);

create table Episodios
(
ID_Episodio int not null primary key auto_increment,
Numero int(3),
Nombre varchar(25),
Estreno year,
ID_Temporada int not null,
foreign key(ID_Temporada) references Temporadas(ID_Temporada),
ID_Serie int not null,
foreign key(ID_Serie) references Series(ID_Serie)
);

use series;

select into Generos(Nombre)
values
("Sci-Fi");

select into Series(Nombre, Año_Lanzamiento, Presupuesto, ID_Genero, ID_Director)
values
("Stranger things", 2016, "usd $30.000.000", 1)
