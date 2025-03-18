package ar.edu.objetos.uno.ejercicio2;

public class Piedra implements Juego {
	
	public String contra(Piedra p) {
		return "Empate";
	}
	
	public String contra(Papel p) {
		return "Ganador: Papel";
	}
	
	public String contra(Tijera t) {
		return "Ganador: Piedra";
	}

}
