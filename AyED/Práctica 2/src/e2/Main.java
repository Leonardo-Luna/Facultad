package e2;

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
		
		//System.out.println(arbolin.contarHojas());
		//arbolin.preorden();
		System.out.println("  ");
		BinaryTree<Integer> arbolinEspejo = new BinaryTree<Integer>();
		arbolinEspejo = arbolin.espejo();
		//arbolinEspejo.preorden();
		
		arbolin.entreNiveles(0, 0);

	}

}
