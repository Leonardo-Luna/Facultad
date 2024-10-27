-- Listar datos personales de clientes cuyo apellido comience con el string 'Pe'. Ordenar por DNI.

SELECT * FROM Cliente
WHERE (apellido LIKE 'Pe%')
ORDER BY DNI DESC;