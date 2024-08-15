package parcial3;

import archivos.BinaryTree;

public class Parcial {
	
	public static void main(String[] args) {
		
        System.out.println("Test Ejercicio9");
        ParcialArboles parcialArb = new ParcialArboles();
        
        BinaryTree<Integer> ab = new BinaryTree<Integer>(20);
        ab.addLeftChild(new BinaryTree<Integer>(5));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(-5));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(10));
        ab.getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(1));
        ab.addRightChild(new BinaryTree<Integer>(30));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(50));
        ab.getRightChild().addRightChild(new BinaryTree<Integer>(-9));
        ab.getRightChild().getLeftChild().addRightChild(new BinaryTree<Integer>(4));
        ab.getRightChild().getLeftChild().getRightChild().addRightChild(new BinaryTree<Integer>(6));
        
        ab.entreNiveles(0, 4);
        System.out.println();
        System.out.println("Nuevo arbol:");
        parcialArb.sumAndDif(ab).entreNiveles(0, 5);
		
	}

}
