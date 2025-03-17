using System;
using System.Diagnostics;
using System.Reflection.Metadata.Ecma335;
using System.Runtime.CompilerServices;
using System.Text;

namespace Teoria2
{
    public class Program
    {
        public static void Main(string[] args)
        {

            //Ejer1();
            //Ejer2(); //El ejercicio 5 es idéntico al 2
            //Ejer3();
            //Ejer4();
            //Ejer6();
            //Ejer7();
            //Ejer8();
            //Ejer9();
            //Ejer10();
            //Ejer11();
            Ejer12();
            //Ejer13();
            //Ejer14();
            //Ejer15();
            //Ejer16();
            //Ejer17();
            //Ejer18();
            //Ejer19();
            //Ejer20();
            //Ejer21();
            Console.ReadKey();

        }

        static void Ejer1()
        {
            object o1 = "A";
            object o2 = o1;
            o2 = "Z";
            Console.WriteLine(o1 + " " + o2);
            //Porque el tipo Object es de tipo referencia, y siempre que asignes un nuevo valor va a apuntar a
            //otra dirección de memoria.
        }

        static void Ejer2()
        {
            char c1 = 'A';
            string st1 = "A";
            object o1 = c1; //Boxing -> Primitivo a referencia
            object o2 = st1;
            char c2 = (char)o1; //Unboxing -> Referencia a primitivo
            string st2 = (string)o2;
        }

        static void Ejer3()
        {
            //Explícita -> Cuando se utiliza alguna operación para realizar el cambio
            object o1 = 'A';
            string st1 = (string)o1;
            //Implícita -> Cuando no es necesario realizar nada y se convierte automáticamente
            byte b1 = 1;
            int i1 = b1;
        }

        static void Ejer4()
        {
            object o = "Hola Mundo!";
            string? st = o as string;
            int i = 12;
            byte b = (byte)i;
            double d = i;
            float f = (float)d;
            o = i;
            i = (int)o + 1;
        }

        static void Ejer6()
        {
            // int i;
            // Console.WriteLine(i); //No compila porque i no tiene valor
        }

        static void Ejer7()
        {
            char c1 = 'A';
            char c2 = 'A';
            Console.WriteLine(c1 == c2); //True porque la comparacion es igual
            object o1 = c1;
            object o2 = c2;
            Console.WriteLine(o1 == o2); //Falso porque las direcciones de memoria sin distintas
        }

        static void Ejer8()
        {
            //El StringBuilder es mejor siempre que se deba modificar parte del String
            string asd = "Test";
            StringBuilder stb = new StringBuilder("Test");

            //Caso en el que es mejor: Reemplazar todas las 'T' por 't'
            Console.WriteLine(DateTime.Now.Millisecond + " Milisegundos");
            stb.Replace('T', 't');
            Console.WriteLine(DateTime.Now.Millisecond + " Milisegundos");

            //En el caso del String normal no puedo reemplazar la letra, ya que es una operación
            //de solo lectura. Tendría que reescribir toda la palabra con el formato deseado
            Console.WriteLine(DateTime.Now.Millisecond + " Milisegundos");
            for (int i = 0; i < (asd.Length - 1); i++)
            {
                if (asd[i] == 'T')
                {
                    //asd[i] = 't';
                    Console.WriteLine("T encontrada");
                    Console.WriteLine(DateTime.Now.Millisecond + " Milisegundos");
                }
            }

            //Caso en el que es peor: Utilización cotidiana

        }

        static void Ejer9()
        {
            Console.WriteLine(DateTime.Now.Millisecond + " Milisegundos");
            for (int i = 0; i <= 5; i++)
            {

            }
            Console.WriteLine(DateTime.Now.Millisecond + " Milisegundos");
        }

        static void Ejer10()
        {
            object[] v = new object[10];
            v[0] = new StringBuilder("Net");

            for (int i = 1; i < 10; i++)
            {
                v[i] = v[i - 1];
            }

            (v[5] as StringBuilder).Insert(0, "Framework .");

            foreach (StringBuilder s in v)
                Console.WriteLine(s);

            //dibujar el estado de la pila y la mem. heap
            //en este punto de la ejecución

            v[5] = new StringBuilder("CSharp");

            foreach (StringBuilder s in v)
                Console.WriteLine(s);

            //dibujar el estado de la pila y la mem. heap
            //en este punto de la ejecución
        }

