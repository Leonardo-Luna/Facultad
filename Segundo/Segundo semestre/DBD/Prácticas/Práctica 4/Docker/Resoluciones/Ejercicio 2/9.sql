-- Reportar nombre, descripción y cantidad de habitantes de localidades que tengan
-- menos de 100 árboles

SELECT l.nombreL, l.descripcion, l.cantHabitantes
FROM Localidad l
LEFT JOIN Arbol a ON (l.codigoPostal = a.codigoPostal)
GROUP BY l.codigoPostal, l.nombreL, l.descripcion, l.cantHabitantes
HAVING (count(*) < 100);

-- Utilizo LEFT JOIN por si hay localidades sin árboles (El enunciado no aclara nada).