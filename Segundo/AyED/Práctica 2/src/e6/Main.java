package e6;

import e2.BinaryTree;

public class Main {

	public static void main(String[] args) {
		
		BinaryTree<Integer> arbolin = new BinaryTree<Integer>(5);
		BinaryTree<Integer> izq = new BinaryTree<Integer>(2);
		BinaryTree<Integer> der = new BinaryTree<Integer>(4);
		BinaryTree<Integer> der2 = new BinaryTree<Integer>(1);
		BinaryTree<Integer> izq2 = new BinaryTree<Integer>(6);
		
		arbolin.addLeftChild(izq);
		arbolin.addRightChild(der);
		arbolin.getRightChild().addRightChild(der2);
		arbolin.getLeftChild().addLeftChild(izq2);
		arbolin.getLeftChild().getLeftChild().addLeftChild(der2);
		arbolin.getLeftChild().getLeftChild().addRightChild(der);
		
		Transformacion t = new Transformacion(arbolin);
		
		arbolin = t.Suma();
		
		//arbolin.postorden();

	}

}
