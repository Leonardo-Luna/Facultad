using System.Runtime.CompilerServices;

class Ecuacion2
{

    private double a;
    private double b;
    private double c;

    public Ecuacion2(double a, double b, double c) 
    {

        this.a = a;
        this.b = b;
        this.c = c;

    }

    public double getDiscriminante()
    {

        double discriminante = (Math.Pow(b, 2)-4*a*c);

        return discriminante;

    }

    public int getCantidadDeRaices()
    {

        double disc = this.getDiscriminante();

        if(disc < 0)
        {
            return 0;
        }
        else if(disc == 0)
        {
            return 1;
        }
        else
        {
            return 2;
        }

    }

    public void imprimirRaices()
    {

        int cant = this.getCantidadDeRaices();

        if(cant == 0)
        {
            Console.WriteLine("La ecuación no posee raíces.");
        }
        else
        {

            var raiz1 = ((-b)+Math.Sqrt(Math.Pow(b,2)-(4*a*c)))/2*a;
            var raiz2 = ((-b)-Math.Sqrt(Math.Pow(b,2)-(4*a*c)))/2*a;
            Console.WriteLine(raiz1 + " " + raiz2);

        }

    }

}