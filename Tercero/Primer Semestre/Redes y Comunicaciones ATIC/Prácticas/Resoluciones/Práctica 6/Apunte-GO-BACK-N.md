Apuntecito sobe Go-Back-N porque lo mencioné y me lo mencionaron pero nunca supe ni pregunté lo que era 🤠

Go-Back-N es un protocolo de retransmisión y repetición (ARQ (Automatic Request)) que se utiliza para asegurar la entrega fiable de datos en redes con ruido o sin pérdidas de paquetes. Permite que un emisor envíe múltiples segmentos de datos sin esperar una confirmación (ACK) por cada una, lo que mejora la eficiencia en comparación con un protocolo como Stop-and-Wait.

Características principales: 

- **Ventana deslizante del emisor:** El emisor mantiene una "ventana" de tamaño N para los segmentos que ha enviado y para las cuales aún no ha recibido un ACK. N es el tamaño de la ventana. <s>Esto significa que puede tener hasta N segmentos pendientes de confirmación en cualquier momento.</s> Significa que tiene N espacio para almacenar la información que se le mande. No depende de la cantidad de segmentos sino de la longitud de estos.

- **Numeración de secuencias:** Cada segmento de datos tiene un número de secuencia único.

- **ACK acumulativo:** El receptor envía confirmaciones acumulativas. Un ACK con número K significa que el receptor ha recibido correctamente todas los segmentos hasta la K-1 (o hasta K, depende la implementación pero es la misma mierda, el concepto es que es un conjunto de segmentos).

- **Retransmisión en caso de pérdida/error (lo importante):**

    - Si el emisor no recibe un ACK para el segmento K dentro de un tiempo de espera (timeout), asume que el segmento K (o su ACK) se perdió.

    - Cuando esto ocurre, el emisor no solo retransmite el segmento K, sino todas los segmentos desde la K en adelante que ya había enviado. De ahí el nombre "Go-Back-N" (volver N segmentos o al segmento N que causó problemas).

- **Buffer del receptor:** El receptor no necesita un gran buffer. Solo acepta los segmentos en el orden correcto. Si recibe un segmento K+1 cuando esperaba la K, la descarta y sigue esperando la K. Esto simplifica la lógica del receptor, pero puede llevar a retransmisiones innecesarias si muchos segmentos se reciben fuera de orden.

**Funcionalidad simplificada 🤠 (quiero dejar la materia):**

> - Emisor > envía los segmentos [0, 1, 2, N-1]
> - Receptor:
>
>    - Si recibe el segmento 0 > envía ACK 1
>    - Si recibe el segmento 1, envía ACK 2
>    - Let's suppose que el segmento 2 se pierde, lo cual causa que el receptor no la reciba 🤓
>    - El receptor recibe el segmento 3 (en este ejemplo representaría N (N = 3)). Como esperaba el 2 y recibió el 3, lo descarta y **NO** lo guarda.
>    - El receptor sigue enviando ACK 2 (confirmando que espera la 2).
>
> - Emisor:
>
>    - El emisor sigue enviando segmentos (otros, [4, 5, ...])
>    - Cuando el temporizador para el segmento 2 expira y NO haya recibido ACK 3, el emisor vuelve al segmento 2 y retransmite [2, 3, 4, 5, ...] (todos los de su ventana o que envió después de la última confirmación)
>
> - Receptor > try catch **finally** (jaja estoy re quemado) la acepta y después puede aceptar los segmentos [3, 4, 5, ...] si los recibe correctamente después de la retransmisión.

Fin del ejemplo 🤟 

**<u>VENTAJAS</u>**

- Es más eficiente que Stop-and-Wait, ya que el emisor puede enviar datos continuamente.
- Lógica simple para el receptor, que no necesita reordenar o almacenar segmentos fuera de secuencia.

**<u>DESVENTAJAS</u>**

Puede llevar a retransmisiones redundantes de segmentos que ya fueron recibidas correctamente pero que estaban fuera de orden y fueron descartadas por el receptor. Esto reduce la eficiente del ancho de banda en redes con altas tasas de error o latencias elevadas.

Es mucho más simple que Selective Repeat (el que hcie una biblia para explicar), pero menos eficiente en entornos de red donde las pérdidas de paquetes son frecuentes o los paquetes llegan muy desordenados (Selective Repeat permitía almacenar los paquetes en el buffer por más que no sea el esperado, para una mayor eficiente (asumo)).