
create database seriess;
use seriess;

create table Generos
(
    ID_Genero int not null primary key auto_increment,
    Nombre varchar(50)
);

create table Directores
(
    ID_Director int not null primary key auto_increment,
    Nombre varchar(100),
    Edad_Director int,
    Sueldo varchar(25)
);

create table Series
(
    ID_Serie int not null primary key auto_increment,
    Nombre varchar(100),
    Año_Lanzamiento year,
    Presupuesto varchar(25),
    Plataforma varchar(25),
    ID_Genero int not null,
    ID_Director int not null,
    Puntuacion int,
    foreign key(ID_Genero) references Generos(ID_Genero),
    foreign key(ID_Director) references Directores(ID_Director)
);

create table Temporadas
(
    ID_Temporada int not null primary key auto_increment,
    Numero int,
    Nombre_Temporada varchar(100),
    Descripcion varchar(255), -- Ampliado para que quepan las descripciones largas
    ID_Serie int not null,
    foreign key(ID_Serie) references Series(ID_Serie)
);

create table Personajes
(
    ID_Personaje int not null primary key auto_increment,
    Nombre varchar(100),
    Edad int,
    Genero enum("F","M"),
    ID_Serie int not null,
    foreign key(ID_Serie) references Series(ID_Serie)
);

create table Episodios
(
    ID_Episodio int not null primary key auto_increment,
    Numero int,
    Nombre varchar(100),
    Estreno year,
    ID_Temporada int not null,
    ID_Serie int not null,
    foreign key(ID_Temporada) references Temporadas(ID_Temporada),
    foreign key(ID_Serie) references Series(ID_Serie)
);

insert into Generos(Nombre)
values
("Sci-Fi"), ("Drama"), ("Post-Apoc"), ("Accion"), 
("Antologia"), ("Comedia"), ("Suspenso"), ("Intriga");

insert into Directores(Nombre, Edad_Director, Sueldo)
values
("Duffer Brothers", 42, "$500.000"),
("Christopher Storer", 44, "$450.000"),
("Craig Mazin", 53, "$700.000"),
("Mark Mylod", 60, "$600.000"),
("Eric Kripke", 50, "$650.000"),
("Charlie Brooker", 54, "$55.000.000"),
("Declan Lowney", 58, "$400.000"),
("Ben Stiller", 59, "$800.000"),
("Jonathan Nolan", 48, "$900.000"),
("Baranbo Odar", 47, "$500.000");

insert into Series(Nombre, Año_Lanzamiento, Presupuesto, Plataforma, ID_Genero, ID_Director)
values
("Stranger things", 2016, "usd $30.000.000", "Netflix", 1, 1),
("The Bear", 2022, "usd $12.000.000", "Disney", 2, 2),
("The Last Of Us", 2023, "usd $100.000.000", "Max", 3, 3),
("Succession", 2018, "usd $90.000.000", "Max", 2, 4),
("The Boys", 2019, "usd $11.000.000", "Prime Video", 4, 5),
("Black Mirror", 2011, "usd $5.000.000", "Netflix", 5, 6),
("Ted Lasso", 2020, "usd $15.000.000", "Apple TV", 6, 7),
("Severance", 2022, "usd $40.000.000", "Apple TV", 7, 8),
("Fallout", 2024, "usd $150.000.000", "Prime Video", 1, 9),
("Dark", 2017, "usd $18.000.000", "Netflix", 8, 10);

insert into Temporadas(Numero, Nombre_Temporada, Descripcion, ID_Serie)
values
(1, "Stranger things 1", "Desaparición de Will", 1),
(4, "Stranger things 4", "El regreso de Vecna", 1),
(1, "The bear s1", "El caos en la cocina", 2),
(1, "The Last of Us", "El viaje de Joel y Ellie", 3),
(4, "Succession S4", "La guerra final", 4),
(1, "The boys S1", "Los héroes son malos", 5),
(1, "Black mirror s1", "Tecnología y pesadillas", 6),
(1, "Ted lasso s1", "Un DT de fútbol americano en UK", 7),
(1, "Severance s1", "Separación cerebral laboral", 8),
(1, "Fallout s1", "Salida del refugio 33", 9);

insert into Personajes(Nombre, Edad, Genero, ID_Serie)
values
("Eleven", 14, "F", 1),
("Carmy Berzatto", 28, "M", 2),
("Joel Miller", 52, "M", 3),
("Ellie Williams", 14, "F", 3),
("Kendall Roy", 40, "M", 4),
("Homelander", 38, "M", 5),
("Ted Lasso", 45, "M", 7),
("Mark Scout", 42, "M", 8),
("Lucy MacLean", 22, "F", 9),
("Jonas Kahnwald", 17, "M", 10);

insert into Episodios(Numero, Nombre, Estreno, ID_Temporada, ID_Serie)
values
(101, "El mundo del revez", 2020, 1, 1),
(102, "Dear Billy", 2017, 2, 1),
(103, "Sistema", 2018, 3, 2),
(104, "Muchos Tiempo", 2019, 4, 3),
(105, "Connor's Wedding", 2021, 5, 4),
(106, "El nombre del juego", 2023, 6, 5),
(107, "Himno Nacional", 2024, 7, 6),
(108, "Piloto", 2024, 8, 7),
(109, "Lo que somos", 2026, 9, 8),
(110, "El fin", 2011, 10, 9);

SELECT Genero, COUNT(Nombre) as Cantidad FROM Personajes GROUP BY Genero;

SELECT Directores.Nombre FROM Directores
INNER JOIN Series ON Directores.ID_Director = Series.ID_Director
WHERE Series.Plataforma = 'Prime Video';
