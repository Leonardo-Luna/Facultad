import java.time.LocalDate;

public class Ticket {

	private LocalDate fecha;
	private int cantidadDeProductos;
	private double pesoTotal;
	private double precioTotal;
	
	public Ticket(Balanza b) {
		this.fecha = LocalDate.now()
		this.cantidadDeProductos = b.getCantidadDeProductos();
		this.pesoTotal = b.getPesoTotal();
		this.precioTotal = b.getPrecioTotal;
	}
	
	public double impuesto() {
		return this.precioTotal*0.21;
	}
	
}
