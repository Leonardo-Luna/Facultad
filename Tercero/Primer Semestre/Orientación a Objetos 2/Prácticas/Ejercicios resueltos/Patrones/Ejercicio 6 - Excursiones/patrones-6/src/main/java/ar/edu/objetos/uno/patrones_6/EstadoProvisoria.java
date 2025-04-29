package ar.edu.objetos.uno.patrones_6;

public class EstadoProvisoria extends EstadoExcursion {
	
	public EstadoProvisoria(Excursion e) {
		super(e);
	}
	
	public void inscribir(Usuario u) {
		
		Excursion e = this.getExcursion();
		
		if(!e.excursionLlegaMinimo()) {
			e.addListaInscriptos(u);
		}
		else {
			e.setEstado(new EstadoDefinitiva(e));
			e.getEstado().inscribir(u);
		}
	}
	
	public String obtenerInformacion() {
		Excursion e = this.getExcursion();
		String str = this.obtenerInformacion();
		
		return str + "Faltan " + e.calcularFaltantesCupoMinimo() + " para llegar al cupo mínimo.";
	}

}
