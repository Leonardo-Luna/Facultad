package ar.edu.objetos.uno.patrones_2;

public class EmpleadoTemporario extends Empleado {
	
	private double horasTrabajadas;
	private boolean casado;
	private int cantidadHijos;
	
	public EmpleadoTemporario(double horasTrabajadas, boolean casado, int cantidadHijos) {
		this.horasTrabajadas = horasTrabajadas;
		this.casado = casado;
		this.cantidadHijos = cantidadHijos;
	}
	
	public double calcularBasico() {
		return super.calcularBasico() + (this.horasTrabajadas * 300);
	}
	
	public double calcularAdicional() {
		double bonus = 0;
		
		if(this.casado) {
			bonus = 5000;
		}
		
		return super.calcularAdicional(this.cantidadHijos) + bonus;
	}

}
