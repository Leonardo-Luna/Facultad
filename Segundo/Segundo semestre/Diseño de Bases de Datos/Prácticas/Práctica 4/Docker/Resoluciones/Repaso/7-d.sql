/*

Club = (codigoClub, nombre, anioFundacion, codigoCiudad(FK))
Ciudad = (codigoCiudad, nombre)
Estadio = (codigoEstadio, codigoClub(FK), nombre, direccion)
Jugador = (DNI, nombre, apellido, edad, codigoCiudad(FK))
ClubJugador = (codigoClub (FK), DNI (FK), desde, hasta)

*/

/*

Mostrar DNI, nombre y apellido de aquellos jugadores que tengan más de 29 años y hayan jugado o juegan en algún club de la ciudad de Córdoba.

*/

SELECT j.DNI, j.nombre, j.apellido
FROM Jugador j
INNER JOIN ClubJugador CJ ON (j.DNI = CJ.DNI)
INNER JOIN Club c ON (CJ.codigoClub = c.codigoClub)
INNER JOIN Ciudad ciud ON (c.codigoCiudad = ciud.codigoCiudad)
WHERE ciud.nombre = 'Córdoba' AND j.edad > 29;