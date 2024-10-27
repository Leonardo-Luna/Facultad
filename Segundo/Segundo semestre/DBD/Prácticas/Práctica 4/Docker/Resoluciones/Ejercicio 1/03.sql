-- Listar nombre, descripción, precio y stock de productos vendidos al cliente con DNI
-- 45789456, pero que no fueron vendidos a clientes de apellido 'Garcia'.

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Detalle d ON (d.idProducto = p.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
WHERE c.DNI = 45789456

EXCEPT

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Detalle d ON (d.idProducto = p.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
WHERE c.apellido = 'Garcia';