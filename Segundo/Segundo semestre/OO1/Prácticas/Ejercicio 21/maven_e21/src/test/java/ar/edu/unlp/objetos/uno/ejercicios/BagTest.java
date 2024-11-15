package ar.edu.unlp.objetos.uno.ejercicios;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class BagTest {
	
	private Bag<Jugador> bag;
	private Jugador j1;
	private Jugador j2;
	
	@BeforeEach
	void SetUp() {
		this.bag = new Bag<Jugador>();
		this.j1 = new Jugador("Leo", "Luna");
		this.j2 = new Jugador("Gonza", "Villarreal");
	}
	
	@Test
	void addTest() {
		assertTrue(this.bag.add(this.j1));
		assertTrue(this.bag.add(this.j2));
	}
	
	@Test
	void occurrencesOfTest() {
		this.bag.add(this.j1);
		this.bag.add(this.j2);
		this.bag.add(this.j1);
		
		assertEquals(2, this.bag.occurrencesOf(this.j1));
		assertEquals(1, this.bag.occurrencesOf(this.j2));
	}
	
	@Test
	void removeOccurrenceTest() {
		this.bag.add(this.j1);
		this.bag.add(this.j2);
		this.bag.add(this.j1);
		
		this.bag.removeOccurrence(this.j1);
		this.bag.removeOccurrence(this.j2);
		
		assertEquals(1, this.bag.occurrencesOf(this.j1));
		assertEquals(0, this.bag.occurrencesOf(this.j2));
	}
	
	@Test
	void removeAllTest() {
		this.bag.add(this.j1);
		this.bag.add(this.j1);
		
		assertEquals(2, this.bag.occurrencesOf(this.j1));
		this.bag.removeAll(this.j1);
		assertEquals(0, this.bag.occurrencesOf(this.j1));
	}
	
	@Test
	void sizeTest() {
		this.bag.add(this.j1);
		this.bag.add(this.j1);
		
		assertEquals(2, this.bag.size());
		
		this.bag.add(this.j2);

		assertEquals(3, this.bag.size());
	}

}
