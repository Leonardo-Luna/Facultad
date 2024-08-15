class Persona
{
    public String Nombre { get; set; }
}

public class Auto3
{
    private Persona _dueño1, _dueño2;
    //public Persona GetPrimerDueño() => _dueño1;
    //protected Persona SegundoDueño { set => _dueño2 = value; }

}

class E5
{

    public static void Ejercicio5()
    {

        Console.WriteLine("Las líneas de código que provocan error son las que intentan definir una variable de tipo Persona de forma \"protected\" cuando la clase Persona es de tipo pública. Causa una incoherencia en los accesos.");
        Console.WriteLine("\n\n### public Persona GetPrimerDueño() => _dueño1;\n### protected Persona SegundoDueño { set => _dueño2 = value; }");

    }

}