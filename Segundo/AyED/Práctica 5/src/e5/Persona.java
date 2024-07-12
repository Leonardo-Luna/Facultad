package e5;

public class Persona {

	private String nombre;
	private String domicilio;
	private boolean esEmpleado;
	private boolean cobro;
	
	public Persona(String n, String d, boolean es, boolean cobro) {
		this.nombre = n;
		this.domicilio = d;
		this.esEmpleado = es;
		this.cobro = cobro;
	}
	
	public boolean getEsEmpleado() {
		return this.esEmpleado;
	}
	
	public boolean getCobro() {
		return this.cobro;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	@Override
	public String toString() {
		
		String s = this.nombre;
		return s;
		
	}
	
	//Resto de getter y setter no hago por paja 
	
}
