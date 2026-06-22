use gb;

select Nombre, Creador from Series
order by Nombre asc;

select Nombre, Rol from Personajes
WHERE Nombre LIKE "B%" or "F%";

select Nombre from Episodios
where DuracionMinutos > 11 and DuracionMinutos > 8.5;	

select Nombre from Objetos
where Nombre = "Espada" or Nombre = "Anillo";

select Nombre from Personajes