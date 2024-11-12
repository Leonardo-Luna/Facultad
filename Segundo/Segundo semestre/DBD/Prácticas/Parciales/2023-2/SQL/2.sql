/**

Eliminar el país con código 2398

**/

DELETE FROM Visita v WHERE (v.codigo_ciudad IN (
    SELECT c.codigo_ciudad
    FROM Ciudad c
    WHERE c.codigo_pais = 2398
));
DELETE FROM Ciudad c WHERE (c.codigo_pais = 2398);
DELETE FROM Pais p WHERE (p.codigo_pais = 2398);

