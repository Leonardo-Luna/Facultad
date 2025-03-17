package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;

public class Vehiculo {

	private String descripcion;
	private int capacidad;
	private int anio;
	private double valor;
	private Conductor conductor;
	
	public Vehiculo(String d, int c, int a, double v, Conductor cond) {
		this.descripcion = d;
		this.capacidad = c;
		this.anio = a;
		this.valor = v;
		this.conductor = cond;
	}
	
	public int getComision() {
		int act = LocalDate.now().getYear();
		return ((act - anio) < 5) ? 1 : 10;
	}
	
	public int getCapacidad() {
		return this.capacidad;
	}
	
	public double getPorcentaje() {
		return (this.valor*0.1)/100;
	}
	
}
