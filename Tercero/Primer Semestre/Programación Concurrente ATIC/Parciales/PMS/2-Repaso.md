>Resolver con PMS el siguiente problema. Simular la atención de una estación de servicio con un único surtidor que tiene un empleado que atiende a los N clientes de acuerdo al orden de llegada. Cada cliente espera hasta que el empleado lo atienda y le indica qué y cuánto cargar; espera hasta que termina de cargarle combustible y se retira.
>
>**Nota:** cada cliente carga combustible sólo una vez; todos los procesos deben terminar.

```ada
process Empleado {
    int idC;
    string tipo;

    for (int i = 0; i < N; i++) {
        Administraodr ? atender(idC);

        Cliente[idC] ! atiende();
        Cliente[idC] ? pedir(tipo);
        # Cargar combustible
        Cliente[idc] ! esperar();
        Cliente[idC] ! salir(); # Avisa que se puede ir
    }

    Administrador ! finalizar();
}

process Cliente[id: 1..N] {
    int id;
    string tipo = getTipo();

    Administrador ! llegue(id);

    Empleado ? atiende();
    Empleado ! pedir(tipo);
    Empleado ? esperar();
    Empleado ? salir();

    # Se retira
}

process Administrador {
    Queue q;
    bool seguir = true;
    int id;

    while(seguir) {
        if Cliente[*] llegue(id) -> q.push(id);
        □ (!empty(q)); Empleado ! atender(q.pop());
        □ Empleado ? finalizar() -> seguir = false;
    }
}
```