package ar.edu.objetos.uno.parcial_3;

public class TemperaturaCelsiusDecorator extends BaseDecorator {
	
	public TemperaturaCelsiusDecorator(Component wrappee) {
		super(wrappee);
	}
	
	public String displayData() {
		return "Temperatura C: " + this.getTemperaturaCelsius() + " ";
	}

}
