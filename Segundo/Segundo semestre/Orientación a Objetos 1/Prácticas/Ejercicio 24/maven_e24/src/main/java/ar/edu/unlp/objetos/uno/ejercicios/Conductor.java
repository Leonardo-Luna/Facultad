package ar.edu.unlp.objetos.uno.ejercicios;

public class Conductor extends Usuario {
	
	private Vehiculo vehiculo;
	
	public Conductor(Vehiculo v, String n, double s) {
		super(n, s);
		this.vehiculo = v;
	}
	
	@Override
	public boolean cargarSaldo(double saldo) {
		int com = this.vehiculo.getComision();
		saldo -= (saldo*com)/100;
		return super.cargarSaldo(saldo);
	}
	
	protected boolean descontarSaldo(double saldo) {
		return super.descontarSaldo(saldo);
	}
	
	public boolean procesarPasaje(double parte) {
		this.descontarSaldo(parte - (this.vehiculo.getPorcentaje()));
		return false;
	}

}
