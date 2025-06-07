package ar.edu.objetos.uno.parcial_4;

import java.util.ArrayList;

public class Bolsa implements Componente {
	
	private ArrayList<Componente> bolsa;
	private int capacidad;
	
	public Bolsa(int capacidad) {
		this.bolsa = new ArrayList<Componente>();
		this.capacidad = capacidad;
	}
	
	public int espacioQueOcupa() {
		return this.bolsa.stream().mapToInt(i -> i.espacioQueOcupa()).sum();
	}
	
	public int getCapacidad() {
		return this.capacidad;
	}
	
	public Bolsa agregarObjeto(Item objeto) { // hacer una variable espacio ocuadp que se actualiza con cada add
		// si el espacio ocupado + el espacio que ocupa el nuevo objeto es <= al espacio disponible total
		// entonces se puede agregar
		if(this.capacidad >= objeto.espacioQueOcupa()) {
			this.capacidad -= objeto.espacioQueOcupa();
			this.bolsa.add(objeto);
			return this;
		} else {
			this.bolsa
		}
		
	}
}
