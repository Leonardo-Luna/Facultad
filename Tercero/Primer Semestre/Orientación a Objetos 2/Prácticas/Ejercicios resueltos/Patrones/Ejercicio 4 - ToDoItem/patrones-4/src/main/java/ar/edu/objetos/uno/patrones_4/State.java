package ar.edu.objetos.uno.patrones_4;

public abstract class State {
	
	private ToDoItem item;
	
	public State(ToDoItem item) {
		this.item = item;
	}
	
	public abstract void start();
	public abstract void togglePause();
	public abstract void finish();
	
	protected ToDoItem getItem() {
		return this.item;
	}

}
