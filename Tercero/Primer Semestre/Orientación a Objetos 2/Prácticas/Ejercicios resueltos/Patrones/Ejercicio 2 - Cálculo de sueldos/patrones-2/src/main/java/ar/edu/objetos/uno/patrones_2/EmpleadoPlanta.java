package ar.edu.objetos.uno.patrones_2;

public class EmpleadoPlanta extends Empleado {
	
	private int aniosAntiguedad;
	private boolean casado;
	private int cantidadHijos;
	
	public EmpleadoPlanta(int aniosAntiguedad, boolean casado, int cantidadHijos) {
		this.aniosAntiguedad = aniosAntiguedad;
		this.casado = casado;
		this.cantidadHijos = cantidadHijos;
	}
	
	@Override
	public double calcularBasico() {
		return 50000;
	}
	
	public double calcularAdicional() {
		double bonus = 0;
		
		if(this.casado) {
			bonus = 5000;
		}
		
		int multiplicador = this.cantidadHijos + this.aniosAntiguedad;
		return super.calcularAdicional(multiplicador) + bonus;
	}
	
}
