use Laboratorio;

Insert into Empresas(Nombre)
values
("Clearwater"),
("Oceandiver"),
("Tidytests");

Insert into Muestras(IDEmpresa, Tipo)
values
(1, "Agua"),
(2, "Suelo"),
(3, "Hongos");

Insert into Laboratorios(Nombre)
values
("Roemmers"),
("Laboratorios Elea"),
("Gador");

Insert into Tecnicos(NombreTecnico)
values
("Juan"),
("Martin Rueda"),
("Joaquin");

Insert into Analisis(IDMuestra, IDLaboratorio, IDTecnico, Fecha)
values
(1, 1, 3, 3-6-2026),
(2, 3, 3, 15-5-2025),
(3, 2, 1, 20-7-2026);

Insert into Resultados(IDAnalisis, Compuestos, valor)
values
(1, "Bacterias", 10),
(2, "ADN", 100),
(3, "Cabello humano", 5);