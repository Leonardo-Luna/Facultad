//namespace Practica6;

public class E6
{

    public static void Ejercicio6()
    {

        Console.WriteLine("1) Utiliza un Override sobre un método que no es Virtual.");
        Console.WriteLine("2) La clase A no es abstracta.");
        Console.WriteLine("3) El método abstracto M1 tiene cuerpo.");
        Console.WriteLine("4) El método M1 hace Override es un método que no existe. B hace Override de un método no Virtual.");
        Console.WriteLine("5) El método M1 de B es Protected. Tiene que tener el mismo nivel de protección (public) que A.");
        Console.WriteLine("6) No se puede marcar un método Static como Virtual ni Override.");
        Console.WriteLine("7) Los métodos Virtual y Override no pueden ser privados. Deben ser públicos.");
        Console.WriteLine("8) Se debe hacer un \": base\" en el constructor de B para que A reciba el dato necesario debido a la herencia.");
        Console.WriteLine("9) La variable _id de A se intenta modificar en B, pero esta es privada.");
        Console.WriteLine("10) La variable Propiedad es Private, pero la propiedad Get es Public, lo cual causa una interferencia en los niveles de protección.");
        Console.WriteLine("11) La clase B debe seguir la firma de la variable Abstract Prop, es decir, DEBE tener Get Y Set porque así lo especifica.");
        Console.WriteLine("12) La variable Prop en A no es Abstract ni Virtual, por lo tanto no se le puede hacer un Override en B.");

    }

}