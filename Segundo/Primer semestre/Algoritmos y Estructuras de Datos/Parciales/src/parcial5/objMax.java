package parcial5;

public class objMax {

	int caminoMaximo;
	
	public objMax(int cM) {
		
		this.caminoMaximo = cM;
		
	}
	
	public void setCM(int c) {
		this.caminoMaximo = c;
	}
	
	public int getCM() {
		return this.caminoMaximo;
	}
	
	@Override
	public String toString() {
		return "Camino máximo: " + this.caminoMaximo;
	}
	

}
