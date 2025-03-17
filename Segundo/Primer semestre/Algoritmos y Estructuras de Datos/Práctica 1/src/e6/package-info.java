package e6;


/* Análisis de las estructuras de listas provistas por la API de Java.
a. ¿En qué casos ArrayList ofrece un mejor rendimiento que LinkedList?
b. ¿Cuándo LinkedList puede ser más eficiente que ArrayList?
c. ¿Qué diferencia encuentra en el uso de la memoria en ArrayList y LinkedList?
d. ¿En qué casos sería preferible usar un ArrayList o un LinkedList? */

/*

a) ArrayList es mejor en los casos que se quiere almacenar información de manera ordenada y se
sabe como acceder de forma directa mediante sus índices

b) En la gran mayoría de los casos una ArrayList es mejor debido a que es más simple su
manipulación. Por ejemplo, al eliminar un elemento, solo se deben reenlazar los datos,
mientras que una ArrayList debe hacer los corrimientos necesarios y eliminar de memoria
el espacio.

c) ArrayList almacena sus datos de forma contínua, mientras que la LinkedList tiene todo
disperso en memoria y utiliza punteros.
También, es posible asignarle un tamaño al ArrayList y terminar usando menos, de esta
forma, se pierde memoria que queda inutilizada, a menos que se achique el Array.
También, el ArrayList debe crear antes de tiempo todos los objetos necesarios que almacena.

d) Diría que una ArrayList es mejor para almacenar pocos datos y poder accederlos directamente
con el índice. Mientras que una LinkedList es mejor para grandes cantidades pero perdiendo
la capacidad de acceder directamente.

*/