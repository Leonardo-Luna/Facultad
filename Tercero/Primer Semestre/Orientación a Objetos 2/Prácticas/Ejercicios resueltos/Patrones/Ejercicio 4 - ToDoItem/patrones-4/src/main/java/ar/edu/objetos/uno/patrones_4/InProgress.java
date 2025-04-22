package ar.edu.objetos.uno.patrones_4;

public class InProgress extends State {
	
	public InProgress(ToDoItem item) {
		super(item);
	}
	
	@Override
	public void start() {}
	
	@Override
	public void togglePause() {
		ToDoItem item = this.getItem();
		item.setState(new Paused(item));
	}
	
	@Override
	public void finish() {
		ToDoItem item = this.getItem();
		item.setState(new Finished(item));
	}

}
