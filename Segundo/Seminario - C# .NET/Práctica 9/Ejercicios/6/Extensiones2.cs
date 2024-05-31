namespace ej6;
public static class Extensiones2
{

    public static void ForEach<T>(this IEnumerable<T> secuencia, Action<T> a)
    {

        IEnumerator<T> iterator = secuencia.GetEnumerator();

        while(iterator.MoveNext())
        {

            a(iterator.Current); //a es de tipo Action porque todos los Action son VOID

        }

    }

    public static IEnumerable<T> Donde<T>(this IEnumerable<T> secuencia, Func<T, bool> a)
    {

        List<T> r = new List<T>();
        IEnumerator<T> iterator = secuencia.GetEnumerator();

        while(iterator.MoveNext())
        {

            if(a(iterator.Current)) //Func recibe parámetro de tipo T y devuelve un bool
            {

                r.Add(iterator.Current);

            }

        }

        return r;

    }

    public static IEnumerable<TResult> Seleccionar<T, TResult>(this IEnumerable<T> secuencia, Func<T, TResult> a)
    {

        List<TResult> r = new List<TResult>();
        IEnumerator<T> iterator = secuencia.GetEnumerator();

        while(iterator.MoveNext())
        {

            r.Add(a(iterator.Current)); //a es de tipo Func porque recibe un tipo T (mismo que el tipo del array)
            //y devuelve un resultado que se infiere del tipo que se envía en el parámetro.

        }

        return r;

    }

}