/*

Técnico = (codTec, nombre, especialidad) // técnicos
Repuesto = (codRep, nombre, stock, precio) // repuestos
RepuestoReparacion = (nroReparac (fk), codRep (fk), cantidad, precio)
Reparación (nroReparac, codTec (fk), precio_total, fecha)

*/

/*

Listar el nombre y especialidad de técnicos que no participaron en ninguna repación. Ordenar por nombre ascendentemente.

*/

SELECT DISTINCT t.nombre, t.especialidad
FROM Técnico t
INNER JOIN Reparación r ON (t.codTec = r.codTec)

EXCEPT

SELECT DISTINCT t2.nombre, t2.especialidad
FROM Técnico t2
INNER JOIN Reparacion r2 ON (t2.codTec = r2.codTec)
WHERE t2.codTec = t.codTec;