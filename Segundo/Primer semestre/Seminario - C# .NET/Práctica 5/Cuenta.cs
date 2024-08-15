namespace p5
    {

    public class Cuenta
    {

        private int _monto = 0;
        private static int _id = 0;
        private int id;
        private static int totalDepositado = 0;
        private static int totalExtraido = 0;
        private static int cantDepositos = 0;
        private static int cantExtracciones = 0;
        private static int cantErrores = 0;
        private static int montoTotal = 0;
        private readonly static List<Cuenta> lista = new List<Cuenta>();

        public Cuenta()
        {
            Cuenta._id++;
            id = Cuenta._id;
            Console.WriteLine($"Se creó la cuenta ID: {this.id}");
            Cuenta.lista.Add(this);
        }

        public Cuenta Depositar(int monto)
        {

            this._monto += monto;
            Cuenta.totalDepositado += monto;
            Cuenta.cantDepositos++;
            Cuenta.montoTotal += monto;
            Console.WriteLine($"Se depositó {monto} en la cuenta {this.id}. Saldo: {this._monto}");
            return this;

        }

        public Cuenta Extraer(int monto)
        {

            if(monto <= this._monto)
            {
                Console.WriteLine($"Se extrajo {monto} de la cuenta {this.id}. Saldo: {this._monto}");
                this._monto -= monto;
                Cuenta.cantExtracciones++;
                Cuenta.totalExtraido += monto;
                Cuenta.montoTotal -= monto;
            }
            else
            {
                Console.WriteLine("Operación denegada - Saldo insuficiente.");
                Cuenta.cantErrores++;
            }
            return this;

        }

        public static void ImprimirDetalle()
        {

            Console.WriteLine($"CUENTAS CREADAS: {Cuenta._id}");
            Console.WriteLine($"DEPÓSITOS {Cuenta.cantDepositos}\t\t- Total depositado: {Cuenta.totalDepositado}");
            Console.WriteLine($"EXTRACCIONES {Cuenta.cantExtracciones}\t\t- Total extraído {Cuenta.totalExtraido}");
            Console.WriteLine($"\t\t\t- Saldo {Cuenta.montoTotal}");
            Console.WriteLine($"* Se denegaron {Cuenta.cantErrores} por falta de fondos.");

        }

        public static List<Cuenta> GetCuentas()
        {

            List<Cuenta> listaCopia = new List<Cuenta>(Cuenta.lista);

            return listaCopia;

        }

    }
}