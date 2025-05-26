package ar.edu.objetos.uno.patrones_14;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Alquiler extends Component {

	private LocalDate inicioContrato;
	private LocalDate finContrato;
	private double costoMensual;
	private double liquidez;
	
	public Alquiler(LocalDate inicioContrato, LocalDate finContrato, double costoMensual) {
		super();
		this.inicioContrato = inicioContrato;
		this.finContrato = finContrato;
		this.costoMensual = costoMensual;
		this.liquidez = 0.9;
	}
	
	public double getValor() {
		int faltan = (int) ChronoUnit.MONTHS.between(inicioContrato, finContrato);
		return faltan * costoMensual;
	}
	
	public double getLiquidez() {
		return this.liquidez;
	}
	
}
