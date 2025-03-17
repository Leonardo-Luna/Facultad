/**

Mostrar todos los datos de las personas que hayan visitado solo Argentina en el año 2023.

**/

SELECT *
FROM Persona per
INNER JOIN Visita v ON (per.dni = v.dni)
INNER JOIN Ciudad c ON (v.codigo_ciudad = c.codigo_ciudad)
INNER JOIN Pais p ON (c.codigo_pais = p.codigo_pais)
WHERE ((p.nombre = 'Argentina') AND (YEAR(v.fecha) = 2023) AND NOT EXISTS (
    SELECT *
    FROM Visita v2
    INNER JOIN Ciudad c2 ON (v2.codigo_ciudad = c2.codigo_ciudad)
    INNER JOIN Pais p2 ON (c2.codigo_pais = p2.codigo_pais)
    WHERE ((v2.dni = per.dni) AND (p2.nombre != 'Argentina') AND (YEAR(v2.fecha) = 2023))
));