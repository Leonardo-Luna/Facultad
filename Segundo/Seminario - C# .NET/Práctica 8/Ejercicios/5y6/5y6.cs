class e5y6
{

    public static void Ejecutar()
    {

        int i = 15;
        Action a = delegate () { Console.WriteLine(i); };

        //Recibe una referencia a la variable
        
        a.Invoke();
        i = 20;
        a.Invoke();

        Action[] acciones = new Action[10];
        
        for (int j = 0; j < 10; j++)
        {
            acciones[j] = () => Console.Write(j + " ");
        }

        foreach (var x in acciones)
        {
            x.Invoke();
        }

    }

}