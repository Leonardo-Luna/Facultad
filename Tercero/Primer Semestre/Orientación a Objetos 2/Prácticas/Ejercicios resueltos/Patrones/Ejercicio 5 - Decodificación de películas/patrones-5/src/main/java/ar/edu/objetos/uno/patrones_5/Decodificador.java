package ar.edu.objetos.uno.patrones_5;

import java.util.ArrayList;

public class Decodificador {
	
	private ArrayList<Pelicula> grilla;
	private ArrayList<Pelicula> reproducidas;
	private EstrategiaSugerencia estrategia;
	
	// No tengo del todo claro cómo hacer para pasar los datos que cada estrategia necesita para calcular las recomendaciones.
	// Se me ocurren 2 formas, de las cuales ninguna me gusta por sus motivos:
	
	// 1 - Paso this y uso getters para acceder a lo que necesito, pero no soy fan de pasar this entero y hacer GET sobre una lista
	// 2 - Paso Las dos listas por parámetro por más que no se usan, lo cual tampoco me cierra porque en una estrategia no se usa
	
	// Novedad > 3 más nuevas
	// Similaridad > Películas similares a una que reprodujo (más a menos reciente)
	// Puntaje > Mayor puntaje, para igual puntaje se toma la más reciente

}
