package ar.edu.unlp.objetos.uno.ejercicios;

public class CajaDeAhorro extends Cuenta {
	
	private static final double COMISION = 0.02;
	
	public CajaDeAhorro() {
		super();
	}

	@Override
	public boolean extraer(double monto) {
		return super.extraer(monto+(monto*COMISION));
	}
	
	@Override
	public void depositar(double monto) {
		super.depositar(monto-(monto*COMISION));
	}
	
	@Override
	public boolean transferirACuenta(double monto, Cuenta cuentaDestino) {
		return super.transferirACuenta(monto-(monto*COMISION), cuentaDestino);
	}
	
}
