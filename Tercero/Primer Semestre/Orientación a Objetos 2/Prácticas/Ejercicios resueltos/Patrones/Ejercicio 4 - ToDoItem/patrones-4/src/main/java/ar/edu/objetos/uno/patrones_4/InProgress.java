package ar.edu.objetos.uno.patrones_4;

public class InProgress extends State {
	
	public State togglePause() {
		return new Paused();
	}

}
