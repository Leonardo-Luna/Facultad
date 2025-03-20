package ar.edu.objetos.uno.ejercicio2;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class TijeraTest {
	
	private Piedra piedra;
	private Papel papel;
	private Tijera tijera;
	
	@BeforeEach
	public void setUp() throws Exception {
		
		this.piedra = new Piedra();
		this.papel = new Papel();
		this.tijera = new Tijera();
		
	}
	
	@Test
	public void testContra() {
		
		assertEquals("Perdedor", this.tijera.contra(this.papel));
		assertEquals("Ganador: Piedra", this.tijera.contra(this.piedra));
		assertEquals("Empate", this.tijera.contra(this.tijera));
		
	}

}
