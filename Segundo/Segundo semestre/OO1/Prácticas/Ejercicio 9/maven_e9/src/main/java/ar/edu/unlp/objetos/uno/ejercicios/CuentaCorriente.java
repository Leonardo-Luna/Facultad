package ar.edu.unlp.objetos.uno.ejercicios;

public class CuentaCorriente extends Cuenta {
	
	private double limiteDeDescubierto;
	
	public CuentaCorriente() {
		super();
		this.limiteDeDescubierto = 0;
	}
	
	public void setLimiteDeDescubierto(double monto) {
		this.limiteDeDescubierto = monto;
	}
	
	public double getLimiteDeDescubierto() {
		return this.limiteDeDescubierto;
	}
	
	@Override
	public boolean extraer(double monto) {
		double saldo = super.getSaldo();
		saldo += this.getLimiteDeDescubierto();
		
		if(saldo >= monto) {
			super.extraerSinControlar(monto);
			return true;
		}
		return false;
	} 
}
