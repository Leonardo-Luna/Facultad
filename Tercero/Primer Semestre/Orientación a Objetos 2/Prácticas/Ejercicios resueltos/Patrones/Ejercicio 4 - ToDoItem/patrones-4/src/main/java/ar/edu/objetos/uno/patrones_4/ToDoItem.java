package ar.edu.objetos.uno.patrones_4;

import java.time.Duration;
import java.util.ArrayList;

public class ToDoItem {
	
	private String nombre;
	private State estado;
	private Duration time;
	private ArrayList<String> comentarios;
	
	//Se manda la Duratopm em tpdps los métpdps y que cada uno lo handlee como quiere?
	
	public ToDoItem(String nombre) {
		this.nombre = nombre;
		this.estado = new Pending();
		this.comentarios = new ArrayList<String>();
		
		// Para que quede explícito:
		this.time = null;
	}
	
	public void start() {
		this.estado = this.estado.start();
	}
	
	public void togglePause()
	{
		this.estado = this.estado.togglePause();
	}
	
	public void finish()
	{
		this.estado =  this.estado.finish();
	}
	
	public Duration workedTime()
	{
		if(this.time == null) {
			throw new RuntimeException("Nunca se inició este ToDoItem.");
		}
		return this.time;
	}
	
	public void addComment(String comment)
	{
		this.comentarios.add(comment);
	}

}
