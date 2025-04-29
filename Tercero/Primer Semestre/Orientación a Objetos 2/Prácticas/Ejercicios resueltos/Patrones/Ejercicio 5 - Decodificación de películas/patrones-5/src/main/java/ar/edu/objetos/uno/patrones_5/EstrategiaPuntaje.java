package ar.edu.objetos.uno.patrones_5;

import java.util.*;
import java.util.stream.Collectors;

public class EstrategiaPuntaje implements EstrategiaSugerencia {

	// Puntaje > 3 de mayor puntaje, para igual puntaje se toma la más reciente

	public List<Pelicula> ejecutarAlgoritmo(Decodificador decodificador) {
	
		ArrayList<Pelicula> grillaFiltrada = (ArrayList<Pelicula>) decodificador.getPeliculasNoVistas();
		
		return grillaFiltrada.stream()
				.sorted(Comparator.comparing(Pelicula::getPuntaje).reversed()
				.thenComparing(Pelicula::getEstreno, Comparator.reverseOrder()))
				.toList(); // Gracias Mati, no pienso analizar cómo hacer este filtro ni qué está pasando en el background
								
	}
	
}
