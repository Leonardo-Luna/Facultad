package e6;

import e2.BinaryTree;

public class Transformacion {
	
	BinaryTree<Integer> a;
	
	public Transformacion(BinaryTree<Integer> a) {
		
		this.a = a;
		
	}
	
	private int Suma(BinaryTree<Integer> a) {
		
		int suma = 0;
		
		if(a.hasLeftChild()) {
			suma += Suma(a.getLeftChild());
		}
		
		if(a.hasRightChild()) {
			suma += Suma(a.getRightChild());
		}
		
		int act = a.getData();
		//System.out.println(act);
		a.setData(suma);
		return suma+act;
		
	}
	
	public BinaryTree<Integer> Suma() {
		
		if(!this.a.isEmpty()) {
			Suma(this.a);
		}
		
		return this.a;
		
	}

}
