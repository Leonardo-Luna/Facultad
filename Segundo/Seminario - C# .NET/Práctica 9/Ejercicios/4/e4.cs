class e4
{

    public static void Ejecutar()
    {

        var lista = new ListaEnlazada<int>();

        lista.AgregarAdelante(3);
        lista.AgregarAdelante(100);
        lista.AgregarAtras(10);
        lista.AgregarAtras(11);
        lista.AgregarAdelante(0);
        IEnumerator<int> enumerador = lista.GetEnumerator();

        while (enumerador.MoveNext())
        {
            int i = enumerador.Current;
            Console.Write(i + " ");
        }
        Console.WriteLine();

    }

    public static T ListaEnlazada<T>()
    {

        return 

    }

}