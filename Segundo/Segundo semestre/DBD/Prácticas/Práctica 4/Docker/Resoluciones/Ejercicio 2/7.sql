-- Listar especies de árboles que se encuentren en la localidad de 'La Plata' y también
-- en la localidad de 'Salta'.

SELECT DISTINCT a.especie
FROM Arbol a
WHERE (a.especie IN (
    SELECT DISTINCT a2.especie
    FROM Arbol a2
    INNER JOIN Localidad l ON (a2.codigoPostal = l.codigoPostal)
    WHERE (l.nombreL = 'La Plata')
) AND (a.especie IN (
    SELECT DISTINCT a3.especie
    FROM Arbol a3
    INNER JOIN Localidad l2 ON (a3.codigoPostal = l2.codigoPostal)
    WHERE (l2.nombreL = 'Salta')
)));