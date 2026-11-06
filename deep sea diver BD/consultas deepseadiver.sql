use deep;

select IDJugador, Usuario, Nivel from Jugadores
order by (Nivel)desc
limit 1;

select IDObjeto, Nombre, Tipo from Objetos
where Tipo like "Legendaria%";

select Experiencia from Recompensas
order by (Experiencia)asc
limit 1;

select IDZona, Nombre, NivelPresion from Zonas
order by (NivelPresion)desc;

select Nombre, Tipo, Costo from Equipamientos
where Costo > (select avg(Costo) from Equipamientos);

CALL sp_VerJugador(2);

call sp_ReporteConsumoOxigeno();

CALL sp_ModificarDineroJugador(1, 500);

CALL sp_DescubrimientosPorUsuario('Pablo');
