package ar.edu.unlp.objetos.uno.ejercicios;

public class Circulo implements Cara {

	private double radio;
	private double diametro;

	public Circulo() {
	}
	
	public double getDiametro() {
		return this.diametro;
	}
	
	public void setDiametro(double d) {
		this.diametro = d;
		this.radio = d/2;
	}
	
	public double getRadio() {
		return this.radio;
	}
	
	public void setRadio(double r) {
		this.radio = r;
		this.diametro = r*2;
	}
	
	public double getPerimetro() {
		return Math.PI * this.diametro;
	}
	
	public double getArea() {
		return Math.PI * (Math.pow(this.radio, 2));
	}
	
}
