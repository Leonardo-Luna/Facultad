package ar.edu.objetos.uno.ejercicio2;

public class Papel extends Juego {
	
	public String contra(Juego j) {
		return j.contraPapel(this);
	}
	
	protected String contraPapel(Papel p) {
		return this.empate();
	}
	
	protected String contraTijera(Tijera t) {
		return this.pierde();
	}
	
	protected String contraPiedra(Piedra p) {
		return this.gana(this);
	}
	
	public String toString() {
		return "Papel";
	}

}
