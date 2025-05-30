package ar.edu.objetos.uno.patrones_15;

public abstract class PCBuilder {
	
	private PC pc;
	
	public void reset() {
		this.pc = new PC();
	}
	
	public PC getPC() {
		return this.pc;
	}
	
	// Tengo terrible duda con el tema componentes, porque algunos son una colección (la mayoría de la PC gamer. Cómo gestiono eso?

}
