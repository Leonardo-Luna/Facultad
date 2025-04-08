### Ejercicio de parcial

```bash
curl -X ?? www.redes.unlp.edu.ar/??
```

```bash
> HEAD /metodos/ HTTP/??
> Host: www.redes.unlp.edu.ar
> User-Agent: curl/7.54.0

< HTTP/?? 200 OK
< Server: nginx/1.4.6 (Ubuntu)
< Date: Wed, 31 Jan 2018 22:22:22 GMT
< Last-Modified: Sat, 20 Jan 2018 13:02:41 GMT
< Content-Type: text/html; charset=UTF-8
< Connection: close
```

<b>a)</b> ¿Qué versión de HTTP podría estar utilizando el servidor?

Podría estar utilizando tanto HTTP 1.1 ya que se está enviando la cabecera Host por defecto, que pasó a ser obligatoria en esta versión.

<b>Corrección del ayudante</b>: El ejercicio en sí es confuso y nadie sabe la respuesta real. Pongas lo que pongas va a estar bien porque ni te dan el comando compelto, podrías interpretar que es HTTP 1.0 o 1.1 por varios motivos.

<b>b)</b> ¿Qué método está utilizando? Dicho método, ¿retorna el recurso completo solicitado?

Se está utilizando el método HEAD, como se puede ver en la primera línea de la respuesta, el parámetro utilizado quedaría ```curl -X HEAD ...```.

Teóricamente no retorna el recurso completo, solo se están pidiendo los headers, más no el body.

<b>c)</b> ¿Cuál es el recurso solicitado?

El directorio /metodos/, por lo tanto el comando completo quedaría algo por el estilo:

```bash
curl -X HEAD www.redes.unlp.edu.ar/metodos/
```

<b>d)</b> ¿El método funcionó correctamente?

Sí, sólo se devolvieron headers y el código de respuesta fue 200 OK.

<b>e)</b> Si la solicitud hubiese llevado un encabezado que diga: ```If-Modified-Since: Sat, 20 Jan 2018 13:02:41 GMT```
¿Cuál hubiera sido la respuesta del servidor web? ¿Qué habría hecho el navegador en este caso?

La respuesta que devuelve es 304 Not Modified en el código de respuesta.
El navegador devuelve un body vacío.
