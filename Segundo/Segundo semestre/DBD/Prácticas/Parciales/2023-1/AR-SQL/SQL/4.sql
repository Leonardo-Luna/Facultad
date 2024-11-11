/**

Listar apellido, nombre de cliente y número de pedido para los pedidos que tengan más de un remito.

**/

SELECT c.apellido, c.nombre, p.nroPedido
FROM Cliente c
INNER JOIN Pedidos p ON (c.nroClte = p.nroClte)
INNER JOIN Remitos r ON (p.nroPedido = r.nroPedido)
GROUP BY c.apellido, c.nombre, p.nroPedido
HAVING COUNT(DISTINCT r.nroRemito) > 1;