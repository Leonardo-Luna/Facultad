package ar.edu.objetos.uno.patrones_14;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Script {
	
	public static void main(String[] args) {
		
		CompositeMixta mixta = new CompositeMixta();
		
		Component alquiler = new Alquiler(LocalDate.now().minus(1, ChronoUnit.YEARS), LocalDate.now().plus(2, ChronoUnit.YEARS), 300);
		Component auto = new Automovil(LocalDate.now().minus(2, ChronoUnit.YEARS), 120, 100000);
		
		mixta.agregar(alquiler);
		mixta.agregar(auto);
	
		System.out.println(mixta.calcularValorPrendario()); // No tengo ni idea de cuánto debería devolver, asumo que está bien :D
	}

}
