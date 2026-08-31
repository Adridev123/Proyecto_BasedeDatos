drop database if exists Laboratorio;
create database Laboratorio;
use Laboratorio;

create table Empresas(
	IDEmpresa int primary key auto_increment not null,
    Nombre varchar(30)
);

create table Muestras(
	IDMuestra int primary key auto_increment not null,
    IDEmpresa int not null,
    Tipo varchar(15)
);

create table Laboratorios(
	IDLaboratorio int primary key auto_increment not null,
    Nombre varchar(30)
);

create table Tecnicos(
	IDTecnico int primary key auto_increment not null,
    Nombre varchar(30)
);

create table Analisis(
	IDAnalisis int primary key auto_increment not null,
    IDMuestra int not null,
    IDLaboratorio int not null,
    IDTecnico int not null,
    foreign key (IDMuestra) references Muestras(IDMuestra),
    foreign key (IDLaboratorio) references Laboratorios(IDLaboratorio),
    foreign key (IDTecnico) references Tecnicos(IDTecnico)
);

create table Resultados(
	IDResultado int primary key auto_increment not null,
    IDAnalisis int not null,
    foreign key (IDAnalisis) references Analisis(IDAnalisis)
);