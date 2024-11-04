package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

interface IDateLapse {
	
	public LocalDate getFrom();
	public LocalDate getTo();	
	public int sizeInDays();
	public boolean includesDate(LocalDate other);
	public boolean overlaps(Reserva anotherDateLapse);
	
	
}
