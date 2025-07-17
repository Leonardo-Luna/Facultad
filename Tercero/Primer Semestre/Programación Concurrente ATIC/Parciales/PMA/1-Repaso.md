>Resolver con PMA el siguiente problema. En una oficina hay 3 empleados y P personas que van a ser atendidas para realizar un trámite. Cuando una persona llega, espera hasta ser atendido por cualquiera de los empleados, le indica el trámite a realizar y espera a que le den el resultado. Los empleados atienden las solicitudes en orden de llegada; si no hay personas esperando, durante 5 minutos resuelven trámites pendientes (simular el proceso de resulver trámites pendientes por medio de un delay).
>
>**Nota:** no generar demora innecesaria; cada persona hace sólo un pedido y termina; los empleados no necesitan terminar su ejecución.

```ada
chan libre(int);
chan resultado[P](Resultado);
chan atender[3](int, Tramite);
chan atiende(int);

process Administrador {
    int persona;
    Tramite t; 
    int idE;

    while(true) {
        receive libre(idE);

        if(!empty(llegue)) {
            receive llegue(persona, t);
        }
        else {
            persona = -1;
            t = -1;
        }
        send atender[idE](persona, t);
    }
}

process Empleado[id: 1..3] {

    while(true) {
        send libre(id);

        receive atender[id](idP, t);

        if(t != -1) {
            Resultado r = resolver(t);
            send resultado[idP](r);
        }
        else {
            delay(5 minutos);
        }
    }
}

process Persona[id: 1..P] {
    Tramite t = generarTramite();
    int idE; 
    Resultado r;

    send llegue(id, t);
    receive atiende(empleado); # Qué tan incorrecto sería que le mande la id, una vez que sabe quien lo atiende, le mande a ese específico el trámite? Creo que es mejor

    receive resultado[id](r); 
}
```