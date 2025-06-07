package ar.edu.objetos.uno.parcial_4;

import java.util.ArrayList;

public class Jugador {
	
	private String nombre;
	private Bolsa bolsaInicial;
	
	public Jugador(String nombre, int capacidad) {
		this.nombre = nombre;
		this.bolsaInicial = new Bolsa(capacidad);
	}
	
	public Bolsa guardarObjeto(Componente objeto) {
		return this.bolsaInicial.agregarObjeto(objeto);
	}

}
