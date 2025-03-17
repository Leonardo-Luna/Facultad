/*

PERSONA = (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero)
ALUMNO = (DNI (fk), Legajo, Año_Ingreso)
PROFESOR = (DNI (fk), Matricula, Nro_Expediente)
TITULO = (Cod_Titulo, Nombre, Descripción)
TITULO-PROFESOR = (Cod_Titulo (fk), DNI (fk), Fecha)
CURSO = (Cod_Curso, Nombre, Descripción, Fecha_Creacion, Duracion)
ALUMNO-CURSO = (DNI (fk), Cod_Curso (fk), Año, Desempeño, Calificación)
PROFESOR-CURSO = (DNI (fk), Cod_Curso (fk), Fecha_Desde, Fecha_Hasta)

*/

/*

Listar el DNI, apellido, nombre y matrícula de aquellos profesores que posean más de 3 títulos. Dicho listado deberá estar ordenado por Apellido y Nombre.

*/

SELECT prof.DNI, per.apellido, per.nombre, prof.matricula, COUNT(*)
FROM Profesor prof
INNER JOIN Persona per ON (prof.DNI = per.DNI)
INNER JOIN Titulo_Profesor TP ON (prof.DNI = TP.DNI)
INNER JOIN Titulo t ON (TP.cod_titulo = t.cod_titulo)
GROUP BY prof.DNI, per.apellido, per.nombre, prof.matricula
HAVING COUNT(*) > 3;