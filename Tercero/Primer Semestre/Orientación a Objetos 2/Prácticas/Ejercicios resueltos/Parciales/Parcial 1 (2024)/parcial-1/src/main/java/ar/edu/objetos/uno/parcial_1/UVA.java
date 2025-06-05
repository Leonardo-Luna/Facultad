package ar.edu.objetos.uno.parcial_1;

public class UVA extends Prestamo {
	
	public UVA(double valorPrestamo, int cantidadCuotas, Cliente cliente) {
		super(valorPrestamo, cantidadCuotas, cliente);
	}
	
	public double obtenerValorCuota() {
		return super.obtenerValorCuota(Indec.getIndiceInflacion()/100); // Se asume que llega un valor ej. "30", que representa 30%, por el /100
	}
	
	public double getTotalPagado() {
		return this.obtenerValorCuota() * this.getCuotasPagas();
	}
	
	public double getRestante() {
		return this.obtenerValorCuota() * this.getCuotasRestantes();
	}
	
	public double calcularCancelacion() {
		return this.getRestante() + (this.getRestante() * (VALOR_ADMINISTRATIVO/100));
	}

}
