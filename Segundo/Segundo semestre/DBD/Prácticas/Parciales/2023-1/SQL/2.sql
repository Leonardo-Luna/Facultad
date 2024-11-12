/**

Listar apellido, nombre, domicilio y teléfono de clientes más número de pedido,
fecha de envío y número de remito, correspondientes a remitos con fecha 07-11-23

**/

SELECT c.apellido, c.nombre, c.domicilio, c.tel, p.nroPedido, p.fechaEnvio, r.nroRemito
FROM Cliente c
INNER JOIN Pedidos p ON (c.nroClte = p.nroClte)
INNER JOIN Remitos r ON (p.nroPedido = r.nroPedido)
WHERE (r.fechaRemito = '2023-11-07');