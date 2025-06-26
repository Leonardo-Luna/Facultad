>[!note]
>En la muestra de parciales dijeron que además de explicar cada paso, se debe especificar sobre qué método o parte se está trabajando.

>[!warning]
>Las versiones resumidas son ayudas memotécnicas, aparentemente la cátedra pide el paso a paso punteado.

<hr>

- Form Template Method

    - Encontrar el método que es similar en todas las subclases y extraer sus partes en:
        - Métodos idénticos (misma firma y cuerpo en las subclases)
        - Métodos únicos (distinta firma y cuerpo)
    - Aplicar "Pull Up Method" para los métodos idénticos.
    - Aplicar "Rename Method" sobre los métodos únicos hasta que el método similar quede con cuerpo idéntico en las subclases.
    - Compilar y testear después de cada "rename".
    - Aplicar "Rename Method" sobre los métodos similares de las subclases (esqueleto).
    - Aplicar "Pull Up Method" sobre los métodos similares.
    - Definir métodos abstractos en la superclase por cada método único de las subclases.
    - Compilar y testear.

Buscar los métodos similares, pull up en esos, y rename para unificarlos, rename en los únicos (**no entendí el motivo**), y pull up a los únicos (?)..........

**La teoría en ningún momento menciona la idea de crear una superclase con estos métodos similares, saltaría por la ventana, pero vivo en planta baja**

<hr>

- Extract Adapter

**No está en la teoría, solo se menciona en el título pero no se dio**

<hr>

- Replace Implicit Tree with Composite

**No está en la teoría, solo se menciona en el título pero no se dio**

<hr>

- Replace Conditional Logic with Strategy

    - Crear una clase Strategy.
    - Aplicar "Move Method" para mover el cálculo con los condicionales del conexto al Strategy.
        - Definir una VI en el contexto para referencias al Strategy y un setter (constructor del contexto).
        - Dejar un método en el contexto que delegue.
        - Elegir los parámetros necesarios para pasar al Strategy.
        - Compilar y testear.
    - Aplicar "Extract Parameter" en el código del contexto que inicializa un Strategy concreto, para permitir a los clientes setear el Strategy.
        - Compilar y testear.
    - Aplicar "Replace Conditional with Polymorphism" en el método del Strategy.
    - Compilar y testear con distintas combinaciones de estrategias y contextos.

Crear una clase Strategy, aplicar "Move Method" sobre el if/switch, definir una VI de estrategia con su setter, un método donde se invoque (no sé, estrategia.ejecutar()) y definir los parámetros **necesarios**.
"Extract Parameter" en el código que inicializa la estrategia para permitir su seteo y aplicar herencia en los condicionales que se llevaron a la estrategia.

**Dato de color, en el libro de Refactoring no figura el "Extract Parameter", quién sabe a qué se refiere. Según la teoría es definir un parámetro en ese método (constructor en este caso)**

<hr>

- Replace State-Altering Conditionals with State

    - Aplicar "Replace Type-Code with Class" para crear una clase que será la superclase del State a partir de la VI que mantiene el estado.
    - Aplicar "Extract Superclass" para crear una subclase del State por cada uno de los estados de la clase contexto.
    - Por cada método de la clase contexto con condicionales que cambiar el valor del estado, aplicar "Move Method" hacia la superclase de State.
    - Por cada estado concreto, aplicar "Push Down Method" para mover de la superclase a esa subclase los métodos que producen una transición desde ese estado. Sacar la lógica de comprobación que ya no hace falta.
    - Dejar los métodos de cambio de estado como abstractos en la superclase o como métodos por defecto.

Aplicar "Replace Type-Code with Class" para la superclase State a partir de la VI del estado, aplicar "Extract Superclass" para crear una clase por cada posible estado, por cada método de la clase original que altera el estado, aplicar "Move Method" hacia la clase State, y por cada estado concreto aplicar "Push Down Method" para mover de la superclase a las subclase esos métodos que generan cambios en el comportamiento, finalmente dejar los métodos de cambio de estado en la clase State como abstractos o métodos por defecto.

Replace Type-Code With Class: Cuando una clase tiene un tipo numérico (dice así el libro) que no afecta el comportamiento, se puede delegar a una clase externa y setear una crear una referencia.

![alt text](image-1.png)

Crear una nueva clase para el Type-Code, modificar la implementación de la clase original para que use la nueva clase, editar las referencias a las VI o getters/setters por comportamiento de la nueva clase.

<hr>

- Move Embelishment to Decorator

    - Identificar la superclase (o interface) del objeto a decorar (clase Component del patrón). Si no existe, crearla.
    - Aplicar "Replace Conditional Logic with Polymorphism" (crea Decorator como subclase del decorado).

    **Si no alcanza con estos dos pasos:**

    - Aplicar "Replace Inheritance with Delegation" (Decorator delega en decorado como clase "hermana").
    - Aplicar "Extract Parameter" en decorator para asignar decorado.

Identificar el componente a decorar (sería como la hoja, el extremo), si no existe, se crea. Aplicar "Replace Conditional Logic with Polymorphism" para crear Decorators como subclase del decorado (acá es donde me pierde un toquesin, porque queda como una jerarquía rarísima).

Si no alcanza con eso (nunca alcanza, eso no es Decorator):

Aplicar "Replace Inheritance with Delegation" para que ¿...? y aplicar "Extract Parameter" en decorator para asignar decorado (wrappee?).

**Este no lo termino de entender, la realidad es que no queda algo siquiera similar al patrón Decorator**

<hr>

- Introduce Null Object

    - Crear el null object aplicando "Extract Subclass" sobre la clase que se quiere proteger del chequeo por null (clase origen). Alternativamente hacer que la nueva clase implemente la misma interface que la clase origen. Compilar.
    - Buscar un null check en el código cliente, es decir, código que invoque un método sobre una instancia de la clase origen si a misma no es null. Redefinir el método en la clase de null object para que implemente el comportamiento alternativo. Compilar.
    - Repetir el paso 2 para todos los null checks asociados a la clase origen.
    - Encontrar todos los lugares que pueden retornar null cuando se le pide una instancia de la clase origen. Inicializar con una instancia de null object lo antes posible. Compilar.
    - Para cada lugar elegido en el paso 4, eliminar los null checks asociados.

Crear un objecto Null Object aplicando "Extract Superclass" sobre la clase que se quiere proteger del chequeo null (origen). La clase del Null Object debe aplicar la misma interface que la clase origen, buscar un null check en el código cliente y redefinir el método en la clase de Null Object para que implemente el comportamiento alternativo.
Repetir hasta que se haya pasado por todos los checks.
Una vez hecho, encontrar todos los lugares que pueden retornar null cuando se le pide unaa instancia de la clase origen, ahí devolver una instancia de null object.
Repetir hasta que se hayan eliminado todos los checks.