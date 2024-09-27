package ar.edu.unlp.objetos.uno.ejercicios;

public class EmpleadoJerarquico extends Empleado {

	public EmpleadoJerarquico() {
		
	}
	
	public double sueldoBasico() {
		return super.sueldoBasico() + this.bonoPorCategoria();
	}
	
	public double montoBasico() {
		return 45000;
	}
	
	public double bonoPorCategoria() {
		return 8000;
	}
}
