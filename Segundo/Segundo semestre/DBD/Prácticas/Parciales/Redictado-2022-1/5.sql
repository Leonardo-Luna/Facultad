/*

Especialista = (matricula, nombre, apellido, domicilio)
ObraSocial = (nombre, descripcion)
Paciente = (DNI, nombre, apellido, domicilio, telefono)
Turno = (matricula (FK), DNI (FK), fecha, motivo, nombre (fk)?, observaciones?)

*/

-- Listar para cada especialista la cantidad de turnos en el 2022.

SELECT e.matricula, e.nombre, e.apellido, COUNT(*)
FROM Especialista e 
LEFT JOIN Turno t ON (e.matricula = t.matricula)
WHERE YEAR(t.fecha) = 2022
GROUP BY e.matricula, e.nombre, e.apellido;