package ar.edu.objetos.uno.ejercicio2;

public class Piedra extends Juego {
	
	public String contra(Juego j) {
		return j.contraPiedra(this);
	}
	
	protected String contraPiedra(Piedra p) {
		return this.empate();
	}
	
	protected String contraPapel(Papel p) {
		return this.pierde();
	}
	
	protected String contraTijera(Tijera t) {
		return this.gana(this);
	}
	
	public String toString() {
		return "Piedra";
	}

}
