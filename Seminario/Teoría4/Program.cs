using System.Security.Cryptography.X509Certificates;

namespace p4 {

    class Program {

        public static void Main(string[] args) {

            seleccion();
            Console.ReadKey();

        }

        static void seleccion() {

            Console.WriteLine("1 - Ejercicios con clase Persona");
            Console.WriteLine("2 - Ejercicios con clase Hora");
            Console.WriteLine("3 - Ejercicios con clase Ecuacion2");
            Console.WriteLine("4 - Ejercicios con clase Matriz");
            Console.WriteLine("5 - Ejercicios con clase Cuenta");
            string s = Console.ReadLine();
            
            int.TryParse(s, out int opcion);

            switch (opcion)
            {

                case 1: 
                    ejPersona();
                    break;

                case 2:
                    ejHora();
                    break;

                case 3:
                    ejEcuacion2();
                    break;

                case 4:
                    ejMatriz();
                    break;

                case 5:
                    ejCuenta();
                    break;
                
                default:
                    Console.Clear();
                    seleccion();
                    break;

            }

        }
        
        static void ejPersona()
        {

            List<Persona> lista = new List<Persona>();

            Console.WriteLine("Ingrese los datos separados por una coma, \"nombre,edad,DNI\"");

            for(int i = 0; i < 5; i++) {

                string datos = Console.ReadLine();
                string[] v = new string[3];
                v = datos.Split(',');

                string nombre = v[0];
                int edad = int.Parse(v[1]);
                int DNI = int.Parse(v[2]);

                Persona test = new Persona(nombre, edad, DNI);
                lista.Add(test);
            }

            int cont = 1;
            foreach(Persona i in lista) {

                Console.WriteLine($"{cont})        {i.texto()}");
                cont++;

            }

            Persona aux = lista[0];

            foreach(Persona i in lista) {

                if(aux.esMayorQue(i)) {
                    aux = i;
                }

            }

            Console.WriteLine(aux.texto());
        
        }

        static void ejHora()
        {

            Hora h = new Hora(23, 30, 15);
            h.imprimir();
            Hora h2 = new Hora(14.45114);
            h2.imprimir();

        }

        static void ejEcuacion2()
        {

            Ecuacion2 test = new Ecuacion2(4,5,1);
            Console.WriteLine(test.getCantidadDeRaices());
            Console.WriteLine(test.getDiscriminante());
            test.imprimirRaices();

        }

        static void ejMatriz()
        {

            Matriz test = new Matriz(2,2);
            test.SetElemento(1,1,1);
            test.SetElemento(1,2,2);
            test.SetElemento(2,1,3);
            test.SetElemento(2,2,4);
            test.Imprimir();
            Console.WriteLine("");
            Matriz test2 = new Matriz(2,4);
            test2.Imprimir();

        }

        static void ejCuenta()
        {

            Cuenta c = new Cuenta();
            Cuenta c2 = new Cuenta("Leo");
            Cuenta c3 = new Cuenta(4444);
            Cuenta c4 = new Cuenta("Leo", 4242);
            
            c.Imprimir();
            c2.Imprimir();
            c3.Imprimir();
            c4.Imprimir();
            c4.Depositar(4000);
            c4.Extraer(3000);
            c4.Extraer(2000);

        }

        static void nullCoso()
        {

            string st = "asd";
            string st1 = "asd";
            string st2 = "asd";
            string st3 = "asd";
            string st4 = "asd";

            st = st1 ?? st2 ?? st3; // -> Consultar

            st4 = st4 ?? "Valor por defecto";

            if (st1 == null)
            {
                if (st2 == null)
                {
                    st = st3;
                }
                else
                {
                    st = st2;
                }
            }
            else
            {
                st = st1;
            }

            if (st4 == null)
            {
                st4 = "valor por defecto";
            }       

        }

    }

}
