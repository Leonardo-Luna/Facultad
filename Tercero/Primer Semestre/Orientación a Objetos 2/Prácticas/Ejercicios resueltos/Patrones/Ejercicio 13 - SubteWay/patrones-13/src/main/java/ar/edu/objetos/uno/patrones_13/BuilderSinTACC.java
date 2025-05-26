package ar.edu.objetos.uno.patrones_13;

public class BuilderSinTACC extends SandwichBuilder {
	
	@Override
	public void buildPan() {
		this.getSandwich().setPan("Chipá");
		this.getSandwich().setPrecioPan(150);
	}
	
	@Override
	public void buildAderezo() {
		this.getSandwich().setAderezo("Salsa tártara");
		this.getSandwich().setPrecioAderezo(18);
	}
	
	@Override
	public void buildPrincipal() {
		this.getSandwich().setPrincipal("Carne de pollo");
		this.getSandwich().setPrecioPrincipal(250);
	}
	
	@Override
	public void buildAdicional() {
		this.getSandwich().setAdicional("Verduras grilladas");
		this.getSandwich().setPrecioAdicional(200);
	}

}
