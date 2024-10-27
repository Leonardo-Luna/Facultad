-- Listar DNI, apellido y nombre de clientes donde el monto total comprado,
-- teniendo en cuenta todas sus facturas, supere $10.000.000.

SELECT DNI, apellido, nombre
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
GROUP BY f.total, DNI, apellido, nombre
HAVING f.total > 10000000;