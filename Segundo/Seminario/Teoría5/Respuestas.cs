namespace p5
{
    public class Respuestas
    {

        public static void ejer1()
        {

            Cuenta c1 = new Cuenta();
            c1.Depositar(100).Depositar(50).Extraer(120).Extraer(50);
            Cuenta c2 = new Cuenta();
            c2.Depositar(200).Depositar(800);
            new Cuenta().Depositar(20).Extraer(20);
            c2.Extraer(1000).Extraer(1);
            Console.WriteLine("\n\t\tDETALLE");
            Cuenta.ImprimirDetalle();

        }

        public static void ejer2()
        {

            new Cuenta();
            new Cuenta();
            List<Cuenta> cuentas = Cuenta.GetCuentas();
            cuentas[0].Depositar(50);
            cuentas.RemoveAt(0);
            Console.WriteLine(cuentas.Count);
            cuentas = Cuenta.GetCuentas();
            Console.WriteLine(cuentas.Count);
            cuentas[0].Extraer(30);

        }

        public static void ejer5()
        {

            e5.test();

        }

        public static void ejer6()
        {

            Matriz test = new Matriz(2,2);
            test[1, 1] = 1;
            test[1, 2] = 2;
            test[2, 1] = 3;
            test[2, 2] = 4;
            test.Imprimir();

            //Console.WriteLine(test[1,1]);

            double[] t = test.DiagonalSecundaria;
            foreach(double i in t) 
            {
                Console.WriteLine(i);
            }

        }

        public static void ejer7()
        {

            Persona p = new Persona();

            p[1] = "Leo";
            p[2] = 'M';
            p[3] = 111111;
            p[4] = new DateTime(2004, 1, 1);

            Console.WriteLine((string)p[1]);
            Console.WriteLine((char)p[2]);
            Console.WriteLine((int)p[3]);
            Console.WriteLine((DateTime)p[4]);
            Console.WriteLine((int)p[5]);
            Console.WriteLine(p[9]);

        }

    }

}