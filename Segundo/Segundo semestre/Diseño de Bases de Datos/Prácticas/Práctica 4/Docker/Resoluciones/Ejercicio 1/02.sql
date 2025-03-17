-- Listar nombre, apellido, DNI, teléfono y dirección de clientes que realizaron compras solamente
-- durante 2017.

SELECT DISTINCT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c
INNER JOIN Factura f
ON (c.idCliente = f.idCliente)
WHERE (f.fecha BETWEEN '2017-1-1' AND '2017-12-31')

EXCEPT

SELECT c2.nombre, c2.apellido, c2.DNI, c2.telefono, c2.direccion
FROM Cliente c2
INNER JOIN Factura f2
ON (c2.idCliente = f2.idCliente)
WHERE (f2.fecha < '2017-1-1' OR f2.fecha > '2017-12-31');