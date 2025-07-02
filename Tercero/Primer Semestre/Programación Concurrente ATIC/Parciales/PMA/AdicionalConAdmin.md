>Se debe modelar el funcionamiento de una casa de comida rápida, en la cual trabajan 2 cocineros y 3 vendedores, y que debe atender a C clientes. El modelado debe considerar que:
>
>- Cada cliente realiza un pedido y luego espera a que se lo entreguen.
>- Los pedidos que hacen los clientes son tomados por cualquiera de los vendedores y se lo pasan a los cocineros para que realicen el plato. Cuando no hay pedidos para atender, los vendedores aprovechan para reponer un pack de bebidas de la heladera (tardan entre 1 y 3 minutos para hacer esto).
>- Repetidamente cada cocinero toma un pedido pendiente dejado por los vendedores, lo cocina y se lo entrega directamente al cliente correspondiente.
>
>**Nota:** maximizar la concurrencia.

```ada
chan quienPide(int);
chan miPedido[C](Pedido);
chan comidaLista[C](Comida);
chan cocinarPara(int);
chan cocinar(Pedido);
chan armarPedido[3](int);
chan libre(int);

process Cliente[id: 0..C-1] {
    Pedido p = verMenuYArmarPedido,OjalaSePidaUnaHamburguesa();
    Comida c;

    send quienPide(id);
    send miPedido[id](p);

    receive comidaLista[id](c);
}

process Cocinero[id: 0..1] {
    while(true) {
        receive cocinarPara(cliente);
        receive cocinar(pedido);

        Comida c = p.prepararYEnvenenar();

        send comidaLista[cliente](pedido);
    }
}

process Vendedor[id: 0..2] {
    Pedido p;
    int cliente;

    while(true) {
        send libre(id);
        receive armarPedido[id](cliente); # Podría llamarse trabajar, para una mayor claridad. No siempre armará un pedido

        if(cliente == -1) {
            reponerPack(); # o delay(random(1,3 minutos));
        }
        else {
            receive miPedido[cliente](p);
            send cocinarPara(cliente);
            send cocinar(p);
        }
    }
}

process Admin {
    int empleado;
    int cliente;
    while(true) {
        receive libre(empleado);
        if(empty(quienPide)) {
            cliente = -1;
        }
        else {
            receive quienPide(cliente);
        }

        send armarPedido[empleado](cliente);
    }
}
```