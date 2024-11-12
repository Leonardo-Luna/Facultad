/**

Mostrar todos los datos de las personas que hayan conocido más de 10 países diferentes junto con la
cantidad de países conocidos.

**/

SELECT per.dni, per.nombre, per.apellido, per.edad, COUNT(DISTINCT p.codigo_pais) as cantidad
FROM Persona per
INNER JOIN Visita v ON (per.dni = v.dni)
INNER JOIN Ciudad c ON (v.codigo_ciudad = c.codigo_ciudad)
INNER JOIN Pais p ON (c.codigo_pais = p.codigo_pais)
GROUP BY per.dni, per.nombre, per.apellido, per.edad
HAVING cantidad > 10;

