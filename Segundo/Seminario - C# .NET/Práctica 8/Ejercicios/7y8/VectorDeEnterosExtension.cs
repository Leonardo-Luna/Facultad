static class VectorDeEnterosExtension
{
    public static void Print(this int[] vector, string leyenda)
    {
        Console.WriteLine(leyenda + string.Join(", ", vector));
    }
    
    public static int[] Seleccionar(this int[] vector, FuncionEntera del)
    {
        int[] v2 = new int[vector.Length];

        for(int i = 0; i < v2.Length; i++)
        {

            v2[i] = del(vector[i]);

        }

        return v2;

    }

    public static int[] Donde(this int[] vector, Predicado del)
    {

        List<int> resultado = new List<int>();

        for(int i = 0; i < vector.Length; i++)
        {

            if(del(vector[i]))
            {
                resultado.Add(vector[i]);
            }

        }

        int[] r = resultado.ToArray<int>();

        return r;

    }

}