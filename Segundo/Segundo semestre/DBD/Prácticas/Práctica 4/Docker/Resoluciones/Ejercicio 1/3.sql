SELECT p.nombre, p.descripcion, p.precio, p.stock
FROM Producto p
INNER JOIN Factura f
ON (f.idCliente = 45789456)
WHERE 