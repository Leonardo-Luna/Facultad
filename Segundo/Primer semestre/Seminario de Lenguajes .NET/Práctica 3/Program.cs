using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Numerics;
using Microsoft.VisualBasic;

namespace Practica3
{

    public class Program
    {
        public static void Main(string[] args)
        {

            //ejer1();
            //ejer2();
            //ejer3();
            //ejer4();
            //ejer5();
            // HACER EL 6 :D
            //ejer7();
            //ejer8();
            //ejer9();
            //ejer10();
            //ejer11();
            //ejer12();
            //ejer13();
            ejer14();

            Console.ReadKey();

        }

        static void ejer1()
        {

            Console.CursorVisible = false; //Setea la barrita parpadeante de escribir a invisible
            ConsoleKeyInfo k = Console.ReadKey(true); //True = No mostrar la telca en pantalla | False = Mostrar tecla en pantalla
            while (k.Key != ConsoleKey.End) //Mientras la tecla presionada sea distinta de "Fin"
            {
                Console.Clear();
                Console.Write($"{k.Modifiers}-{k.Key}-{k.KeyChar}"); //Modifiers (Ctrl, Shift, etc) Key (Nombre de la tecla presionada) Char (Caracter (si tiene))
                k = Console.ReadKey(true);
            }

        }

