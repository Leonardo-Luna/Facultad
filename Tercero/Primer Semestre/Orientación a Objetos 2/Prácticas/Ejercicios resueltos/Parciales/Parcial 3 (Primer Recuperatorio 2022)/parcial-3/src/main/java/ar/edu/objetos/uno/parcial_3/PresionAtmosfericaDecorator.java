package ar.edu.objetos.uno.parcial_3;

public class PresionAtmosfericaDecorator extends BaseDecorator {

	public PresionAtmosfericaDecorator(Component wrappee) {
		super(wrappee);
	}
	
	public String displayData() {
		return this.wrappee.displayData() + "Presión atmosférica: " + this.getPresion() + " ";
	}
	
}
