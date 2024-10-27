-- Listar para cada producto nombre, descripción, precio y cuántas veces fue vendido.
-- Tenga en cuenta que puede no haberse vendido nunca un producto.

SELECT nombreP, descripcion, precio, sum(d.cantidad)
FROM Producto p
LEFT JOIN Detalle d ON (d.idProducto = p.idProducto)
GROUP BY p.idProducto, nombreP, descripcion, precio;