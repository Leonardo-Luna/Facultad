package ar.edu.objetos.uno.patrones_13;

public class DirectorSubteWay {
	
	private SandwichBuilder builder;
	
	public DirectorSubteWay() {
		this.builder = new BuilderClasico(); // Para tener uno por default
	}
	
	public void setBuilder(SandwichBuilder builder) {
		this.builder = builder;
	}
	
	public Sandwich buildSandwich() {
		this.builder.reset();
		
		this.builder.buildPan();
		this.builder.buildAderezo();
		this.builder.buildPrincipal();
		this.builder.buildAdicional();
		
		return this.builder.getSandwich();
	}

}
