package ar.edu.objetos.uno.parcial_4;

public class Item implements Componente {
	
	private int espacio;
	private String nombre;
	
	public Item(int espacio, String nombre) {
		this.espacio = espacio;
		this.nombre = nombre;
	}
	
	public int espacioQueOcupa() {
		return this.espacio;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public int getCapacidad() {
		return 0;
	}
	
	public Item buscarItem(String nombre) {
		if(this.nombre.equals(nombre)) {
			return this;
		}
		return null;
	}

}
