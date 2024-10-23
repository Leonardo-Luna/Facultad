package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;

public class Factura {

	private Usuario usuario;
	private LocalDate fecha;
	private double bonificacion;
	private double montoTotal;
	
	public Factura(Usuario u, LocalDate f, double b, double m) {
		this.usuario = u;
		this.fecha = f;
		this.bonificacion = b;
		this.montoTotal = m;
	}
	
	@Override
	public String toString() {
		return this.usuario.getNombre() + " - total a pagar: " + this.montoTotal;
	}
	
}
