package ar.edu.unlp.objetos.uno.ejercicios;

public class Esfera extends Pieza {
	
	private int radio;
	
	public Esfera(String material, String color, int radio) {
		super(material, color);
		this.radio = radio;
	}
	
	public double calcularVolumen() {
		return (4/3) * Math.PI * Math.pow(this.radio, 3);
	}
	
	public double calcularSuperficie() {
		return 4 * Math.PI * Math.pow(this.radio, 2);
	}
	
}
