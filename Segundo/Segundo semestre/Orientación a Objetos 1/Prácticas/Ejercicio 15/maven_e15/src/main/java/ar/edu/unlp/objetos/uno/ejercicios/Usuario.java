package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;
import java.util.*;

public class Usuario {

	private String nombre;
	private String domicilio;
	private List<Consumo> consumos;
	
	public Usuario(String n, String d) {
		this.nombre = n;
		this.domicilio = d;
		this.consumos = new ArrayList<Consumo>();
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	private Consumo obtenerUltimoConsumo() {
		return this.consumos.get(this.consumos.size()-1);
	}
	
	private double calcularUltimoConsumo(double preciokWh) {
		return this.obtenerUltimoConsumo().calcularConsumoEA(preciokWh);
	}
	
	public Factura emitirFactura(CuadroTarifario c) {
		boolean tieneBonificacion = this.obtenerUltimoConsumo().calcularFPE();
		LocalDate fecha = LocalDate.now();
		double montoTotal = this.calcularUltimoConsumo(c.getPrecio());
		double bonificacion = 0;
		
		if(tieneBonificacion) {
			bonificacion = montoTotal*0.10;
		}
		
		return new Factura(this, fecha, bonificacion, (montoTotal-bonificacion));
	}
	
}
