package ar.edu.unlp.objetos.uno.ejercicios;

public class CuadroTarifario {

	private double preciokWh;
	
	public CuadroTarifario(double p) {
		this.preciokWh = p;
	}
	
	public void setPrecio(double p) {
		this.preciokWh = p;
	}
	
	public double getPrecio() {
		return this.preciokWh;
	}
	
}
