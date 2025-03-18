package ar.edu.objetos.uno.ejercicio2;

public class Papel implements Juego {
	
	public String contra(Papel p) {
		return "Empate";
	}
	
	public String contra(Tijera t) {
		return "Ganador: Tijera";
	}
	
	public String contra(Piedra p) {
		return "Ganador: Papel";
	}

}
