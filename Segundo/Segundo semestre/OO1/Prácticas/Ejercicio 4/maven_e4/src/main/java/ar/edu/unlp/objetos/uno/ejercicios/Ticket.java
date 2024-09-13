package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.util.*;

public class Ticket {

	private LocalDate fecha;
    private int cantidadDeProductos;
    private double pesoTotal;
    private double precioTotal;
	
	public Ticket(List<Producto> prod) {
		this.fecha = LocalDate.now();
		this.cantidadDeProductos = prod.size();
		this.pesoTotal = prod.stream().mapToDouble(p -> p.getPeso()).sum();
		this.precioTotal = prod.stream().mapToDouble(p -> p.getPrecio()).sum();
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadDeProductos;
	}
	
	public double getPrecioTotal() {
		return this.precioTotal;
	}
	
	public double getPesoTotal() {
		return this.pesoTotal;
	}
	
	public double impuesto() {
		return this.precioTotal*0.21;
	}
	
}
