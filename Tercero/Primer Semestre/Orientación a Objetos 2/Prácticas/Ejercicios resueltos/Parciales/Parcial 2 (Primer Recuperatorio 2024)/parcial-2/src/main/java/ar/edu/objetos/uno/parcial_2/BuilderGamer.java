package ar.edu.objetos.uno.parcial_2;

public class BuilderGamer extends Builder {
	
	private static final double PORCENTAJE_CONSUMO = 50;
	
	public BuilderGamer() {
		super();
	}
	
	public void setProcesador() {
		Presupuesto presupuesto = this.getPresupuesto();
		presupuesto.agregarComponente(Catalogo.getComponente("Procesador Gamer"));
		presupuesto.agregarComponente(Catalogo.getComponente("Pad térmico"));
		presupuesto.agregarComponente(Catalogo.getComponente("Cooler"));
	}
	
	public void setRAM() {
		Presupuesto presupuesto = this.getPresupuesto();
		presupuesto.agregarComponente(Catalogo.getComponente("32 GB"));
		presupuesto.agregarComponente(Catalogo.getComponente("32 GB"));
	}
	
	public void setDisco() {
		Presupuesto presupuesto = this.getPresupuesto();
		presupuesto.agregarComponente(Catalogo.getComponente("SSD 500 GB"));
		presupuesto.agregarComponente(Catalogo.getComponente("SSD 1 TBs"));
	}
	
	public void setGrafica() {
		this.getPresupuesto().agregarComponente(Catalogo.getComponente("RTX 4090"));
	}
	
	public void setGabinete() {
		Presupuesto presupuesto = this.getPresupuesto();
		presupuesto.agregarComponente(Catalogo.getComponente("Gabinete Gamer"));
		presupuesto.agregarComponente(Catalogo.getComponente("Fuente " + presupuesto.calcularConsumo() * (1 + this.PORCENTAJE_CONSUMO/100)  + " w")); // no tener magic numbers empeoró un 300% la cuenta q onda
	}

}
