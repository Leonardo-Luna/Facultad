package ar.edu.objetos.uno.parcial_2;

public abstract class Builder {
	
	private Presupuesto presupuesto;
	
	public Builder() {
		this.reset();
	}
	
	public void reset() {
		this.presupuesto = new Presupuesto();
	}
	
	public Presupuesto getPresupuesto() {
		return this.presupuesto;
	}
	
	public void setCliente(String nombreCliente) {
		this.presupuesto.setCliente(nombreCliente);
	}
	
	public abstract void setProcesador();
	public abstract void setRAM();
	public abstract void setDisco();
	public abstract void setGrafica();
	public abstract void setGabinete();
	

}
