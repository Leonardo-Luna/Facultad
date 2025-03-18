package ar.edu.objetos.uno.ejercicio1;

import java.util.*;

public class Twitter {

	private List<Usuario> usuarios;
	
	public Twitter() {
		this.usuarios = new ArrayList<Usuario>();
	}
	
	public boolean crearUsuario(Usuario user) {
		
		if(!this.verificarNombre(user.getScreenName())) {
			this.usuarios.add(user);
			return true;
		}
		return false;
		
	}
	
	public boolean eliminarUsuario(Usuario usuario) {
		if(this.usuarios.contains(usuario)) {
			usuario.eliminarPublicaciones();
			this.usuarios.remove(usuario);
			return true;
		}
		return false;
	}
	
	private boolean verificarNombre(String nombre) {
		return this.usuarios.stream().anyMatch(usuario -> usuario.getScreenName().equals(nombre));		
	}
	
}
