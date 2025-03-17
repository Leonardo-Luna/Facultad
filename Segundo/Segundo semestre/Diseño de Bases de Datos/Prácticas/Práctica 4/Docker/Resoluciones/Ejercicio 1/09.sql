-- Listar nroTicket, total, fecha y hora para las facturas del cliente 'Jorge Pérez'
-- donde no haya comprado el producto 'Z'.

SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM Factura f
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket)
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE c.nombre = 'Jorge' AND c.apellido = 'Perez' AND p.nombreP != 'Z';