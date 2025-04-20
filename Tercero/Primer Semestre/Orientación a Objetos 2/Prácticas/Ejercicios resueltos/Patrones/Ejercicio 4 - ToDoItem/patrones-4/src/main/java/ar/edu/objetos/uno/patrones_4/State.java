package ar.edu.objetos.uno.patrones_4;

public abstract class State {
	
	public State() {}
	
	public State start() {
		return this;
	}
	
	public State togglePause()
	{
		throw new RuntimeException("Todavía no se inició este ToDoItem.");
	}
	
	public State finish() {
		return new Finished();
	}

}
