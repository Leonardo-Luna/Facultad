package ar.edu.objetos.uno.ejercicio2;

public class Papel extends Juego {
	
	public String contra(Juego j) {
		return j.contra(this);
	}
	
	public String contra(Papel p) {
		return this.empate();
	}
	
	public String contra(Tijera t) {
		return this.gana(t);
	}
	
	public String contra(Piedra p) {
		return this.gana(this);
	}
	
	public String toString() {
		return "Papel";
	}

}
