package ar.edu.objetos.uno.patrones_2;

public class EmpleadoPasante extends Empleado {

	private int cantidadExamenes;
	
	public EmpleadoPasante(int cantidadExamenes) {
		this.cantidadExamenes = cantidadExamenes;
	}
	
	public double calcularDescuento() {
		return super.calcularDescuento(this.cantidadExamenes);
	}
	
	public double calcularAdicional() {
		return super.calcularAdicional(this.cantidadExamenes);
	}
	
}
