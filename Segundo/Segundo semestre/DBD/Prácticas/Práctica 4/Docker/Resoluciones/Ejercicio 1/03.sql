-- Listar nombre, descripción, precio y stock de productos vendidos al cliente con DNI
-- 45789456, pero que no fueron vendidos a clientes de apellido 'Garcia'.

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Detalle d ON (d.idProducto = p.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
WHERE c.DNI = 45789456

EXCEPT

SELECT p2.nombreP, p2.descripcion, p2.precio, p2.stock
FROM Producto p2
INNER JOIN Detalle d2 ON (d2.idProducto = p2.idProducto)
INNER JOIN Factura f2 ON (d2.nroTicket = f2.nroTicket)
INNER JOIN Cliente c2 ON (f2.idCliente = c2.idCliente)
WHERE c2.apellido = 'Garcia';