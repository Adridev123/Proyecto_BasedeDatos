create database deep;

use deep;

create table Jugadores(
IDJugador int primary key auto_increment not null,
Dinero int(10),
Nivel float(10),
Usuario varchar(25)
);

create table Dificultades(
IDDificultad int primary key auto_increment not null,
Dificultad enum("Facil", "Medio", "Dificil"),
MobRate int(2),
Jefe varchar(25)
);

create table Objetos(
IDObjeto int primary key auto_increment not null,
Nombre varchar(30),
Tipo enum("Comun", "Raro", "Epico", "Legendario"),
CostoVender int(10),
CostoComprar int(10)
);

create table Equipamientos(
IDEquipamiento int primary key auto_increment not null,
Nombre varchar(30),
Tipo enum("Comun", "Raro", "Epico", "Legendario"),
CapacidadOxigeno float(10),
DuracionLuz float(10),
ResistenciaPresion float(10),
Costo int(10)
);

create table Zonas(
IDZona int primary key auto_increment not null,
Nombre varchar(30),
ProfundidadInicial int(10),
ProfundidadFinal int(10),
NivelPresion int(10),
Visibilidad int(10)
);

create table ConsumoOxigeno(
IDConsumoOxigeno int primary key auto_increment not null,
IDZona int,
foreign key(IDZona) references Zonas(IDZona),
TasaConsumo float(10)
);

create table Sesiones(
IDSesion int primary key auto_increment not null,
IDJugador int,
foreign key(IDJugador) references Jugadores(IDJugador),
IDDificultad int,
foreign key(IDDificultad) references Dificultades(IDDificultad),
FechaInicio date,
FechaFinal date
);

create table Recompensas(
IDRecompensa int primary key auto_increment not null,
IDSesion int,
foreign key(IDSesion) references Sesiones(IDSesion),
IDObjeto int,
foreign key(IDObjeto) references Objetos(IDObjeto),
Experiencia float(10),
Dinero int(10)
);

create table ProgresoFinal(
IDProgresoFinal int primary key auto_increment not null,
IDZona int,
foreign key(IDZona) references Zonas(IDZona),
IDRecompensa int,
foreign key(IDRecompensa) references Recompensas(IDRecompensa),
IDSesion int,
foreign key(IDSesion) references Sesiones(IDSesion),
Puntaje int(20)
);

create table RegistrosEventos(
IDRegistroEvento int primary key auto_increment not null,
IDSesion int,
foreign key(IDSesion) references Sesiones(IDSesion),
IDZona int,
foreign key(IDZona) references Zonas(IDZona),
TiempoJuego time,
Tipo varchar(20)
);

create table Descubrimientos(
IDDescubrimiento int primary key auto_increment not null,
IDSesion int,
foreign key(IDSesion) references Sesiones(IDSesion),
IDZona int,
foreign key(IDZona) references Zonas(IDZona)
);				