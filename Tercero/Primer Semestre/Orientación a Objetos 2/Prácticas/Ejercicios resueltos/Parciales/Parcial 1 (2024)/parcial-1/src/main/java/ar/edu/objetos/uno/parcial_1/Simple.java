package ar.edu.objetos.uno.parcial_1;

public class Simple extends Prestamo {
	
	private double tasaInteres;
	private static final double SELLADO = 5000;
	
	public Simple(double valorPrestamo, int cantidadCuotas, Cliente cliente, double tasaInteres) {
		super(valorPrestamo, cantidadCuotas, cliente);
		this.tasaInteres = tasaInteres;
	}
	
	public double obtenerValorCuota() {
		return super.obtenerValorCuota(this.tasaInteres/100); // Se asume que llega un valor ej. "30", que representa 30%, por el /100
	}

	public double getTotalPagado() {
		return this.obtenerValorCuota() * this.getCuotasPagas();
	}
	
	public double getRestante() {
		return this.obtenerValorCuota() * this.getCuotasRestantes();
	}
	
	public double calcularCancelacion() {
		return this.getRestante() * (1 + (VALOR_ADMINISTRATIVO/100)) + SELLADO;
	}

}
