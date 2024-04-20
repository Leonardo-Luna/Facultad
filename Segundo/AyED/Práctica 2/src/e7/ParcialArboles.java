package e7;

import e2.BinaryTree;

public class ParcialArboles {
	
	private BinaryTree<Integer> ab;
	
	public ParcialArboles(BinaryTree<Integer> ab) {
		this.ab = ab;
	}
	
	private BinaryTree<Integer> SearchPostOrder(BinaryTree<Integer> a, int num) {
		
		if(a.getData() == num) {
			
			return a;
			
		}
		
		BinaryTree<Integer> result = new BinaryTree<Integer>();
		
			if(a.hasLeftChild()) {
				result = SearchPostOrder(a.getLeftChild(), num);
			}
			
			if(a.hasRightChild() && result.isEmpty()) {
				result = SearchPostOrder(a.getRightChild(), num);
			}
			
			return result;
		
	}
	
	private int contar2(BinaryTree<Integer> a) {
		
		int num = 0;
		
		if(a.hasLeftChild()) {
			
			if(!a.hasRightChild()) {
				num++;
			}
			
			num += contar2(a.getLeftChild());
		}
		
		if(a.hasRightChild()) {
			
			if(!a.hasLeftChild()) {
				num++;
			}
			
			num += contar2(a.getRightChild());
		}
		
		return num;
		
	}
	
	private boolean contar(BinaryTree<Integer> a){
		
		int contHI = -1;
		int contHD = -1;
		
		if(a.hasLeftChild()) {
			
			contHI = 0;
			contHI = contar2(a.getLeftChild());
			
		}
		
		if(a.hasRightChild()) {
			
			contHD = 0;
			contHD = contar2(a.getRightChild());
			
		}
		
		System.out.println(contHI + " " + contHD);
		
		return contHI > contHD;
		
	}
	
	public boolean IsLeftTree(int num) {
		
		BinaryTree<Integer> a = SearchPostOrder(ab, num);
		
		if(a.isEmpty()) {
			return false;
		}
		else {
			
			return contar(a);
			
		}
		
	}
	

}
