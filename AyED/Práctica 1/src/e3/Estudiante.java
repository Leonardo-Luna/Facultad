package e3;

public class Estudiante {
	
	String nombre;
	String apellido;
	String comision;
	String email;
	String direccion;
	
	public Estudiante(String nombre, String apellido, String comision, String email, String direccion) {
		
		this.nombre = nombre;
		this.apellido = apellido;
		this.comision = comision;
		this.email = email;
		this.direccion = direccion;
		
	}
	
	public void setNombre(String nombre) {
		
		this.nombre = nombre;
		
	}
	
	public String getNombre() {
		
		return this.nombre;
		
	}
	
	public void setApellido(String apellido) {
		
		this.apellido = apellido;
		
	}
	
	public String getApellido() {
		
		return this.apellido;
		
	}
	
	public void setComision(String comision) {
		
		this.comision = comision;
		
	}
	
	public String getComision() {
		
		return this.comision;
		
	}
	
	public void setEmail(String email) {
		
		this.email = email;
		
	}
	
	public String getEmail() {
		
		return this.email;
		
	}
	
	public void setDireccion(String direccion) {
		
		this.direccion = direccion;
		
	}
	
	public String getDireccion() {
		
		return this.direccion;
		
	}
	
	public String tusDatos() {
		
		String st = this.getNombre() + " " + this.getApellido() + " - " + this.getEmail() + " | " + this.getDireccion() + " | Comision " + this.getComision();
		return st;
		
	}

}
