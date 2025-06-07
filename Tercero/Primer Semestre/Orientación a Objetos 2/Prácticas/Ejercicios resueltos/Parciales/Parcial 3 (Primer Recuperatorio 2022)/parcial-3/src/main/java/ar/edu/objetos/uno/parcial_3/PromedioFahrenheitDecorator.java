package ar.edu.objetos.uno.parcial_3;

public class PromedioFahrenheitDecorator extends BaseDecorator {
	
	public PromedioFahrenheitDecorator(Component wrappee) {
		super(wrappee);
	}
	
	public String displayData() {
		return this.wrappee.displayData() + "Promedio de temperaturas F: " + this.getPromedioFahrenheit() + " ";
	}

}
