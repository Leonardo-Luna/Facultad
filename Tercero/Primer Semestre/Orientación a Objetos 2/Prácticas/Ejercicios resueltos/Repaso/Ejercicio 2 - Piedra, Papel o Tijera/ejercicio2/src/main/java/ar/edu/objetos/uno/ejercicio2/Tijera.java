package ar.edu.objetos.uno.ejercicio2;

public class Tijera implements Juego {
	
	public String contra(Tijera t) {
		return "Empate";
	}
	
	public String contra(Papel p) {
		return "Ganador: Tijera";
	}
	
	public String contra(Piedra p) {
		return "Ganador: Piedra";
	}

}
