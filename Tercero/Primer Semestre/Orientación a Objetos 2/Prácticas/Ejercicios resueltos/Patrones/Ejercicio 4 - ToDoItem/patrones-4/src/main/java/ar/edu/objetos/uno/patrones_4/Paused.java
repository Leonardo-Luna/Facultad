package ar.edu.objetos.uno.patrones_4;

public class Paused extends State {
	
	public State togglePause() {
		return new InProgress();
	}

}
