package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;

public class Viaje {

	private String origen;
	private String destino;
	private double costoTotal;
	private LocalDate fecha;
	private List<Usuario> integrantes;
	private Vehiculo vehiculo;
	
	public Viaje(String o, String d, double c, LocalDate f, Vehiculo v) {
		this.origen = o;
		this.destino = d;
		this.costoTotal = c;
		this.fecha = f;
		this.vehiculo = v;
	}
	
	public boolean getDias() {
		return (ChronoUnit.DAYS.between(this.fecha, LocalDate.now())) > 30;
	}
	
	public boolean puedeEnlistar() {
		return ChronoUnit.DAYS.between(this.fecha, LocalDate.now()) >= 2;
	}
	
	public boolean enlistar(Pasajero p) {
		if(this.integrantes.size() < this.vehiculo.getCapacidad()) {
			if(p.puedeViajar() && this.puedeEnlistar()) {
				this.integrantes.add(p);
				p.anotarPasajero(this);
				return true;
			}
		}
		return false;
	}
	
	public boolean procesarViaje() {
		double parte = this.costoTotal / this.integrantes.size()+1;
		this.integrantes.stream().forEach(i -> i.procesarPasaje(parte));
		return true;
	}
	
}
