using System;

Console.WriteLine("1)");
Console.WriteLine("Hola"); //Console.WriteLine pasa a la siguiente línea despues de ejecutarse
Console.Write("Mundo"); //Console.Write sigue ejecutando el código en la misma línea
Console.WriteLine("!"); /**Esto imprime: Hola
                                        Mundo!**/

string s = Console.ReadLine();
string t = Console.ReadLine();
Console.WriteLine($"{s} {t}");


Console.WriteLine("\n2)");
// La secuencia \\ o \" permite hacer un escape del siguiente caracter (imprime \)
// \t hace una tabulación y \n un salto de línea

Console.WriteLine("Hola \t mundo!");
Console.WriteLine("Ejemplo \n2");
Console.WriteLine("Ahora puedo usar \\");

Console.WriteLine("\n3)");
//
string st = @"c:\windows\system";
string st2 = "c:\\windows\\system";
Console.WriteLine(st);
//Sin @ sería:
Console.WriteLine(st2);

Console.WriteLine("\n4)");
//
Console.WriteLine("Ingrese su nombre:");
string name = Console.ReadLine();
if(name == "")
{
    Console.WriteLine("Hola Mundo");
}
else
{
    Console.WriteLine($"Hola {name}");
}

Console.WriteLine("\n5)");
//
Console.WriteLine("Ingrese su nombre:");
string name2 = Console.ReadLine();
if(name2 == "Juan")
{
    Console.WriteLine("Hola amigo!");
}
else if(name2 == "Maria")
{
    Console.WriteLine("Buen día, señora");
}
else if(name2 == "Alberto")
{
    Console.WriteLine("Hola Alberto");
}
else if(name2 == "")
{
    Console.WriteLine("¡Buen día mundo!");
}
else
{
    Console.WriteLine($"Buen día {name2}");
}

Console.WriteLine("Ingrese su nombre:");
string name3 = Console.ReadLine();
switch(name3)
{
    case "Juan":
        Console.WriteLine("Hola amigo!");
    break;

    case "Maria":
        Console.WriteLine("Buen día señora");
    break;

    case "Alberto":
        Console.WriteLine("Hola Alberto");
    break;

    case "":
        Console.WriteLine("¡Buen día mundo!");
    break;
    
    default:
        Console.WriteLine($"Buen dia {name3}");
    break;

}

// ^ choclazo

Console.WriteLine("\n6)");
//
Console.WriteLine(Console.ReadLine().Length);

Console.WriteLine("\n7)");
//Console.WriteLine("100".Length); devuelve la cantidad de caracteres del contenido entre las " "

Console.WriteLine("\n8)");
//Sí, sí es válida

Console.WriteLine("\n9)");
// Tengo una posible idea de cómo hacer esto pero dudoso
Console.WriteLine("Ingrese las palabras separadas por un espacio");
string palabra = Console.ReadLine();

Console.WriteLine("~");

string[] caracteres = palabra.Split(' ');

string palabra1 = caracteres[0];
char[] arreglo = caracteres[1].ToArray();
Array.Reverse(arreglo);
string palabra2 = new string(arreglo);

string msg = (palabra1 == palabra2) ? "Simétricas" : "No simétricas";

Console.WriteLine(msg);

Console.WriteLine("\n10)");
// Múltiplos de 17 y 29 entre 1 y 1000

for(int i = 1; i<=1000; i++)
{
    if(i % 17 == 0 || i % 29 == 0)
    {
        //Console.WriteLine(i); //Lo dejo comentado porque es alto spam
    }
}

Console.WriteLine("\n11)");
//a) El operador / da el cociente, % da el resto
//b) Concatena el string y el número, no modifica el valor ni nada por el estilo

Console.WriteLine("10/3 = " + 10 / 3);
Console.WriteLine("10.0/3 = " + 10.0 / 3);
Console.WriteLine("10/3.0 = " + 10 / 3.0);
int a = 10, b = 3;
Console.WriteLine("Si a y b son variables enteras, si a=10 y b=3");
Console.WriteLine("entonces a/b = " + a / b);
double c = 3;
Console.WriteLine("Si c es una variable double, c=3");
Console.WriteLine("entonces a/c = " + a / c);

Console.WriteLine("\n12)");
//usar int.Parse(st)

string numero = Console.ReadLine();
int.Parse(numero);

for(int i = 1; i<=int.Parse(numero); i++)
{
    if(int.Parse(numero) % i == 0)
    {
        //Console.WriteLine(i);
    }
}

Console.WriteLine("\n13)");
//El error sería que la segunda condición se evalúa igualmente, entonces hace la división por 0
//La solución sería reemplazar el & por &&
string jj = Console.ReadLine();
int j = int.Parse(jj);
string kk = Console.ReadLine();
int k = int.Parse(kk);
if((k != 0) & (j/k > 5))
{
    Console.WriteLine(j/k);
}

Console.WriteLine("\n14)");

int numerito1 = int.Parse(Console.ReadLine());
int numerito2 = int.Parse(Console.ReadLine());
int numeroMenor = (numerito1 < numerito2) ? numerito1 : numerito2;
Console.WriteLine(numeroMenor + " es el menor");

Console.WriteLine("\n15)");
//El problema del código es que se está definiendo la variable i 2 veces, fuera y dentro del for

/**int i = 0;
for (int i = 1; i <= 10;)
{
Console.WriteLine(i++);
} **/
//Cosito para que no se me cierre la consola en la cara

Console.WriteLine("\n16)");
// cero, cero, 1
// --i modifica el valor y después evalua (0)
// i++ evalua y despues modifica el valor (1)
// Después se imprime el valor final de i (1)

/**int i = 1;
if (--i == 0)
{
    Console.WriteLine("cero");
}
if (i++ == 0)
{
    Console.WriteLine("cero");
}

Console.WriteLine(i);**/

Console.ReadKey();
