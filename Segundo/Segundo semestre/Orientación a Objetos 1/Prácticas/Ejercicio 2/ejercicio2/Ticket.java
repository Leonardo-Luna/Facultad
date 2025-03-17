import java.time.LocalDate;

public class Ticket {

	private LocalDate fecha;
	private int cantidadDeProductos;
	private double pesoTotal;
	private double precioTotal;
	
	public Ticket(int cant, double peso, double precio) {
		this.fecha = LocalDate.now()
		this.cantidadDeProductos = cant;
		this.pesoTotal = peso;
		this.precioTotal = precio;
	}
	
	public double impuesto() {
		return this.precioTotal*0.21;
	}
	
}
