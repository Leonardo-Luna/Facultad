-- Reportar DNI, nombre, apellido, fecha de nacimiento y localidad donde viven aquellos
-- podadores con apellido terminado con el string 'ata' y que tengan al menos una poda
-- durante 2024. Ordenar por apellido y nombre.

SELECT DISTINCT po.DNI, po.nombre, po.apellido, po.fnac, l.nombreL
FROM Podador po
INNER JOIN Localidad l ON (po.codigoPostalVive = l.codigoPostal)
INNER JOIN Poda p ON (po.DNI = p.DNI)
WHERE (po.apellido LIKE '%ata') AND (p.fecha BETWEEN '2024-1-1' AND '2024-12-31');