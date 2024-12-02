/*

Especialista = (matricula, nombre, apellido, domicilio)
ObraSocial = (nombre, descripcion)
Paciente = (DNI, nombre, apellido, domicilio, telefono)
Turno = (matricula (FK), DNI (FK), fecha, motivo, nombre (fk)?, observaciones?)

*/

-- Listar los pacientes que se hayan atendido más de 5 veces en el año 2020.

SELECT p.DNI, p.nombre, p.apellido
FROM Paciente p
INNER JOIN Turno t ON (p.DNI = t.DNI)
WHERE YEAR(t.fecha) = 2020
GROUP BY p.DNI, p.nombre, p.apellido
HAVING COUNT(*) > 5;