namespace Practica6
{

    class MenuEx
    {

        public static void Menu()
        {

            int option = 0;

            do
            {

                Text(ref option);
                Console.Clear();

                switch(option)
                {

                    case 1: E1.Ejercicio1();
                            break;

                    case 2: E2.Ejercicio2();
                            break;

                    case 3: E3.Ejercicio3();
                            break;

                    case 4: E4.Ejercicio4();
                            break;

                    case 5: E5.Ejercicio5();
                            break;

                    case 6: E6.Ejercicio6();
                            break;
                    
                    case 7: E7.Ejercicio7();
                            break;
                        
                    case 8: E8.Ejercicio8();
                            break; 

                    default: break;

                }

                Console.ReadKey();

            } while(option > 0);

        }

        private static void Text(ref int option)
        {

            Console.Clear();
            Console.WriteLine("1 -> Ejercicio 1");
            Console.WriteLine("2 -> Ejercicio 2");
            Console.WriteLine("3 -> Ejercicio 3");
            Console.WriteLine("4 -> Ejercicio 4");
            Console.WriteLine("5 -> Ejercicio 5");
            Console.WriteLine("6 -> Ejercicio 6");
            Console.WriteLine("7 -> Ejercicio 7");
            Console.WriteLine("8 -> Ejercicio 8");
            Console.WriteLine();
            Console.Write(" >>>  ");
            int.TryParse(Console.ReadLine(), out option);

        }

    }

}