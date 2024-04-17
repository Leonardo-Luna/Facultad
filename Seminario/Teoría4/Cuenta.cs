class Cuenta
{
    private double _monto;
    private string? _titularDNI;
    private string? _titularNobre;

    public Cuenta()
    {

        this._monto = 0;
        this._titularNobre = "No especificado";
        this._titularDNI = "No especificado";

    }

    public Cuenta(string nombre, int dni) : this()
    {

        this._titularNobre = nombre;
        this._titularDNI = $"{dni}";

    }

    public Cuenta(string nombre) : this()
    {

        this._titularNobre = nombre;

    }

    public Cuenta(int dni) : this()
    {

        this._titularDNI = $"{dni}";

    }

    public void Depositar(int monto)
    {

        this._monto += monto;

    }

    public void Extraer(int monto)
    {

        if(this._monto >= monto)
        {
            Console.WriteLine("Operación exitosa.");
            this._monto -= monto;
        }
        else
        {
            Console.WriteLine("Operación cancelada, monto insuficiente.");
        }

    }

    public void Imprimir()
    {

        Console.WriteLine($"Nombre: {this._titularNobre}, DNI: {this._titularDNI}, Monto: {this._monto}.");

    }

}