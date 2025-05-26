package ar.edu.objetos.uno.patrones_13;

public class BuilderVegano extends SandwichBuilder {
	
	@Override
	public void buildPan() {
		this.getSandwich().setPan("Pan integral");
		this.getSandwich().setPrecioPan(100);
	}
	
	@Override
	public void buildAderezo() {
		this.getSandwich().setAderezo("Salsa criolla");
		this.getSandwich().setPrecioAderezo(20);
	}
	
	@Override
	public void buildPrincipal() {
		this.getSandwich().setPrincipal("Milanesa de girgolas");
		this.getSandwich().setPrecioPrincipal(500);
	}
	
	@Override
	public void buildAdicional() {
		this.getSandwich().setAdicional("Sin adicional");
		this.getSandwich().setPrecioAdicional(0);
	}

}
