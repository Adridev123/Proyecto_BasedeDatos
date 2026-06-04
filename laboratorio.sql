drop database if exists labo;

create database labo;

use labo;

create table Laboratorios(
ID_Laboratorio int primary key auto_increment,
Pais varchar(25),
Telefono int(100),
Nombre varchar(25)
);

create table Medicamentos(
ID_Medicamento int primary key auto_increment,
Nombre varchar(25),
Monodroga varchar(25),
Precio int(6),
ID_Laboratorio int,
foreign key (ID_Laboratorio) references Laboratorios(ID_Laboratorio)
);

create table Lotes(
ID_Lote int primary key auto_increment,
Stock int(3),
Precio_Final int(20),
Fecha_Vencimiento date,
Gondola varchar(25),
ID_Medicamento int,
foreign key (ID_Medicamento) references Medicamentos(ID_Medicamento)
);

use labo;

insert into Laboratorios(Pais, Telefono, Nombre)
values
("Argentina", 549112022182, "Bago"),
("Alemania", 499114021142, "Bayer AG"),
("Brasil", 559119921745, "EMS"),
("Japon", 819116922789, "Takeda Pharmaceutical"),
("Peru", 519116782782, "Medifarma");

insert into Medicamentos(Nombre, Monodroga, Precio, ID_Laboratorio)
values
("Anaflex", "Diclofenac Sódico", 4500, 1),
("Buscapina", "Hioscina N-butilbromuro", 11300, 2),
("Torsilax", "Diclofenac sódico", 15000, 3),
("Nene Dent", "Lidocaína", 12000, 4),
("PVM", "Proteína de soja", 29000, 5);

insert into Lotes(Stock, Precio_Final, Fecha_Vencimiento, Gondola, ID_Medicamento)
values
(230, 1035000, "2026-05-25", "Gondola 3", 1),
(120, 1356000, "2023-05-25", "Gondola 7", 2),
(140, 2100000, "2026-09-30", "Gondola 4", 3),
(250, 3000000, "2022-07-31", "Gondola 9", 4),
(300, 8700000, "2026-12-05", "Gondola 2", 5);