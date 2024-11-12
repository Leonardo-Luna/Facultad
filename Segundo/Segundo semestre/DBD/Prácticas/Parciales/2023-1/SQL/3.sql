/**

Listar apellido, nombre y teléfono de cliente junto con el código, descripción y cantidades pedida
y remitida de artículo, para los artículos cuya cantidad remitida sea menor a la cantidad pedida.
En SQL ordenar por apellido y nombre del cliente y código de artículo.

**/

SELECT c.apellido, c.nombre, c.tel, a.codigoArticulo, a.descripcion, pa.cantPedido, ra.cantRemito
FROM Cliente c
INNER JOIN Pedidos p ON (c.nroClte = p.nroClte)
INNER JOIN PedidoArticulo pa ON (p.nroPedido = pa.nroPedido)
INNER JOIN Articulos a ON (pa.codigoArticulo = a.codigoArticulo)
INNER JOIN RemitoArticulo ra ON (a.codigoArticulo = ra.codigoArticulo)
WHERE (pa.cantPedido > ra.cantRemito)
ORDER BY c.apellido, c.nombre, a.codigoArticulo;