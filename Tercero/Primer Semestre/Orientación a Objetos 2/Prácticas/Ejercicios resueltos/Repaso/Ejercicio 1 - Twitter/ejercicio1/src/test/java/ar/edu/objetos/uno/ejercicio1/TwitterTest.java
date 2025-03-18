package ar.edu.objetos.uno.ejercicio1;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.*;

public class TwitterTest {
	
	Twitter twitter;
	Twitter twitterCargado;
	Usuario leo;
	Usuario gonza;

	@BeforeEach
	public void SetUp() throws Exception {
		
		this.twitter = new Twitter();
		
		this.twitterCargado = new Twitter();
		this.leo = new Usuario("Leo");
		this.gonza = new Usuario("Gonza");
		this.twitterCargado.crearUsuario(this.leo);
		this.twitterCargado.crearUsuario(this.gonza);
		
		
	}
	
	@Test
	public void testCrearUsuario() {
		
		assertEquals(true, this.twitter.crearUsuario(this.leo));
		assertEquals(false, this.twitter.crearUsuario(this.leo));
		assertEquals(true, this.twitter.crearUsuario(this.gonza));
		
	}
	
	@Test
	public void testEliminarUsuario() {
		
		assertEquals(true, this.twitterCargado.eliminarUsuario(this.leo));
		assertEquals(false, this.twitterCargado.eliminarUsuario(this.leo));
		assertEquals(true, this.twitterCargado.eliminarUsuario(this.gonza));
		
	}
	
}
