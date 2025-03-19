package ar.edu.objetos.uno.ejercicio2;

public class Tijera extends Juego {
	
	public String contra(Juego j) {
		return j.contra(this);
	}
	
	public String contra(Tijera t) {
		return this.empate();
	}
	
	public String contra(Papel p) {
		return this.gana(this);
	}
	
	public String contra(Piedra p) {
		return this.gana(p);
	}
	
	public String toString() {
		return "Tijera";
	}

}
