/**

Mostrar todos los datos de las personas que hayan conocido todas las ciudades.

**/

SELECT *
FROM Persona p
WHERE (NOT EXISTS (
    SELECT *
    FROM Ciudad c
    WHERE (NOT EXISTS (
        SELECT *
        FROM Visita v
        WHERE c.codigo_ciudad = v.codigo_ciudad AND v.dni = p.dni
    ))
));

/**

Mostrar todos los datos de las personas que NO hayan visitado ninguna ciudad.

**/

SELECT *
FROM Persona p
WHERE (NOT EXISTS (
    SELECT *
    FROM Visita v
    WHERE (v.dni=p.dni)
));