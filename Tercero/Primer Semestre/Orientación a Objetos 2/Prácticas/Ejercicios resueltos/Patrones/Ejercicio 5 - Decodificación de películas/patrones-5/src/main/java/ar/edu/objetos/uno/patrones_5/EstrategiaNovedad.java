package ar.edu.objetos.uno.patrones_5;

import java.util.*;
import java.util.stream.Collectors;

public class EstrategiaNovedad implements EstrategiaSugerencia {
	
	// Novedad > 3 más nuevas que no haya reproducido

	public List<Pelicula> ejecutarAlgoritmo(Decodificador decodificador) {
		
		ArrayList<Pelicula> grillaFiltrada = (ArrayList<Pelicula>) decodificador.getPeliculasNoVistas();
		
		return grillaFiltrada.stream()
				.sorted((p1, p2) -> p1.getEstreno().compareTo(p2.getEstreno()))
				.limit(3)
				.collect(Collectors.toList());	
	}
	
}
