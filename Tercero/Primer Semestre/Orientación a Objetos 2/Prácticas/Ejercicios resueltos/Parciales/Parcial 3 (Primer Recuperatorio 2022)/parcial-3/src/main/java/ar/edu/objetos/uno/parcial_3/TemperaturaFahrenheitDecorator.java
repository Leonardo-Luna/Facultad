package ar.edu.objetos.uno.parcial_3;

public class TemperaturaFahrenheitDecorator extends BaseDecorator {

	public TemperaturaFahrenheitDecorator(Component wrappee) {
		super(wrappee);
	}
	
	public String displayData() {
		return "Temperatura F: " + this.getTemperaturaFahrenheit() + " ";
	}
	
}
