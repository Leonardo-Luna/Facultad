## Headers de Respuesta en `dig`

Cuando utilizás el comando `dig`, la sección que comienza con `->>HEADER<<-` proporciona información sobre el encabezado del paquete de respuesta DNS.

```bash
redes@debian:~$ dig www.redes.unlp.edu.ar

; <<>> DiG 9.16.27-Debian <<>> www.redes.unlp.edu.ar
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8607
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: 9dca5537bb557fe70100000067fd84650ac939d876faaa2c (good)
;; QUESTION SECTION:
;www.redes.unlp.edu.ar.		IN	A

;; ANSWER SECTION:
www.redes.unlp.edu.ar.	300	IN	A	172.28.0.50

;; Query time: 0 msec
;; SERVER: 172.28.0.29#53(172.28.0.29)
;; WHEN: Mon Apr 14 18:55:49 -03 2025
;; MSG SIZE  rcvd: 94
```

Flags y campos más comunes:

* **`opcode`**: Indica el tipo de consulta que se realizó. Los valores comunes incluyen:
    * `QUERY`: Una consulta estándar.
    * `IQUERY`: Una consulta inversa (obsoleta en la práctica).
    * `STATUS`: Una consulta de estado del servidor.
* **`status`**: Muestra el código de estado de la respuesta del servidor DNS. Algunos valores comunes son:
    * `NOERROR`: La consulta se completó con éxito.
    * `FORMERR`: El servidor no pudo interpretar el formato de la consulta.
    * `SERVFAIL`: El servidor tuvo un fallo interno al intentar procesar la consulta.
    * `NXDOMAIN`: El nombre de dominio consultado no existe.
    * `NOTIMP`: El servidor no implementa el tipo de consulta solicitado.
    * `REFUSED`: El servidor rechazó responder a la consulta por razones de política o seguridad.
* **`id`**: Un identificador único para el par de consulta y respuesta. Se utiliza para hacer coincidir las respuestas con las consultas.
* **`flags`**: Un conjunto de indicadores de un bit que proporcionan información adicional sobre la respuesta. Las flags más comunes son:
    * **`qr` (Query Response)**: Indica si el mensaje es una consulta (`0`) o una respuesta (`1`). En los headers de respuesta, este valor siempre será `1`.
    * **`aa` (Authoritative Answer)**: Indica si el servidor de nombres que respondió es la autoridad para el dominio consultado.
    * **`tc` (Truncated)**: Indica si el mensaje fue truncado debido a su tamaño (generalmente cuando se usa UDP).
    * **`rd` (Recursion Desired)**: Indica si el cliente (tu `dig`) solicitó recursión.
    * **`ra` (Recursion Available)**: Indica si el servidor de nombres soporta consultas recursivas.
    * **`ad` (Authenticated Data)**: (Relacionado con DNSSEC) Indica que los datos en la sección de respuesta han sido autenticados por el servidor de nombres mediante DNSSEC.
    * **`cd` (Checking Disabled)**: (Relacionado con DNSSEC) Indica que el cliente no desea que el servidor realice la validación DNSSEC.
* **`QUERY`**: El número de preguntas en la sección de preguntas. Normalmente es `1`.
* **`ANSWER`**: El número de registros de respuesta en la sección de respuestas.
* **`AUTHORITY`**: El número de registros de autoridad en la sección de autoridad (normalmente registros NS que delegan la zona).
* **`ADDITIONAL`**: El número de registros adicionales en la sección adicional (información extra que puede ser útil).

**Ejemplo de un header de respuesta:**

## Parámetros Comunes del Comando `dig`

Aquí tienes los parámetros y opciones más comunes para el comando `dig`, incluyendo cómo solicitar un registro específico:

**Parámetros Básicos:**

* `dig <dominio>`: Realiza una consulta para el registro A (dirección IPv4) del dominio especificado.
    ```bash
    dig www.google.com
    ```

* `dig <dominio> <tipo>`: Realiza una consulta para un tipo de registro específico del dominio. Los tipos más comunes son:
    * `A`: Dirección IPv4.
        ```bash
        dig www.google.com A
        ```
    * `AAAA`: Dirección IPv6.
        ```bash
        dig www.google.com AAAA
        ```
    * `MX`: Mail Exchange (servidores de correo).
        ```bash
        dig google.com MX
        ```
    * `NS`: Name Server (servidores de nombres autoritativos).
        ```bash
        dig unlp.edu.ar NS
        ```
    * `CNAME`: Canonical Name (alias de un nombre de dominio a otro).
        ```bash
        dig redes.unlp.edu.ar CNAME
        ```
    * `TXT`: Text (registros de texto, a menudo usados para verificación).
        ```bash
        dig example.com TXT
        ```
    * `SOA`: Start of Authority (información administrativa sobre la zona DNS).
        ```bash
        dig unlp.edu.ar SOA
        ```
    * `ANY`: Consulta todos los tipos de registros (generalmente no recomendado para uso regular).
        ```bash
        dig google.com ANY
        ```

