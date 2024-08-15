package e9;

import e2.BinaryTree;

public class ParcialArboles {
	
	private void crearArbol(BinaryTree<Integer> a, BinaryTree<Objetos> a2, int sum, int padre) {
		
		int datoOriginal = a.getData();
		
		Objetos bolita = new Objetos(sum+datoOriginal, datoOriginal-padre);
		
		a2.setData(bolita);
		
		if(a.hasLeftChild()) {
			
			a2.addLeftChild(new BinaryTree<Objetos>());
			crearArbol(a.getLeftChild(), a2.getLeftChild(), datoOriginal+sum, datoOriginal);
			
		}
		
		if(a.hasRightChild()) {
			
			a2.addRightChild(new BinaryTree<Objetos>());
			crearArbol(a.getRightChild(), a2.getRightChild(), datoOriginal+sum, datoOriginal);
			
		}
		
	}
	
	public BinaryTree<Objetos> sumAndDif(BinaryTree<Integer> arbol) {
		
		BinaryTree<Objetos> a2 = new BinaryTree<Objetos>();

		crearArbol(arbol, a2, 0, 0);
		
		return a2;
		
	}

}
