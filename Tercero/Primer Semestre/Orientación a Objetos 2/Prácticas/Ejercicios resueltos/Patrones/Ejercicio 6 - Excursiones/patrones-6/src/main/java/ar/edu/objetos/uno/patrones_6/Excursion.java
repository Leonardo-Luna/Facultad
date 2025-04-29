package ar.edu.objetos.uno.patrones_6;

import java.time.LocalDate;
import java.util.ArrayList;

public class Excursion {

	private String nombre;
	private double costo;
	private LocalDate fechaInicio;
	private LocalDate fechaFin;
	private String puntoEncuentro;
	private int cupoMinimo;
	private int cupoMaximo;
	
	private ArrayList<Usuario> inscriptos;
	private ArrayList<Usuario> listaEspera;
	
	private EstadoExcursion estado;
	
	public Excursion(String nombre, double costo, LocalDate fechaInicio, LocalDate fechaFin, String puntoEncuentro, int cupoMinimo, int cupoMaximo) {
		this.nombre = nombre;
		this.costo = costo;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.puntoEncuentro = puntoEncuentro;
		this.cupoMinimo = cupoMinimo;
		this.cupoMaximo = cupoMaximo;
		this.inscriptos = new ArrayList<Usuario>();
		this.listaEspera = new ArrayList<Usuario>();
	}
	
	public boolean excursionLlena() {
		return this.inscriptos.size() > this.cupoMaximo;
	}
	
	public boolean excursionLlegaMinimo() {
		return this.inscriptos.size() >= this.cupoMinimo;
	}
	
	public void addListaEspera(Usuario u) {
		this.listaEspera.add(u);
	}
	
	public void addListaInscriptos(Usuario u) {
		this.inscriptos.add(u);
	}
	
	public void setEstado(EstadoExcursion estado) {
		this.estado = estado;
	}
	
	public EstadoExcursion getEstado() {
		return this.estado;
	}
	
	public int calcularFaltantesCupoMinimo() {
		return this.cupoMinimo - this.inscriptos.size();
	}
	
	public int calcularFaltantesCupoMaximo() {
		return this.cupoMaximo - this.inscriptos.size();
	}
	
	public String getStringGenerico() {
		String str = "%s, $%s | %s a %s | Salida de %s | ";
		
		return String.format(str, this.nombre, this.costo, this.fechaInicio, this.fechaFin, this.puntoEncuentro);

	}
	
}
