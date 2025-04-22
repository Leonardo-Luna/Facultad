package ar.edu.objetos.uno.patrones_4;

public class Finished extends State {
	
	public Finished(ToDoItem item) {
		super(item);
	}
	
	@Override
	public void start() {}

	@Override
	public void togglePause() {
		throw new RuntimeException("El item ya ha finalizado.");
	}
	
	@Override
	public void finish() {}

}
