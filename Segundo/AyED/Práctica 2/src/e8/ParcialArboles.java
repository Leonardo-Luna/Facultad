package e8;

import e2.BinaryTree;

public class ParcialArboles {
	
	private boolean verSiEsPrefijoNombreOriginal(BinaryTree<Integer> a1, BinaryTree<Integer> a2) {
		
		boolean aux;
		
		if(a1.getData() == a2.getData()) {
			
			aux = true;
		
			if(a1.hasLeftChild()) {
				
				if(a2.hasLeftChild()) {
					
					aux = aux && verSiEsPrefijoNombreOriginal(a1.getLeftChild(), a2.getLeftChild());
				
				}
				else {
					return false;
				}
			}
			
			if(a1.hasRightChild()) {
				
				if(a2.hasRightChild()) {
					
					aux = aux && verSiEsPrefijoNombreOriginal(a1.getRightChild(), a2.getRightChild());
					
				}
				else {
					return false;
				}
				
			}
			
			return aux;
		
		}
		
		return false;
		
	}
	
	public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
		
		return verSiEsPrefijoNombreOriginal(arbol1, arbol2);
		
	}

}
