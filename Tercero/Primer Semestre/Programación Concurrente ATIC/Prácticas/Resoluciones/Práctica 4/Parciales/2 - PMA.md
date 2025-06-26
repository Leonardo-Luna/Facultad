### Resolver con PMA el siguiente problema. En un negocio hay 5 empleados que atienden a N personas que van a pedir un presupuesto, de acuerdo al orden de llegada. Cuando el cliente sabe qué empleado lo va a atender, le entrega el listado de productos que necesita, y luego el empleado le entrega el presupuesto del mismo. Nota: Maximizar la concurrencia. Existe una función HacerPresupuesto(lista) que simula la elaboración del presupuesto por parte de los empleados.

```ada
chan atender[N](id);
chan armarPresupuesto(int);
chan presupuesto[N](Presupuesto);
chan darListado[5](Listado);

process Empleado[id: 0..4] {
    int cId;
    Lista l;
    Presupuesto p;
    while(true) {
        receive armarPresupuesto(cId);
        send atender[cId](id);
        receive darListado[id](l);
        p = HacerPresupuesto(l);
        send presupuesto[cId](p);
    }
}

process Persona[id: 0..N-1] {
    int eId;
    Lista l; # Se dispone
    Presupuesto p;
    send armarPresupuesto(cId);
    receive atender[id](eId);
    send darListado[eId](l);
    receive presupuesto[id](p);
}
```