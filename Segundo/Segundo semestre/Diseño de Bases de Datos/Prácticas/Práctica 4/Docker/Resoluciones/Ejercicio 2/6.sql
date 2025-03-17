-- Listar DNI, apellido, nombre, teléfono y fecha de nacimiento de podadores que
-- solo podaron árboles de especie 'Coniferas'.

SELECT DISTINCT po.DNI, po.apellido, po.nombre, po.telefono, po.fnac
FROM Podador po
INNER JOIN Poda p ON (po.DNI = p.DNI)
INNER JOIN Arbol a ON (p.nroArbol = a.nroArbol)
WHERE (a.especie = 'Coniferas') AND (po.DNI NOT IN (
    SELECT po2.DNI
    FROM Podador po2
    INNER JOIN Poda p2 ON (po2.DNI = p2.DNI)
    INNER JOIN Arbol a2 ON (p2.nroArbol = a2.nroArbol)
    WHERE (a2.especie != 'Coniferas')
));