namespace p5
{
    public class e5
    {

        public static void test()
        {
            Console.WriteLine(@"

############################################################################################################

    class A
    {
        char c;
        static string st;
        void metodo1()
        {
            st = 'string';
            c = 'A';
        }
        static void metodo2()
        {
            new ClaseA().c = 'a'; ### ClaseA no existe (?)
            st = 'otro string';
            c = 'B'; ### No se pueden utilizar variables de instancia dentro de un método Static
            new A().st = ; ### No se puede instanciar una variable estática, se hace en el constructor?
        }
        
    }

############################################################################################################

            ");

        }

    }
       
}