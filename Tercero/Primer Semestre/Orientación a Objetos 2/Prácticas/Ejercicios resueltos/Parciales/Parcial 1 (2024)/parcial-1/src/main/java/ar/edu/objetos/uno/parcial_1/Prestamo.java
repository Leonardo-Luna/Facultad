package ar.edu.objetos.uno.parcial_1;

public abstract class Prestamo {
	
	private double valorPrestamo;
	private int cantidadCuotas;
	private Cliente cliente;
	private Estado estado;
	private int cuotasPagas = 0;
	protected static final double VALOR_ADMINISTRATIVO = 10;
	
	public Prestamo(double valorPrestamo, int cantidadCuotas, Cliente cliente) {
		
		double treintaSueldo = cliente.getSalarioMensual() * 0.3;
		if(valorPrestamo > treintaSueldo) {
			this.estado = new EstadoRechazado();
			throw new Error("El valor del préstamo supera el 30% del sueldo del cliente.");
		}
		
		this.estado = new EstadoAceptado();
		this.valorPrestamo = valorPrestamo;
		this.cantidadCuotas = cantidadCuotas;
		this.cliente = cliente;
		this.estado = null; // Modificar cuando tenga los estados :D
	}
	
	public abstract double getTotalPagado();
	public abstract double calcularCancelacion();
	
	public int getCuotasRestantes() {
		return this.cantidadCuotas - this.cuotasPagas;
	}
		
	public double obtenerValorCuota(double multiplicador) {
		return (this.valorPrestamo/this.cantidadCuotas) * multiplicador;
	}
	
	public void pagarCuota() {
		this.estado.pagarCuota();
	}
	
	public int getCuotasPagas() {
		return this.cuotasPagas;
	}
	
	public int getCantidadCuotas() {
		return this.cantidadCuotas;
	}
	
	public void registrarPago() {
		this.cuotasPagas++;
	}
	
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	
	public double getValorAdministrativo() {
		return this.VALOR_ADMINISTRATIVO;
	}
}
