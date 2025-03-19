package ar.edu.objetos.uno.ejercicio2;

abstract class Juego {

	public abstract String contra(Juego j);
	public abstract String contra(Piedra p);
	public abstract String contra(Papel p);
	public abstract String contra(Tijera t);
	public abstract String toString();
	
	protected String gana(Juego ganador) {
		return "Ganador: " + ganador.toString();
	}
	
	protected String empate() {
		return "Empate";
	}
	
}
