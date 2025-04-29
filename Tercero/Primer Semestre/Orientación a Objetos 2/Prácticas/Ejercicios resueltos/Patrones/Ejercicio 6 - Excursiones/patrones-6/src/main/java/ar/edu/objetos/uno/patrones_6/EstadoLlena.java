package ar.edu.objetos.uno.patrones_6;

public class EstadoLlena extends EstadoExcursion {
	
	public EstadoLlena(Excursion excursion) {
		super(excursion);
	}
	
	public void inscribir(Usuario u) {
		this.getExcursion().addListaEspera(u);
	}

}
