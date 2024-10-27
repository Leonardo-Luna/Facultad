-- Reportar especie, años, calle, nro y localidad de árboles que fueron podados
-- durante 2022 y no fueron podados durante 2023.

SELECT DISTINCT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
INNER JOIN Poda p ON (a.nroArbol = p.nroArbol)
WHERE (p.fecha BETWEEN '2022-1-1' AND '2022-12-31')

EXCEPT

SELECT DISTINCT a2.especie, a2.anios, a2.calle, a2.nro, l2.nombreL
FROM Arbol a2
INNER JOIN Localidad l2 ON (a2.codigoPostal = l2.codigoPostal)
INNER JOIN Poda p2 ON (a2.nroArbol = p2.nroArbol)
WHERE (p2.fecha BETWEEN '2023-1-1' AND '2023-12-31');