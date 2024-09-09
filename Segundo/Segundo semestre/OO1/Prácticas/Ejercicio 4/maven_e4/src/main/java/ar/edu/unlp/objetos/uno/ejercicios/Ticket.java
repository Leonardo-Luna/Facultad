package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.util.*;

public class Ticket {

	private LocalDate fecha;
	private List<Producto> listaProductos;
	
	public Ticket(List<Producto> prod) {
		this.fecha = LocalDate.now();
		this.listaProductos = prod;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public int getCantidadDeProductos() {
		return this.listaProductos.size();
	}
	
	public double getPrecioTotal() {
		System.out.println(this.listaProductos.size());
		System.out.println(this.listaProductos.stream().mapToDouble(Producto::getPrecio).sum());
		return this.listaProductos.stream().mapToDouble(Producto::getPrecio).sum();
	}
	
	public double getPesoTotal() {
		return this.listaProductos.stream().mapToDouble(Producto::getPeso).sum();
	}
	
	public double impuesto() {
		return listaProductos.stream().mapToDouble(Producto::getPrecio).sum()*0.21;
	}
	
}
