package ar.edu.objetos.uno.patrones_4;

public class Paused extends State {
	
	public Paused(ToDoItem item) {
		super(item);
	}
	
	@Override
	public void start() {}
	
	public void togglePause() {
		ToDoItem item = this.getItem();
		item.setState(new InProgress(item));
	}
	
	public void finish() {
		ToDoItem item = this.getItem();
		item.setState(new Finished(item));
	}

}
