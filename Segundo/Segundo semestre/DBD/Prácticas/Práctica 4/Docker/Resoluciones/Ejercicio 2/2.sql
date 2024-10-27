-- Reportar DNI, nombre, apellido, fecha de nacimiento y localidad donde viven aquellos
-- podadores que tengan podas realizadas durante 2023.

SELECT DISTINCT po.DNI, po.nombre, po.apellido, po.fnac, l.nombreL
FROM Podador po
INNER JOIN Localidad l ON (po.codigoPostalVive = l.codigoPostal)
INNER JOIN Poda p ON (po.DNI = p.DNI)
WHERE (p.fecha BETWEEN '2023-1-1' AND '2023-12-31');