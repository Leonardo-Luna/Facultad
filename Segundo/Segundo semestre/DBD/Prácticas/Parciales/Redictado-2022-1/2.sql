/*

Especialista = (matricula, nombre, apellido, domicilio)
ObraSocial = (nombre, descripcion)
Paciente = (DNI, nombre, apellido, domicilio, telefono)
Turno = (matricula (FK), DNI (FK), fecha, motivo, nombre (fk)?, observaciones?)

*/

-- Listar los datos de los pacientes que se atendieron con todos los especialistas.

SELECT p.DNI, p.nombre, p.apellido
FROM Paciente p
WHERE NOT EXISTS (
    SELECT *
    FROM Especialista
    WHERE NOT EXISTS (
        SELECT *
        FROM Turno t
        WHERE t.matricula = e.matricula AND t.DNI = p.DNI
    )
);

/*

π DNI, Paciente.nombre, Paciente.apellido (Paciente |×| Turno)
                        %
                π Matricula (Especialista)
                
*/