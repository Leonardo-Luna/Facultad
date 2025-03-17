package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateLapse {
	
	private LocalDate from;
	private LocalDate to;
	
	/* No me termina de quedar claro el enunciado. La clase recibe una variable "from" y una cantidad
	 * de días? En base al LocalDate from y la cantidad de días, puedo calcular el "to" y me ahorro el
	 * método sizeInDays(). Va por ese lado? */
	
	public DateLapse(LocalDate from, LocalDate to) {
		this.from = from;
		this.to = to;
	}
	
	public LocalDate getFrom() {
		return this.from;
	}
	
	public LocalDate getTo() {
		return this.to;
	}
	
	public int sizeInDays() {
		return (int)ChronoUnit.DAYS.between(from, to); /* Lo casteo porque así está la firma en
		el cuadernillo y el método me da error porque retorna un long */
	}

	public boolean includesDate(LocalDate other) {
		return (other.isAfter(this.from) && other.isBefore(this.to));
	}
	
}
