package ar.edu.unlp.objetos.uno.ejercicios;

import java.util.*;

public class Balanza {
	
	private List<Producto> productos;
	
	public Balanza() {
		this.productos = new LinkedList<Producto>();
	}
	
	public void ponerEnCero() {
		this.productos.clear();
	}
	
	public void agregarProducto(Producto producto) {
		this.productos.add(producto);
	}
	
	public Ticket emitirTicket() {
		Ticket t = new Ticket(this.productos);
		return t;
	}
	
	public List<Producto> getProductos() {
		return this.productos;
	}
	
	public double getPesoTotal() {
		return this.productos.stream().mapToDouble(Producto::getPeso).sum();
	}
	
	public double getPrecioTotal() {
		return this.productos.stream().mapToDouble(Producto::getPrecio).sum();
	}
	
	public int getCantidadDeProductos() {
		return this.productos.size();
	}
	
}
