namespace p5
{
    public class Menu
    {
    
        public static void seleccion()
        {

            Console.WriteLine("1 - Ejercicio 1");
            Console.WriteLine("2 - Ejercicios 2-3");
            Console.WriteLine("3 - Ejercicio 5");
            Console.WriteLine("4 - Ejercicio 6 // Consultar si está bien");
            Console.WriteLine("5 - Ejercicio 7 // Ídem"); 

            int opcion = int.Parse(Console.ReadLine());

            switch(opcion)
            {

                case 1: Respuestas.ejer1();
                        break;

                case 2: Respuestas.ejer2();
                        break;

                case 3: Respuestas.ejer5();
                        break;

                case 4: Respuestas.ejer6();
                        break;

                case 5: Respuestas.ejer7();
                        break;

            }

        }
    
    }

}