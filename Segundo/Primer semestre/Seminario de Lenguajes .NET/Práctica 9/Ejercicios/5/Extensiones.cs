namespace ej5;
public static class Extensiones
{

    public static void ForEach<T>(this IEnumerable<T> secuencia, Action<T> a)
    {

        IEnumerator<T> iterator = secuencia.GetEnumerator();

        while(iterator.MoveNext())
        {

            a(iterator.Current);

        }

        Console.WriteLine();

    }

}