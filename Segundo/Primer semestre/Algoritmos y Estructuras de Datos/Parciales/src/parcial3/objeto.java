package parcial3;

public class objeto {
	
	int suma;
	int diferencia;
	
	public objeto() {
		
	}
	
	public objeto(int s, int d) {
		this.suma = s;
		this.diferencia = d;
	}
	
	public int getSuma() {
		return this.suma;
	}
	
	public int getDiferencia() {
		return this.diferencia;
	}
	
	public void setSuma(int v) {
		this.suma = v;
	}
	
	public void setDiferencia(int v) {
		this.diferencia = v;
	}
	
	@Override
	public String toString() {
		return this.suma + " " + this.diferencia; 
	}

}
