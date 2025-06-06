package ar.edu.objetos.uno.parcial_3;

public class PresionAtmosfericaDecorator extends BaseDecorator {

	public PresionAtmosfericaDecorator(Component wrappee) {
		super(wrappee);
	}
	
	public String displayData() {
		return "Presión atmosférica: " + this.getPresion() + " ";
	}
	
}
