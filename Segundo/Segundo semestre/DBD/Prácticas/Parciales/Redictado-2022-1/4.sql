/*

Especialista = (matricula, nombre, apellido, domicilio)
ObraSocial = (nombre, descripcion)
Paciente = (DNI, nombre, apellido, domicilio, telefono)
Turno = (matricula (FK), DNI (FK), fecha, motivo, nombre (fk)?, observaciones?)

*/

-- Listar los pacientes que se atendieron por la obra social 'OSDE' y también 'IOMA'

SELECT p.DNI, p.nombre, p.apellido
FROM Paciente p
INNER JOIN Turno t ON (p.DNI = t.DNI)
WHERE t.nombre = 'OSDE'

INTERSECT

SELECT p2.DNI, p2.nombre, p2.apellido
FROM Paciente p2
INNER JOIN Turno t2 ON (p2.DNI = t2.DNI)
WHERE t2.nombre = 'IOMA';

/*

π DNI, Paciente.nombre, Paciente.apellido σ (Turno.nombre = 'OSDE' (Paciente |x| Turno))
                                        ∩
π DNI, Paciente.nombre, Paciente.apellido σ (Turno.nombre = 'IOMA' (Paciente |x| Turno))

*/