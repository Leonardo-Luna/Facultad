package ar.edu.objetos.uno.ejercicio1;

import java.util.*;

public class Usuario {
	
	private String screenName;
	private List<Publicacion> publicaciones;
	
	public Usuario(String nombre) {
		this.screenName = nombre;
		this.publicaciones = new ArrayList<Publicacion>();
	}
	
	public String getScreenName() {
		return this.screenName;
	}
	
	public void eliminarPublicaciones() {
		this.publicaciones.clear();
	}
	
	public boolean publicarTweet(String texto) {
		if(this.verificarLongitud(texto)) {
			Publicacion tweet = new Tweet(texto);
			this.publicaciones.add(tweet);
			return true;
		}
		return false;
	}
	
	public boolean retweetear(Tweet tweet) {
		Publicacion retweet = new Retweet(tweet);
		this.publicaciones.add(retweet);
		return true;
	}
	
	private boolean verificarLongitud(String texto) {
		if(texto.length() >= 1 && texto.length() <= 280) {
			return true;
		}
		return false;
	}
	
	public int getCantidadPublicaciones() {
		return this.publicaciones.size();
	}

}
