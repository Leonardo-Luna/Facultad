-- Listar especie, años, calle, nro y localidad de árboles que no fueron podados nunca.

-- Opción 1:

SELECT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)

EXCEPT

SELECT a2.especie, a2.anios, a2.calle, a2.nro, l2.nombreL
FROM Arbol a2
INNER JOIN Localidad l2 ON (a2.codigoPostal = l2.codigoPostal)
INNER JOIN Poda p2 ON (a2.nroArbol = p2.nroArbol);

-- Opción 2:

SELECT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
LEFT JOIN Poda p ON (a.nroArbol = p.nroArbol)
WHERE (p.nroArbol IS NULL);

-- Ambas son equivalentes, el problema es que MySQL no acepta "EXCEPT", por lo que no se puede usar.