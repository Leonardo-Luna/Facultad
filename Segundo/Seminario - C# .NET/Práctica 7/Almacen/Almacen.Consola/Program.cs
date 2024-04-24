using Almacen.Aplicacion;
using Almacen.Repositorios;

//configuro las dependencias
IRepositorioProducto repo = new RepositorioProductoTXT();
ProductoValidador validador = new ProductoValidador();

//creo los casos de uso
var agregarProducto = new AgregarProductoUseCase(repo, validador);
var listarProducto = new ListarProductosUseCase(repo);
var getProducto = new GetProductoUseCase(repo);
var ModificarProducto = new ModificarProductoUseCase(repo);

//ejecuto los casos de uso
agregarProducto.Ejecutar(new Producto() { Nombre="Yerba",Precio=1000});
agregarProducto.Ejecutar(new Producto() { Nombre="Azúcar",Precio=500});
agregarProducto.Ejecutar(new Producto() { Nombre="Leche",Precio=300});
agregarProducto.Ejecutar(new Producto() { Nombre="Caramelo",Precio=20});
agregarProducto.Ejecutar(new Producto() { Nombre="Yogurt",Precio=700});
agregarProducto.Ejecutar(new Producto() { Nombre="Agua",Precio=250});
agregarProducto.Ejecutar(new Producto() { Nombre="Papel",Precio=800});

Producto? busqueda = getProducto.Ejecutar(5);
Console.WriteLine(busqueda);

var lista = listarProducto.Ejecutar();

foreach(Producto p in lista)
{
  Console.WriteLine(p);
}

Console.ReadKey();