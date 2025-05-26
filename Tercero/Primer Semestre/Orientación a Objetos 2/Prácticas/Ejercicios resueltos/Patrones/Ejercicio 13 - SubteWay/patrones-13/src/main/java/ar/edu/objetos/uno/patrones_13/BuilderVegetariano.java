package ar.edu.objetos.uno.patrones_13;

public class BuilderVegetariano extends SandwichBuilder {
	
	@Override
	public void buildPan() {
		this.getSandwich().setPan("Pan con semillas");
		this.getSandwich().setPrecioPan(120);
	}
	
	@Override
	public void buildAderezo() {
		this.getSandwich().setAderezo("Sin aderezo");
		this.getSandwich().setPrecioAderezo(0);
	}
	
	@Override
	public void buildPrincipal() {
		this.getSandwich().setPrincipal("Provoleta Grillada");
		this.getSandwich().setPrecioPrincipal(200);
	}
	
	@Override
	public void buildAdicional() {
		this.getSandwich().setAdicional("Berenjenas al escabeche");
		this.getSandwich().setPrecioAdicional(100);
	}

}
