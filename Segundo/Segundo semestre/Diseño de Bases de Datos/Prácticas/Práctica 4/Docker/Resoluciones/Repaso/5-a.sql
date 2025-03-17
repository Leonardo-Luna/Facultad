/*

AGENCIA = (RAZON_SOCIAL, dirección, telef, e-mail)
CIUDAD = (CODIGOPOSTAL, nombreCiudad, añoCreación)
CLIENTE = (DNI, nombre, apellido, teléfono, dirección)
VIAJE = (FECHA, HORA, DNI (fk), cpOrigen(fk), cpDestino(fk), razon_social(fk), descripcion)

*/

/*

Listar razón social, dirección y teléfono de agencias que realizaron viajes desde la ciudad de 'La Plata' (origen) y que el cliente tenga apellido 'Roma'. Ordenar por razón social y luego por teléfono.

*/

SELECT a.razon_social, a.nombre, a.telef
FROM Agencia a
INNER JOIN Viaje v ON (a.razon_social = v.razon_social)
INNER JOIN Ciudad c ON (v.cpOrigen = c.codigopostal)
INNER JOIN Cliente cte ON (v.DNI = cte.DNI)
WHERE c.nombreCiudad = 'La Plata' AND cte.apellido = 'Roma'
ORDER BY a.razon_social, a.telef;