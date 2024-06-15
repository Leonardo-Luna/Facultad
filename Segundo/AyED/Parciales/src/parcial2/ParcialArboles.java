package parcial2;

import archivos.BinaryTree;

public class ParcialArboles {
	
	private boolean calcular(BinaryTree<Integer> a1, BinaryTree<Integer> a2, boolean p) {
		
		if(a1.hasLeftChild()) {
			if(a2.hasLeftChild()) {
				p = p && calcular(a1.getLeftChild(), a2.getLeftChild(), p);
			} else {
				return false;
			}
		}
		
		if(a1.hasRightChild()) {
			if(a2.hasRightChild()) {
				p = p && calcular(a1.getRightChild(), a2.getRightChild(), p);
			} else {
				return false;
			}
		}
		
		if(a1.getData() == a2.getData()) {
			return true;
		}
		
		return false;
		
	}
	
	public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
		
		if(arbol1 != null && arbol2 != null) {
			
			boolean prefijo = true;
			
			return calcular(arbol1, arbol2, prefijo);
			
		} else {
			return false;
		}
		
	}

}
