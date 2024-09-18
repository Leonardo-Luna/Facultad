package ar.edu.unlp.objetos.uno.ejercicios;

public class Cuerpo3D {
	
	private double altura;
	private Cara caraBasal;
	
	public Cuerpo3D() {
		
	}
	
	public double getAltura() {
		return this.altura;
	}
	
	public double getVolumen() {
		return this.caraBasal.getArea() * this.altura;
	}
	
	public double getSuperficieExterior() {
		return (2 * this.caraBasal.getArea()) + (this.caraBasal.getPerimetro() * this.altura);
	}
	
	public void setAltura(double a) {
		this.altura = a;
	}
	
	public void setCaraBasal(Cara c) {
		this.caraBasal = c;
	}

}
