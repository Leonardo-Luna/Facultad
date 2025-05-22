**SYN** - Synchronize. Lo envía cada parte una vez para iniciar la conexión. incrementa en 1 el número de secuencia.

**ACK** - Acknowledgement. Se envía para advertir de la recepción de información hasta el mensaje con número de secuencia coincidente (Go-Back-N por defecto. En la práctica usamos ese).

**FIN** - Finish. Lo envía cada parte una vez para finalizar la conexión. Incrementa en 1 el número de secuencia.

**RST** - Reset. Lo envía un host para finalizar abruptamente una conexión TCP.

**SEQ** - Sequence. Número de identificación del último dato enviado por una de las parte de una conexión TCP.