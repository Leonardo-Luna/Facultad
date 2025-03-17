package ar.edu.unlp.objetos.uno.ejercicios;

public class Producto {

	private double peso;
	private double precioPorKilo;
	private String descripcion;
	
	public Producto() {
		
	}
	
	public double getPrecio() {
		return this.precioPorKilo * this.peso;
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public String getDescripcion() {
		return this.descripcion;
	}
	
	public double getPrecioPorKilo() {
		return this.precioPorKilo;
	}
	
	public void setDescripcion(String desc) {
		this.descripcion = desc;
	}
	
	public void setPeso(double p) {
		this.peso = p;
	}
	
	public void setPrecioPorKilo(double p) {
		this.precioPorKilo = p;
	}
	
	@Override
	public String toString() {
		return this.descripcion + " - " + this.peso + "Kg * " + this.precioPorKilo;
	}
	
}
