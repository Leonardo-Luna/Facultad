class e7y8
{

    public static void Ejecutar()
    {

        int[] vector = [1, 2, 3, 4, 5];
        vector.Print("Valores iniciales: ");
        var vector2 = vector.Seleccionar(n => n * 3);
        vector2.Print("Valores triplicados: ");
        vector.Seleccionar(n => n * n).Print("Cuadrados: ");

        int[] vector3 =[1, 2, 3, 4, 5];
        vector3.Print("Valores iniciales: ");
        vector3.Donde(n => n % 2 == 0).Print("Pares: ");
        vector3.Donde(n => n % 2 == 1).Seleccionar(n => n * n).Print("Impares al cuadrado: ");

    }

}