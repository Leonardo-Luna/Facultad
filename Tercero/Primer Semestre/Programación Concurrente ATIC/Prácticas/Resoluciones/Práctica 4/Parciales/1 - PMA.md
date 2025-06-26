### Resolver con PMA el siguiente problema. En una oficina hay 3 empleados y P personas que van para ser atendidas para realizar un trámite. Cuando una persona llega espera hasta ser atendido por cualquiera de los empleados, le indica el trámite a realizar y espera a que le den el resultado. Los empleados atienden las solicitudes en orden de llegada; si no hay personas esperando, durante 5 minutos resuelven trámites pendientes (simular el proceso de resolver trámites pendientes por medio de un delay). Nota: No generar demora innecesaria; cada persona hace sólo un pedido y termina; los empleados no necesitan terminar su ejecución.

```ada
chan tramite(int);
chan resultado[P](Resultado);
chan datos[3](string);
chan solicitud(int);
chan listo(int);
chan atender[P](int);

process Empleado[id: 0..2] {
    string datos;
    int persona;
    while(true) {
        send listo(id);
        receive tramite(persona);
        if(persona > -1) {
            send atender[persona](id);
            receive datos[id](datos);
            Resolucion r = resolverTramite();
            send resultado[persona](r);
        }
        else {
            delay(5 minutos);
        }
    }
}

process Persona[id: 0..P-1] {
    string tramite, resultado;
    int empleado;

    send solicitud(id);
    receive atender[id](empleado);
    send datos[empleado](tramite);
    receive resultado[id](resultado);
}

process Admin {
    int empleado, persona;
    Solicitud s;
    
    while(true) {
        receive listo(empleado);
        if(!empty(solicitud)) {
            receive solicitud(persona);
        }
        else {
            persona = -1;
        }
        send tramite[empleado](s);
    }
}
```