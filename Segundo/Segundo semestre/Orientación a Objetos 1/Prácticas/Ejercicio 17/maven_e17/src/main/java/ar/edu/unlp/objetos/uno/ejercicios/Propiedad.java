package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

public class Propiedad {
	
	private String direccion;
	private String nombre;
	private double precioPorNoche;
	private ArrayList<Reserva> reservas;
	
	public Propiedad(String d, String n, double p) {
		this.direccion = d;
		this.nombre = n;
		this.precioPorNoche = p;
		this.reservas = new ArrayList<Reserva>();
	}
	
	public boolean estaDisponible(LocalDate desde, LocalDate hasta) {
		
		Reserva dt = new Reserva(desde, hasta);
		return !(reservas.stream().anyMatch(r->r.overlaps(dt) == true));
	}
	
	public void agregarReserva(LocalDate desde, LocalDate hasta) {
		Reserva r = new Reserva(desde, hasta);
		this.reservas.add(r);
	}
	
	public double calcularTotal(Reserva r) {
		Reserva existe = this.reservas.stream().filter(reserva->reserva.equals(r)).findFirst().orElse(null);
		if(existe != null) {
			return this.precioPorNoche * (r.sizeInDays());
		}
		System.out.println("Reserva no encontrada.");
		return 0;
	}
	
	public boolean cancelarReserva(Reserva r) {
					
		Reserva existe = this.reservas.stream().filter(reserva->reserva.equals(r)).findFirst().orElse(null);
		
		if(!this.reservas.contains(existe)) {
			System.out.println("La reserva ingresada no existe.");
			return false;
		}
		
		LocalDate now = LocalDate.now();
		
		if(r.includesDate(now)) {
			System.out.println("No se puede cancelar una reserva en curso.");
			return false;
		}
		
		this.reservas.remove(r);
		return true;
				
	}
	
	public double calcularTotalDentro(LocalDate desde, LocalDate hasta) {
		double suma = 0;
		Reserva dt = new Reserva(desde, hasta);
		List<Reserva> cumple = this.reservas.stream().filter(r->r.overlaps(dt)).collect(Collectors.toList());
		for(Reserva r : cumple) {
			suma += this.calcularTotal(r);
		}
		return suma;
	}

}
