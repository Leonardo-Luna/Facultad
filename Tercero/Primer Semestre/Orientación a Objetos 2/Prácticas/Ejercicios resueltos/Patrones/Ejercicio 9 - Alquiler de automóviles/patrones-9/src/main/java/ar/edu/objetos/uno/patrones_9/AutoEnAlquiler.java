package ar.edu.objetos.uno.patrones_9;

public class AutoEnAlquiler {
	
	private double precioPorDia;
	private int cantidadPlazas;
	private String marca;
	private EstrategiaCancelacion estrategia;
	
	public AutoEnAlquiler(double precioPorDia, int cantidadPlazas, String marca, EstrategiaCancelacion estrategia) {
		this.precioPorDia = precioPorDia;
		this.cantidadPlazas = cantidadPlazas;
		this.marca = marca;
		this.estrategia = estrategia;
	}

	public double getPrecioPorDia() {
		return this.precioPorDia;
	}
	
	public EstrategiaCancelacion getPoliticaCancelacion() {
		return this.estrategia;
	}
	
	public void setEstrategiaCancelacion(EstrategiaCancelacion estrategia) {
		this.estrategia = estrategia;
	}
	
}
