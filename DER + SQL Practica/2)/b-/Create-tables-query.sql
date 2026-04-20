create database TIENDA;
use TIENDA;

Create table Clinicas(
	ID_Clinica Int Auto_increment primary key not null,
    Nombre varchar(30)
);

Create table Pacientes(
	ID_Paciente Int Auto_increment primary key not null,
    Nombre varchar(30)
);

Create table Especialidades(
	ID_Especialidad Int Auto_increment primary key not null,
    Nombre varchar(30)
);

Create table Medicos(
	ID_Medico Int Auto_increment primary key not null,
    ID_Especialidad Int not null,
    foreign key (ID_Especialidad) references Especialidades(ID_Especialidad),
    Nombre varchar(30)
);

Create table Turnos(
	ID_Turno Int Auto_increment primary key not null,
    ID_Paciente Int not null,
    ID_Medico Int not null,
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID_Paciente),
    FOREIGN KEY (ID_Medico) REFERENCES Medicos(ID_Medico),
    Fecha date,
    Hora time,
    Estado varchar(25)
);