        static void ejer2()
        {

            double[,] matriz = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9} };
            imprimirMatriz(matriz);
    
        }

        static void imprimirMatriz(double[,] matriz)
        {

            for(int i = 0; i < matriz.GetLength(0); i++)
            {

                for(int j = 0; j < (matriz.Length/matriz.GetLength(0)); j++)
                {
                
                    Console.Write($"{matriz[i,j]} ");
                
                }

                Console.WriteLine("");

            }

        }

        static void ejer3() {

            double[,] matriz = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9} };
            string st = "";
            imprimirMatrizConFormato(matriz, st);

        }

        static void imprimirMatrizConFormato(double[,] matriz, string formatString)
        {

            for(int i = 0; i < matriz.GetLength(0); i++)
            {

                for(int j = 0; j < (matriz.Length/matriz.GetLength(0)); j++)
                {
                
                    formatString += String.Format(matriz[i,j].ToString() + " ");
                
                }

                formatString += "\n";

            }

            Console.WriteLine(formatString);

        }

        static void ejer4()
        {
  
            double[,] matrizC = { {1, 2, 3}, //i v || j >
                                  {4, 5, 6},
                                  {7, 8, 9} };

            double[,] matrizNC = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {10, 11, 12} };

            double[] diagP = GetDiagonalPrincipal(matrizC);
            double[] diagS = GetDiagonalSecundaria(matrizC);

            foreach(double i in diagP)
            {

                Console.Write($"{i} ");

            }

            Console.WriteLine(" ");

            foreach(double i in diagS)
            {

                Console.Write($"{i} ");

            }

        }

        static double[] GetDiagonalPrincipal(double[,] matriz)
        {

            if(!(matriz.GetLength(0) == (matriz.Length/matriz.GetLength(0))))
            {

                throw new ArgumentException("La matriz enviada no es cuadrada.");

            }
            else
            {

                double[] diagonal = new double[(matriz.Length/matriz.GetLength(0))];
                int cont = 0;

                for(int i = 0; i < matriz.GetLength(0); i++)
                {

                    diagonal[i] = matriz[i,cont];
                    cont++;

                }

                return diagonal;

            }

        }

        static double[] GetDiagonalSecundaria(double[,] matriz)
        {

            if(!(matriz.GetLength(0) == (matriz.Length/matriz.GetLength(0))))
            {

                throw new ArgumentException("La matriz enviada no es cuadrada.");

            }
            else
            {

                double[] diagonal = new double[(matriz.Length/matriz.GetLength(0))];
                int j = 0;

                for(int i = (matriz.GetLength(0)-1); i >= 0; i--)
                {

                    diagonal[j] = matriz[i,j];
                    j++;

                }

                return diagonal;

            }

        }

        static void ejer5()
        {

            double[,] matriz = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {1, 2, 3}, {2, 2, 2}};
            double[][] arregloDeArreglos = GetArregloDeArreglos(matriz);

            foreach(double[] i in arregloDeArreglos)
            {

                foreach(double j in i)
                {

                    Console.Write(j + " ");

                } Console.WriteLine(" ");

            }
            
        }

        static double[][] GetArregloDeArreglos(double[,] matriz)
        {

            int d = matriz.GetLength(0);
            Console.WriteLine(d);
            double[][] a = new double[d][];

            for(int i = 0; i < d; i++)
            {

                a[i] = new double[matriz.Length/d];
                
            }

            for(int i = 0; i < d; i++)
            {

                for(int j = 0; j < matriz.Length/d; j++)
                {
                    
                  a[i][j] = matriz[i,j];

                }

            }

            return a;

        }


        static void ejer6()
        {

            

        }

        static void ejer7()
        {

            //¿De qué tipo quedan definidas las variables x, y, z en el siguiente código?

            int i = 10;
            var x = i*1.10; //Double
            var y = 1f; //Float
            var z = i * y;  //Int

            Console.WriteLine(x.GetType());
            Console.WriteLine(y.GetType());
            Console.WriteLine(z.GetType());

        }
    
        static void ejer8()
        {

            object obj = new int[10];
            dynamic dyn = 13;
            //Console.WriteLine(obj.Length());
            //System.Object está por encima de todos los tipos en la jerarquía y carece de la mayoría de métodos, por ejemplo .Length
            //Console.WriteLine(dyn.Length());
            //Los integer no tienen el método .Length. Para calcular ese valor habría que usar .toString().Length

        }

        static void ejer9()
        {

            var a = 3L;
            dynamic b = 32;
            object obj = 3;
            //a = a * 2.0; //A fue declarado como var y se le asignó un Long, por lo que no puede cambiar su tipo de contenido
            b = b * 2.0;
            b = "hola";
            obj = b;
            b = b + 11;
            //obj = obj + 11; //No se puede realizar operaciones entre un obj y un tipo primitivo
            var c = new { Nombre = "Juan" };
            var d = new { Nombre = "Maria" };
            var e = new { Nombre = "Maria", Edad = 20 };
            var f = new { Edad = 20, Nombre = "Maria" };
            //f.Edad = 22; //No se pueden modificar los atributos porque son de solo lectura (no tienen setter)
            d = c;
            //e = d; //Son diferentes por los campos
            //f = e; //Ídem

        }

        static void ejer10()
        {

            //La sección opcional de FormatString redondea los valores
            double a = 2.4526;
            double b = 1.255;

            Console.WriteLine($"{a:0.00} || {b:0.0}");

        }

        static void ejer11()
        {

            List<int> a = [ 1, 2, 3, 4 ];
            a.Remove(5); //El Remove remueve la primera ocurrencia de un objeto
            //a.RemoveAt(4); //El RemoveAt remueve una posición específica

        }

        static void ejer12()
        {

            Stack<Char> c = new Stack<Char>();

            String cadena = "{{{{{{}}}}}";
            foreach(char i in cadena)
            {

                if(i == '{' || i == '[' || i == '(')
                {

                    c.Push(i);

                }
                else
                {

                    if(c.Count == 0)
                    {
                        
                        throw new ArgumentException("La secuencia no es simétrica");
                    
                    }
                    else
                    {
                        c.Pop();
                    }

                }

            }

            if(c.Count == 0)
            {

                Console.WriteLine("La secuencia es simétrica");

            }
            else
            {

                throw new ArgumentException("La secuencia no es simétrica");

            }
        }
   
        static void ejer13()
        {

            Queue<int> cola = new Queue<int>();
            int num = 40;
            int resto;
            string binario = "";

            if(num > 1)
            {
                while(num != 1)
                {

                    Console.WriteLine(num%2 + " " + num/2);
                    resto = num%2;
                    num = num/2;
                    cola.Enqueue(resto);

                }

                cola.Enqueue(num);

            }
            else
            {

                binario = "1";

            }

            while(cola.Count != 0)
            {

                binario = cola.Dequeue() + binario;

            }

            Console.WriteLine(binario);

        }

        static void ejer14()
        {

            Console.WriteLine("Ingrese la clave (Finaliza con 0)");
            int clave = int.Parse(Console.ReadLine());
            Queue<int> cola = new Queue<int>();

            while(clave > 0)
            {
                cola.Enqueue(clave);
                clave = int.Parse(Console.ReadLine());
            }


            Console.WriteLine("Ingrese el mensaje a cifrar");
            string mensaje = Console.ReadLine().ToUpper();

            int[] encriptado;

            encriptar(cola, mensaje, out encriptado);

            foreach(int i in encriptado)
            {
                Console.Write($"{i} ");
            }

            char[] desencriptado;

            cola.Clear(); cola.Enqueue(5); cola.Enqueue(3); cola.Enqueue(9); cola.Enqueue(7); Console.WriteLine("");

            desencriptar(cola, encriptado, out desencriptado); Console.WriteLine(' ');

            foreach(char c in desencriptado)
            {
                Console.Write($"{c} ");
            }

        }
        static int[] encriptar(Queue<int> cola, string? mensaje, out int[] resultado)
        {

            int[] numero = Enumerable.Range(1, 28).ToArray();
            char[] l = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ ".ToCharArray();
            int aux; int cont = 0;
            int[] r = new int[mensaje.Length];

            foreach(char c in mensaje)
            {

                for(int indice = 0; indice < l.Length; indice++)
                {

                    if(c == l[indice])
                    {
                
                        aux = cola.Dequeue();

                        if(aux + numero[indice] > 28)
                        {
                            if((aux + numero[indice]) - 28 == 0)
                            {
                                r[cont] = 28;
                            }
                            else
                            {
                                r[cont] = ((aux + numero[indice]) - 28);
                            }
                        }
                        else
                        {
                            r[cont] = (aux + numero[indice]);
                        }

                        cont++;
                        cola.Enqueue(aux);

                    }

                }

            }

            resultado = r;
            return resultado;

        }

        static char[] desencriptar(Queue<int> cola, int[] mensaje, out char[] resultado)
        {

            int[] numero = Enumerable.Range(1, 28).ToArray();
            char[] l = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ ".ToCharArray();
            int aux; int cont = 0;
            char[] r = new char[mensaje.Length];
            
            foreach(int c in mensaje)
            {

                for(int indice = 0; indice < numero.Length; indice++)
                {

                    if(c == numero[indice])
                    {
                
                        aux = cola.Dequeue();
                        Console.WriteLine($"Encriptado {c} || Clave {aux} Letra {l[indice]}");
                        if(mensaje[cont] - aux == 0)
                        {
                            r[cont] = ' '; 
                        }
                        else if(mensaje[cont] - aux -1 < 0)
                        {
                            r[cont] = l[28 + (mensaje[cont] - aux)-1];
                        }
                        else
                        {
                            r[cont] = l[(mensaje[cont]) - aux -1];
                        }

                        cont++;
                        cola.Enqueue(aux);

                    }

                }

            }

            resultado = r;
            return resultado;

        }

    }

}