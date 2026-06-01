use fg;
select a.Nombre, count(r.ID_Reproduccion) as total
from Artistas a
join Reproducciones r on r.ID_Artista = a.ID_Artista
join Albumes l on l.ID_Album = a.ID_Album
group by a.Nombre, total 
having count(Albumes.ID_Album) > 3 and sum(Reproducciones.Cantidad) > 1000000