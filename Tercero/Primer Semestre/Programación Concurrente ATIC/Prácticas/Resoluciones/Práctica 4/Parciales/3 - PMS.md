### Resolver con PMS el siguiente problema. En una carrera hay C corredores y 3 Coordinadores. Al llegar los corredores deben dirigirse a los coordinadores para que cualquiera de ellos le dé el número de "chaleco" con el que van a correr y luego se va. Los coordinadores atienden a los corredores de acuerdo al orden de llegada (cuando un coordinador está libre atiende al primer corredor que está esperando). Nota: Maximizar la concurrencia.

```ada
process Corredor[id: 0..C-1] {
    Admin ! llegue(id);
    Chaleco chaleco;
    Coordinador[*] ? darChaleco(chaleco);
}

process Coordinador[id: 0..2] {
    int c;
    Admin ! listo(id);
    Admin ? atender(c);
    Chaleco chaleco; # Se dispone
    Corredor[c] ! darChaleco(chaleco);
}

process Admin {
    Queue q;
    int id, coordinador;
    while(true) {
        if Corredor ? llegue(cliente) -> q.push(cliente);
        □ (!empty(q)); Coordinador ? listo(coordinador) -> Coordinador ! atender(q.pop());
    }
}
```