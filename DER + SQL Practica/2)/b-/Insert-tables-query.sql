insert into Clinicas(Nombre)
values("Nutrimad"),
("NutriGreen"),
("NutriTech");

insert into Pacientes(Nombre)
values("Azul"),
("Mauricio"),
("Mariano");

insert into Especialidades(Nombre)
values("Cardiologia"),
("Pediatria"),
("Psiquiatria");

insert into Medicos(ID_Especialidad, Nombre)
values(1, "Fabricio"),
(2, "Martin"),
(3, "Lucas");

insert into Turnos(ID_Paciente, ID_Medico, Fecha, Hora, Estado)
values
(1, 1, '2026-02-15', '15:00:00', 'Aprobado'),
(2, 2, '2026-04-12', '13:30:00', 'Cancelado'),
(3, 3, '2026-07-15', '20:00:00', 'En proceso');