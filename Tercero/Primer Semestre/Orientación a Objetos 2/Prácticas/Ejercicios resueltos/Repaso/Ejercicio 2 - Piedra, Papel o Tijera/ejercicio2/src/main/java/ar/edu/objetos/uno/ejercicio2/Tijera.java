package ar.edu.objetos.uno.ejercicio2;

public class Tijera extends Juego {
	
	public String contra(Juego j) {
		return j.contraTijera(this);
	}
	
	protected String contraTijera(Tijera t) {
		return this.empate();
	}
	
	protected String contraPapel(Papel p) {
		return this.gana(this);
	}
	
	protected String contraPiedra(Piedra p) {
		return this.pierde();
	}
	
	public String toString() {
		return "Tijera";
	}

}
