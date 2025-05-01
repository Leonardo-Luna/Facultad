package ar.edu.objetos.uno.patrones_10;

public class FeistelCipherAdapter implements AlgoritmoCifrado {

	private FeistelCipher cipher;
	
	public FeistelCipherAdapter(String key) {
		this.cipher = new FeistelCipher(key);
	}
	
	public String cifrar(String message) {
		return this.cipher.encode(message);
	}
	
	public String descifrar(String cipheredMessage) {
		return this.cipher.encode(cipheredMessage);
	}
	
}
