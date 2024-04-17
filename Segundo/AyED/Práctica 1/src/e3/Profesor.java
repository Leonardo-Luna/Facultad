package e3;

public class Profesor {
	
	String nombre;
	String apellido;
	String email;
	String catedra;
	String facultad;
	
	public Profesor(String nombre, String apellido, String email, String catedra, String facultad) {
		
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.catedra = catedra;
		this.facultad = facultad;
		
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
	
	public void setCatedra(String catedra) {
		
		this.catedra = catedra;
		
	}
	
	public String getCatedra() {
		
		return this.catedra;
		
	}
	
	public void setEmail(String email) {
		
		this.email = email;
		
	}
	
	public String getEmail() {
		
		return this.email;
		
	}
	
	public void setFacultad(String facultad) {
		
		this.facultad = facultad;
		
	}
	
	public String getFacultad() {
		
		return this.facultad;
		
	}
	
	public String tusDatos() {
		
		String st = this.getNombre() + " " + this.getApellido() + " - " + this.getEmail() + " | Facultad de " + this.getFacultad() + " > " + this.getCatedra();
		return st;
		
	}

}
