package e4;
import e2.*;

public class RedBinariaLlena {
	
	BinaryTree<Integer> arbol;
	
	public RedBinariaLlena(BinaryTree<Integer> arbolLleno) {
		this.arbol = arbolLleno;
	}

	private int calcularRetardo(BinaryTree<Integer> arbol) {
		
		int totalHI = 0;
		int totalHD = 0;
		
		if(arbol.hasLeftChild()) {
			totalHI = calcularRetardo(arbol.getLeftChild());
		}
		if(arbol.hasRightChild()) {
			totalHD = calcularRetardo(arbol.getRightChild());
		}
		
		return Math.max(totalHI, totalHD) + arbol.getData();
		
	}
	
	public int RetardoEnvio() {
		
		return(!this.arbol.isEmpty() ? calcularRetardo(this.arbol) : 0);
		
		
	}
	
}
