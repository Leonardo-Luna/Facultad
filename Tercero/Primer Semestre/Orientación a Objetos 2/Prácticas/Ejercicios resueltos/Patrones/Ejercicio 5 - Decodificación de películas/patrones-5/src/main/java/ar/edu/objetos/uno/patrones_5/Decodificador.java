package ar.edu.objetos.uno.patrones_5;

import java.util.*;

public class Decodificador {
	
	private ArrayList<Pelicula> grilla;
	private ArrayList<Pelicula> reproducidas;
	private EstrategiaSugerencia estrategia;
	
	public List<Pelicula> getRecomendaciones() {
		return this.estrategia.ejecutarAlgoritmo(this);
	}
	
	public void setEstrategia(EstrategiaSugerencia estrategia) {
		this.estrategia = estrategia;
	}
	
	public List<Pelicula> getPeliculasNoVistas() {
		ArrayList<Pelicula> listaFiltrada = new ArrayList<Pelicula>(this.grilla);
		listaFiltrada.removeAll(this.reproducidas);
		return listaFiltrada;
	}
	
	public List<Pelicula> getReproducidas() {
		return this.reproducidas;
	}
}
