namespace ej5;
class e5
{

    public static void Ejecutar()
    {

        List<int> lista = [1, 2, 3];
        lista.ForEach(i => Console.Write(i + ","));

        Console.WriteLine();

        int[] vector = [1, 2, 3];
        vector.ForEach(c => Console.Write(c + ","));
        "Hola Mundo".ForEach(c => Console.Write(c + ","));

    }

}