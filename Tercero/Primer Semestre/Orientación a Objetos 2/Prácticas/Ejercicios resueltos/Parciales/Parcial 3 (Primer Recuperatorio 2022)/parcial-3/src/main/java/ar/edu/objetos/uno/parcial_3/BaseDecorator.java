package ar.edu.objetos.uno.parcial_3;

public abstract class BaseDecorator implements Component {
	
	protected Component wrappee;
	
	public BaseDecorator(Component wrappee) {
		this.wrappee = wrappee;
	}
	
	public Component getWrappee() {
		return this.wrappee;
	}
	
	public double getTemperaturaFahrenheit() {
		return this.wrappee.getTemperaturaFahrenheit();
	}
	
	public double getTemperaturaCelsius() {
		return this.wrappee.getTemperaturaCelsius();
	}
	
	public double getPresion() {
		return this.wrappee.getPresion();
	}
	
	public double getRadiacionSolar() {
		return this.wrappee.getRadiacionSolar();
	}
	
	public double getPromedioCelsius() {
		return this.wrappee.getPromedioCelsius();
	}
	
	public double getPromedioFahrenheit() {
		return this.wrappee.getPromedioFahrenheit();
	}
	
}
