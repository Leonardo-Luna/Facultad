package ar.edu.unlp.objetos.uno.ejercicios;

import java.util.*;

public class ClienteDeCorreo {
	
	private Carpeta inbox;
	private List<Carpeta> carpetas;
	
	public ClienteDeCorreo() {
		this.inbox = new Carpeta("Inbox");
		this.carpetas = new ArrayList<Carpeta>();
		this.carpetas.add(this.inbox);
	}
	
	public void recibir(Email email) {
		this.inbox.agregar(email);		
	}
	
	public void mover(Email email, Carpeta destino) {
		destino.agregar(email);
	}
	
	public Email buscar(String texto) {
		return this.carpetas.stream().map(c -> c.buscar(texto)).filter(e -> e.cumple(texto)).findFirst().orElse(null);
	}
	
	public int espacioOcupado() {
		return this.carpetas.stream().mapToInt(c -> c.tamanio()).sum() + this.inbox.tamanio();
	}
	
}
