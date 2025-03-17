package parcialGrafos;

public class Tupla {

	private int cantidad;
	private boolean esPopular;
	
	public Tupla(int c, boolean e) {
		this.cantidad = c;
		this.esPopular = e;
	}
	
	public Tupla() {
		
	}
	
	public void setEsPopular(boolean e) {
		this.esPopular = e;
	}
	
	public void setCantidad(int c) {
		this.cantidad = c;
	}
	
	@Override
	public String toString() {
        return this.cantidad + " " + this.esPopular;
    }

	
}
