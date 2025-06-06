package ar.edu.objetos.uno.parcial_3;

public class PromedioCelsiusDecorator extends BaseDecorator {

	public PromedioCelsiusDecorator(Component wrappee) {
		super(wrappee);
	}
	
	public String displayData() {
		return "Promedio de temperaturas C: " + this.getPromedioCelsius() + " ";
	}
	
}
