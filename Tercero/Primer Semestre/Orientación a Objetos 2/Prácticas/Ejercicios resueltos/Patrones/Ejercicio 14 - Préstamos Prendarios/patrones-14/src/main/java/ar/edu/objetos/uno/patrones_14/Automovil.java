package ar.edu.objetos.uno.patrones_14;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Automovil extends Component {

	private LocalDate modelo; // Asumo que modelo = año?
	private double kilometraje;
	private double costo0KM;
	private double liquidez;
	
	public Automovil(LocalDate modelo, double kilometraje, double costo0KM) {
		super();
		this.modelo = modelo;
		this.kilometraje = kilometraje;
		this.costo0KM = costo0KM;
		this.liquidez = 0.7;
	}
	
	public double getValor() {
		int antiguedad = (int) ChronoUnit.YEARS.between(this.modelo, LocalDate.now());
		return this.costo0KM * (0.1 * antiguedad); // Calculo robado a Mati, ni idea de qué es o qué hace :)
	}
	
	public double getLiquidez() {
		return this.liquidez;
	}
	
}
