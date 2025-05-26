package ar.edu.objetos.uno.patrones_13;

public abstract class SandwichBuilder {
	
	private Sandwich sandwich;
	
	public void reset() {
		this.sandwich = new Sandwich();
	}
	
	public Sandwich getSandwich() {
		return this.sandwich;
	}
	
	public abstract void buildPan();
	public abstract void buildAderezo();
	public abstract void buildPrincipal();
	public abstract void buildAdicional();
 
}
