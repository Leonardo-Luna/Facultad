package ar.edu.objetos.uno.patrones_5;

import java.util.*;
import java.util.stream.Collectors;

public class EstrategiaSimilaridad implements EstrategiaSugerencia {
	
	// Similaridad > 3 películas similares a una que reprodujo (más a menos reciente)

	public List<Pelicula> ejecutarAlgoritmo(Decodificador decodificador) {
		
		ArrayList<Pelicula> reproducidas = (ArrayList<Pelicula>) decodificador.getReproducidas();
		
		return reproducidas.stream()
				.flatMap(p -> p.getSimilares().stream())
				.sorted((p1, p2) -> p1.getEstreno().compareTo(p2.getEstreno()))
				.limit(3)
				.collect(Collectors.toList());
	}

}
