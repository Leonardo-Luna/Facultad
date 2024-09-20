package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.util.*;

public class Ticket {

	private LocalDate fecha;
    private int cantidadDeProductos;
    private double pesoTotal;
    private double precioTotal;
    private List<Producto> lista;
	
	public Ticket(List<Producto> prod, int cant, double peso, double precio) {
		this.fecha = LocalDate.now();
		this.cantidadDeProductos = cant;
		this.pesoTotal = peso;
		this.precioTotal = precio;
		this.lista = prod;
		
		// El ticket no debe encargarse de calcular nada. Solo de imprimir.
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
