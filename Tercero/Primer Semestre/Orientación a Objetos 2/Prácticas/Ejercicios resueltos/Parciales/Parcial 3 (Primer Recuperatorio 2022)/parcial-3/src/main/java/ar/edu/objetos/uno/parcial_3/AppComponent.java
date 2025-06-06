package ar.edu.objetos.uno.parcial_3;

public class AppComponent implements Component {
	
	// No sé si asumir que HomeWeatherStation es estática, así que:
	
	private HomeWeatherStation homeWeatherStation;
	
	public AppComponent(HomeWeatherStation hws) {
		this.homeWeatherStation = hws;
	}
	
	private double calcularCelsius(double tempFahrenheit) {
		return (tempFahrenheit - 32) + 1.8;
	}
	
	public double getTemperaturaCelsius() {
		return this.calcularCelsius(this.homeWeatherStation.getTemperaturaFahrenheit());
	}
	
	public double getPromedioFahrenheit() {
		return this.homeWeatherStation.getTemperaturasFahrenheit().stream().mapToDouble(t -> t).average().orElse(0);
	}
	
	public double getPromedioCelsius() {
		return this.homeWeatherStation.getTemperaturasFahrenheit().stream().mapToDouble(t -> this.calcularCelsius(t)).average().orElse(0);
	}
	
	public double getPresion() {
		return this.homeWeatherStation.getPresion();
	}
	
	public double getRadiacionSolar() {
		return this.homeWeatherStation.getRadiacionSolar();
	}
	
	public double getTemperaturaFahrenheit() {
		return this.homeWeatherStation.getTemperaturaFahrenheit();
	}
	
	public String displayData() {
		return "";
	}

}
