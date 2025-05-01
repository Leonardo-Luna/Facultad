package ar.edu.objetos.uno.patrones_9;

public class CancelacionFlexible implements EstrategiaCancelacion {
	
	public CancelacionFlexible () {
		
	}
	
	public double calcularMontoAReembolsar(Reserva reserva) {
		return reserva.montoAPagar();
	}

}
