package ar.edu.objetos.uno.parcial_3;

public class RadiacionSolarDecorator extends BaseDecorator {
	
	public RadiacionSolarDecorator(Component wrappee) {
		super(wrappee);
	}
	
	public String displayData() {
		return this.wrappee.displayData() + "Radiación solar: " + this.getRadiacionSolar() + " ";
	}

}
