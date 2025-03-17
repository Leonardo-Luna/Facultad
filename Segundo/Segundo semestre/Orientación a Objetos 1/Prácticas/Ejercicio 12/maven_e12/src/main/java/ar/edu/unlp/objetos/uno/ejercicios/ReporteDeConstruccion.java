package ar.edu.unlp.objetos.uno.ejercicios;

import java.util.*;

public class ReporteDeConstruccion {
	
	ArrayList<Pieza> piezas = new ArrayList<Pieza>();
	
	public double volumenDeMaterial(String material) {
		return this.piezas.stream().filter(p -> p.getMaterial() == material).mapToDouble(p -> p.calcularVolumen()).sum();
	}
	
	public double superficieDeColor(String color) {
		return this.piezas.stream().filter(p -> p.getColor() == color).mapToDouble(p -> p.calcularSuperficie()).sum();
	}

}
