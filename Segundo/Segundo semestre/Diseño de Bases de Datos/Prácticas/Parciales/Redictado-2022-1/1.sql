/*

Especialista = (matricula, nombre, apellido, domicilio)
ObraSocial = (nombre, descripcion)
Paciente = (DNI, nombre, apellido, domicilio, telefono)
Turno = (matricula (FK), DNI (FK), fecha, motivo, nombre (fk)?, observaciones?)

*/

-- Para los turnos del 26/06/2022 listar matrícula, nombre y apellido de los especialistas, DNI, nombre, apellido, teléfono de los pacientes involucrados, fecha del turno, nombre y descripción de la obra social.

SELECT e.matricula, e.nombre, e.apellido, p.DNI, p.nombre, p.apellido, p.telefono, t.fecha, o.nombre, o.descripcion
FROM Especialista e
INNER JOIN Turno t ON (e.matricula = t.matricula)
INNER JOIN Paciente p ON (t.DNI = p.DNI)
INNER JOIN ObraSocial o ON (t.nombre = o.nombre)
WHERE t.fecha = '2022-06-26'

/*

π Matricula, Especialista.nombre, Especialista.apellido, DNI, Paciente.nombre, Paciente.apellido, telefono, fecha, ObraSocial.nombre, descripcion
σ ((fecha = '26/06/2022') ^ (Especialista.matricula = Turno.matricula) ^ (Paciente.DNI = Turno.DNI) ^ (ObraSocial.nombre = Turno.nombre) (Especialista x Turno x Paciente x ObraSocial))

*/