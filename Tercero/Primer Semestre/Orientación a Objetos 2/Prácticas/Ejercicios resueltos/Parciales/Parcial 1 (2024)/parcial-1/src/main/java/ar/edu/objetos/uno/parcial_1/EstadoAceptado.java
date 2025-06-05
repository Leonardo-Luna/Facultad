package ar.edu.objetos.uno.parcial_1;

public class EstadoAceptado extends Estado {
	
	@Override
	public void pagarCuota() {
		Prestamo prestamo = this.getPrestamo();
		prestamo.registrarPago();
		
		if(prestamo.getCuotasPagas() >= prestamo.getCantidadCuotas()) {
			prestamo.setEstado(new EstadoFinalizado());
		}
	}
	
	public double calcularCancelacion() {
		Prestamo prestamo = this.getPrestamo();
		
		return prestamo.calcularCancelacion();
	}

}
