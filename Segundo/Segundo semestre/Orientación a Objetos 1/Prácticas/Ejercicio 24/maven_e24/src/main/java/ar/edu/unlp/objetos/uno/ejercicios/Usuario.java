package ar.edu.unlp.objetos.uno.ejercicios;

public abstract class Usuario {

	private String nombre;
	private double saldo;
	
	public Usuario(String n, double s) {
		this.nombre = n;
		this.saldo = s;
	}
	
	public boolean cargarSaldo(double saldo) {
		this.saldo += saldo;
		return true;
	}
	
	protected double getSaldo() {
		return this.saldo;
	}
	
	protected boolean descontarSaldo(double saldo) {
		this.saldo -= saldo;
		return true;
	}
	
	public abstract boolean procesarPasaje(double parte);
	
}
