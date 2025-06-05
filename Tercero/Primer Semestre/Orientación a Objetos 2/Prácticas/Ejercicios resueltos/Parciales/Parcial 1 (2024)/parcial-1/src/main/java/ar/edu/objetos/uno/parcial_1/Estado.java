package ar.edu.objetos.uno.parcial_1;

public abstract class Estado {

	private Prestamo prestamo;
	
	public Prestamo getPrestamo() {
		return this.prestamo;
	}
	
	public void pagarCuota() {
		throw new Error("No se pueden pagar cuotas de este préstamo.");
	}
	
	public abstract double calcularCancelacion();
	
}
