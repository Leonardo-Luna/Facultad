package ar.edu.objetos.uno.parcial_2;

import java.util.ArrayList;

public class Presupuesto {
	
	private String nombreCliente;
	private ArrayList<Componente> componentes;
	
	public Presupuesto() {
		this.componentes = new ArrayList<Componente>();
	}
	
	public void setCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}
	
	public void agregarComponente(Componente componente) {
		this.componentes.add(componente);
	}
	
	public double calcularConsumo() {
		return this.componentes.stream()
				.mapToDouble(c -> c.getConsumo())
				.sum();
	}
	
	public double calcularPrecio() {
		return this.componentes.stream()
				.mapToDouble(c -> c.getPrecio())
				.sum() * 1.21;
	}

}
