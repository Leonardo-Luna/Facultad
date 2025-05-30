package ar.edu.objetos.uno.patrones_15;

import java.util.ArrayList;

public class Catalogo {
	
	private ArrayList<Componente> componentes;
	
	public Catalogo() {
		this.componentes = new ArrayList<Componente>();
	}
	
	public void agregarComponente(Componente componente) {
		this.componentes.add(componente);
	}
	
	public Componente getComponente(String descripcion) {
		return this.componentes.stream()
			.filter(c -> c.mismaDescripcion(descripcion))
			.findFirst()
			.orElse(null);
	}

}
