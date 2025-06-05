package ar.edu.objetos.uno.parcial_2;

public class Director {
	
	private Builder builder;
	
	public Presupuesto build() {
		this.builder.reset();
		
		this.builder.setProcesador();
		this.builder.setRAM();
		this.builder.setDisco();
		this.builder.setGrafica();
		this.builder.setGabinete();
		
		return this.builder.getPresupuesto();
	}
	
	public void setBuilder(Builder builder) {
		this.builder = builder;
	}

}
