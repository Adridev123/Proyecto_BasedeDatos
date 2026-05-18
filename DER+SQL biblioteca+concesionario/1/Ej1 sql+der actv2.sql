create database ej1;

use ej1;

create table Editoriales(
ID_Editorial int auto_increment not null,
Nombre varchar(25)
);

create table Usuarios(
ID_Usuario int auto_increment not null,
Nombre varchar(25),
Direccion varchar(25),
Telefono varchar(25)
);

create table Prestamos(
ID_Prestamo int auto_increment not null,
Fecha_Prestamo date,
Fecha_Devolucion date
);

create table Usuarios_Prestamos(
ID_Usuario_Prestamo int auto_increment not null,
ID_Usuario int not null,
FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
ID_Prestamo int not null,
FOREIGN KEY (ID_Prestamo) REFERENCES Prestamos(ID_Prestamo)
);

create table Autores(
ID_Autor int auto_increment not null,
Nombre varchar(25)
);

create table Libros(
ID_Libro int auto_increment not null,
Titulo varchar(25),
ISBN int(3),
Numero_Pagina int(3),
ID_Editorial int not null,
FOREIGN KEY (ID_Editorial) REFERENCES Editoriales(ID_Editorial)
);

create table Autores_Libros(
ID_Autor_Libro int auto_increment not null,
ID_Autor int not null,
FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor),
ID_Libro int not null,
FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

create table Ejemplares(
ID_Ejemplar int auto_increment not null,
Localizacion varchar(25),
ID_Libro int not null,
FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

insert into Editoriales(Nombre)
values
("Editorial Moron"),
("Editorial Laprida"),
("Editorial Chacarita"),
("Editorial Argentina"),
("Editorial Española");

insert into Usuarios(Nombre, Direccion, Telefono)
values
("Adriano", "Acevedo 180", "+54 911 4567-2899"),
("Pablo", "Corrientes 560", "+54 911 1587-2399"),
("Facundo", "Rivadavia 700", "+54 911 3524-2597"),
("Juana", "Av. Forest 320", "+54 911 4122-3356"),
("Leandro", "Boca 144", "+54 911 7521-5542");

insert into Prestamos(Fecha_Prestamo, Fecha_Devolucion)
values
("11/2/26", "15/2/26"),
("14/2/26", "11/3/26"),
("24/2/26", "21/5/26"),
("22/3/26", "30/3/26"),
("12/6/26", "21/6/26");

insert into Usuarios_Prestamos(ID_Usuario, ID_Prestamo)
values
("1", "1"),
("2", "2"),
("3", "3"),
("4", "4"),
("5", "5");

insert into Autores(Nombre)
values
("Antonio"),
("Luis"),
("Lucia"),
("Agustin"),
("Benicio");

insert into Libros(Titulo, ISBN, Numero_Pagina, ID_Editorial)
values
("Principito", 1, 20, 1),
("El quijote", 4, 22, 2),
("El poder de las palabras", 5, 44, 3),
("El espejo africano", 3, 30, 4),
("Diminuto", 2, 70, 5);

insert into Autores_Libros(ID_Autor, ID_Libro)
values
("1", "1"),
("2", "2"),
("3", "3"),
("4", "4"),
("5", "5");

insert into Autores_Libros(ID_Autor, ID_Libro)
values
("1", "1"),
("2", "2"),
("3", "3"),
("4", "4"),
("5", "5");

insert into Ejemplares(Localizacion, ID_Libro)
values
("A3", "1"),
("D2", "2"),
("R3", "3"),
("L4", "4"),
("H5", "5");

