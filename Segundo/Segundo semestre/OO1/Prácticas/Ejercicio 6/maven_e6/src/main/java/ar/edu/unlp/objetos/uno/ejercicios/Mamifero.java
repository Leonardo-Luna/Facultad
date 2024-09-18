package ar.edu.unlp.objetos.uno.ejercicios;

import java.time.LocalDate;

public class Mamifero extends Object { 
	
	private String identificador;
	private String especie;
	private LocalDate fechaNacimiento;
	private Mamifero madre;
	private Mamifero padre;
	
	public Mamifero() {
		
	}
	
	public Mamifero(String id) {
		this.identificador = id;
	}
	
	private boolean buscarAncestros(Mamifero m) {
		if(this == m){
			return true;
		} 
		else {
			boolean aux = false;
			
			if(this.padre != null) {
				aux = aux || this.padre.buscarAncestros(m);
			}
			if(this.madre != null) {
				aux = aux || this.madre.buscarAncestros(m);
			}
			return aux;
		}
	}
	
	public boolean tieneComoAncestroA(Mamifero m) {
		
		if((this.madre == m) || (this.padre == m)) {
			return true;
		}
		else {
			
			boolean aux = false;
			
			if(this.madre != null) {
				aux = aux || this.madre.buscarAncestros(m);
			}
			
			if(this.padre != null) {
				aux = aux || this.padre.buscarAncestros(m);
			}
	
			return aux;
			
		}
		
	}
	
	public boolean tieneComoAncestroA2(Mamifero m) {
		
		if((this.padre == m) || (this.madre == m)) {
			return true;
		}
		
		boolean busquedaMadre = false;
		boolean busquedaPadre = false;
		
		if(this.madre != null) {
			busquedaMadre = this.madre.tieneComoAncestroA2(m);
		}
		
		if((!busquedaMadre) && (this.padre != null) {
			busquedaPadre = this.padre.tieneComoAncestroA2(m);
		}
		
		return busquedaMadre || busquedaPadre;
	}
	
	public String getIdentificador() {
		return this.identificador;
	}
	
	public void setIdentificador(String id) {
		this.identificador = id;
	}
	
	public String getEspecie() {
		return this.especie;
	}

	public void setEspecie(String e) {
		this.especie = e;
	}
	
	public LocalDate getFechaNacimiento() {
		return this.fechaNacimiento;
	}
	
	public void setFechaNacimiento(LocalDate fecha) {
		this.fechaNacimiento = fecha;
	}
	
	public Mamifero getPadre() {
		return this.padre;
	}
	
	public void setPadre(Mamifero p) {
		this.padre = p;
	}
	
	public Mamifero getMadre() {
		return this.madre;
	}
	
	public void setMadre(Mamifero m) {
		this.madre = m;
	}
	
	public Mamifero getAbueloMaterno() {
		return (this.madre == null) ? null : this.madre.getPadre();
	}
	
	public Mamifero getAbuelaMaterna() {
		return (this.madre == null) ? null : this.madre.getMadre();
	}
	
	public Mamifero getAbueloPaterno() {
		return (this.padre == null) ? null : this.padre.getPadre();
	}
	
	public Mamifero getAbuelaPaterna() {
		return (this.padre == null) ? null : this.padre.getMadre();
	}
	
}
