package ar.edu.unlp.objetos.uno.ejercicios;

import java.util.* ;

public class Pasajero extends Usuario {

	private List<Viaje> viajes;
	
	public Pasajero(String n, double s) {
		super(n, s);
		this.viajes = new ArrayList<Viaje>();
	}
	
	public boolean cargarSaldo(double saldo) {
		boolean viajo = this.viajes.stream().anyMatch(v -> v.getDias());
		
		int com = 0;
		if(!viajo) {
			com = 10;
		}
		
		return super.cargarSaldo(saldo - ((saldo*com)/100));
	}
	
	public boolean anotarPasajero(Viaje v) {
		this.viajes.add(v);
		return true;
	}
	
	protected double getSaldo() {
		return super.getSaldo();
	}
	
	private boolean viajo() {
		return !this.viajes.isEmpty();
	}
	
	public boolean puedeViajar() {
		return this.getSaldo() > 0;
	}
	
	protected boolean descontarSaldo(double saldo) {
		return super.descontarSaldo(saldo);
	}
	
	public boolean procesarPasaje(double parte) {
		this.descontarSaldo(parte - ((this.viajo()) ? 500 : 0));
		return true;
	}
	
}
