> [!CAUTION]
> Este recorrido sólo aplica para la práctica. Vemos una versión más resumida de cómo es el manejo real y nos salteamos varios agentes.

1. El MUA realiza una consulta DNS mediante el puerto 53 a su servidor DNS local  por el registro A de su servidor MX configurado (MTA).
2. Le envía el correo a su MTA mediante el protocolo SMTP por el puerto 25.
3. El MTA realiza una consulta DNS mediante el puerto 53  a su servidor DNS local por el registro MX del dominio del destinatario. A su vez, le envía el registro A (IP del MX).
4. El MTA le envía al MTA destinatario el correo electrónico mediante SMTP utilizando el puerto 25.
5. El MUA utiliza el protocolo POP o IMAP para acceder a los correos almacenados en su MTA.
