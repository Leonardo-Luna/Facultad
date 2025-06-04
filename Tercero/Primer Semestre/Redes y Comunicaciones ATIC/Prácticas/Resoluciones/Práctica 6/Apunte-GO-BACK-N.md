Apuntecito sobe Go-Back-N porque lo mencioné y me lo mencionaron pero nunca supe ni pregunté lo que era 🤠

Go-Back-N es un protocolo de retransmisión y repetición (ARQ) que se utiliza para asegurar la entrega fiable de datos en redes con ruido o sin pérdidas de paquetes. Permite que un emisor envíe múltiples tramas (o paquetes) de datos sin esperar una confirmación (ACK) por cada una, lo que mejora la eficiencia en comparación con un protocolo como Stop-and-Wait.

Características principales:

- **Ventana deslizante del emisor:** El emisor mantiene una "ventana" de tamaño N para las tramas que ha enviado y para las cuales aún no ha recibido un ACK. N es el tamaño de la ventana. Esto significa que puede tener hasta N tramas pendientes de confirmación en cualquier momento.

- **Numeración de secuencias:** Cada trama de datos tiene un número de secuencia único.

- **ACK acumulativo:** El receptor envía confirmaciones acumulativas. Un ACK con número K significa que el receptor ha recibido correctamente todas las tramas hasta la K-1 (o hasta K, depende la implementación pero es la misma mierda, el concepto es que es un conjunto de tramas).

- **Retransmisión en caso de pérdida/error (lo importante):**

    - Si el emisor no recibe un ACK para la trama K dentro de un tiempo de espera (timeout), asume que la trama K (o su ACK) se perdió.

    - Cuando esto ocurre, el emisor no solo retransmite la trama K, sino todas las tramas desde la K en adelante que ya había enviado. De ahí el nombre "Go-Back-N" (volver N tramas o la trama N que causó problemas).

- **Buffer del receptor:** El receptor no necesita un gran buffer. Solo acepta las tramas en el orden correcto. Si recibe una trama K+1 cuando esperaba la K, la descarta y sigue esperando la K. Esto simplifica la lógica del receptor, pero puede llevar a retransmisiones innecesarias si muchas tramas se reciben fuera de orden.

**Funcionalidad simplificada 🤠 (quiero dejar la materia):**

> - Emisor > envía las tramas [0, 1, 2, N-1]
> - Receptor:
>
>    - Si recibe la trama 0 > envía ACK 1
>    - Si recibe la trama 1, envía ACK 2
>    - Let's suppose que la trama 2 se pierde, lo cual causa que el receptor no la reciba 🤓
>    - El receptor recibe la trama 3 (en este ejemplo representaría N (N = 3)). Como esperaba la 2 y recibió la 3, la descarta y **NO** la guarda.
>    - El receptor sigue enviando ACK 2 (confirmando que espera la 2).
>
> - Emisor:
>
>    - El emisor sigue enviando tramas (otras, [4, 5, ...])
>    - Cuando el temporizador para la trama 2 expira y NO hay recibido ACK 3, el emisor vuelve a la trama 2 y retransmite [2, 3, 4, 5, ...] (todas las de su ventana o que envió después de la última confirmación)
>
> - Receptor > try catch **finally** (jaja estoy re quemado) la acepta y después puede aceptar las tramas [3, 4, 5, ...] si las recibe correctamente después de la retransmisión.

Fin del ejemplo 🤟 

**<u>VENTAJAS</u>**

- Es más eficiente que Stop-and-Wait, ya que el emisor puede enviar datos continuamente.
- Lógica simple para el receptor, que no necesita reordenar o almacenar tramas fuera de secuencia.

**<u>DESVENTAJAS</u>**

Puede llevar a retransmisiones redundantes de tramas que ya fueron recibidas correctamente pero que estaban fuera de orden y fueron descartadas por el receptor. Esto reduce la eficiente del ancho de banda en redes con altas tasas de error o latencias elevadas.

Es mucho más simple que Selective Repeat (el que hcie una biblia para explicar), pero menos eficiente en entornos de red donde las pérdidas de paquetes son frecuentes o los paquetes llegan muy desordenados (Selective Repeat permitía almacenar los paquetes en el buffer por más que no sea el esperado, para una mayor eficiente (asumo)).