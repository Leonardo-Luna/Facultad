
public class Producto {

	private double peso;
	private double precioPorKilo;
	private String descripcion;
	
	public Producto() {
		
	}
	
	public double getPrecio() {
		return this.precioPorKilo * this.peso;
	}
	
}
