package ar.edu.objetos.uno.patrones_5;

import java.time.LocalDate;
import java.util.ArrayList;

public class Pelicula {
	
	private String titulo;
	private LocalDate estreno;
	private ArrayList<Pelicula> similares;
	private double puntaje;
	
	public Pelicula(String titulo, LocalDate estreno, double puntaje) {
		this.titulo = titulo;
		this.estreno = estreno;
		this.puntaje = puntaje;
		this.similares = new ArrayList<Pelicula>();
	}
	
	public void addSimilar(Pelicula pelicula) {
		if(!this.similares.contains(pelicula)) {
			this.similares.add(pelicula);
			pelicula.addSimilar(this);
		}
	}
	
	public void removeSimilar(Pelicula pelicula) {
		if(this.similares.contains(pelicula)) {
			this.similares.remove(pelicula);
			pelicula.removeSimilar(this);
		}
	}
	
	public double getPuntaje() {
		return this.puntaje;
	}
	
	public LocalDate getEstreno() {
		return this.estreno;
	}
	
	public ArrayList<Pelicula> getSimilares() {
		return this.similares;
	}

}
