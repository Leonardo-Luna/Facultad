package ar.edu.objetos.uno.parcial_3;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.*;

public class AppComponentTest {
	
	private Component appComponent;
	
	@BeforeEach
	public void setUp() {
		HomeWeatherStation hws = new HomeWeatherStation(); // Se asume que los sensores arrojarán los valores del ejemplo
		this.appComponent = new AppComponent(hws);
	}
	
	@Test
	public void comprobarTest1() {
		BaseDecorator presionDecorator = new PresionAtmosfericaDecorator(this.appComponent);
		assertEquals("Presión atmosférica: 1008.0 ", presionDecorator.displayData());
	}
	
	@Test
	public void comprobarTest2() {
		BaseDecorator presionDecorator = new PresionAtmosfericaDecorator(this.appComponent);
		BaseDecorator radiacionDecorator = new RadiacionSolarDecorator(this.appComponent);
		assertEquals("Presión atmosférica: 1008.0 Radiación solar: 500.0 ", presionDecorator.displayData()+radiacionDecorator.displayData());
	}
	
	@Test
	public void comprobarTest3() {
		BaseDecorator presionDecorator = new PresionAtmosfericaDecorator(this.appComponent);
		BaseDecorator celsiusDecorator = new TemperaturaCelsiusDecorator(this.appComponent);
		BaseDecorator promedioCelsius = new PromedioCelsiusDecorator(this.appComponent);
		assertEquals("Presión atmosférica: 1008.0 Temperatura C: 28.0 Promedio de temperaturas C: 25.0 ", presionDecorator.displayData()+celsiusDecorator.displayData()+promedioCelsius.displayData());
		// Este test da mal por los decimales :L
	}

}
