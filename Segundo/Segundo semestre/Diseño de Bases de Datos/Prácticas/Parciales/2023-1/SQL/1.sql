/**

Listar número de pedido, código de artículo, cantidad pedida, tipo y descripción
de artículo para los pedidos con fecha de envío 7-11-23. En SQL ordenar por código
de artículo y número de pedido.

**/

SELECT p.nroPedido, pa.codigoArticulo, pa.cantPedido, a.tipo, a.descripcion
FROM Pedidos p
INNER JOIN PedidoArticulo pa ON (p.nroPedido = pa.nroPedido)
INNER JOIN Articulos a ON (pa.codigoArticulo = a.codigoArticulo)
WHERE (p.fechaEnvio = '2023-11-07')
ORDER BY pa.codigoArticulo, p.nroPedido;