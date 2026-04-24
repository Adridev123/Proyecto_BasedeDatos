create database ej2;

use ej2;

create table Pacientes(
ID_Paciente int auto_increment primary key not null,
Nombre varchar(25)
);
create table Especialidades(
ID_Especialidad int auto_increment primary key not null,
Nombre varchar(25)
);
create table Medicos(
ID_Medico int auto_increment primary key not null,
ID_Especialidad int not null,
Nombre varchar(25)
);
create table Turnos(
ID_Turno int auto_increment primary key not null,
ID_Paciente int not null,
ID_Medico int not null,
Fecha datetime,
Estado varchar(25)
);

use ej2;

insert into Pacientes(Nombre)
values
("Adriano"),
("Julian"),
("Ulises");

insert into Especialidades(Nombre)
values
("Cardiologia"),
("Pediatra"),
("Cirujano");

insert into Medicos(ID_Especialidad, Nombre)
values
(1, "Roberto"),
(2, "Flor"),
(3, "Messi");

insert into Turnos(ID_Paciente, ID_Medico, Fecha, Estado)
values
(1, 3, '2067-09-23 17:30:00', "En proceso"),
(2, 2, '2026-04-18 13:00:00', "Hecho"),
(3, 1, '2026-03-12 09:00:00', "Cancelado");

select * from Medicos;
select * from Turnos;