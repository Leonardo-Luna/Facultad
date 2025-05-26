package ar.edu.objetos.uno.patrones_13;

public class Sandwich {
	
	private String pan;
	private String aderezo;
	private String principal;
	private String adicional;
	
	private double precioPan = 0;
	private double precioAderezo = 0;
	private double precioPrincipal = 0;
	private double precioAdicional = 0;
	
	public Sandwich() {}
	
	public double calcularPrecioFinal() {
		return this.precioPan + this.precioAderezo + this.precioPrincipal + this.precioAdicional;
	}
	
	public void setPan(String pan) {
		this.pan = pan;
	}
	
	public String getPan() {
		return this.pan;
	}
	
	public void setAderezo(String aderezo) {
		this.aderezo = aderezo;
	}
	
	public String getAderezo() {
		return this.aderezo;
	}
	
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	
	public String getPrincipal() {
		return this.principal;
	}
	
	public void setAdicional(String adicional) {
		this.adicional = adicional;
	}
	
	public String getAdicional() {
		return this.adicional;
	}
	
	public void setPrecioPan(double precioPan) {
		this.precioPan = precioPan;
	}
	
	public double getPrecioPan() {
		return this.precioPan;
	}
	
	public void setPrecioAderezo(double precioAderezo) {
		this.precioAderezo = precioAderezo;
	}
	
	public double getPrecioAderezo() {
		return this.precioAderezo;
	}
	
	public void setPrecioPrincipal(double precioPrincipal) {
		this.precioPrincipal = precioPrincipal;
	}
	
	public double getPrecioPrincipal(double precioPrincipal) {
		return this.precioPrincipal;
	}
	
	public void setPrecioAdicional(double precioAdicional) {
		this.precioAdicional = precioAdicional;
	}
	
	public double getPrecioAdicional() {
		return this.precioAdicional;
	}

}
