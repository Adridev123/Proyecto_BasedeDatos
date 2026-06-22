drop database if exists gb;
create database gb;
use gb;

create table Series(
	IDSerie int primary key auto_increment not null,
    Nombre varchar (30),
    AnioEstreno int (4),
    Creador varchar(25)
);

create table Personajes(
	IDPersonaje int primary key auto_increment not null,
    Nombre varchar (25),
    NivelEnergia int,
    Rol enum("Protagonista", "Antagonista", "secundario"),
    IDSerie int not null,
    Foreign key (IDSerie) references Series(IDSerie)
);

create table Episodios(
	IDEpisodios int primary key auto_increment not null,
    Titulo varchar(25),
    Rating int(2),
    DuracionMinutos float,
    IDSerie int not null,
    foreign key (IDSerie) references Series(IDSerie)
);

create table Habilidades(
	IDHabilidad int primary key auto_increment not null,
    Nombre varchar(15),
    Tipo Varchar(15),
    IDSerie int not null,
    foreign key (IDSerie) references Series(IDSerie)
);

create table Enemigos(
	IDRivalidad int primary key auto_increment not null,
    EncuentrosTotales int,
    IDHeroe int not null,
    IDVillano int not null,
    foreign key (IDHeroe) references Personajes(IDPersonaje),
    foreign key (IDVillano) references Personajes(IDPersonaje)
);

create table Objetos(
	IDObjeto int primary key auto_increment not null,
    Nombre varchar(15),
    ValorSubasta int,
    IDPersonajeDuenio int not null,
    foreign key (IDPersonajeDuenio) references Personajes(IDPersonaje)
);