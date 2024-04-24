namespace Practica6;

class Auto2
{

    public string Marca { get; private set; } = "Ford";
    public Auto2(string marca) => this.Marca = marca;

}

class Taxi2 : Auto2
{

    public int Pasajeros { get; private set; }
    public Taxi2(int pasajeros, string marca) : base(marca)
    {
        this.Pasajeros = pasajeros;
    }

}

public class E4
{

    public static void Ejercicio4()
    {

        Console.WriteLine("No es necesario utilizar \": base\" debido a que Auto también posee un constructor vacío, por lo tanto, pasar la marca es opcional.\nEn caso de que se borre el constructor vacío, sí sería obligatorio usar \": base\".\n\n");

        Taxi2 t = new Taxi2(3, "Ford");
        Console.WriteLine($"Un {t.Marca} con {t.Pasajeros} pasajeros");
    
    }

}