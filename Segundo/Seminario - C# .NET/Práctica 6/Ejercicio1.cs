namespace Practica6;

class A
{

    protected int _id;

    public A(int id) //Saqué el Lambda porque casi me da una embolia leyendo
    {
        
        _id = id;

    }

    public virtual void Imprimir()
    {
    
        Console.WriteLine($"A_{_id}");
    
    }

}

class B : A
{

    protected int _valueB;

    public B(int value) : base(value)
    {
        this._valueB = value;
    }

    public override void Imprimir()
    {

        Console.Write($"B_{this._valueB} --> ");
        base.Imprimir();

    }

}

class C : B
{

    protected int _valueC;

    public C(int value) : base(value)
    {
        this._valueC = value;
    }
    
    public override void Imprimir()
    {

        Console.Write($"C_{this._valueC} --> ");
        base.Imprimir();

    }

}

class D : C
{
    
    protected int _valueD;

    public D(int value) : base(value)
    {
        this._valueD = value;
    }

    public override void Imprimir()
    {
        Console.Write($"D_{this._valueD} --> ");
        base.Imprimir();
    }

}

public class E1
{

    public static void Ejercicio1()
    {

        A[] vector = [new A(3),new B(5),new C(15),new D(41)];

        foreach (A a in vector)
        {
            a.Imprimir();
        }

    }

}

public class E2
{

    public static void Ejercicio2()
    {

        A[] vector = [ new C(1),new D(2),new B(3),new D(4),new B(5)];

        foreach (A a in vector)
        {
            /* if(a is B b)
            {
                b.Imprimir(); //No logré que funcione
            } */

            if(a.GetType() == typeof(B))
            {
                a.Imprimir();
            }
        }

    }

}