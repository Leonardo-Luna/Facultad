package parcial1;

import archivos.BinaryTree;

public class ParcialArboles {
	
	BinaryTree<Integer> arbol;
	
	public ParcialArboles(BinaryTree<Integer> a) {
		this.arbol = a;
	}
	
	private BinaryTree<Integer> buscarHijo(BinaryTree<Integer> a, int num, BinaryTree<Integer> res) {
		
		if(a.getData() == num) {
			return a;
		}
		
		//BinaryTree<Integer> res = new BinaryTree<Integer>();
			
		if(a.hasLeftChild()) {
			res =  buscarHijo(a.getLeftChild(), num, res);
		}
			
		if(a.hasRightChild()) {
			res =  buscarHijo(a.getRightChild(), num, res);
		}
		
		return res;
			
		
	}
	
	private int calcular(BinaryTree<Integer> a) {
		
		int hijos = 0;
		
		if(a.hasLeftChild()) { 
			hijos += calcular(a.getLeftChild());
		} // Recorro todos los hijos izquierdos
		
		if(a.hasRightChild()) { 
			hijos += calcular(a.getRightChild()); 
		} // Recorro todos los hijos derecho
		
		if((a.hasLeftChild() && !a.hasRightChild()) || (a.hasRightChild() && !a.hasLeftChild())) {
			hijos++; // Si se cumple el caso de que solo tenga un hijo, sumo 1
		}
		
		return hijos; // Si no se cumple, no devuelvo nada
		
	}
	
	private boolean procesar(BinaryTree<Integer> a) {
	
		int izq = -1; int der = -1; // Contadores de hijos
		
		if(a.hasLeftChild()) {
			izq = calcular(a.getLeftChild()); // Proceso la rama izquierda del nodo pedido
		}
		
		if(a.hasRightChild()) {
			der = calcular(a.getRightChild()); // Proceso la rama derecha del nodo pedido
		}
		
		return izq > der;
		
	}
	
	public boolean isLeftTree(int num) {
		
		if(this.arbol != null) {
			
			BinaryTree<Integer> res = new BinaryTree<Integer>();
			BinaryTree<Integer> nodo = buscarHijo(this.arbol, num, res); // Busco el nodo pedido
			
			return procesar(nodo);
			
		} else {
			return false;
		}
		
	}

}
