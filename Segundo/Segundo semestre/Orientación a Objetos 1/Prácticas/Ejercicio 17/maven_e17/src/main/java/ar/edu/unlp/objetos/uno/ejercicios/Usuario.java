package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.util.*;

public class Usuario {
	
	private String nombre;
	private String domicilio;
	private String DNI; //12.345.678
	private ArrayList<Propiedad> propiedades; //Asumo que la alta y baja no debe modelarse
	
	// listarPropiedad y darDeBajaPropiedad serían los métodos que usaría para "propiedades"
	
	public Usuario(String nombre, String domicilio, String DNI) {
		this.nombre = nombre;
		this.domicilio = domicilio;
		this.DNI = DNI;
		this.propiedades = new ArrayList<Propiedad>();
	}
	
	public void ListarPropiedad(Propiedad p) {
		this.propiedades.add(p);
	}
	
	public void DarDeBajaPropiedad(Propiedad p) {
		if(this.propiedades.contains(p)) {
			this.propiedades.remove(p);
		}
	}
	
	public boolean Reservar(LocalDate desde, LocalDate hasta, Propiedad prop) {
		if(prop.estaDisponible(desde, hasta)) {
			prop.agregarReserva(desde, hasta);
			return true;
		}
		else {
			System.out.println("No se puede reservar en la fecha ingresada.");
			return false;
		}
	}

	public boolean cancelarReserva(Reserva r, Propiedad prop) {
		return prop.cancelarReserva(r);
	}
	
	public double calcularIngrsos(LocalDate desde, LocalDate hasta) {
		double suma = 0;
		for(Propiedad prop : this.propiedades) {
			suma += prop.calcularTotalDentro(desde, hasta);
		}
		return suma;
	}

	public int getCantidadPropiedades() {
		return this.propiedades.size();
	}
	
}
