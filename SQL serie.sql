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

insert into Generos(Nombre)
values
("Sci-Fi"),
("Drama"),
("Post-Apoc"),
("Accion"),
("Antologia"),
("Comedia"),
("Suspenso"),
("Intriga");

insert into Series(Nombre, Año_Lanzamiento, Presupuesto, ID_Genero, ID_Director)
values
("Stranger things", 2016, "usd $30.000.000", 1, "Duffer Brothers"),
("The Bear", 2022, "usd $12.000.000", 2, "Christopher Storer"),
("The Last Of Us", 2023, "usd $100.000.000", 3, "Craig Mazin"),
("Succession", 2018, "usd $90.000.000", 2, "Mark Mylod"),
("The Boys", 2019, "usd $11.000.000", 4, "Eric Kripke"),
("Black Mirror", 2011, "usd $5.000.000", 5, "Charlie Brooker"),
("Ted Lasso", 2020, "usd $15.000.000", 6, "Declan Lowney"),
("Severance", 2022, "usd $40.000.000", 7, "Ben Stiller"),
("Fallout", 2024, "usd $150.000.000", 1, "Jonathan Nolan"),
("Dark", 2017, "usd $18.000.000", 8, "Baranbo Odar");
