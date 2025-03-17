/*

Especialista = (matricula, nombre, apellido, domicilio)
ObraSocial = (nombre, descripcion)
Paciente = (DNI, nombre, apellido, domicilio, telefono)
Turno = (matricula (FK), DNI (FK), fecha, motivo, nombre (fk)?, observaciones?)

*/

-- Listar los pacientes que se atendieron en el año 2021 pero no se atendieron en el año 2019.

SELECT p.DNI, p.nombre, p.apellido
FROM Paciente p
INNER JOIN Turno t ON (p.DNI = t.DNI)
WHERE YEAR(t.fecha) = 2021

EXCEPT

SELECT p2.DNI, p2.nombre, p2.apellido
FROM Paciente p2
INNER JOIN Turno t2 ON (p2.DNI = t2.DNI)
WHERE YEAR(t2.fecha) = 2019;

-----------------------------------------------------------

SELECT p.DNI, p.nombre, p.apellido
FROM Paciente p
INNER JOIN Turno t ON (p.DNI = t.DNI)
WHERE YEAR(t.fecha) = 2021 AND p.DNI NOT IN (
    SELECT DISTINCT t2.DNI
    FROM Turno t2
    WHERE YEAR(t2.fecha) = 2019
);

/*

π DNI, Paciente.nombre, Paciente.apellido σ (fecha >= '1/1/2021' v fecha <= '31/12/2021' (Paciente |x| Turno))
                                                -
π DNI, Paciente.nombre, Paciente.apellido σ (fecha >= '1/1/2019' v fecha <= '31/12/2019' (Paciente |x| Turno))

*/