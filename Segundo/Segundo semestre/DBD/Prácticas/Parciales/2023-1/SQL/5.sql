/**

Listar número de pedido junto con la cantidad de artículos distintos remitidos y el monto total
del pedido para los pedidos de octubre de 2023.

**/

SELECT p.nroPedido, count(distinct pa.codigoArticulo) as cantidad, sum(pa.cantPedido * a.precio) AS montoTotal
FROM Pedidos p
INNER JOIN PedidoArticulo pa ON (p.nroPedido = pa.nroPedido)
INNER JOIN Articulos a ON (pa.codigoArticulo = a.codigoArticulo)
WHERE (p.fechaPedido BETWEEN '2023-10-1' AND '2023-10-31')
GROUP BY p.nroPedido;