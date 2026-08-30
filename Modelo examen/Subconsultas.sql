use Carreras;

SELECT P.Nombre AS Piloto, E.Nombre AS Escuderia
FROM Pilotos P
INNER JOIN Escuderias E
ON P.IDEscuderia = E.IDEscuderia;


SELECT E1.*
FROM Escuderias E1
WHERE E1.Presupuesto > (
    SELECT AVG(E2.Presupuesto)
    FROM Escuderias E2
    WHERE E2.IDEscuderia <> E1.IDEscuderia
);


Select Marca, Modelo, Precio
FROM Autos
WHERE Precio = (SELECT MAX(Precio) FROM Autos);


SELECT Pais, MIN(Fecha) AS Fecha
FROM Carreras
WHERE Longitud > 5000
GROUP BY Pais
ORDER BY Fecha ASC;


SELECT DISTINCT P.Nombre, C.Fecha
FROM Pilotos P
INNER JOIN Participaciones PA
ON P.IDPiloto = PA.IDPiloto
INNER JOIN Carreras C
ON PA.IDCarrera = C.IDCarrera
WHERE PA.Puesto = 1
AND YEAR(C.Fecha) > 2020
AND P.Edad > 25;