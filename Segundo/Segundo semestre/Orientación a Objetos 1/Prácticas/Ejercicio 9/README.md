#### a) ¿Por qué cree que este ejercicio se llama "Cuenta gon ganchos"?
- Se llama de esta manera debido a que los métodos se van enganchando (hooks). Un método "padre" tiene submétodos hooks que se pueden re-implementar (Override) para que el "padre" cumpla con la funcionalidad esperada.

#### b) En las implementaciones de los métodos extraer() y transferirACuenta() que se ven en el diagrama, ¿quién es this? ¿Puede decir de qué clase es this?
- "this" hace referencia a una instancia de la clase CajaDeAhorro o CuentaCorriente dentro de la clase Cuenta. (?)

#### c) ¿Por qué decidimos que los métodos puedeExtraer() y extraerSinControlar() tengan la visibilidad "protegido"?
- Para que no se puedan ejecutar desde fuera de la clase o sus sub-clases. Son métodos que sirven para controlar la lógica de las cuentas, por lo tanto no tendría sentido permitir el uso fuera de las mismas.

#### d) ¿Se puede transferir de una caja de ahorro a una cuenta corriente y viceversa? ¿por qué? ¡Pruébelo!
- Sí, se puede ya que ambas clases reciben una cuenta de tipo "Cuenta", que generaliza el tipo y ambas cuentan con los métodos necesarios (gracias a la herencia) para poder entender la secuencia de depósito.

#### e) ¿Cómo se declara en Java un método abstracto? ¿Es obligatorio implementarlo? ¿Qué dice el compilador de Java si una subclase no implementa un método abstracto que hereda?
- "public abstract [retorno] [nombre]", en la clase que se declara el método no se debe implementar, solo sirve como molde para sus subclases.

- Si no se implementa en la clase correspondiente, el compilador da el siguiente mensaje "The type CajaDeAhorro/CuentaCorriente must implement the inherited abstract method Cuenta.nombre()."
