SELECT DISTINCT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion FROM Cliente c
INNER JOIN Factura f
ON (c.idCliente = f.idCliente)
WHERE (f.fecha BETWEEN '2017-1-1' AND '2017-12-31')

EXCEPT

SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion FROM Cliente c
INNER JOIN Factura f
ON (c.idCliente = f.idCliente)
WHERE (f.fecha < '2017-1-1' OR f.fecha > '2017-12-31');