* `dig @<servidor> <dominio>`: Realiza la consulta utilizando un servidor DNS específico en lugar del configurado en tu sistema.
    ```bash
    dig @8.8.8.8 www.google.com
    dig @1.1.1.1 redes.unlp.edu.ar MX
    ```

**Opciones Comunes:**

* `+short`: Proporciona una salida concisa, mostrando generalmente solo la dirección IP o el valor del registro consultado.
    ```bash
    dig www.google.com +short
    dig google.com MX +short
    ```

* `+trace`: Traza la ruta de la resolución DNS, mostrando cada servidor consultado.
    ```bash
    dig www.google.com +trace
    ```

* `+noall`: No muestra ninguna sección de la salida por defecto.
* `+answer`: Muestra solo la sección de la respuesta.
* `+authority`: Muestra solo la sección de la autoridad.
* `+additional`: Muestra solo la sección adicional.
    ```bash
    dig www.google.com +noall +answer
    dig google.com MX +noall +answer +authority
    ```## Parámetros Comunes del Comando `dig`

Aquí tienes los parámetros y opciones más comunes para el comando `dig`, incluyendo cómo solicitar un registro específico:

**Parámetros Básicos:**

* `dig <dominio>`: Realiza una consulta para el registro A (dirección IPv4) del dominio especificado.
    ```bash
    dig www.google.com
    ```

* `dig <dominio> <tipo>`: Realiza una consulta para un tipo de registro específico del dominio. Los tipos más comunes son:
    * `A`: Dirección IPv4.
        ```bash
        dig www.google.com A
        ```
    * `AAAA`: Dirección IPv6.
        ```bash
        dig www.google.com AAAA
        ```
    * `MX`: Mail Exchange (servidores de correo).
        ```bash
        dig google.com MX
        ```
    * `NS`: Name Server (servidores de nombres autoritativos).
        ```bash
        dig unlp.edu.ar NS
        ```
    * `CNAME`: Canonical Name (alias de un nombre de dominio a otro).
        ```bash
        dig redes.unlp.edu.ar CNAME
        ```
    * `TXT`: Text (registros de texto, a menudo usados para verificación).
        ```bash
        dig example.com TXT
        ```
    * `SOA`: Start of Authority (información administrativa sobre la zona DNS).
        ```bash
        dig unlp.edu.ar SOA
        ```
    * `ANY`: Consulta todos los tipos de registros (generalmente no recomendado para uso regular).
        ```bash
        dig google.com ANY
        ```

* `dig @<servidor> <dominio>`: Realiza la consulta utilizando un servidor DNS específico en lugar del configurado en tu sistema.
    ```bash
    dig @8.8.8.8 www.google.com
    dig @1.1.1.1 redes.unlp.edu.ar MX
    ```

**Opciones Comunes:**

* `+short`: Proporciona una salida concisa, mostrando generalmente solo la dirección IP o el valor del registro consultado.
    ```bash
    dig www.google.com +short
    dig google.com MX +short
    ```

* `+trace`: Traza la ruta de la resolución DNS, mostrando cada servidor consultado.
    ```bash
    dig www.google.com +trace
    ```

* `+noall`: No muestra ninguna sección de la salida por defecto.
* `+answer`: Muestra solo la sección de la respuesta.
* `+authority`: Muestra solo la sección de la autoridad.
* `+additional`: Muestra solo la sección adicional.
    ```bash
    dig www.google.com +noall +answer
    dig google.com MX +noall +answer +authority
    ```

* `+nocmd`: Oculta la línea de comando de `dig` en la salida.
* `+nocomments`: Oculta las líneas de comentario en la salida.
* `+nostats`: Oculta la sección de estadísticas de la consulta.
    ```bash
    dig www.google.com +nocmd +noall +answer +nocomments +nostats
    ```

* `-x <dirección_ip>`: Realiza una búsqueda inversa de DNS (PTR record).
    ```bash
    dig -x 8.8.8.8
    ```

Para una lista completa de opciones, consulta la página del manual: `man dig`.

* `+nocmd`: Oculta la línea de comando de `dig` en la salida.
* `+nocomments`: Oculta las líneas de comentario en la salida.
* `+nostats`: Oculta la sección de estadísticas de la consulta.
    ```bash
    dig www.google.com +nocmd +noall +answer +nocomments +nostats
    ```

* `-x <dirección_ip>`: Realiza una búsqueda inversa de DNS (PTR record).
    ```bash
    dig -x 8.8.8.8
    ```

Para una lista completa de opciones, consulta la página del manual: `man dig`.