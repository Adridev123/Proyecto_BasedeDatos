create database vuelos;

create table Pasajeros(
ID_Pasajero int primary key auto_increment,
Nombre_Completo varchar(25),
DNI int(8)
);

create table Aviones(
ID_Avione int primary key auto_increment,
Modelo varchar(25),
Capacidad int(4)
);

create table Vuelos(
ID_Vuelo int primary key auto_increment,
Numero int(4),
Salida varchar(25),
Destino varchar(25),
ID_Avion int,
foreign key (ID_Avion) references Aviones(ID_Avion)
);

create table Tickets(
ID_Ticket int primary key auto_increment,
Precio int(8),
ID_Pasajero int,
foreign key (ID_Pasajero) references Pasajeros(ID_Pasajero),
ID_Vuelo int,
foreign key (ID_Vuelo) references Vuelos(ID_Vuelo)
);

use vuelos;