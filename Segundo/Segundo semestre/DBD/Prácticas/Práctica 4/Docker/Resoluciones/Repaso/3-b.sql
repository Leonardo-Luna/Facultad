/*

Banda = (codigoB, nombreBanda, genero_musical, año_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))

*/

/*

Reportar nombre, género musical y año de creación de bandas que hayan realizado recitales durante 2023, pero no hayan tocado durante 2022.

*/

SELECT b.nombreBanda, b.genero_musical, b.año_creacion
FROM Banda b
INNER JOIN Recital r ON (b.codigoB = r.codigoB)
WHERE YEAR(r.fecha) = 2023 AND NOT EXISTS(
    SELECT b2.nombreBanda, b2.genero_musical, b2.año_creacion
    FROM Banda b2
    INNER JOIN Recital r2 ON (b2.codigoB = r2.codigoB)
    WHERE YEAR(r2.fecha) = 2022 AND b2.codigoB = b.codigoB
);


SELECT b.nombreBanda, b.genero_musical, b.año_creacion
FROM Banda b
INNER JOIN Recital r ON (b.codigoB = r.codigoB)
WHERE YEAR(r.fecha) = 2023

EXCEPT

SELECT b2.nombreBanda, b2.genero_musical, b2.año_creacion
FROM Banda b2
INNER JOIN Recital r2 ON (b2.codigoB = r2.codigoB)
WHERE YEAR(r2.fecha) = 2022 AND b2.codigoB = b.codigoB