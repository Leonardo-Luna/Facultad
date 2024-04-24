namespace Practica6;

class Auto
{
    protected double velocidad;
    public virtual void Acelerar() => Console.WriteLine("Velocidad = {0}", velocidad += 10);
}

class Taxi : Auto
{
    public override void Acelerar() => Console.WriteLine("Velocidad = {0}", velocidad += 5);
}

public class E3
{

    public static void Ejercicio3()
    {

        Console.WriteLine("El error es debido al nivel de protección de velocidad.\nCon poner la variable de instanca \"Public\" o \"Protected\" se soluciona.");

        Auto a = new Auto();
        a.Acelerar();

        Taxi t = new Taxi();
        t.Acelerar();

    }

}