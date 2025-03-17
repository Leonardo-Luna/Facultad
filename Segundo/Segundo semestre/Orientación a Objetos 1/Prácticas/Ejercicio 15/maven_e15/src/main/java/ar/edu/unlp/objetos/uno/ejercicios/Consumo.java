package ar.edu.unlp.objetos.uno.ejercicios;

public class Consumo {
	
	private double consumoEA;
	private double consumoER;
	
	public Consumo(double a, double r) {
		this.consumoEA = a;
		this.consumoER = r;
	}
	
	public double getEnergiaReactiva() {
		return this.consumoER;
	}
	
	public boolean calcularFPE() {
		double suma = Math.pow(this.consumoEA, 2) + Math.pow(this.consumoEA, 2);
		suma = Math.sqrt(suma);
		
		double fpa = this.consumoEA / suma;
		
		return (fpa > 0.8);
		
	}
	
	public double calcularConsumoEA(double preciokWh) {
		return this.consumoEA * preciokWh;
	}

}
