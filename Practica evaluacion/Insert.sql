insert into Series(Nombre, AnioEstreno, Creador) values
("Hora de Aventura", 2010, "Pendleton Ward"),
("Ben 10", 2005, "Adriel Fux"),
("Billy y Mandy", 2001, "Benicio Longo"),
("Un Show Más", 2010, "Antonio Latour"),
("Coraje el Perro Cobarde", 1999, "Sebastián Besteiro"),
("El laboratorio de Dexter", 1996, "Santino Mendez");

insert into Personajes(Nombre, NivelEnergia, Rol, IDSerie) values
("Finn el Humano", 85, "Protagonista", 1),
("Jake el Perro", 90, "Protagonista", 1),
("Rey Helado", 75, "Antagonista", 1),
("Ben Tennyson", 95, "Protagonista", 2),
("Vilgax", 98, "Antagonista", 2),
("Puro Hueso", 80, "Secundario", 3),
("Mordecai", 60, "Protagonista", 4),
("Rigby", 55, "Protagonista", 4),
("Coraje", 40, "Protagonista", 5),
("Dexter", 70, "Protagonista", 6);

insert into Episodios(Titulo, Rating, DuracionMinutos, IDSerie) values
("Pánico en la fiesta de palacio", 7.3, 11, 1),
("Y fueron diez", 8.2, 24, 2),
("Billy & Mandy", 7.9, 22, 3),
("El Poder", 8.6, 11, 4),
("Una noche en el Motel Gato", 7.9, 23, 5),
("Viaje al pasado", 7.5, 22, 6);

insert into Habilidades(Nombre, Tipo, IDSerie) values
("Bola de fuego", "Magico", 1),
("Xclr8", "Transformacion", 2),
("Golpe", "Fisico", 3),
("Puño Mortal", "mortal", 4),
("Llorar", "Dramatico", 5),
("Quimico acido", "Alquimia", 6);

insert into Enemigos(EncuentrosTotales, IDHeroe, IDVillano) values
(3, 1, 3),
(4, 4, 5),
(5, 7, 8),
(6, 3, 3),
(7, 5, 5),
(8, 6, 6);

insert into Objetos(Nombre, ValorSubasta, IDPersonajeDuenio) values
("Scarlet", 350000, 1),
("Sándwich perfecto", 15000, 2),
("Omnitrix", 9999999, 4),
("Cama elastica", 35000, 8),
("Consola de videojuegos", 90000, 7),
("Jugo Rick", 38000, 7);