using System.Collections;
class e3
{
    public static void Ejecutar()
    {

        IEnumerable rango = Rango(6, 30, 3);
        IEnumerable potencias = Potencias(2, 10);
        IEnumerable divisibles = DivisiblesPor(rango, 6);

        foreach (int i in rango)
        {
            Console.Write(i + " ");
        }

        Console.WriteLine();

        foreach (double i in potencias)
        {
            Console.Write(i + " ");
        }

        Console.WriteLine();
        
        foreach (int i in divisibles)
        {
            Console.Write(i + " ");
        }

        Console.WriteLine();

    }

    public static IEnumerable<int> Rango(int inicio, int fin, int paso)
    {

        while(inicio <= fin)
        {

            yield return inicio;
            inicio += paso;

        }

    }

    public static IEnumerable<double> Potencias(int num, int exponente)
    {

        for(int i = 1; i <= exponente; i++)
        {

            yield return Math.Pow(num, i);

        }

    }

    public static IEnumerable<int> DivisiblesPor(IEnumerable rango, int divisor)
    {

        foreach(int num in rango)
        {

            if(num % divisor == 0)
            {

                yield return num;

            }

        }

    }

}

