package ar.edu.objetos.uno.parcial_2;

import java.util.*;

public class Catalogo {
	
	private ArrayList<Componente> componentes;

	public Catalogo() {
		this.componentes = new ArrayList<Componente>();
	}
	
	public void addComponente(Componente componente) {
		if(!this.componentes.contains(componente)) {
			this.componentes.add(componente);
		}
	}
	
	public void removeComponente(Componente componente) {
		if(this.componentes.contains(componente)) {
			this.componentes.remove(componente);
		}
	}
	
	public static Componente getComponente(String descripcion) {
		return new Componente(); // No voy a perder tiempo con esto, es para que no tire errores :)
	}

}
