package ar.edu.objetos.uno.patrones_13;

public class BuilderClasico extends SandwichBuilder {
	
	@Override
	public void buildPan() {
		this.getSandwich().setPan("Brioche");
		this.getSandwich().setPrecioPan(100);
	}
	
	@Override
	public void buildAderezo() {
		this.getSandwich().setAderezo("Mayonesa");
		this.getSandwich().setPrecioAderezo(20);
	}
	
	@Override
	public void buildPrincipal() {
		this.getSandwich().setPrincipal("Carne de ternera");
		this.getSandwich().setPrecioPrincipal(300);
	}
	
	@Override
	public void buildAdicional() {
		this.getSandwich().setAdicional("Tomate");
		this.getSandwich().setPrecioAdicional(80);
	}
	

}
