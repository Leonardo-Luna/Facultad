package ar.edu.unlp.objetos.uno.ejercicios;

public class PrismaRectangular extends Pieza {
	
	private int ladoMenor;
	private int ladoMayor;
	private int altura;
	
	public PrismaRectangular(String material, String color, int ladoMenor, int ladoMayor, int altura) {
		super(material, color);
		this.ladoMayor = ladoMayor;
		this.ladoMenor = ladoMenor;
		this.altura = altura;
	}
	
	public double calcularVolumen() {
		return this.ladoMayor * this.ladoMenor * this.altura;
	}
	
	public double calcularSuperficie() {
		return 2 * (this.ladoMayor * this.ladoMenor + this.ladoMayor * this.altura + this.ladoMenor * this.altura);
	}

}
