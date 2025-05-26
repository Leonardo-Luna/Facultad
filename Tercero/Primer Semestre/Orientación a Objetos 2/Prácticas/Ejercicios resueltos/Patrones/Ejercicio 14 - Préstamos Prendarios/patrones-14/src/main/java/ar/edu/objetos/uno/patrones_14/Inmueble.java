package ar.edu.objetos.uno.patrones_14;

public class Inmueble extends Component {
	
	private String direccion;
	private double superficie;
	private double costoM2;
	private double liquidez;
	
	public Inmueble(String direccion, double superficie, double costoM2) {
		super();
		this.direccion = direccion;
		this.superficie = superficie;
		this.costoM2 = costoM2;
		this.liquidez = 0.2;
	}
	
	public double getValor() {
		return this.superficie * this.costoM2;
	}
	
	public double getLiquidez() {
		return this.liquidez;
	}

}
