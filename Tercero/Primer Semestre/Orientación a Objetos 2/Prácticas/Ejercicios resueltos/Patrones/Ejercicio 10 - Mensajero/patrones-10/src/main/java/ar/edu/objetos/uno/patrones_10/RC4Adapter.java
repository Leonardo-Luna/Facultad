package ar.edu.objetos.uno.patrones_10;

public class RC4Adapter implements AlgoritmoCifrado {
	
	private RC4 cipher;
	private String key;
	
	public RC4Adapter(String key) {
		this.cipher = new RC4();
		this.key = key;
	}
	
	public String cifrar(String message) {
		return this.cipher.encriptar(message, this.key);
	}
	
	public String descifrar(String cipheredMessage) {
		return this.cipher.desencriptar(cipheredMessage, this.key);
	}

}
