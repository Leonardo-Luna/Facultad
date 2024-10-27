-- Listar nombre, apellido, DNI, teléfono y dirección de clientes que compraron los productos
-- con nombre 'prod1' y 'prod2' pero nunca compraron el producto con nombre 'prod3'.

SELECT nombre, apellido, DNI, telefono, direccion
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE p.nombreP = 'prod1'

INTERSECT

SELECT nombre, apellido, DNI, telefono, direccion
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE p.nombreP = 'prod2'

EXCEPT

SELECT nombre, apellido, DNI, telefono, direccion
FROM Cliente c
INNER JOIN Factura f ON (c.idCliente = f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE p.nombreP = 'prod3';