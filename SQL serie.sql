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
Nombre varchar(25)
);