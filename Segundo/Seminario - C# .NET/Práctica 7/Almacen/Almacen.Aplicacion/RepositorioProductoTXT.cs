namespace Almacen.Repositorios;
using Almacen.Aplicacion;

public class RepositorioProductoTXT : IRepositorioProducto
{

    readonly string _nombreArch = "productos.txt";
    public void AgregarProducto(Producto producto)
    {

        using var sw = new StreamWriter(_nombreArch, true);
        sw.WriteLine(producto.Id);
        sw.WriteLine(producto.Nombre);
        sw.WriteLine(producto.Precio);

    }

    public List<Producto> ListarProductos()

    {
        var resultado = new List<Producto>();
        using var sr = new StreamReader(_nombreArch);
        while (!sr.EndOfStream)
        {
            var producto = new Producto();
            producto.Id = int.Parse(sr.ReadLine() ?? "");
            producto.Nombre = sr.ReadLine() ?? "";
            producto.Precio = int.Parse(sr.ReadLine() ?? "");
            resultado.Add(producto);
        }
        return resultado;

    }

    public Producto? GetProducto(int id)
    {

        using var sr = new StreamReader(_nombreArch);
        bool encontre = false;
        var producto = new Producto();

        while((!sr.EndOfStream) && (!encontre))
        {

            producto.Id = int.Parse(sr.ReadLine() ?? "");
            producto.Nombre = sr.ReadLine() ?? "";
            producto.Precio = int.Parse(sr.ReadLine() ?? "");

            if(producto.Id == id)
            {
                encontre = true;
            }

        }

        if(encontre)
        {
            return producto;
        }
        else
        {
            return null;
        }

    }

    public void ModificarProducto(Producto producto)
    {

        

    }

}