namespace p5
{

    public class Matriz
    {

        private double[,] _matriz;

        public double this[int fila, int columna]
        {
            get { return this._matriz[fila-1, columna-1]; }
            set { this._matriz[fila-1, columna-1] = value; }
        }

        public double[] DiagonalPrincipal
        {
            get {
                
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

            ;}
        }

        public double[] DiagonalSecundaria
        {
            get
            {

                if(this._matriz.GetLength(0) == this._matriz.GetLength(1))
                {

                    int l = this._matriz.GetLength(0);
                    double[] diag = new double[l];
                    int j = 0;

                    for(int i = l-1; i >= 0; i--)
                    {

                        diag[i] = this._matriz[i,j++];

                    }

                    return diag;

                }
                else
                {
                    throw new IndexOutOfRangeException("La matriz enviada debe ser cuadrada.");
                }

            ;}

        }

        public Matriz(int filas, int columnas)
        {

            this._matriz = new double[filas,columnas];

        }

        public Matriz(double[,] matriz)
        {

            this._matriz = matriz;

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

    }
    
}