package ar.edu.objetos.uno.patrones_4;

public class Pending extends State{
	
	@Override
	public State start() {
		return new InProgress();
	}
	
	@Override
	public State finish() {
		return this;
	}

}
