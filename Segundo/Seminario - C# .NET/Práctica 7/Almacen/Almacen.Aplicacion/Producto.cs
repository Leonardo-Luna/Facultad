namespace Almacen.Aplicacion;

public class Producto
{

    public int Id { get; set; }
    private static int idStatic = 0;
    public string Nombre { get; set; } = "";
    public double Precio { get; set; }

    public Producto()
    {
        Id = ++idStatic;
    }

    public override string ToString() { return $"{Nombre} ${Precio} (Id:{Id})"; }
    
}