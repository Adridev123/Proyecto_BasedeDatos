drop database if exists Carreras;
CREATE DATABASE Carreras;
USE Carreras;

CREATE TABLE Autos (
    IDAuto INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Precio DECIMAL(10,2),
    AnioFabricacion INT
);

CREATE TABLE Escuderias (
    IDEscuderia INT PRIMARY KEY,
    IDAuto INT,
    Nombre VARCHAR(100),
    Presupuesto DECIMAL(15,2),
    FOREIGN KEY (IDAuto) REFERENCES Autos(IDAuto)
);

CREATE TABLE Pilotos (
    IDPiloto INT PRIMARY KEY,
    IDEscuderia INT,
    Nombre VARCHAR(100),
    Edad INT,
    FOREIGN KEY (IDEscuderia) REFERENCES Escuderias(IDEscuderia)
);

CREATE TABLE Carreras(
    IDCarrera INT PRIMARY KEY,
    IDPiloto INT,
    Pais VARCHAR(50),
    Fecha DATE,
    Longitud DECIMAL(10,2),
    FOREIGN KEY (IDPiloto) REFERENCES Pilotos(IDPiloto)
);

CREATE TABLE Participaciones(
    IDParticipacion INT PRIMARY KEY,
    IDCarrera INT,
    IDPiloto INT,
    Puesto INT,
    FOREIGN KEY (IDCarrera) REFERENCES Carreras(IDCarrera),
    FOREIGN KEY (IDPiloto) REFERENCES Pilotos(IDPiloto)
);