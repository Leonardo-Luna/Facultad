/*

Localidad = (codigoPostal, nombreL, descripcion, #habitantes)
Arbol = (nroArbol, especie, años, calle, nro, codigoPostal(fk))
Podador = (DNI, nombre, apellido, telefono, fnac, codigoPostalVive(fk))
Poda = (codPoda, fecha, DNI(fk), nroArbol(fk))

*/

/*

Reportar especie, años, calle, número y localidad de árboles que fueron podados durante 2022 y no fueron podados durante 2023.

*/

SELECT DISTINCT a.especie, a.años, a.calle, a.nro, l.nombreL
FROM Arbol a
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
INNER JOIN Poda p ON (a.nroArbol = p.nroArbol)
WHERE YEAR(p.fecha) = 2022 AND NOT EXISTS (
    SELECT DISTINCT a2.especie, a2.años, a2.calle, a2.nro, l2.nombreL
    FROM Arbol a2
    INNER JOIN Localidad l2 ON (a2.codigoPostal = l2.codigoPostal)
    INNER JOIN Poda p2 ON (a2.nroArbol = p2.nroArbol)
    WHERE YEAR(p2.fecha) = 2023 AND a2.nroArbol = a.nroArbol
);