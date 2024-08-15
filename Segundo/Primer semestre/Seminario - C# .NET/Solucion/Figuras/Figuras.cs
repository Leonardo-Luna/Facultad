namespace Figuras;

public class Circulo
{

    private double _radio;
    private const double pi = Math.PI;

    public Circulo(double radio)
    {

        this._radio =  radio;

    }

    public double GetArea()
    {

        return (Math.Pow(this._radio, 2)*pi);

    }

}

public class Rectangulo
{

    private double _largo;
    private double _ancho;

    public Rectangulo(double largo, double ancho)
    {

        this._largo = largo;
        this._ancho = ancho;   

    }

    public double GetArea()
    {

        return (this._largo * this._ancho);
        
    }

}
