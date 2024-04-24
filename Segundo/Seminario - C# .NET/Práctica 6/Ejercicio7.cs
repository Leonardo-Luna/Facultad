namespace Practica6;

class Polimorfismo
{

    public virtual void Imprimir() => Console.WriteLine("Soy una instancia x");

}

class A2 : Polimorfismo {

    public override void Imprimir() => Console.WriteLine("Soy una instancia A");

}

class B2 : Polimorfismo {

    public override void Imprimir() => Console.WriteLine("Soy una instancia B");

}

class C2 : Polimorfismo {
    
    public override void Imprimir() => Console.WriteLine("Soy una instancia C");

}

class D2 : Polimorfismo {

    public override void Imprimir() => Console.WriteLine("Soy una instancia D");

}

static class Imprimidor
{
    public static void Imprimir(params object[] vector)
    {
        foreach (Polimorfismo o in vector)
        {
            o.Imprimir();
        }
    }
}

class E7
{

    public static void Ejercicio7()
    {

        Imprimidor.Imprimir(new A2(), new B2(), new C2(), new D2());

    }

}