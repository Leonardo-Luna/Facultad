package ar.edu.objetos.uno.parcial_3;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.*;

public class AppComponentTest {
	
	private Component appComponent;
	private HomeWeatherStation hws;
	
	@BeforeEach
	public void setUp() {
		this.hws = new HomeWeatherStation(); // Se asume que los sensores arrojarán los valores del ejemplo
		this.appComponent = new AppComponent(hws);
	}
	
	@Test
	public void comprobarTest1() {
		BaseDecorator presionDecorator = new PresionAtmosfericaDecorator(this.appComponent);
		assertEquals("Presión atmosférica: 1008.0 ", presionDecorator.displayData());
	}
	
	@Test
	public void comprobarTest2() {
		Component componente = new AppComponent(this.hws);
		componente = new PresionAtmosfericaDecorator(componente);
		componente = new RadiacionSolarDecorator(componente);
		assertEquals("Presión atmosférica: 1008.0 Radiación solar: 500.0 ", componente.displayData());
	}
	
	@Test
	public void comprobarTest3() {
		BaseDecorator presionDecorator = new PresionAtmosfericaDecorator(this.appComponent);
		BaseDecorator celsiusDecorator = new TemperaturaCelsiusDecorator(presionDecorator);
		BaseDecorator promedioCelsius = new PromedioCelsiusDecorator(celsiusDecorator);
		assertEquals("Presión atmosférica: 1008.0 Temperatura C: 28.0 Promedio de temperaturas C: 25.0 ", promedioCelsius.displayData());
		// Este test da mal por los decimales :L
	}

}
