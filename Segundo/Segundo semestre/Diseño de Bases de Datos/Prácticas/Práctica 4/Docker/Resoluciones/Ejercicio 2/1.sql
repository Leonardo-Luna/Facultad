-- Listar especie, años, calle, nro y localidad de árboles podados por el podaddor
-- 'Juan Perez' y por el podador 'Jose Garcia'

SELECT DISTINCT a.especie, a.anios, a.calle, a.nro, l.nombreL
FROM Arbol a
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
INNER JOIN Poda p ON (a.nroArbol = p.nroArbol)
INNER JOIN Podador po ON (p.DNI = po.DNI)
WHERE (po.nombre = 'Juan' AND po.apellido = 'Perez') OR (po.nombre = 'Jose' AND po.apellido = 'Garcia');