package ar.edu.objetos.uno.patrones_10;

public class Mensajero {
	
	private AlgoritmoCifrado algoritmo;
	
	public Mensajero(AlgoritmoCifrado algoritmo) {
		this.algoritmo = algoritmo;
	}
	
	public String enviar(String mensaje) {
		return this.algoritmo.cifrar(mensaje);
	}
	
	public String recibir(String mensaje) {
		return this.algoritmo.descifrar(mensaje);
	}

	public void setAlgoritmo(AlgoritmoCifrado algoritmo) {
		this.algoritmo = algoritmo;
	}
	
}
