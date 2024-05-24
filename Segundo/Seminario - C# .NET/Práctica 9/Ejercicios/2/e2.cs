class e2
{

    public static void Ejecutar()
    {

        int[] vector1 = [1, 2, 3];
        bool[] vector2 = [true, true, true];
        string[] vector3 = ["uno", "dos", "tres"];
        Set<int>(vector1, 110, 2);
        Set<bool>(vector2, false, 1);
        Set<string>(vector3, "Hola Mundo!", 0);
        Imprimir(vector1);
        Imprimir(vector2);
        Imprimir(vector3);

    }

    public static void Set<T1>(T1[] v, T1 value, int pos)
    {

        v[pos] = value;

    }

    public static void Imprimir<T>(T[] v)
    {

        foreach(T a in v)
        {

            Console.Write(a + " ");

        }

        Console.WriteLine();

    }

}