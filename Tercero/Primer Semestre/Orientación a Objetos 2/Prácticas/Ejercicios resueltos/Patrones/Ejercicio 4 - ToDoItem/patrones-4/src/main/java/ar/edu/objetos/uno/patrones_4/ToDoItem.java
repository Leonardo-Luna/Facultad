package ar.edu.objetos.uno.patrones_4;

import java.time.Duration;
import java.util.ArrayList;

public class ToDoItem {
	
	private String nombre;
	private State estado;
	private Duration time;
	private ArrayList<String> comentarios;
		
	public ToDoItem(String nombre) {
		this.nombre = nombre;
		this.estado = new Pending(this);
		this.comentarios = new ArrayList<String>();
	}
	
	public void start() {
		this.estado.start();
	}
	
	public void togglePause()
	{
		this.estado.togglePause();
	}
	
	public void finish()
	{
		this.estado.finish();
	}
	
	public Duration workedTime()
	{
		return this.time; // Realmente no tengo ganas de razonar sobre este individuo
	}
	
	public void addComment(String comment)
	{
		this.comentarios.add(comment);
	}
	
	public void setState(State state) {
		this.estado = state;
	}

}
