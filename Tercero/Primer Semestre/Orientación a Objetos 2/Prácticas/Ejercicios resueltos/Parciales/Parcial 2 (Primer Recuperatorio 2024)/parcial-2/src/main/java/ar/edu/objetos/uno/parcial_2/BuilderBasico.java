package ar.edu.objetos.uno.parcial_2;

public class BuilderBasico extends Builder {
	
	public BuilderBasico() {
		super();
	}
	
	public void setProcesador() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("Procesador Básico"));
	}
	
	public void setRAM() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("8 GB"));
	}
	
	public void setDisco() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("HDD 500GB"));
	}
	
	public void setGrafica() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("Integrada"));
	}
	
	public void setGabinete() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("Gabinete Estándar"));
	}

}
