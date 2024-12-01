/*

Club = (codigoClub, nombre, anioFundacion, codigoCiudad(FK))
Ciudad = (codigoCiudad, nombre)
Estadio = (codigoEstadio, codigoClub(FK), nombre, direccion)
Jugador = (DNI, nombre, apellido, edad, codigoCiudad(FK))
ClubJugador = (codigoClub (FK), DNI (FK), desde, hasta)

*/

/*

Reportar el nombre y apellido de aquellos jugadores que hayan jugado en todos los clubes de la ciudad de Córdoba.

*/

SELECT j.nombre, j.apellido
FROM Jugador j
INNER JOIN ClubJugador CJ ON (j.DNI = CJ.DNI)
INNER JOIN Club c ON (CJ.codigoClub = c.codigoClub)
INNER JOIN Ciudad ciud ON (c.codigoCiudad = ciud.codigoCiudad)
WHERE ciud.nombre = 'Córdoba'
GROUP BY j.DNI, j.nombre, j.apellido
HAVING COUNT(DISTINCT c.codigoClub) = (
    SELECT COUNT(*) FROM Club WHERE codigoCiudad = (
        SELECT codigoCiudad FROM Ciudad WHERE nombre = 'Córdoba'));

/* A Viviana no le gusta el COUNT para la división, asi que: */

SELECT j.nombre. j.apellido
FROM Jugador j
WHERE NOT EXISTS (
    SELECT *
    FROM Club c
    INNER JOIN Ciudad ciudad ON (c.codigoCiudad = ciudad.codigoCiudad)
    WHERE ciudad.nombre = 'Córdoba' AND NOT EXISTS (
        SELECT * 
        FROM ClubJugador CJ
        WHERE CJ.DNI = j.DNI AND CJ.codigoClub = c.codigoClub
    )
);