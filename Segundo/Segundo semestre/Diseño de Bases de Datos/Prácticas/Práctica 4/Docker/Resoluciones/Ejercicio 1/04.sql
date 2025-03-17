-- Listar nombre, descripción, precio y stock de productos no vendidos a clientes que tengan teléfono
-- con característica 221 (la característica está al comienzo del teléfono). Ordenar por nombre.

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Detalle d ON (d.idProducto = p.idProducto)
INNER JOIN Factura f ON (f.nroTicket = d.nroTicket)
INNER JOIN Cliente c ON (c.idCliente = f.idCliente)
WHERE (c.telefono NOT LIKE '221%')
ORDER BY p.nombreP ASC;