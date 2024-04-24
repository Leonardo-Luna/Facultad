namespace Almacen.Aplicacion;

public class ListarProductosUseCase(IRepositorioProducto repo)
{

    public List<Producto> Ejecutar()
    {
        return repo.ListarProductos();
    }

}