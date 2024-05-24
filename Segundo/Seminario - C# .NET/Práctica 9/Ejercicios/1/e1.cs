class e1
{

    public static void Ejecutar()
    {

        List<object> lista = [ "hola", 7, 'A' ];
        string st = Get<string>(lista, 0);
        int i = Get<int>(lista, 1);
        char c = Get<char>(lista, 2);
        Console.WriteLine($"{st} {i} {c}");

    }

    public static T1 Get<T1>(List<object> list, int index)
    {
        
        return (T1)list[index];

    }

}