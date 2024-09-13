package ar.edu.unlp.objetos.uno.ejercicios;

public class Circulo implements Cara {

	private double radio;

	public Circulo() {
	}
	
	public double getDiametro() {
		return this.radio*2;
	}
	
	public void setDiametro(double d) {
		this.radio = d/2;
	}
	
	public double getRadio() {
		return this.radio;
	}
	
	public void setRadio(double r) {
		this.radio = r;
	}
	
	public double getPerimetro() {
		return Math.PI * (this.radio*2);
	}
	
	public double getArea() {
		return Math.PI * (Math.pow(this.radio, 2));
	}
	
}
