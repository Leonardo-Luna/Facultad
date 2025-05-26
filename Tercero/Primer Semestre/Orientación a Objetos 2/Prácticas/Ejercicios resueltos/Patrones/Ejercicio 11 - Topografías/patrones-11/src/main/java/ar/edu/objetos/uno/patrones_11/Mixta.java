package ar.edu.objetos.uno.patrones_11;

import java.util.ArrayList;

public class Mixta implements Topografia {
	
	private ArrayList<Topografia> composicion;
	
	public Mixta() {
		this.composicion = new ArrayList<Topografia>();
	}
	
	public void agregar(Topografia topografia) {
		if(this.composicion.size() < 4) {
			this.composicion.add(topografia);
		}
	}
	
	@Override
	public double calcularProporcion() {
		return (this.composicion.stream().mapToDouble(t -> t.calcularProporcion()).sum()) / 4;
	}
	
	@Override
	public boolean iguales(Topografia topografia) {
		
		return false; // Tengo el cerebro demasiado quemado para sentarme con esta materia :D
		
	}

}
