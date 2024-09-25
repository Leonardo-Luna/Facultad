package ar.edu.unlp.objetos.uno.ejercicios;

public class CajaDeAhorro extends Cuenta {
	
	private static final double COMISION = 0.02;
	
	public CajaDeAhorro() {
		super();
	}
	
	protected boolean puedeExtraer(double monto) {
		return super.getSaldo() >= (monto + (monto*0.02)) ? true : false;
	}

	@Override
	protected void extraerSinControlar(double monto) {
		super.extraerSinControlar(monto+(monto*COMISION));
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
