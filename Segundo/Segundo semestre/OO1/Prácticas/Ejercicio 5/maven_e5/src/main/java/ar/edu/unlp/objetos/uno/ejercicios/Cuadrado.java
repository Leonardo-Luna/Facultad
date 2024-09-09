package ar.edu.unlp.objetos.uno.ejercicios;

public class Cuadrado implements Cara {
	
	private double lado;
	
	public Cuadrado() {
		
	}
	
	public void setLado(double l) {
		this.lado = l;
	}
	
	public double getLado() {
		return this.lado;
	}
	
	public double getPerimetro() {
		return this.lado * 4;
	}
	
	public double getArea() {
		return Math.pow(lado, 2);
	}

}
