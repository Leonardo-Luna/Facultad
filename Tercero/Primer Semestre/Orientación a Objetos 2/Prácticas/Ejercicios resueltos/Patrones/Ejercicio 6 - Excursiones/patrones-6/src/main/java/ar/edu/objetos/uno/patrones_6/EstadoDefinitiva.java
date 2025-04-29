package ar.edu.objetos.uno.patrones_6;

public class EstadoDefinitiva extends EstadoExcursion {
	
	public EstadoDefinitiva(Excursion e) {
		super(e);
	}
	
	public void inscribir(Usuario u) {
		Excursion e = this.getExcursion();
		
		if(!e.excursionLlena()) {
			this.getExcursion().addListaInscriptos(u);
		}
		else {
			e.setEstado(new EstadoLlena(e));
			e.getEstado().inscribir(u);
		}
	}
	
	public String obtenerInformacion() {
		Excursion e = this.getExcursion();
		String str = this.obtenerInformacion();
		
		return str + "Faltan " + e.calcularFaltantesCupoMaximo() + " para llegar al cupo máximo.";
	}

}
