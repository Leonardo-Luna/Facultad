package ar.edu.unlp.objetos.uno.ejercicios;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UsuarioTest {
	
	private Usuario usuario;
	Propiedad p6 = new Propiedad("", "", 0);
	
	@BeforeEach()
	public void setUp() {
		this.usuario = new Usuario("Leo", "1 entre 2 y 3", "1.234.567");
		
		Propiedad p1 = new Propiedad("2 entre 3 y 4", "Propiedad 1", 10.42);
		Propiedad p2 = new Propiedad("3 entre 4 y 5", "Propiedad 2", 20.42);
		Propiedad p3 = new Propiedad("4 entre 5 y 6", "Propiedad 3", 30.42);
		Propiedad p4 = new Propiedad("5 entre 6 y 7", "Propiedad 4", 40.42);
		Propiedad p5 = new Propiedad("6 entre 7 y 8", "Propiedad 5", 50.42);

		this.usuario.ListarPropiedad(p1);
		this.usuario.ListarPropiedad(p2);
		this.usuario.ListarPropiedad(p3);
		this.usuario.ListarPropiedad(p4);
		this.usuario.ListarPropiedad(p5);
		
	}
	
	@Test
	public void testListarPropiedad() {
		this.usuario.ListarPropiedad(this.p6);
		
		assertEquals(6, this.usuario.getCantidadPropiedades());
	}
	
	@Test
	public void testDarDeBajaPropiedad() {
		this.usuario.DarDeBajaPropiedad(this.p6);
		
		assertEquals(5, this.usuario.getCantidadPropiedades());
	}
	
	@Test
	public void testReservar() {
		LocalDate desde = LocalDate.now();
		LocalDate hasta = LocalDate.now().plusDays(5);
		
		assertEquals(true, this.usuario.Reservar(desde, hasta, p6));
		assertEquals(false, this.usuario.Reservar(desde, hasta, p6));
	}
	
	/*@Test
	public void cancelarReserva() {
		LocalDate desde = LocalDate.now();
		LocalDate hasta = LocalDate.now().plusDays(5);
		Reserva r = new Reserva(desde, hasta);
		
		assertEquals(true, this.usuario.cancelarReserva(r, p6));
		assertEquals(false, this.usuario.cancelarReserva(r, p6));
	}*/

}
