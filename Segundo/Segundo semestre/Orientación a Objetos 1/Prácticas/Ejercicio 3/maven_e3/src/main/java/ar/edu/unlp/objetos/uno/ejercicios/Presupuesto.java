package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.util.*;

public class Presupuesto {
	
	private LocalDate fecha;
	private String cliente;
	private List<Item> items;
	
	public Presupuesto(String c) {
		this.cliente = c;
		this.fecha = LocalDate.now();
		this.items = new LinkedList<Item>();
	}
	
	public void agregarItem(Item item) {
		this.items.add(item);
	}
	
	public double  calcularTotal() {
		return this.items.stream().mapToDouble(Item::costo).sum(); // Preguntar esta parte
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public String getCliente() {
		return this.cliente;
	}

}
