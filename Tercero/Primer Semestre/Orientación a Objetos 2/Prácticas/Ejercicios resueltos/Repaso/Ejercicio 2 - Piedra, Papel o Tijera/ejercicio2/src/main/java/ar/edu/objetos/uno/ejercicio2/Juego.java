package ar.edu.objetos.uno.ejercicio2;

abstract class Juego {

	public abstract String contra(Juego j);
	protected abstract String contraPiedra(Piedra p);
	protected abstract String contraPapel(Papel p);
	protected abstract String contraTijera(Tijera t);
	public abstract String toString();
	
	protected String gana(Juego ganador) {
		return "Ganador: " + ganador.toString();
	}
	
	protected String pierde() {
		return "Perdedor";
	}
	
	protected String empate() {
		return "Empate";
	}
	
}
