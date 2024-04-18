package e4;

import e2.BinaryTree;

public class Main {

	public static void main(String[] args) {
		
		BinaryTree<Integer> arbolin = new BinaryTree<Integer>(5);
		
		BinaryTree<Integer> izq = new BinaryTree<Integer>(2);
		BinaryTree<Integer> der = new BinaryTree<Integer>(4);
		
		BinaryTree<Integer> der2 = new BinaryTree<Integer>(1);
		BinaryTree<Integer> izq2 = new BinaryTree<Integer>(6);
		
		BinaryTree<Integer> der3 = new BinaryTree<Integer>(3);
		BinaryTree<Integer> izq3 = new BinaryTree<Integer>(7);
		
		arbolin.addLeftChild(izq);
		arbolin.addRightChild(der);
		
		arbolin.getRightChild().addRightChild(der2);
		arbolin.getLeftChild().addLeftChild(izq2);
		arbolin.getLeftChild().addRightChild(der3);
		arbolin.getRightChild().addLeftChild(izq3);
		
		
		RedBinariaLlena rb = new RedBinariaLlena(arbolin);
		
		System.out.print(rb.RetardoEnvio());
		
	}

}
