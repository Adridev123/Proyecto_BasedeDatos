drop database if exists db;
create database db;
use db;

create table Carniceros(
	IDCarnicero int primary key auto_increment not null,
    Nombre varchar(20),
    Apellido varchar(25),
    DNI int(8) not null
);

create table Clientes(
	IDCliente int primary key auto_increment not null,
    Nombre varchar(20),
    Telefono varchar(14)
);

create table Pedidos(
	IDPedido int primary key auto_increment not null,
    IDCarnicero int not null,
    IDCliente int not null,
    Fecha date,
    Corte varchar(25),
    Monto double,
    MetodoPago enum("Mercado Pago", "Efectivo", "Tarjeta"),
    foreign key (IDCarnicero) references Carniceros(IDCarnicero),
    foreign key (IDCliente) references Clientes(IDCliente)
);