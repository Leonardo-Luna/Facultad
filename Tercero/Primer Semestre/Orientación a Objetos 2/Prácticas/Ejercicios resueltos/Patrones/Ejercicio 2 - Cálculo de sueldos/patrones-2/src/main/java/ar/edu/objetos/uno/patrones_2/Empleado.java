package ar.edu.objetos.uno.patrones_2;

public abstract class Empleado {
	
	public Empleado() {}
	
	public double calcularBasico() {
		return 20000;
	}
	
	protected double calcularAdicional(int multiplicador) {
		return 2000 * multiplicador;
	}

	protected double calcularDescuento(int multiplicador) {
		return -(this.calcularBasico() * 0.13 + this.calcularAdicional(multiplicador) * 0.05);
	}
	
}
