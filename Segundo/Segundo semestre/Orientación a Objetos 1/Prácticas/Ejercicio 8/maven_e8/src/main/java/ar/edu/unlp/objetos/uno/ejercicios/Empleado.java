package ar.edu.unlp.objetos.uno.ejercicios;

public class Empleado {
	
	public Empleado() {
		
	}
	
	public double montoBasico() {
		return 35000;
	}
	
	public double aportes() {
		return 13500;
	}
	
	public double sueldoBasico() {
		return this.montoBasico() + this.aportes();
	}

}
