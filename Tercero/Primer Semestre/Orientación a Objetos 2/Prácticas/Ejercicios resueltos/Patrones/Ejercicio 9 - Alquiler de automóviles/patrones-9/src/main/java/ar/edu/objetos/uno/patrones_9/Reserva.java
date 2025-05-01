package ar.edu.objetos.uno.patrones_9;

import java.time.LocalDate;

public class Reserva {
	
	private int cantidadDias;
	private LocalDate fecha;
	private AutoEnAlquiler autoEnAlquiler;
	
	public Reserva(int cantidadDias, LocalDate fecha, AutoEnAlquiler autoEnAlquiler) {
		this.cantidadDias = cantidadDias;
		this.fecha = fecha;
		this.autoEnAlquiler = autoEnAlquiler;
	}
	
	public double montoAPagar() {
		return this.cantidadDias * this.autoEnAlquiler.getPrecioPorDia();
	}
	
	public double montoAReembolsar() {
		return this.autoEnAlquiler.getPoliticaCancelacion().calcularMontoAReembolsar(this);
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}

}
