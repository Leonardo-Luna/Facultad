namespace ej6;
class e6
{

    public static void Ejecutar()
    {

        int[] vector = [1,2,3,4,5];
        vector.Donde(i => i > 3)
                .Seleccionar(i => i * 10)
                .Seleccionar(i => $"({i})")
                .ForEach(st => Console.WriteLine(st));

    }

}