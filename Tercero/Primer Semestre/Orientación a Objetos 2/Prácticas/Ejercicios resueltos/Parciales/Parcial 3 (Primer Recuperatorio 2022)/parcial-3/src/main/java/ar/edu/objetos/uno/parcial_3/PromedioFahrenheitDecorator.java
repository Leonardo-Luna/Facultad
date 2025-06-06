package ar.edu.objetos.uno.parcial_3;

public class PromedioFahrenheitDecorator extends BaseDecorator {
	
	public PromedioFahrenheitDecorator(Component wrappee) {
		super(wrappee);
	}
	
	public String displayData() {
		return "Promedio de temperaturas F: " + this.getPromedioFahrenheit() + " ";
	}

}
