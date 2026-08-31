use Laboratorio;

Select Tipo as Muestras, Nombre as Empresa, NombreTecnico
from Muestras M, Empresas, Tecnicos T
where T.IDTecnicos = M.
 
select Compuestos, valor
from Analisis
where avg(valor) > valor;

select avg(valor)
from Analisis
group by Tipo