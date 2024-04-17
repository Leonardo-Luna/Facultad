package e5;

import e2.BinaryTree;

public class ProfundidadArbolBinario {
	
	BinaryTree<Integer> arbol;
	
	public ProfundidadArbolBinario(BinaryTree<Integer> a) {
		
		this.arbol = a;
		
	}
	
	private int SumarElementos(int p, BinaryTree<Integer> a, int niv) {
		
		int suma = 0;
		
		if(p == niv) {
			
			return a.getData();
			
		}
		
		else {
		
			if(a.hasLeftChild()) {
				suma += SumarElementos(p, a.getLeftChild(), niv+1);
			}
			
			if(a.hasRightChild()) {
				suma += SumarElementos(p, a.getRightChild(), niv+1);
			}
		
			return suma;
			
		}

	}
	
	public int SumaElementosProfundidad(int p) {
		
		int nivel = 0;
		
		if(!this.arbol.isEmpty()) {
			return SumarElementos(p, this.arbol, nivel);
		}
		else {
			return 0;
		}
		
	}

}
