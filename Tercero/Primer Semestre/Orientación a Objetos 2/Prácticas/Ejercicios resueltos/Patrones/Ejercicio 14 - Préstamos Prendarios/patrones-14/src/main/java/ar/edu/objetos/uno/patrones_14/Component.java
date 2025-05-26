package ar.edu.objetos.uno.patrones_14;

public abstract class Component {
	
	public double calcularValorPrendario() {
		return this.getValor() * this.getLiquidez();
	}
	
	public abstract double getValor();
	public abstract double getLiquidez();
}
