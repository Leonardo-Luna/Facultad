package ar.edu.objetos.uno.parcial_1;

public class EstadoRechazado extends Estado {
	
	public double calcularCancelacion() {
		throw new Error("El préstamo fue rechazado, no se puede cancelar.");
	}

}
