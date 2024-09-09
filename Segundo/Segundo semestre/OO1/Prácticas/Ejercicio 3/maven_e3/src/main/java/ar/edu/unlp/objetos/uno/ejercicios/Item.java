package ar.edu.unlp.objetos.uno.ejercicios;

public class Item {

	private String detalle;
	private int cantidad;
	private double costoUnitario;
	
	public Item(String detalle, int cant, double costoU) {
		this.detalle = detalle;
		this.cantidad = cant;
		this.costoUnitario = costoU;
	}
	
	public double costo() {
		return cantidad*costoUnitario;
	}
	
	public double getCostoUnitario() {
		return this.costoUnitario;
	}
	
	public int getCantidad() {
		return this.cantidad;
	}
	
	public String getDetalle() {
		return this.detalle;
	}
	
}
