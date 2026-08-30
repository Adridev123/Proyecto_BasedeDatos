use Carreras;

INSERT INTO Autos (IDAuto, Marca, Modelo, Precio, AnioFabricacion) VALUES
(1, 'Ferrari', 'SF-25', 2500000.00, 2025),
(2, 'Mercedes', 'W16', 2300000.00, 2025),
(3, 'McLaren', 'MCL39', 2400000.00, 2025),
(4, 'Red Bull', 'RB21', 2600000.00, 2025),
(5, 'Aston Martin', 'AMR25', 2200000.00, 2025);

INSERT INTO Escuderias (IDEscuderia, IDAuto, Nombre, Presupuesto) VALUES
(1, 1, 'Ferrari', 500000000.00),
(2, 2, 'Mercedes', 480000000.00),
(3, 3, 'McLaren', 470000000.00),
(4, 4, 'Red Bull Racing', 520000000.00),
(5, 5, 'Aston Martin', 450000000.00);

INSERT INTO Pilotos (IDPiloto, IDEscuderia, Nombre, Edad) VALUES
(1, 1, 'Charles Leclerc', 28),
(2, 2, 'George Russell', 28),
(3, 3, 'Lando Norris', 26),
(4, 4, 'Max Verstappen', 28),
(5, 5, 'Fernando Alonso', 45);

INSERT INTO Carreras (IDCarrera, IDPiloto, Pais, Fecha, Longitud) VALUES
(1, 1, 'Italia', '2026-05-03', 5793.00),
(2, 2, 'España', '2026-05-17', 4675.00),
(3, 3, 'Monaco', '2026-05-24', 3337.00),
(4, 4, 'Canada', '2026-06-07', 4361.00),
(5, 5, 'Reino Unido', '2026-07-05', 5891.00);

INSERT INTO Participaciones (IDParticipacion, IDCarrera, IDPiloto, Puesto) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 2, 2, 1),
(5, 2, 1, 2),
(6, 2, 4, 3),
(7, 3, 3, 1),
(8, 3, 4, 2),
(9, 3, 5, 3),
(10, 4, 4, 1),
(11, 4, 3, 2),
(12, 4, 1, 3),
(13, 5, 5, 1),
(14, 5, 1, 2),
(15, 5, 2, 3);