package ar.edu.objetos.uno.patrones_11;

public class Hoja implements Topografia {
	
	private double proporcion;
	
	public Hoja(int proporcion) {
		this.proporcion = proporcion;
	}
	
	public double getProporcion() {
		return this.proporcion;
	}
	
	public void setProporcion(int proporcion) {
		this.proporcion = proporcion;
	}
	
	public double calcularProporcion() {
		return this.proporcion;
	}
	
	@Override
	public boolean iguales(Topografia topografia) {
		
		return false; // Tengo el cerebro demasiado quemado para sentarme con esta materia :D
		
	}

}
