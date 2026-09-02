use deep;

insert into Jugadores(Dinero, Nivel, Usuario)
values
(1000, 10, "Pablo"),
(2000, 80, "Tiago"),
(600, 23, "Pablo");

insert into Dificultades(Dificultad, MobRate, Jefe)
values
("Medio", 5, "Kraken"),
("Facil", 9, "Megalodon"),
("Dificil", 8, "Kankralodon");

insert into Objetos(Nombre, Tipo, CostoVender, CostoComprar)
values
("Arpon", "Raro", 1000, 1000),
("Tridente", "Epico", 4000, 4300),
("Caña", "Legendaria", 8000, 8500);

insert into Equipamientos(Nombre, Tipo, CapacidadOxigeno, DuracionLuz, ResistenciaPresion, Costo)
values
("Tanque de oxigeno", "Comun", 5000, 0, 100, 700),
("Casco", "Raro", 0, 0, 6000, 1500),
("Pantalones", "Epico", 0, 0, 10000, 5000);

insert into Zonas(Nombre, ProfundidadInicial, ProfundidadFinal, NivelPresion, Visibilidad)
values
("Cueva", 100, 320, 500, 53),
("Gelido", 700, 800, 1500, 48),
("Almas", 1800, 1990, 7000, 25);

insert into ConsumoOxigeno(IDZona, TasaConsumo)
values
(1, 100),
(2, 300),
(3, 1600);

insert into Sesiones(IDJugador, IDDificultad, FechaInicio, FechaFinal)
values
(1, 1, "2026-10-07", "2026-10-10"),
(2, 2, "2026-10-05", "2026-10-10"),
(3, 3, "2026-10-15", "2026-10-18");

insert into Recompensas(IDSesion, IDObjeto, Experiencia, Dinero)
values
(1, 1, 3000, 4000),
(2, 2, 400, 6000),
(3, 3, 1201, 8000);

insert into ProgresoFinal(IDZona, IDRecompensa, IDSesion, Puntaje)
values
(1, 1, 1, 19),
(2, 2, 2, 2000),
(3, 3, 3, 7000);

insert into RegistrosEventos(IDSesion, IDZona, TiempoJuego, Tipo)
value
(1, 1, "08:30:00", "Error"),
(2, 2, "11:20:00", "Advertencia"),
(3, 3, "09:00:40", "Activacion");

insert into Descubrimientos(IDSesion, IDZona)
values
(1, 1),
(2, 1),
(3, 3);
