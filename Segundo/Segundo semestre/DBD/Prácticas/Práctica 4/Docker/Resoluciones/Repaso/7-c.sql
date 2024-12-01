/*

Club = (codigoClub, nombre, anioFundacion, codigoCiudad(FK))
Ciudad = (codigoCiudad, nombre)
Estadio = (codigoEstadio, codigoClub(FK), nombre, direccion)
Jugador = (DNI, nombre, apellido, edad, codigoCiudad(FK))
ClubJugador = (codigoClub (FK), DNI (FK), desde, hasta)

*/

/*

Mostrar DNI, nombre y apellido de aquellos jugadores que jugaron o juegan en el club Gimnasia y Esgrima La Plata.

*/

SELECT DISTINCT j.DNI, j.nombre, j.apellido
FROM Jugador j
INNER JOIN ClubJugador CJ ON (j.DNI = CJ.DNI)
INNER JOIN Club c ON (CJ.codigoClub = c.codigoClub)
WHERE c.nombre = 'Gimnasia y Esgrima La Plata';