package ar.edu.objetos.uno.patrones_9;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class CancelacionModerada implements EstrategiaCancelacion {
	
	public CancelacionModerada() {
		
	}
	
	public double calcularMontoAReembolsar(Reserva reserva) {
		
		int diasFaltantes = this.diasFaltantes(reserva.getFecha());
		
		if(diasFaltantes >= 7) {
			return reserva.montoAPagar();
		}
		else if(diasFaltantes >= 2) {
			return reserva.montoAPagar() * 0.50;
		}
		return 0;
		
	}
	
	private int diasFaltantes(LocalDate fecha) {
		return (int) ChronoUnit.DAYS.between(fecha, LocalDate.now());
	}

}
