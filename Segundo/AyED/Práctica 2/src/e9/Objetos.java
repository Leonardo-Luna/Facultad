package e9;

public class Objetos {
	
	public int suma;
	public int dif;
	
	public Objetos(int suma, int dif) {
		
		this.suma = suma;
		this.dif = dif;
		
	}
	
	@Override
	public String toString() {
		
		String a = this.suma + " | " + this.dif;
		
		return a;
		
	}
	
}
