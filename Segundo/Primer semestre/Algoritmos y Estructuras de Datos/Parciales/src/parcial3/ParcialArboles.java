package parcial3;

import archivos.BinaryTree;

public class ParcialArboles {
	
	public static void recorrer(BinaryTree<Integer> a, BinaryTree<objeto> r, int s, int d) {
		
		s += a.getData();
		d = a.getData() - d;
		objeto o = new objeto(s, d);
		r.setData(o);
		
		if(a.hasLeftChild()) {
			r.addLeftChild(new BinaryTree<objeto>());
			recorrer(a.getLeftChild(), r.getLeftChild(), s, a.getData());
		}
		
		if(a.hasRightChild()) {
			r.addRightChild(new BinaryTree<objeto>());
			recorrer(a.getRightChild(), r.getRightChild(), s, a.getData());
		}
		
	}
	
	public BinaryTree<objeto> sumAndDif(BinaryTree<Integer> arbol) {
		
		BinaryTree<objeto> resultado = new BinaryTree<objeto>();
		
		recorrer(arbol, resultado, 0, 0);
		
		return resultado;
		
	}

}
