package ar.edu.objetos.uno.ejercicio2;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class PiedraTest {
	
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
		
		assertEquals("Ganador: Papel", this.piedra.contra(this.papel));
		assertEquals("Perdedor", this.piedra.contra(this.tijera));
		assertEquals("Empate", this.piedra.contra(this.piedra));
		
	}

}
