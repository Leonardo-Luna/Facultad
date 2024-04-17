using System.Runtime.ExceptionServices;

class Matriz
{

    private double[,] _matriz;

    public Matriz(int filas, int columnas)
    {

        this._matriz = new double[filas,columnas];

    }

    public Matriz(double[,] matriz)
    {

        this._matriz = matriz;

    }

    public void SetElemento(int fila, int columna, double elemento)
    {

        this._matriz[fila-1,columna-1] = elemento;

    }

    public double GetElemento(int fila, int columna)
    {

        return this._matriz[fila-1,columna-1];

    }

    public void Imprimir()
    {

        int f = this._matriz.GetLength(0);
        int c = this._matriz.GetLength(1);

        for(int i = 0; i < f; i++)
        {

            for(int j = 0; j < c; j++)
            {

                Console.Write($"{this._matriz[i,j]}\t");

            }

            Console.WriteLine("");

        }

    }

    public void Imprimir(string formatString)
    {

        int f = this._matriz.GetLength(0);
        int c = this._matriz.GetLength(1);

        for(int i = 0; i < f; i++)
        {

            for(int j = 0; j < c; j++)
            {

                Console.Write($"{this._matriz[i,j].ToString(formatString)}\t");

            }

            Console.WriteLine("");

        }

    }

    public double[] GetFila(int fila)
    {

        int l = this._matriz.GetLength(1);
        double[] filaArray = new double[l];

        for(int i = 0; i<l; i++)
        {

            filaArray[i] = this._matriz[fila-1, i];

        }

        return filaArray;

    }

    public double[] GetColumna(int columna)
    {

        int l = this._matriz.GetLength(0);
        double[] columnaArray = new double[l];

        for(int i = 0; i<l; i++)
        {

            columnaArray[i] = this._matriz[i, columna-1];

        }

        return columnaArray;

    }

    public double[] GetDiagonalPrincipal()
    {

        if(this._matriz.GetLength(0) == this._matriz.GetLength(1))
        {
        
            int l = this._matriz.GetLength(0);
            double[] diag = new double[l];

            for(int i = 0; i < l; i++)
            {

                diag[i] = this._matriz[i,i];

            }

            return diag;
        }
        else
        {
            throw new IndexOutOfRangeException("La matriz enviada debe ser cuadrada.");
        }

    }

    public double[] GetDiagonalSecundaria()
    {

        if(this._matriz.GetLength(0) == this._matriz.GetLength(1))
        {

            int l = this._matriz.GetLength(0);
            double[] diag = new double[l];

            for(int i = l-1; i >= 0; i--)
            {

                diag[i] = this._matriz[i,i];

            }

            return diag;

        }
        else
        {
            throw new IndexOutOfRangeException("La matriz enviada debe ser cuadrada.");
        }

    }

    public double[][] GetArregloDeArreglo()
    {

        int f = this._matriz.GetLength(0);
        int c = this._matriz.GetLength(1);

        double[][] arr = new double[f][]; //Creo las filas

        for(int i = 0; i < f; i++) 
        {

            arr[i] = new double[c]; //Creo las columnas


            for(int j = 0; j < c; j++)
            {

                arr[i][j] = this._matriz[i,j]; //Cargo los datos

            }

        }

        return arr;

    }

    public bool EsCuadrada()
    {

        return (this._matriz.GetLength(0) == this._matriz.GetLength(1));

    }

    public int GetFilas()
    {

        return this._matriz.GetLength(0);

    }

    public int GetColumnas()
    {

        return this._matriz.GetLength(1);

    }

    public void Sumar(Matriz m)
    {

        int f = this._matriz.GetLength(0);
        int c = this._matriz.GetLength(1);
        
        int f2 = m.GetFilas();
        int c2 = m.GetColumnas();

        if(f == f2 && c == c2)
        {

            for(int i = 0; i < f; i++)
            {

                for(int j = 0; j < c; j++)
                {

                    this._matriz[i,j] += m.GetElemento(i+1,j+1);

                }

            }

        }
        else
        {
            throw new IndexOutOfRangeException("Ambas matrices deben tener la misma dimensión.");
        }

    }

    public void Restar(Matriz m)
    {

        int f = this._matriz.GetLength(0);
        int c = this._matriz.GetLength(1);
        
        int f2 = m.GetFilas();
        int c2 = m.GetColumnas();

        if(f == f2 && c == c2)
        {

            for(int i = 0; i < f; i++)
            {

                for(int j = 0; j < c; j++)
                {

                    this._matriz[i,j] -= m.GetElemento(i+1,j+1);

                }

            }

        }
        else
        {
            throw new IndexOutOfRangeException("Ambas matrices deben tener la misma dimensión.");
        }

    }

    public void Multiplicar(Matriz m)
    {

        int f = this._matriz.GetLength(0);
        int c = this._matriz.GetLength(1);
        
        int f2 = m.GetFilas();
        int c2 = m.GetColumnas();

        if(c == f2)
        {

            double[,] resultado = new double[f,c2];

            for(int i = 0; i < f; i++)
            {

                for(int j = 0; j < c2; j++)
                {

                    double elem = 0;
                    int l = 0;

                    for(int k = 0; k < c; k++)
                    {

                        elem += this._matriz[0,k] * m.GetElemento(k+1,0+1);
                        Console.Write(this._matriz[0,k] + " " + m.GetElemento(k+1,0+1));

                    } Console.WriteLine("");

                    l++;

                    resultado[i,j] = elem;
                    //Console.WriteLine(resultado[i,j]);

                }

            }

        }
        else
        {

            throw new IndexOutOfRangeException("La cantidad de columnas de la matriz X debe ser igual a la cantidad de filas de la matriz Y.");

        }

    }

}