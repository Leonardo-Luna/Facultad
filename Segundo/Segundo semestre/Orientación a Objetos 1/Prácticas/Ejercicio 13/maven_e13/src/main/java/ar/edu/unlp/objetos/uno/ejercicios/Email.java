package ar.edu.unlp.objetos.uno.ejercicios;

import java.util.*;

public class Email {
	
	private String titulo;
	private String cuerpo;
	private List<Archivo> adjuntos;
	
	public Email(String titulo, String cuerpo, List<Archivo> adjuntos) {
		this.titulo = titulo;
		this.cuerpo = cuerpo;
		this.adjuntos = new ArrayList<Archivo>(adjuntos);
	}
		
	public String getTitulo() {
		return this.titulo;
	}
	
	public String getCuerpo() {
		return this.cuerpo;
	}
	
	public boolean cumple(String texto) {
		return this.titulo.equals(texto) || this.cuerpo.equals(texto);
	}
	
	public int tamanio() {
		return this.titulo.length() + this.cuerpo.length() + this.adjuntos.stream().mapToInt(a -> a.tamanio()).sum();
	}
	
	public List<Archivo> adjuntos() {
		return this.adjuntos;
	}
	
}
