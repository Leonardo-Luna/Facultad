package ar.edu.objetos.uno.patrones_4;

public class Pending extends State{
	
	public Pending(ToDoItem item) {
		super(item);
	}
	
	@Override
	public void start() {
		ToDoItem item = this.getItem();
		item.setState(new InProgress(item));
	}
	
	@Override
	public void togglePause() {
		throw new RuntimeException("El Item no ha sido iniciado.");
	}
	
	@Override
	public void finish() {}

}
