-- Listar nroTicket, total, fecha, hora y DNI del cliente, de aquellas facturas donde
-- se haya comprado el producto 'prod38' o la factura tenga fecha de 2019.

SELECT DISTINCT f.nroTicket, f.total, fecha, hora, c.DNI
FROM Factura f
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE (p.nombreP = 'prod38') OR (f.fecha BETWEEN '2019-01-01' AND '2019-12-31'); 