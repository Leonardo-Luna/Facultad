package ar.edu.unlp.objetos.uno.ejercicios;

public class CuentaCorriente extends Cuenta {
	
	private double limiteDeDescubierto;
	
	public CuentaCorriente() {
		super();
		this.limiteDeDescubierto = 0;
	}
	
	public void setLimite(double monto) {
		this.limiteDeDescubierto = monto;
	}
	
	public double getLimite() {
		return this.limiteDeDescubierto;
	}
	
	protected boolean puedeExtraer(double monto) {
		return this.getSaldo()+this.getLimite() >= (monto);
	}
}