        static void Ejer11()
        {

            Console.WriteLine("Ingrese una frase");
            string frase = Console.ReadLine();

            string[] palabras = frase.Split(" ");
            foreach (string p in palabras)
            {
                Console.WriteLine(p);
            }
        }

        static void Ejer12()
        {

            string[] aMeses = Enum.GetNames(typeof(Meses));
            Array.Reverse(aMeses);

            foreach (string a in aMeses)
            {
                Console.WriteLine(a);
            }

            Console.WriteLine("Ingrese un mes a buscar");
            string buscar = Console.ReadLine();

            bool existe = (Enum.IsDefined(typeof(Meses), buscar.ToLower()));
            Console.WriteLine(existe);

        }

        enum Meses
        {
            enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre
        }

		static void Ejer13()
        {

            //Console.WriteLine(args == null);
            //Console.WriteLine(args.Length);

        }
      
      	static void Ejer14()
        {
        	
          int[] vector = new int[0]; //No pone null, sino que no está dentro de los límites. Probar de nuevo
          
        }
      
				static void Ejer15()
        {
					
          //Console.WriteLine("¡Hola {0}!", args[0]); //Se sale de los límites porque el arreglo no está definido/tiene valores adentro
          
        }
      
      	static void Ejer16()
        {
          
          string[] nombres = {"Marta", "Juan", "Luis", "Ana"};
          
          for(int i = 0; i<=(nombres.Length-1); i++)
          {
            Console.WriteLine($"Hola {nombres[i]}");
          }
          Console.WriteLine("-------------");
          foreach(string n in nombres)
          {
            Console.WriteLine($"Hola {n}");
          }
          
        }
      	static void Ejer17()
        {
          
          Console.WriteLine("Ingrese un número: ");
          int num = int.Parse(Console.ReadLine());
          
          Console.WriteLine($"Es primo? -> {esPrimo(num)}");
          
        }
      
      	static bool esPrimo(int n)
        {
          
          double raiz = Math.Sqrt(n);
          
            for(int i = 2; i<= raiz; i++)
    		{
        		if(n % i == 0)
        		{
            	    return false;
        		}
    		}
    		return true;
        }

        static void Ejer18()
        {

            Console.WriteLine("Ingrese un número:");
            int num = int.Parse(Console.ReadLine());
            //Console.WriteLine(Factorial1(num)); //No recursiva
            //Console.WriteLine(Factorial2(num));//Recursiva
            Console.WriteLine(Factorial3(num)); //expression-bodied methods
        
        }

        static int Factorial1(int n)
        {
            int res = 1;
            for(int i = n; i>1; i--)
            {
                res = res * i;
            }
            return res;
        
        }

        static int Factorial2(int n)
        {

            if(n == 0)
            {
                return 1;
            }
            else
            {
                return n*Factorial1(n-1);
            }

        }

        static int Factorial3(int n) => (n == 0) ? 1 : n*Factorial3(n-1);

        static void Ejer19()
        {
            Console.WriteLine("Ingrese un número:");
            int n = int.Parse(Console.ReadLine());
            int f;
            Fac2(n, out f);
            Console.WriteLine($"{n}! = {f}");
        }

        static void Fac(int n, out int f)
        {
            if(n == 0)
            {
                f = 1;
            }
            else
            {
                int res = 1;
                for(int i = n; i>1; i--)
                {
                    res *= i;
                }
                f = res;
            }
        }

        static void Fac2(int n, out int f)
        {
            if(n == 0)
            {
                f = 1;
            }
            else
            {
                Fac2(n-1, out f);
                f = f*n;
            }
        }

        static void Ejer20()
        {

            int a = int.Parse(Console.ReadLine());
            int b = int.Parse(Console.ReadLine()); 
            Console.WriteLine($"{a} | {b}");
            Swap(ref a, ref b);
            Console.WriteLine($"{a} | {b}");

        }
        static void Swap(ref int a, ref int b)
        {

            int aux = a;
            a = b;
            b = aux;

        }

        static void Ejer21()
        {

            Imprimir(1, 2, "asd");

        }

        static void Imprimir(params object[] list)
        {
            foreach(object a in list)
            {
                Console.Write($"{a} ");
            }
        }
    }   
}