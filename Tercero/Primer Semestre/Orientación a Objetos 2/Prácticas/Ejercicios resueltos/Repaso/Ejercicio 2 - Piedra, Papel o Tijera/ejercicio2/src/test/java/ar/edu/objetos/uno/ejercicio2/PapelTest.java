package ar.edu.objetos.uno.ejercicio2;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PapelTest {
	
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
		
		assertEquals("Ganador: Tijera", this.papel.contra(this.tijera));
		assertEquals("Ganador: Papel", this.papel.contra(this.piedra));
		assertEquals("Empate", this.papel.contra(this.papel));
		
	}

}
