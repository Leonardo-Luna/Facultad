/**

Listar número de pedido junto con la cantidad de artículos distintos remitidos y el monto total
del pedido para los pedidos de octubre de 2023.

**/

SELECT p.nroPedido, count(distinct ra.cantRemito), 