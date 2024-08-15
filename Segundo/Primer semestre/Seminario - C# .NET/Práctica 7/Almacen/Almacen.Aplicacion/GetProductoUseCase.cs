namespace Almacen.Aplicacion;

public class GetProductoUseCase(IRepositorioProducto repo)
{

    public Producto? Ejecutar(int id)
    {
        return repo.GetProducto(id);
    }

}