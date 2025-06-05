package ar.edu.objetos.uno.parcial_2;

public class BuilderIntermedio extends Builder {
	
	public BuilderIntermedio() {
		super();
	}
	
	public void setProcesador() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("Procesador intermedio"));
	}
	
	public void setRAM() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("16 GB"));
	}
	
	public void setDisco() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("SSD 500 GB"));
	}
	
	public void setGrafica() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("GTXC 1650"));
	}
	
	public void setGabinete() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("Gabinete Intermedio"));
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("Fuente 800 w"));
	}

}
