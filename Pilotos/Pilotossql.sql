drop database if exists pilotos;

create database pilotos;

use pilotos;

create table Autos(
ID_Auto int primary key auto_increment not null,
Marca varchar(10),
Modelo varchar(10),
Precio int(10),
Año_fabricacion date,
Patente int(7)
);

create table Escuderias(
ID_Escuderia int primary key auto_increment not null,
Nombre varchar(20),
Presupuesto int(10),
ID_Auto int,
foreign key(ID_Auto) references Autos(ID_Auto)
);

create table Pilotos(
ID_Piloto int primary key auto_increment not null,
Nombre varchar(10),
Apellido varchar(10),
Edad int(2),
ID_Escuderia int,
foreign key(ID_Escuderia) references Escuderias(ID_Escuderia)
);

create table Carreras(
ID_Carrera int primary key auto_increment not null,
Kilometros int(3),
Pais varchar(15),
Participantes int(2),
Año date
);

create table Podios(
ID_Podio int primary key auto_increment not null,
ID_Ganador int,
foreign key(ID_Ganador) references Pilotos(ID_Piloto),
ID_Carrera int,
foreign key(ID_Carrera) references Carreras(ID_Carrera)
);

use pilotos;

insert into Autos(Marca, Modelo, Precio, Año_fabricacion, Patente)
values
('Ferrari', 'SF-25', 1200000, "2025-03-24", 'FRA-001'),
('Red Bull', 'RB21', 1300000, "2025-02-14", 'RBT-002'),
('Mercedes', 'W16', 1250000, "2025-04-20", 'MER-003');

INSERT INTO Escuderias (Nombre, Presupuesto, ID_Auto)
VALUES
('Ferrari Racing', 2000000, 1),
('Red Bull Team', 7000000, 2),
('Mercedes AMG', 3000000, 3);

INSERT INTO Pilotos ( Nombre, Apellido, Edad, ID_Escuderia)
VALUES
('Juan', 'Pérez', 24, 1),
('Lucas', 'Gómez', 27, 2),
('Mateo', 'Rodríguez', 22, 3);

INSERT INTO Carreras (Kilometros, Pais, Participantes, Año)
VALUES
(17, 'Italia', 20, "2025-04-15"),
(307, 'Japón', 20, "2023-10-17"),
(306, 'Brasil', 20, "2019-06-11");

INSERT INTO Podios (ID_Ganador, ID_Carrera)
VALUES
(2, 1),
(2, 2),
(1, 3);

select Nombre, ID_Escuderia from Pilotos;

select Nombre, Presupuesto from Escuderias
where Presupuesto > (select avg(Presupuesto) from Escuderias);

select Marca, Modelo, Precio from Autos
order by Precio desc 
limit 1;

select ID_Carrera, Pais, Kilometros from Carreras
group by Pais, Kilometros
having Kilometros > 20
order by Año desc;

select Nombre, Edad from Pilotos
where Edad > 25 and ID_Piloto in (select ID_Ganador from Podios join Carreras on Podios.ID_Carrera = Carreras.ID_Carrera where Carreras.Año > "2020-01-01")