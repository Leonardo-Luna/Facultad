namespace Almacen.Aplicacion;

public class ModificarProductoUseCase(IRepositorioProducto repo)
{

    public void Ejecutar(Producto producto)
    {

        repo.ModificarProducto(producto);

    }

}