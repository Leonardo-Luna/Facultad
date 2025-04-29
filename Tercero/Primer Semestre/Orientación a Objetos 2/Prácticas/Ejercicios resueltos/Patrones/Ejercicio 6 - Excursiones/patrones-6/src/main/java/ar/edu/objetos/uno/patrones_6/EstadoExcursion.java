package ar.edu.objetos.uno.patrones_6;

public abstract class EstadoExcursion {
	
	private Excursion excursion;
	
	abstract void inscribir(Usuario u);
	
	public EstadoExcursion(Excursion excursion) {
		this.excursion = excursion;
	}
	
	public Excursion getExcursion() {
		return this.excursion;
	}
	
	public void setExcursion(Excursion excursion) {
		this.excursion = excursion;
	}
	
	public String obtenerInformacion() {
		Excursion e = this.getExcursion();
		return e.getStringGenerico();
	}

}
