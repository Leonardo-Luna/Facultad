namespace Autos;

public class Auto
{
    private string _marca;
    private int _modelo;
    public Auto(string marca, int modelo)
    {
        _marca = marca;
        _modelo = modelo;
    }
    public Auto()
    {
        _marca = "Fiat";
        _modelo = DateTime.Now.Year;
    }
    public Auto(string marca) : this()
    {
        ;
    }
    public string GetDescripcion() =>
        $"Auto {_marca} {_modelo}";
}
