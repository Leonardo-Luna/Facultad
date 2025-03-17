package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Reserva implements IDateLapse {
	
	private LocalDate from;
	private LocalDate to;
	
	public Reserva(LocalDate from, LocalDate to) {
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
	
	public boolean overlaps(Reserva dt) {
		return (this.includesDate(dt.getFrom()) || this.includesDate(dt.getTo()));
	}
	
}
