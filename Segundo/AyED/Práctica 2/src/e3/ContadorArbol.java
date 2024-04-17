package e3;

import java.util.LinkedList;
import e2.*;

public class ContadorArbol {
	
	BinaryTree<Integer> arbol = new BinaryTree<Integer>();
	
	public ContadorArbol(BinaryTree<Integer> arbol) {
		
		this.arbol = arbol;
		
	}
	
	private boolean esPar(Integer n) {
		return n % 2 == 0;
	}

	private void NumerosParesPost(BinaryTree<Integer> arbol, LinkedList<Integer> l) {
		if(arbol.hasLeftChild()) {
			NumerosParesPost(arbol.getLeftChild(), l);
		}
		if(arbol.hasRightChild()) {
			NumerosParesPost(arbol.getRightChild(), l);
		}
		
		if(esPar(arbol.getData())) {
			l.add(arbol.getData());
		}
		
	}
	
	private void NumerosParesIn(BinaryTree<Integer> arbol, LinkedList<Integer> l) {
		if(arbol.hasLeftChild()) {
			NumerosParesIn(arbol.getLeftChild(), l);
		}
		
		if(esPar(arbol.getData())) {
			l.add(arbol.getData());
		}
		
		if(arbol.hasRightChild()) {
			NumerosParesIn(arbol.getRightChild(), l);
		}
		
	}
	
	public LinkedList<Integer> NumerosParesPost() {
		
		LinkedList<Integer> l = new LinkedList<Integer>();
		this.NumerosParesPost(this.arbol, l);
		return l;
		
	}
	
	public LinkedList<Integer> NumerosParesIn() {
		
		LinkedList<Integer> l = new LinkedList<Integer>();
		this.NumerosParesIn(this.arbol, l);
		return l;
		
	}
	
}
