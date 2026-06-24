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
Raiting float(10)
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

create table Habilidades_Especiales(
ID_Habilidad int primary key auto_increment,
ID_Personaje int,
foreign key (ID_Personaje) references Personajes(ID_Personaje),
Nombre_Habilidad varchar(25),
Tipo_Habilidad varchar(25)
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

insert into Episodios(Titulo_Episodio, ID_Serie, Duracion_min, Raiting)
values
("¡Ven Conmigo!", 1, 44, 10),
("Amor ardiente", 1, 11, 8.6),
("Y entonces llegó Ben", 2, 23, 9.7),
("La venganza", 2, 22, 9.2),
("Mandy la despiadada", 3, 7, 7.5),
("Las sombrías aventuras de Los chicos del barrio", 3, 25, 7.3),
("Salida 9B", 4, 23, 9.7),
("Cuentos de Terror del Parque II", 4, 22, 8.4),
("El granjero acuático", 5, 23, 7.8),
("La maldición del Rey Ramsés", 5, 11, 8.7),
("Dexter es promedio", 6, 7, 7.3),
("El rival de Dexter", 6, 7, 7.9);

insert into Objetos_Misticos(Nombre, ID_Personaje, Valor_Subasta)
values
("Espada Dorada", 1, 5),
("Omnitrix", 4, 500000000),
("Biologia y cibernetica", 5, 85000000),
("Hoz magica", 6, 150000000),
("Biologia Mutante", 9, 35000000),
("Inventos", 10, 150000000);

insert into Habilidades_Especiales(ID_Personaje, Nombre_Habilidad, Tipo_Habilidad)
values
(2, "Poderes Elasticos", "Fisica"),
(3, "Poderes de Criomancia", "Combate"),
(7, "Habilidades Cosmicas", "Combate"),
(8, "Habilidades Cosmicas", "Combate");

select Nombre, Creador from Series
order by Nombre asc;

select Nombre, Rol from Personajes
where Nombre like "F%" or Nombre like"B%";

select Duracion_min, Raiting from Episodios
where Duracion_min > 11 and Raiting > 8.5;

select Nombre from Objetos_Misticos
where Nombre like "Espada%" or Nombre like "Anillo%";

select min(Nivel_Energia) as Energia_Minima, max(Nivel_Energia) as Energia_Maxima from Personajes
where Rol = "Antagonista"
limit 2;

select Tipo_Habilidad, count(Tipo_Habilidad) from Habilidades_Especiales
group by Tipo_Habilidad;

select Nombre, Nivel_Energia from Personajes
order by Nivel_Energia desc;

select ID_Personaje, Valor_Subasta from Objetos_Misticos
where Valor_Subasta > 5000
order by Valor_Subasta desc;

select ID_Serie, avg(Raiting) as Promedio_Audiencia from Episodios
group by ID_Serie
having avg(Raiting) > 7.5;

select ID_, count(ID_Personaje) from Personajes
where Nivel_Energia > 50
group by ID_Serie;
