/*

Cliente (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura (nroTicket, total, fecha, hora, idCliente (fk))
Detalle (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto (idProducto, nombreP, descripcion, precio, stock)

*/

/*

Listar nombre, descripción, precio y stock de productos vendidos al cliente con DNI 45789456, pero que no fueron vendidos a clientes de apellido "García".

*/

SELECT p.nombre, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
WHERE c.DNI = 45789456 AND c.apellido != 'García';