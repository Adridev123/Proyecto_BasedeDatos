INSERT into Estadios(Nombre, Ubicacion)
values("La Bombonera", "La Boca"),
("Estadio Monumental", "Belgrano"),
("Estadio Don León Kolbowski", "Villa Crespo");

INSERT into Campeonatos(ID_Estadio)
values(1),
(2),
(3);

INSERT into Partidos(ID_Campeonato, Fecha)
values(1, '2026-03-03'),
(2, '2026-05-04'),
(3, '2026-08-15');

INSERT into Equipos(Nombre)
values("Club Atlético River Plate"),
("Boca Juniors"),
("Club Atlético Atlanta");

INSERT into Jugadores(ID_Equipo, Nombre, Posicion)
values(1, "Franco Armani", "arquero"),
(2, "Edinson Cavani", "delantero"),
(3, "Juan Galeano", "mediocampista");

INSERT into Goles(ID_Equipo, ID_Jugador, Minuto, Descripcion)
values(1, 1, "30", "Gol de cabeza"),
(2, 2, "45", "Gol asistido"),
(3, 3, "14", "Puntinazo");