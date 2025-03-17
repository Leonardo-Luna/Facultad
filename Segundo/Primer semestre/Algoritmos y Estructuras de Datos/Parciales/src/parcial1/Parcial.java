package parcial1;

import archivos.BinaryTree;

public class Parcial {

	public static void main (String[] args) { 
        System.out.println("Test Ejercicio 7");
        
        BinaryTree<Integer> ab = new BinaryTree<Integer>(2);
        ab.addLeftChild(new BinaryTree<Integer>(7));
        ab.addRightChild(new BinaryTree<Integer>(-5));
        ab.getLeftChild().addLeftChild(new BinaryTree<Integer>(23));
        ab.getLeftChild().addRightChild(new BinaryTree<Integer>(6));
        ab.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(-3));
        ab.getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(55));
        ab.getLeftChild().getRightChild().addRightChild(new BinaryTree<Integer>(11));
        ab.getRightChild().addLeftChild(new BinaryTree<Integer>(19));
        ab.getRightChild().getLeftChild().addRightChild(new BinaryTree<Integer>(4));
        ab.getRightChild().getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(18));
        ab.entreNiveles(0, 4);
        
        ParcialArboles parcialArb = new ParcialArboles(ab);
        System.out.println("Resultado=" + parcialArb.isLeftTree(7));
        System.out.println("Resultado=" + parcialArb.isLeftTree(2));
        System.out.println("Resultado=" + parcialArb.isLeftTree(-5));
        System.out.println("Resultado=" + parcialArb.isLeftTree(19));
        System.out.println("Resultado=" + parcialArb.isLeftTree(-3));
    }

}
