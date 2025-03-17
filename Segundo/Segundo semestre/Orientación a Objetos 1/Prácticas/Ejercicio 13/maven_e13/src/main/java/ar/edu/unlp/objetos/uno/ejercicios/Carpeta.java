package ar.edu.unlp.objetos.uno.ejercicios;

import java.util.*;

public class Carpeta {
	
	private List<Email> emails;
	private String nombre;
	
	public Carpeta(String nombre) {
		this.nombre = nombre;
		this.emails = new ArrayList<Email>();
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void agregar(Email email) {
		this.emails.add(email);
	}
	
	public void mover(Email email, Carpeta destino) {
		this.emails.remove(email);
		destino.agregar(email);
	}
	
	public int tamanio() {
		return this.emails.stream().mapToInt(e -> e.tamanio()).sum();
	}
	
	public Email buscar(String texto) {
		return this.emails.stream().filter(e -> e.cumple(texto)).findFirst().orElse(null);
	}
	
}
