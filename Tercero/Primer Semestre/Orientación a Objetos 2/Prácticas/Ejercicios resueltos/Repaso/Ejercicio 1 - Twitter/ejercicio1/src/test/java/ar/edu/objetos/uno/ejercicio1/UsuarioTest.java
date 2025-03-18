package ar.edu.objetos.uno.ejercicio1;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.*;


public class UsuarioTest {
	
	Usuario leo; 
	Usuario gonza;
	Usuario mati;
	
	Tweet t1;
	Tweet t2;
	
	@BeforeEach
	public void SetUp() throws Exception {
		
		this.leo = new Usuario("Leo");
		this.gonza = new Usuario("Gonza");
		this.mati = new Usuario("Mati");
		
		this.mati.publicarTweet("Test");
		this.mati.publicarTweet("Test 2");
		
		this.t1 = new Tweet("Tweet 1");
		this.t2 = new Tweet("Tweet 2");
		
	}
	
	@Test
	public void testGetScreenName() {
		
		assertEquals("Leo", this.leo.getScreenName());
		
	}
	
	@Test
	public void testPublicarTweet() {
		
		assertEquals(true, this.leo.publicarTweet("Texto de ejemplo"));
		assertEquals(false, this.gonza.publicarTweet("")); // Los tests de abajo son 280 y 281 caracteres
		assertEquals(true, this.gonza.publicarTweet("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"));
		assertEquals(false, this.mati.publicarTweet("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"));
		
	}
	
	@Test
	public void testRetweetear() {
		
		assertEquals(true, this.leo.retweetear(this.t1));
		assertEquals(true, this.gonza.retweetear(this.t2));
		
	}
	
	@Test
	public void testEliminarPublicaciones() {
		
		assertEquals(2, this.mati.getCantidadPublicaciones());
		this.mati.eliminarPublicaciones();
		assertEquals(0, this.mati.getCantidadPublicaciones());
		
	}

}
