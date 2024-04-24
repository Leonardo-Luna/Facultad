namespace Practica6;

abstract class Empleado
{

    public abstract string Nombre { get; }
    public abstract int DNI { get; }
    public abstract DateTime FechaDeIngreso { get; }
    public abstract double SalarioBase { get; protected set; }
    public abstract double Salario { get; }

    public abstract void AumentarSalario();

}

class Administrativo : Empleado
{

    public override String Nombre { get; }
    public override int DNI { get; }
    public override DateTime FechaDeIngreso { get; }
    public override double SalarioBase { get; protected set; }
    public override double Salario { get => SalarioBase+Premio; }
    public int years { get; protected set; }
    public double Premio { get; set; }

    public Administrativo(String Nombre, int DNI, DateTime FechaDeIngreso, double SalarioBase)
    {

        this.Nombre = Nombre;
        this.DNI = DNI;
        this.FechaDeIngreso = FechaDeIngreso;
        this.SalarioBase = SalarioBase;

        DateTime fechaEjecucion = new DateTime(2022,4,9);
        this.years = fechaEjecucion.Subtract(FechaDeIngreso).Days/365;

    }

    public override void AumentarSalario()
    {

        double onePercent = this.SalarioBase*0.01;
        this.SalarioBase += onePercent*years;

    }

    public override string ToString()
    {
        return $"Administrativo Nombre: {this.Nombre}, DNI: {this.DNI} Antigüedad: {this.years}\nSalario base: {this.SalarioBase}, Salario: {this.Salario}\n----------------------------------------------------------------";
    }

}

class Vendedor : Empleado
{

    public override String Nombre { get; }
    public override int DNI { get; }
    public override DateTime FechaDeIngreso { get; }
    public override double SalarioBase { get; protected set; }
    public override double Salario { get => SalarioBase + Comision; }
    public int years { get; protected set; }
    public double Comision { get; set; }

    public Vendedor(String Nombre, int DNI, DateTime FechaDeIngreso, double SalarioBase)
    {

        this.Nombre = Nombre;
        this.DNI = DNI;
        this.FechaDeIngreso = FechaDeIngreso;
        this.SalarioBase = SalarioBase;

        DateTime fechaEjecucion = new DateTime(2022,4,9);
        this.years = fechaEjecucion.Subtract(FechaDeIngreso).Days/365;

    }

    public override void AumentarSalario()
    {

        if(years < 10)
        {

            this.SalarioBase += this.SalarioBase*0.05;

        }
        else
        {

            this.SalarioBase += this.SalarioBase*0.1;

        }

        Console.WriteLine(this.Comision);

    }

    public override string ToString()
    {
        return $"Vendedor Nombre: {this.Nombre}, DNI: {this.DNI} Antigüedad: {this.years}\nSalario base: {this.SalarioBase}, Salario: {this.Salario}\n----------------------------------------------------------------";
    }

}

public class E8
{

    public static void Ejercicio8()
    {

        Empleado[] empleados = new Empleado[] {
            new Administrativo("Ana", 20000000, new DateTime(2018,4,26), 10000) {Premio=1000},
            new Vendedor("Diego", 30000000, new DateTime(2010,4,2), 10000) {Comision=2000},
            new Vendedor("Luis", 33333333, new DateTime(2011,12,30), 10000) {Comision=2000}
        };

        foreach (Empleado e in empleados)
        {
            Console.WriteLine(e);
            e.AumentarSalario();
            Console.WriteLine(e);
        }

    }

}