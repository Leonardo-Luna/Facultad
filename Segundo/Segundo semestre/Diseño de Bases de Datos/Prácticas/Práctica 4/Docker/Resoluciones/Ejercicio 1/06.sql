-- Listar nombre, apellido, DNI, teléfono y dirección de clientes que compraron los productos
-- con nombre 'prod1' y 'prod2' pero nunca compraron el producto con nombre 'prod3'.

SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE p.nombreP = 'prod1'

INTERSECT

SELECT c2.nombre, c2.apellido, c2.DNI, c2.telefono, c2.direccion
FROM Cliente c2
INNER JOIN Factura f2 ON (c2.idCliente = f2.idCliente)
INNER JOIN Detalle d2 ON (f2.nroTicket = d2.nroTicket)
INNER JOIN Producto p2 ON (d2.idProducto = p2.idProducto)
WHERE p2.nombreP = 'prod2'

EXCEPT

SELECT c3.nombre, c3.apellido, c3.DNI, c3.telefono, c3.direccion
FROM Cliente c3
INNER JOIN Factura f3 ON (c3.idCliente = f3.idCliente)
INNER JOIN Detalle d3 ON (f3.nroTicket = d3.nroTicket)
INNER JOIN Producto p3 ON (d3.idProducto = p3.idProducto)
WHERE p3.nombreP = 'prod3';