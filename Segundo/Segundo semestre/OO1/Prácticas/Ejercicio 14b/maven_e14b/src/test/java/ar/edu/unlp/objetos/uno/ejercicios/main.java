package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class main {

	public static void main(String[] args) {
		
		// Investigue cómo hacer para crear una fecha determinada, por ejemplo 15/09/1972
		LocalDate fecha = LocalDate.of(1972, 9, 15);
		System.out.println(fecha);
		
		/* Investigue cómo hacer para determinar si la fecha de hoy se encuentra entre las fechas
		15/12/1972 y 15/12/2032. Sugerencia: Vea los métodos que permiten comparar
		LocalDates y que retornan booleans */
		LocalDate from = LocalDate.of(1972, 12, 15);
		LocalDate to = LocalDate.of(2032, 12, 15);
		LocalDate fecha2 = LocalDate.now();
		
		if(fecha2.isAfter(from) && fecha2.isBefore(to)) {
			System.out.println("La fecha de hoy se encuentra en el rango");
		}
		else {
			System.out.println("La fecha de hoy NO se encuentra en el rango");
		}
		
		/* Investigue cómo hacer para calcular el número de días entre dos fechas. Lo mismo para
		el número de meses y de años. Sugerencia: vea el método until.
		Tenga en cuenta que los métodos de LocalDate colaboran con otros objetos que están definidos a 
		partir de enums, clases e interfaces de java.time. */
		System.out.println(ChronoUnit.DAYS.between(from, to));
		System.out.println(ChronoUnit.MONTHS.between(from, to));
		System.out.println(ChronoUnit.YEARS.between(from, to));
		
		from = LocalDate.of(2024, 10, 2);
		to = LocalDate.of(2024, 10, 9);
		LocalDate includes = LocalDate.of(2024, 10, 7);
		
		DateLapse test = new DateLapse(from, to);
		System.out.println(test.sizeInDays());
		System.out.println(test.includesDate(includes));

	}

}
